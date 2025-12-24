# 设计草稿
已实现：`add sub ori sw sh sb lw lh lb and or j jal jalr beq bne addi lui sll` （不考虑溢出）
## IFU
IFU 由三部分构成，分别是存储当前 PC 的值，计算下一个 PC 的值，用 PC 值从 IM 中提取指令。整体是一个 Moore 型有限状态机。
### PC
PC 用一个 32 位寄存器存储。由于指令段地址从 `0x00003000` 开始，因此需要初始化为该值。  

|端口名|位宽|方向|注释|
|-|-|-|-|
|clk|1|I|时钟信号|
|reset|1|I|异步复位信号|
|NPC|[31:0]|I|下一个 PC 值|
|PC|[31:0]|O|当前 PC 值|

### NPC
NPC 用组合逻辑来计算下一个 PC 的值，回传给 PC。  
- 对于一般的算数指令 `addi`，`ori` 等，PC = PC + 4。
- 对于 `j`，`jal`，PC 直接变为外部输入的 26 位立即数 `instr_index`。`instr_index` 尾部补两个 0（Splitter 实现）后位扩展至 32 位。
- 对于 `bne`，`beq` 等，一方面要接受外界输入的寄存器值，一方面要接受外界输入的 16 位 `offset`，`offset` 尾部补两个 0 实现后位扩展至 32 位，加上寄存器值赋给 PC。
- 对于 `jr`，`jalr`，PC 直接变为外部输入的寄存器值。

由于有四种可能的 NPC 求取方式，必须根据读到的指令来判断 NPC 使用上面哪一条来计算。因此引入一个 `NPCSel[1:0]` 来选择。 
另外，对于 `beq` 等指令，若条件判断不成功，NPC 仍然是 PC + 4，引入一个 `zero` 输入来判断。

|端口名|位宽|方向|注释|
|-|-|-|-|
|PC|[31:0]|I|当前 PC 值|
|imm26|[25:0]|I|机器码低 26 位|
|GRF|[31:0]|I|寄存器值|
|imm16|[15:0]|I|机器码低 16 位|
|NPCSel|[1:0]|I|NPC 计算方法选择信号|
|zero|1|I|条件判断成功信号|
|PCplus4|[31:0]|O|PC + 4 值|
|NPC|[31:0]|O|下一个 PC 值|


### IM
程序运行时为保证安全性，不可篡改指令数据，按要求用一个 4096*32 bits 的 ROM 来存储。至多可存储 4096（2^12）条，因此 ROM 的地址输入位宽为 12，即 `Addr[11:0]`。先给 PC 减去 `0x00003000`，又因为 ROM 两行的地址差为 1 而非 4，故再除以 4（逻辑右移 2 位实现），取低 12 位，从而建立了 PC 到 ROM 的映射关系。  
IM 输出端为指令机器码。分为 `Opcode`，`rs`，`rt`，`rd`，`shamt`，`Funct`，同时提取低 26 位和低 16 位。

|端口名|位宽|方向|注释|
|-|-|-|-|
|addr|[31:0]|I|待取指令之地址|
|instr|[31:0]|O|指令内容|

## Controller
Controller 接受 Opcode 和 Funct，判断收到的具体是什么指令，然后发出信号决定 NPC 如何计算，决定 GRF，ALU，DM 做的事。按照指令手册先比较 Opcode，再比较 Funct，用 Priority Encoder 把指令种类的独热编码换成对应的序号`type[4:0]`。对于未知的指令，序号统一为 0。根据对应的序号：
- 输出 `NewPCSel[1:0]` 给 NPC 决定 NPC 如何计算。  
- 输出 `GRFEnable` 给 GRF 作为写使能信号。
- 输出 `EXTType` 给 EXT 决定输入的立即数是符号扩展或非符号扩展。
- `type[4:0]` 可以作为选择信号给 ALU 选择相应的运算结果， 
- `addi` 等涉及立即数的指令，需要让 ALU 的 inputB 为位扩展后的立即数，而 `add` 等的 ALU 的 inputB 是寄存器值，因此输出 `ALUIBSel` 供 inputB 选择输入是立即数或寄存器值。
- `addi` 等涉及立即数的指令，最终结果存储在 rt 寄存器中，而 `add` 等存储在 rd 中，因此输出 `GRF A3Sel` 供 GRF 的 A3 端口（写入位置）选择 rt 或 rd。**注意 `jalr` 的目的寄存器是 rd**。
- 输出 `DMEnable` 给 DM 作为写使能信号。
- `lw` 等指令需要从 DM 中提取数据到 GRF 中，而 `add` 等指令是 ALU 算出的结果回传给 GRF，因此输出 `DMtoGRFSel` 供 GRF 的 WD 选择输入是 ALU 结果还是 DM 数据。
- `jalr`，`jal` 涉及将 PC + 4 保存到 GRF 中，因此输出 `PC+4toGRFSel` 选择 WD 是否是 PC + 4。**注意，应当在 `DMtoGRFSel` 后选择**。
- `jal` 把 PC + 4 保存到 `$ra`（31 号寄存器）中，这是不需要输入的。因此输出 `$raSel` 选择 A3 是 31 号。**注意，应当在 `GRF A3Sel` 后选择**。

