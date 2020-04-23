`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/10 21:55:48
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
    input wire CLK100MHZ,
	input wire  [3:0] btn,
	output wire [13:0] ck_io,
	output wire [41:26] ck_io2
    );
   	wire [7:0] R;
	wire [7:0] G;
	wire [7:0] B;
    
    wire RST_N;
	wire LCD_CLK;
	wire LCD_HSYNC;
	wire LCD_VSYNC;
	wire LCD_DEN;
	wire LCD_PWM;
   
    assign RST_N = ~btn[0];
   
    assign ck_io2[38] = LCD_CLK;
    assign ck_io2[39] = LCD_HSYNC;
    assign ck_io2[40] = LCD_VSYNC;
    assign ck_io2[41] = LCD_DEN;
//    assign ck_io[12] = LCD_PWM;
    
    assign ck_io[3:0] = R[3:0];
    assign ck_io2[29:26] = R[7:4];
    
    assign ck_io[7:4] = G[3:0];
    assign ck_io2[33:30] = G[7:4];
    
    assign ck_io[11:8] = B[3:0];
    assign ck_io2[37:34] = B[7:4];

    
    test_lcd lcd
(
	.CLK_IN        (CLK100MHZ),
	.RST_N         (RST_N),
	.R             (R),
	.G             (G),
    .B             (B),
	.LCD_CLK       (LCD_CLK),
	.LCD_HSYNC     (LCD_HSYNC),
	.LCD_VSYNC     (LCD_VSYNC),
	.LCD_DEN       (LCD_DEN),
	.LCD_PWM       (LCD_PWM)//backlight,set to high
);
    
endmodule
