`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/16 18:40:06
// Design Name: 
// Module Name: ADC
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


module ADC(
    input ADCCLK,
    input RESET,
    input [7:0] ADC_DATA,
    output [31:0] DataOut
    );
    
    reg [7:0] ADC_BUF;
    
    always @(posedge ADCCLK) begin
        ADC_BUF = ADC_DATA;
    end
    
    assign  DataOut[7:0] = ADC_DATA;
    assign  DataOut[31:8] = 24'b0;

//    assign  DataOut[7:0] = 8'b10101010; ˆÓ–¡‚ª‚È‚©‚Á‚½
//    assign  DataOut[31:8] = 24'b101010101010101010101010;

    
endmodule
