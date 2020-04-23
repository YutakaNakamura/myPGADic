`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/14 22:43:36
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
//    input wire sysclk,
//	input wire  [3:0] btn,
	input wire SYS_CLK_50M,
	input wire SW2,
	output wire LED3,
	inout wire [64:0] IO_U7,
	inout wire [64:0] IO_U8
    );
    
    //LED3
    assign LED3 = 1'b1;
    
    //CYUSB3014 Board Pin Assign    
    //USB3.0 Data
    wire [31:0] CYUSB_DATA;
    //CTRL
    wire CYUSB_SCL;
    wire CYUSB_SDA;
    wire CYUSB_PCLK;
    wire [12:0] CYUSB_CTRL;
    //I2S
    wire CYUSB_I2S_WS;
    wire CYUSB_I2S_CLK;
    wire CYUSB_I2S_MCLK;
    wire CYUSB_I2S_SD;
    //Flash SPI
    wire CYUSB_FLASH_CS;
    wire CYUSB_FLASH_SCK;
    wire CYUSB_FLASH_MISO;
    wire CYUSB_FLASH_MOSI; 
    
    assign CYUSB_FLASH_CS  = IO_U7[7];  assign CYUSB_FLASH_MISO = IO_U7[8];
    assign CYUSB_FLASH_SCK = IO_U7[9];  assign CYUSB_FLASH_MOSI = IO_U7[10];
    
    assign CYUSB_I2S_WS   = IO_U7[11];  assign CYUSB_I2S_MCLK = IO_U7[12];
    assign CYUSB_I2S_CLK  = IO_U7[13];  assign CYUSB_I2S_SD   = IO_U7[14];
    
    assign CYUSB_DATA[30] = IO_U7[15];  assign CYUSB_DATA[31] = IO_U7[16];
    assign CYUSB_DATA[28] = IO_U7[17];  assign CYUSB_DATA[29] = IO_U7[18];
    assign CYUSB_DATA[26] = IO_U7[19];  assign CYUSB_DATA[27] = IO_U7[20];
    assign CYUSB_DATA[24] = IO_U7[21];  assign CYUSB_DATA[25] = IO_U7[22];
    assign CYUSB_DATA[22] = IO_U7[23];  assign CYUSB_DATA[23] = IO_U7[24];
    assign CYUSB_DATA[20] = IO_U7[25];  assign CYUSB_DATA[21] = IO_U7[26];
    assign CYUSB_DATA[18] = IO_U7[27];  assign CYUSB_DATA[19] = IO_U7[28];
    assign CYUSB_DATA[16] = IO_U7[29];  assign CYUSB_DATA[17] = IO_U7[30];
    
    assign CYUSB_CTRL[12] = IO_U7[31];  assign CYUSB_CTRL[11] = IO_U7[32];
    assign CYUSB_CTRL[8]  = IO_U7[33];  assign CYUSB_PCKL     = IO_U7[34];
    assign CYUSB_CTRL[5]  = IO_U7[35];  assign CYUSB_CTRL[1]  = IO_U7[36];
    assign CYUSB_CTRL[4]  = IO_U7[37];  assign CYUSB_CTRL[2]  = IO_U7[38];
    assign CYUSB_CTRL[6]  = IO_U7[39];  assign CYUSB_CTRL[3]  = IO_U7[40];
    assign CYUSB_CTRL[7]  = IO_U7[41];  assign CYUSB_CTRL[0]  = IO_U7[42];
    
    assign CYUSB_DATA[15] = IO_U7[43];  assign CYUSB_DATA[14] = IO_U7[44];
    assign CYUSB_DATA[13] = IO_U7[45];  assign CYUSB_DATA[12] = IO_U7[46];
    assign CYUSB_DATA[11] = IO_U7[47];  assign CYUSB_DATA[10] = IO_U7[48];
    assign CYUSB_DATA[9]  = IO_U7[49];  assign CYUSB_DATA[8]  = IO_U7[50];
    assign CYUSB_DATA[7]  = IO_U7[51];  assign CYUSB_DATA[6]  = IO_U7[52];
    assign CYUSB_DATA[5]  = IO_U7[53];  assign CYUSB_DATA[4]  = IO_U7[54];
    assign CYUSB_DATA[3]  = IO_U7[55];  assign CYUSB_DATA[2]  = IO_U7[56];
    assign CYUSB_DATA[1]  = IO_U7[57];  assign CYUSB_DATA[0]  = IO_U7[58];
    
    assign CYUSB_SDA      = IO_U7[59];  assign CYUSB_SCL      = IO_U7[60];
    
    
    
// Need to assign inputs else they get optimized away
//	assign TP_2 = RX_MOSI & SPI_SCK & SPI_SSN & I2C_SCL & I2C_SDA;

// Assign fixed outputs not used in this example
	assign CYUSB_FLASH_CS = 1'b1;//assign FlashCS_n = 1'b1;
	//assign INT = 1'b0;
	assign CYUSB_FLASH_MISO = 1'bZ; //assign TX_MISO = 1'bZ;

    wire [7:0] LED;

// Include the Counter that does the work
// RESET is connected to CTRL[10] = GPIO27
// WR is connected to CTRL[0] = GPIO17	

//clock counter
BasicCounter Counter (
	.PCLK(CYUSB_PCKL), //.PCLK(PCLK),
	.RESET(CYUSB_CTRL[9]), //.RESET(CTRL[10]),‚ª‘¶Ý‚µ‚È‚¢‚½‚ßA•ÏX‚µ‚½ GPIO26-> CTL9
	.WR_n(CYUSB_CTRL[0]),
	.DQ(CYUSB_DATA), //.DQ(DQ),
	.LED(LED),
	.ADCIN(ADC_DATA)
	);
    
    wire [7:0] ADC_DATA;
    wire ADC_CLK;
    wire ADC_EN;
    
    //ADC Pin Assign    
    //ADC Data
    assign ADC_DATA[0]  = IO_U8[49];  assign ADC_DATA[4]  = IO_U8[50];
    assign ADC_DATA[1]  = IO_U8[51];  assign ADC_DATA[5]  = IO_U8[52];
    assign ADC_DATA[2]  = IO_U8[53];  assign ADC_DATA[6]  = IO_U8[54];
    assign ADC_DATA[3]  = IO_U8[55];  assign ADC_DATA[7]  = IO_U8[56];
    assign ADC_CLK      = IO_U8[57];//  assign ADC  = IO_U8[58];
    assign ADC_EN       = IO_U8[59];//  assign ADC  = IO_U8[60];
    
    assign ADC_CLK = SYS_CLK_50M;
    
//    ADC ADC (
//        .ADCCLK(ADC_CLK),
//        .RESET(SW2),
//        .ADC_DATA(ADC_DATA),
//        .DataOut(CYUSB_DATA)
//    );
    
endmodule
