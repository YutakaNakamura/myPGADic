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
    input wire sysclk,
	input wire  [3:0] btn,
	output wire [7:0] ja,
	output wire [7:0] jb,
	output wire [13:0] ar
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
   
    assign ar[8] = LCD_CLK;
    assign ar[9] = LCD_HSYNC;
    assign ar[10] = LCD_VSYNC;
    assign ar[11] = LCD_DEN;
//    assign ck_io[12] = LCD_PWM;
    
    assign ja[7:0] = R[7:0];
    assign jb[7:0] = G[7:0];
    assign ar[7:0] = B[7:0];

    
    test_lcd lcd
(
	.CLK_IN        (sysclk),
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