|端口名|位宽|方向|注释|
|-|-|-|-|
|opcode|[5:0]|I|机器码高 6 位|
|funct|[5:0]|I|机器码低 6 位|
|ALU_sel|[4:0]|O|ALU 计算方法选择信号|
|NPC_sel|[1:0]|O|NPC 计算方法选择信号|
|GRF_enable|1|O|GRF 写使能信号|
|EXT_type|1|O|EXT 方法选择信号|
|ALU_IB_sel|1|O|ALU InputB 选择信号|
|GRF_A3_sel|1|O|GRF A3 选择信号|
|DM_enable|1|O|DM 写使能信号|
|DM_to_GRF_sel|1|O|允许将 DM 数据写入 GRF|
|PC_plus4_to_GRF_sel|1|O|允许将 PC+4 写入 GRF|
|reg31_Sel|1|O|选择 31 号寄存器为写入目标|
|store_type|[1:0]|O|向 DM 存入数据方法选择信号|
|load_type|[1:0]|O|从 DM 读取数据方法选择信号|


## GRF
GRF 根据 `A1[4:0]` 从 32 个寄存器中读取数据到 `RD1[31:0]`，根据 `A2[4:0]` 从 32 个寄存器中读取数据到 `RD2[31:0]`，若 `WE` 为 1，则将 `WD[31:0]` 写入对应的寄存器。其中 0 号寄存器永远为 0。

|端口名|位宽|方向|注释|
|-|-|-|-|
|clk|1|I|时钟信号|
|reset|1|I|异步复位信号|
|write_enable|1|I|GRF 写使能信号|
|addr1|[4:0]|I|待读取的寄存器编号 1|
|addr2|[4:0]|I|待读取的寄存器编号 2|
|write_addr|[4:0]|I|待写入的寄存器编号|
|write_data|[31:0]|I|待写入的内容|
|read_data1|[31:0]|O|读取的寄存器内容 1|
|read_data2|[31:0]|O|读取的寄存器内容 2|

## ALU
根据 Controller 传来的 `type[4:0]` 决定如何对 inputA 和 inputB 进行运算。
- A + B （`add` 等）
- A - B （`sub` 等）
- A and B（`and` 等）
- A or B（`or` 等）
- A xor B（`xor` 等）
- B 左移 16 位（`lui`）
- if (A == B) （`beq` 等）
- B 左移 `sll` 指定位数（来自 `shamt`）

`if (A == B)` 作为上述的 `zero` 传给 NewPC。

|端口名|位宽|方向|注释|
|-|-|-|-|
|inputA|[31:0]|I|输入 A|
|inputB|[31:0]|I|输入 B|
|ALU_sel|[4:0]|I|ALU 计算方法选择信号|
|shamt|[4:0]|I|机器码 6 至 10 位|
|outputALU|[31:0]|O|计算结果|
|zero|1|O|条件判断成功信号|

## EXT
给 imm16 符号扩展和无符号扩展至 imm32。用 Controller 传来的 `EXTType` 判断如何扩展。

|端口名|位宽|方向|注释|
|-|-|-|-|
|imm16|[15:0]|I|16 位立即数|
|EXT_type|1|I|位扩展方法选择信号|
|imm32|[31:0]|O|32 位立即数|

## DM
DM 需要频繁进行读写操作，故用 3072*32 bits 的 RAM 存储。仍用 `Addr[11:0]` 覆盖所有范围。

|端口名|位宽|方向|注释|
|-|-|-|-|
|clk|1|I|时钟信号|
|reset|1|I|异步复位信号|
|write_enable|1|I|DM 写使能信号|
|addr|[31:0]|I|地址|
|write_data|[31:0]|I|待写入数据|
|read_data|[31:0]|O|读取的数据|

