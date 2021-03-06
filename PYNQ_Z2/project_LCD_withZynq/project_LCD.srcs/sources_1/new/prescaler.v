//180MHz -> 9MHz prescaler

module prescaler(clk_i, reset, clk_o);
	input 		clk_i;
	input		reset;
	output		clk_o;
	reg	[5:0] count;
	reg outflag;
		
	always @(posedge clk_i or posedge reset) begin
		if(reset == 1'b1)begin //リセット処理
			outflag <= 0;
			count <= 6'b0000;
		end	else if(count == 6'b10100) begin //桁上がり
			count	<= 6'b0000;
			outflag <= ~outflag;
		end else begin //通常
			count <= count + 6'b0001;
		end
	end
	
	assign clk_o = outflag;
	
endmodule