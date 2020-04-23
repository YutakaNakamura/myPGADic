`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/15 16:31:51
// Design Name: 
// Module Name: BasicCounter
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


module BasicCounter(
    input PCLK,
    input RESET,
    output reg WR_n,
    output [31:0] DQ,
    output [7:0] LED,
    input  [7:0] ADCIN
    );

reg [31:0] Counter;

// Put key signals on LEDs for DEBUG, ~ since LED is ON when signal is low
assign LED = ~Counter[31:24];

//Counterパターン
assign DQ = Counter;

//ADCパターン
//assign DQ[7:0] = ADCIN;
//assign DQ[31:8] = 24'b0;

//ここを戻す　10を絶対返すパターン
//assign DQ[7:0] = 8'b1010;
//assign DQ[31:8] = 24'b0;


always @ (posedge PCLK or posedge RESET) begin
	if (RESET) begin
		WR_n <= 1;		// Disable writes
		Counter <= 0;
	end
	else begin
		WR_n <= 0;
		Counter <= Counter + 1;
	end
end


endmodule