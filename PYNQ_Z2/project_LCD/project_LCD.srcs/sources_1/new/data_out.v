
module data_out
	(	
		input wire clk_lcd, 
		output wire [7:0] R,
		output wire [7:0] G,
		output wire [7:0] B,
		input  wire den,
		input  wire [10:0] X_pixel,
		input  wire [10:0] Y_pixel
	);

	reg [7:0] r_R;
	reg [7:0] r_G;
	reg [7:0] r_B;
	
	wire [7:0] RedData;
	wire [7:0] GreenData;
	wire [7:0] BlueData;
	//Ç±Ç±Ç©ÇÁÉÅÉÇÉä
    BRAM_RGB_wrapper BRAM(
    .BRAM_PORTA_B_addr          (X_pixel+$signed(Y_pixel)*480),
    .BRAM_PORTA_B_clk           (clk_lcd),
    .BRAM_PORTA_B_din           (8'b0),
    .BRAM_PORTA_B_dout          (BlueData),
    .BRAM_PORTA_B_we            (1'b0),
    .BRAM_PORTA_G_addr          (X_pixel+$signed(Y_pixel)*480),
    .BRAM_PORTA_G_clk           (clk_lcd),
    .BRAM_PORTA_G_din           (8'b0),
    .BRAM_PORTA_G_dout          (GreenData),
    .BRAM_PORTA_G_we            (1'b0),
    .BRAM_PORTA_R_addr          (X_pixel+$signed(Y_pixel)*480),
    .BRAM_PORTA_R_clk           (clk_lcd),
    .BRAM_PORTA_R_din           (8'b0),
    .BRAM_PORTA_R_dout          (RedData),
    .BRAM_PORTA_R_we            (1'b0)
    );
    
reg scan_dir;
reg [31:0]timecnt;

always@(posedge clk_lcd)
begin

	timecnt<=timecnt+1'b1;
	if(timecnt==32'd33_000_000)
	begin
		timecnt<=32'h0;
		scan_dir = ~scan_dir;
	end

	//if(multout < MEMSIZE)
//	if(Y_pixel < 130)	
//	begin
//		//addr_first <= X_pixel+$signed(Y_pixel)*480;
//		r_R<=R_first; 
//		r_B<=8'h00; 
//		r_G<=8'h00;
//	end	else begin
//		r_R<=8'h00; 
//		r_B<=8'h00; 
//		r_G<=8'h00;
//	end
	
	if (den) begin
		r_R<=8'h00; 
		r_B<=8'h00; 
		r_G<=8'h00;
//			if(scan_dir==1)
//			begin
//				if (Y_pixel<(90)) 
//					begin 
//						r_R<=8'h00; 
//						r_B<=8'hff;
//						r_G<=8'h00; 
//					end 
//				else if (Y_pixel<(180)) 
//					begin 
//						r_R<=8'h00; 
//						r_B<=8'hff; 
//						r_G<=8'h00; 
//					end
//				else if (Y_pixel<272) 
//					begin 
//						r_R<=8'h00;
//						r_B<=8'h00; 
//						r_G<=8'hff; 
//					end
//			end
//			else
//			begin
//				if (X_pixel<(100)) 
//					begin 
//						r_R<=8'hff; 
//						r_B<=8'h00; 
//						r_G<=8'h00; 
//					end 
//				else if (X_pixel<(200)) 
//					begin 
//						r_R<=8'h00; 
//						r_B<=8'hff; 
//						r_G<=8'h00; 
//					end 
//				else if (X_pixel<272) 
//					begin 
//						r_R<=8'h00; 
//						r_B<=8'h00; 
//						r_G<=8'hff; 
//					end
//			end
		end
	else 
		begin 
			r_R<=8'h00; 
			r_B<=8'h00; 
			r_G<=8'h00;
		end
end

	assign R = RedData;
	assign G = GreenData;
	assign B = BlueData;

endmodule
