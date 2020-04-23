
module lcd_pattern_generator
(
	input wire clk,
	input wire rest_n,
	output wire lcd_clk,//LCD CLK
	output wire lcd_pwm,//BACKLIGHT ON
	output wire lcd_hsync, //HSYNC
	output wire lcd_vsync, //VSYNC
    output wire DE,
	output wire [10:0] X_pixel,//XPIXEL
	output wire [10:0] Y_pixel
	);
	

	localparam TFT_H = 480;  //TFTص
	localparam TFT_V = 272;  //TFTص
	
	localparam th = 531; //Period Time
	localparam thbp = 43; //Back Porch
	localparam thfp = 8; //Front Porch
	localparam thw = 10; //Pulse Width(SYNC)

	localparam tv = 288; //Period Time
	localparam tvbp = 12; //Back Porch
	localparam tvfp = 4; // Front Porch
    localparam tvw = 10; //Pulse Widge(SYNC)



	reg [10:0] counter_hs;
	reg [10:0] counter_vs;
	
	always@(posedge clk or negedge rest_n)begin	
	
	if(rest_n == 1'b0)begin
		counter_hs <= 0;
		counter_vs <= 0;
	end else begin
	
        if(counter_hs == th	)begin
        counter_hs <= 11'b0;
            if(counter_vs == tv)
                counter_vs <= 11'b0;
            else
                counter_vs <= counter_vs + 11'b1;
        end
        else
            counter_hs <= counter_hs + 11'b1;
        end	
    
	end


    wire DE_h;
    wire DE_v;

	assign lcd_clk = (rest_n == 1'b1) ? clk : 1'b0;
	assign lcd_pwm = (rest_n == 1'b1) ? 1'b1 : 1'b0;
	assign lcd_hsync = (counter_hs >= thw ) ? 1 : 0;
	assign lcd_vsync = (counter_vs >= tvw) ? 1 : 0;

 	assign hsync_cnt = counter_hs;
 	assign vsync_cnt = counter_vs;

	assign DE_h = ( (counter_hs >= thbp) && ((th - thfp) >= counter_hs) )? 1 : 0;
	assign DE_v = ( (counter_vs >= tvbp) && ((tv - tvfp) >= counter_vs) )? 1 : 0;
	assign DE = (DE_h && DE_v)?1:0;
	
 	assign X_pixel = ( (counter_hs >= thbp) && ((th - thfp) >= counter_hs) )? counter_hs - thbp : 11'b0;
 	assign Y_pixel = ( (counter_vs >= tvbp) && ((tv - tvfp) >= counter_vs) )? counter_vs - tvbp : 11'b0;

endmodule