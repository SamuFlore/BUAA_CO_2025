# MIPS 5-Stage Pipeline Extended Test
# Code Start: 0x00003000
# Data Start: 0x00000000
.text
.org 0x3000
    # ==========================================
    # 1. 初始化与基础运算
    # ==========================================
    addi $s0, $zero, 0      # $s0 用于累积校验和 (Checksum)
    lui  $t0, 0x0000        # $t0 = 0 (Data Base Address)
    
    addi $t1, $zero, 10     # $t1 = 10
    addi $t2, $zero, 20     # $t2 = 20
    
    # 测试 add/sub/or/and
    add  $t3, $t1, $t2      # $t3 = 30
    sub  $t4, $t3, $t1      # [Hazard: EX-EX] $t4 = 30 - 10 = 20
    or   $t5, $t1, $t2      # $t5 = 10 | 20 = 30
    and  $t6, $t1, $t2      # $t6 = 10 & 20 = 0 (1010 & 10100) -> wait, 10=0xA, 20=0x14. 01010 & 10100 = 0.
    
    add  $s0, $s0, $t3      # Checksum += 30
    add  $s0, $s0, $t4      # Checksum += 20
    
    # ==========================================
    # 2. 乘除法与 HI/LO (MD Extension)
    # ==========================================
    # 测试 mult (有符号)
    addi $t7, $zero, -2     # $t7 = -2
    mult $t1, $t7           # 10 * (-2) = -20. Hi=FFFFFFFF, Lo=FFFFFFEC
    
    # 测试 mflo 在 mult 后立即读取 (应该 Stall 或正确读取)
    mflo $t8                # $t8 = -20
    mfhi $t9                # $t9 = -1
    
    add  $s0, $s0, $t8      # Checksum += -20
    
    # 测试 divu (无符号)
    # $t2 = 20, $t1 = 10
    addi $k0, $zero, 3
    divu $t2, $k0           # 20 / 3 = 6 ... 2
    
    mflo $s1                # $s1 = 6 (Quotient)
    mfhi $s2                # $s2 = 2 (Remainder)
    
    add  $s0, $s0, $s1      # Checksum += 6
    add  $s0, $s0, $s2      # Checksum += 2
    
    # 测试 mtlo/mthi/mflo/mfhi 数据传递
    addi $k1, $zero, 100
    mtlo $k1
    mflo $k1                # $k1 应该读回 100
    add  $s0, $s0, $k1      # Checksum += 100

    # ==========================================
    # 3. 内存访问与 Load-Use 冒险
    # ==========================================
    # 准备数据
    addi $a0, $zero, 0x1234
    sll  $a0, $a0, 16       # $a0 = 0x12340000
    ori  $a0, $a0, 0x5678   # $a0 = 0x12345678
    sw   $a0, 0($t0)        # Mem[0] = 0x12345678
    
    # 测试 SB (Store Byte)
    addi $a1, $zero, 0xFF
    sb   $a1, 4($t0)        # Mem[4] 低字节 = FF
    
    # 测试 Load-Use Stall
    lw   $a2, 0($t0)        # $a2 = 0x12345678
    add  $a3, $a2, $a2      # [Load-Use Hazard] 必须 Stall. $a3 = ...F0
    
    # 测试 LB (Load Byte Signed)
    lb   $a3, 4($t0)        # Mem[4] 是 0xFF, lb 扩展为 0xFFFFFFFF (-1)
    add  $s0, $s0, $a3      # Checksum += -1
    
    # ==========================================
    # 4. 控制流与延迟槽
    # ==========================================
    # 测试 BEQ (Not Taken)
    beq  $t1, $t2, fail_jump
    addi $s0, $s0, 1        # [Delay Slot] 必须执行 Checksum += 1
    
    # 测试 JAL
    jal  my_func
    addi $s0, $s0, 2        # [Delay Slot] 必须执行 Checksum += 2
    
    # 返回后继续
    j    finish
    nop

fail_jump:
    addi $s0, $zero, 0xBAD  # 错误标记
    j    finish
    nop

my_func:
    # 测试 JALR
    addi $s0, $s0, 10       # Checksum += 10
    jalr $ra
    addi $s0, $s0, 5        # [Delay Slot] 必须执行 Checksum += 5 (在跳转动作发生前执行)

finish:
    # 最终结果写回 Mem[0x50] (80)
    # 预期 Checksum 计算:
    # Init: 0
    # ALU: +30, +20 = 50
    # MD: -20, +6, +2, +100 = 88 (Accum: 138)
    # MEM: -1 = 137
    # Branch Slot: +1 = 138
    # JAL Slot: +2 = 140
    # Func: +10 = 150
    # JALR Slot: +5 = 155 (0x9B)
    
    addi $t9, $zero, 0x50
    sw   $s0, 0($t9)        # 将校验和写入地址 0x50
    
    # 结束，不再进行任何操作，等待 Testbench 捕获
    nop
    nop
    nop
    nop
