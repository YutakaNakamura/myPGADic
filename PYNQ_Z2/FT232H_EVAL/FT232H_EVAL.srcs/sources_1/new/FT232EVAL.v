`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/01/26 16:28:03
// Design Name: 
// Module Name: FT232EVAL
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


module FT232EVAL(
    inout [7:0]AD,
    inout [7:0]AC
    );
    
    wire FT_CLK;
    wire nTXE;
    reg [7:0] ADBUS = 8'd0;
    reg nWR = 1'b1;
    

    //ADBUS
    assign AD = ADBUS;
   
   //ACBUS
    assign AC[0] = 1'bz;//= ACBUS[0] = RXF#
    assign nTXE = AC[1]; // = ACBUS[1] = TXE#
    assign AC[2] = 1'b1; // = ACBUS[2] = RD#
    assign AC[3] = nWR; // = ACBUS[3] = WR#
    assign AC[4] = 1'b1; // = ACBUS[4] = SIWU
    assign FT_CLK = AC[5]; // = ACBUS[5] = CLKOUT (60MHz) PN‰ñ”ð
    assign AC[6] = 1'b1; // = ACBUS[6] = OE#

    // No read data mode operation
    
    
    reg state = 1'b0;

    
    always @ (negedge FT_CLK) begin
    if (!nTXE) begin
        if (state) begin
            ADBUS <= ADBUS + 8'b00000001;
            nWR <= 1'b0;
            state <= 1'b0;
        end
        else begin
            nWR <= 1'b1;
            state <= 1'b1;
        end
    end
    else begin
        nWR <= 1'b1;
        state <= 1'b0;
    end
end
endmodule
