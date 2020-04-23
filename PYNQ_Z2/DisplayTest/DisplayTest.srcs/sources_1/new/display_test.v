`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/01/26 04:55:05
// Design Name: 
// Module Name: display_test
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


module display_test(
    input        reset,
    input        clk,
    output [3:0] r,
    output [3:0] g,
    output [3:0] b,
    output reg hsync,
    output reg vsync,
    output wire dclk,
    output wire DATAenable,
    output wire DISPON
    );



    //125MHz to 9MHz
    clkwiz_wrapper(
        dclk,
        1'b0,
        clk
    );
        
//    clk_wiz_0 clk_wiz_0_inst(
//       .clk_in1(clk),
//       .clk_out1(dclk),
//       .reset(1'b0)
//    );

    //block RAM 240 x 136
    blkmem_wrapper
   (16'h0,//input [15:0]BRAM_PORTA_0_addr;
    dclk,// input BRAM_PORTA_0_clk;
    12'h0,//input [11:0]BRAM_PORTA_0_din;
    1'b0,//input [0:0]BRAM_PORTA_0_we;
    addrb,//input [15:0]BRAM_PORTB_0_addr;
    dclk,//input BRAM_PORTB_0_clk;
    {r,g,b},//output [11:0]BRAM_PORTB_0_dout;
    1'b1//input BRAM_PORTB_0_en;
    );
    
//    blk_mem_gen_0 blk_mem_gen_0_inst(
//      .clka(dclk),    // input wire clka
//      .wea(1'b0),      // input wire [0 : 0] wea
//      .addra(16'h0),  // input wire [15 : 0] addra
//      .dina(12'h0),    // input wire [11 : 0] dina
//      .clkb(dclk),    // input wire clkb
//      .enb(1'b1),      // input wire enb
//      .addrb(addrb),  // input wire [15 : 0] addrb
//      .doutb({r,g,b})  // output wire [11 : 0] doutb
//    );

    //display parameter
    parameter H_PERIOD = 531;
    parameter H_BPORCH = 43;
    parameter V_PERIOD = 288;
    parameter V_BPORCH = 12;

    reg  [9:0]  hcnt;
    reg  [9:0]  pcnt;
    wire [15:0] addrb;
    wire [9:0] p_addr;
    wire [9:0] h_addr;

    always @(posedge dclk) begin
        if(pcnt == (H_PERIOD-1)) begin
            pcnt <= 0;
        end else begin
            pcnt <= pcnt + 1;
        end
    end

    always @(posedge dclk) begin
        if(pcnt < (H_BPORCH-1))begin
            hsync <= 0;        
        end else begin
            hsync <= 1;
        end
    end

    always @(posedge hsync) begin
        if((V_PERIOD-1) == hcnt) begin
            hcnt <= 0;            
        end else begin
            hcnt <= hcnt + 1;
        end
    end

    always @(posedge dclk) begin
        if((V_BPORCH-1) < hcnt) begin
            vsync <= 1;
        end else begin
            vsync <= 0;
        end
    end


    assign DATAenable = 1;
    assign DISPON = 1;

    assign p_addr = (hsync == 1 && vsync == 1) ? pcnt - 43 : 10'h0;
    assign h_addr = (hsync == 1 && vsync == 1) ? hcnt - 12 : 10'h0;
    assign addrb  = (hsync == 1 && vsync == 1) ? p_addr[9:1] + h_addr[9:1] * 240 : 12'h0;

endmodule