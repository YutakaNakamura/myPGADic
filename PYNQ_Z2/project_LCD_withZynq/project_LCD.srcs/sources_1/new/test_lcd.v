
module test_lcd
(
	input wire CLK_IN,
	input wire RST_N,
	output wire [7:0] R,
	output wire [7:0] G,
	output wire [7:0] B,
	output wire LCD_CLK,
	output wire LCD_HSYNC,
	output wire LCD_VSYNC,
	output wire LCD_DEN,
	output wire LCD_PWM		//backlight,set to high
);
	wire clk_lcd;
	wire clk_180M;
	wire clklock;

	//100MHz -> 180MHz
	PLL_wrapper PLL180M(
	.clk_out1_0     (clk_180M),
    .locked_0       (clklock),
    .reset_rtl      (~RST_N),
    .sys_clock      (CLK_IN)
    );

	//180MHz -> 9MHz
	prescaler prescaler9M(
		.clk_i		(clk_180M),
		.reset		(~RST_N),
		.clk_o		(clk_lcd)
	);	
	

	wire [10:0] X_pixel;
	wire [10:0] Y_pixel;	

	lcd_pattern_generator unit_PtnGen
	(
	.clk				(clk_lcd),
	.rest_n				(RST_N),
	.lcd_clk			(LCD_CLK),//LCD CLK
	.lcd_pwm			(LCD_PWM),//BACKLIGHT ON
	.lcd_hsync			(LCD_HSYNC), //HSYNC
	.lcd_vsync			(LCD_VSYNC), //VSYNC
    .DE					(LCD_DEN),
	.X_pixel			(X_pixel),//XPIXEL
	.Y_pixel			(Y_pixel)
	);


 	data_out datout
	(	
		.clk_lcd	(clk_lcd), 
		.R			(R),
		.G			(G),
		.B			(B),
		.den		(LCD_DEN),
		.X_pixel	(X_pixel),
		.Y_pixel	(Y_pixel)
	);

endmodule
