`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:37:25 09/11/2025
// Design Name:   elevator
// Module Name:   E:/CO/ISE/ISE_Project/elevator/elevator_tb.v
// Project Name:  elevator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: elevator
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module elevator_tb;

    // 输入信号
    reg [2:0] from;
    reg clk;
    reg reset;
    
    // 输出信号
    wire out;
    wire [2:0] cur_floor;
    wire direction;
    wire [2:0] request;
    
    // 实例化被测试模块
    elevator uut (
        .from(from),
        .clk(clk),
        .reset(reset),
        .out(out),
        .cur_floor(cur_floor),
        .direction(direction),
        .request(request)
    );
    
    // 生成10ns周期的时钟（从0时刻开始正常运转）
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 5ns翻转一次，周期10ns
    end
    
    // 测试激励
    initial begin
        // 初始状态：所有输入为x，确保前5ns信号未初始化
        from = 3'bxxx;
        reset = 1'bx;
        
        // 5ns时：初始化系统，设置复位信号
        #5;
        reset = 1;         // 激活复位
        from = 3'b000;     // 无请求
        
        // 15ns时：释放复位（确保复位至少维持一个时钟周期）
        #10;
        reset = 0;
        
        // 30ns时：发出1楼指令（当前时间=15+15=30ns）
        #15;
        from = 3'b001;     // 1楼请求
        
        // 40ns时：取消请求（维持一个时钟周期）
        #10;
        from = 3'b000;
        
        // 100ns时：发出5楼指令（当前时间=40+60=100ns）
        #60;
        from = 3'b101;     // 5楼请求
        
        // 110ns时：取消请求
        #10;
        from = 3'b000;
        
        // 继续运行一段时间观察结果
        #200;
        
        // 结束仿真

    end
    
endmodule