# 思考题
1. addr 来自 ALU 计算结果。目的是为了让地址强制对齐为 4 的倍数。
2. 
    - 第一种：
    ```verilog
    case (instr)
        add: begin
            NPC_sel = 3'b0;
            GRF_enable = 1;
            ......
        end
    endcase
    ```
    可以很清晰地看到每种指令对哪些控制信号有影响。但随着指令的增加，重复的代码会增加。
    - 第二种
    ```verilog
    wire add = (opcode == 6'h0 && funct == 6'b100001) ? 1 : 0;
    ......
    wire GRF_enable;
    assign GRF_enable = (add | ......) ? 1 : 0;
    ```
    可以方便地为这种控制信号添加对应的指令，但观感较差，容易疏漏。
3. 
    - 同步复位：clk 高于 reset。当 clk 为高时再看 reset 的状态。
    - 异步复位：reset 高于 clk。不管 clk 状态为何，reset 为高时复位。
4. 在不考虑溢出时，add 无条件进入 else 分支，即 GPR[rd] <- temp。而 temp 有 33 位，高位截断，与 addu 的操作 GPR[rd] <- temp 一样。同理 addi 与 addiu 一样。
# 测试
```mipsasm
.text
main:
    # ------------------------------------------------
    # 常量构造测试
    # ------------------------------------------------
    lui   $t0, 0x1234          # $t0 = 0x12340000
    ori   $t0, $t0, 0x5678     # $t0 = 0x12345678
    addi  $t1, $zero, -1       # $t1 = 0xFFFFFFFF
    addi  $t2, $zero, 1        # $t2 = 0x00000001
    addi  $t3, $t2, -2         # $t3 = 0xFFFFFFFF (-1)
    lui   $t4, 0x7FFF          # $t4 = 0x7FFF0000
    ori   $t4, $t4, 0xFFFF     # $t4 = 0x7FFFFFFF
    lui   $t5, 0x8000          # $t5 = 0x80000000

    # ------------------------------------------------
    # 算术逻辑运算测试
    # ------------------------------------------------
    add   $s0, $t0, $t2        # = 0x12345679
    sub   $s1, $t0, $t2        # = 0x12345677
    and   $s2, $t0, $t1        # = 自身
    or    $s3, $t0, $t3        # = 全1
    addi  $s4, $t2, -1         # = 0

    # ------------------------------------------------
    # sll 测试
    # ------------------------------------------------
    addi  $s5, $zero, 1
    sll   $s6, $s5, 0          # 不移位 => 1
    sll   $s7, $s5, 31         # 移31位 => 0x80000000

    # ------------------------------------------------
    # sw / lw 测试（以 $zero 为基址）
    # 内存布局：
    #   0($zero)  存 $t0
    #   4($zero)  存 $t1
    #   8($zero)  存 $t2
    #   12($zero) 存 $t3
    # ------------------------------------------------
    sw    $t0, 0($zero)
    sw    $t1, 4($zero)
    sw    $t2, 8($zero)
    sw    $t3, 12($zero)

    lw    $a0, 0($zero)        # = $t0
    lw    $a1, 4($zero)        # = $t1
    lw    $a2, 8($zero)        # = $t2
    lw    $a3, 12($zero)       # = $t3

    add   $v0, $a0, $a1        # 测试加载后运算
    sub   $v1, $a0, $a1

    # ------------------------------------------------
    # beq / bne 测试
    # ------------------------------------------------
    addi  $s0, $zero, 0
    beq   $s4, $zero, label_beq_true   # s4 == 0，应跳转
    addi  $s0, $s0, 1                  # 不执行
    j     label_beq_end

label_beq_true:
    addi  $s0, $s0, 10

label_beq_end:
    bne   $t1, $t2, label_bne_true     # 不相等，应跳转
    addi  $s0, $s0, 1                  # 不执行
    j     label_bne_end

label_bne_true:
    addi  $s0, $s0, 5

label_bne_end:

    # ------------------------------------------------
    # j / jal / jalr / jr 测试
    # ------------------------------------------------
    jal   func1
    j     after_func1

func1:
    addi  $a0, $zero, 111
    jalr  $t6, $ra       # 保存 $ra -> $t6
    jr    $t6             # 跳回

after_func1:
    addi  $a1, $zero, 222

    # ------------------------------------------------
    # 简单循环测试 (存取 + 条件跳转)
    # ------------------------------------------------
    addi  $s1, $zero, 0         # i = 0
    addi  $s2, $zero, 5         # 循环 5 次
    addi  $s3, $zero, 0         # 累加和 = 0

loop_start:
    sw    $s1, 100($zero)       # 用固定地址存 i
    lw    $t7, 100($zero)
    add   $s3, $s3, $t7         # 累加
    addi  $s1, $s1, 1
    bne   $s1, $s2, loop_start

    # ------------------------------------------------
    # 程序结束
    # ------------------------------------------------

```