
module slaveFIFO2b_fpga_top(
	reset_in_,            //input reset active low
	clk,                  //input clp 27 Mhz

	//	sync,
	fdata,  
	faddr,                //output fifo address  
	slrd,                 //output read select
	slwr,                 //output write select
	flaga,
	flagb,
	flagc,
	flagd,
	sloe,                //output output enable select
	clk_100,             //output clk 100 Mhz and 180 phase shift
	slcs,                //output chip select
	pktend,              //output pkt end
	
	mode_p,
	
	//i2c
	//sda,
	//scl,
	
	//spi flash
	flash_cs,
	flash_so,
	flash_sck,
	flash_si,
	
	//i2s
	i2s_ws,
	i2s_mclk,
	i2s_clk,
	i2s_sd,
	
    led_1
); 
//i2c
//input sda;
//input scl;
	
//spi flash
input flash_cs;
input flash_so;
input flash_sck;
input flash_si;
	
//i2s
input i2s_ws;
input i2s_mclk;
input i2s_clk;
input i2s_sd;

//led
output led_1;
parameter DLY_CNT = 32'd50000000;
parameter HALF_DLY_CNT = 32'd25000000;

(*mark_debug = "true"*)reg r_led;
(*mark_debug = "true"*)reg [31:0]count;

(*mark_debug = "true"*)input reset_in_;
(*mark_debug = "true"*)inout [31:0] fdata; 
(*mark_debug = "true"*)output [1:0] faddr; 
(*mark_debug = "true"*)output       slrd;  
(*mark_debug = "true"*)output reg   slwr;  

//input        sync; 
(*mark_debug = "true"*)input        flaga;
(*mark_debug = "true"*)input        flagb; 
(*mark_debug = "true"*)input        flagc; 
(*mark_debug = "true"*)input        flagd; 
input        clk;   
output       clk_100;
(*mark_debug = "true"*)output       sloe; 
(*mark_debug = "true"*)output       slcs; 
(*mark_debug = "true"*)output       pktend;
(*mark_debug = "true"*)input [2:0]  mode_p;


(*mark_debug = "true"*)reg [2:0] mode; 	

wire [31:0] fpga_master_data_out;
reg  [31:0] data_out;
reg  [1:0] oe_delay_cnt;	
reg  [1:0] fifo_address;   
reg  [1:0] fifo_address_d;   
reg       slrd_;
reg       slcs_;       
reg       slwr_;
reg      sloe_;
wire      clk_100;
reg[7:0] conter; 		
wire clk_out_temp;	
reg rd_oe_delay_cnt; 
reg first_time;
reg[15:0] index ;
reg[15:0] DataCount_i ;
reg slrd1_d_ ;
reg slrd2_d_ ;
wire reset_;
wire [31:0]data_out_loopback;
wire [31:0]data_out_partial;
wire [31:0]data_out_zlp;
wire [31:0]data_out_stream_in;

reg [31:0]loopback_data_from_fx3;
reg [31:0]stream_out_data_from_fx3;
reg flaga_d;
reg flagb_d;
reg flagc_d;
reg flagd_d;

reg [2:0]current_fpga_master_mode_d;

reg [2:0]current_fpga_master_mode;
reg [2:0]next_fpga_master_mode;
 


wire lock;
reg short_pkt_strob;

reg pktend_;


reg [31:0]fdata_d;


wire slwr_loopback_;
wire slwr_streamIN_;
wire slwr_zlp_;
wire slwr_partial_;
wire pktend_partial_;
wire pktend_zlp_;

wire loopback_mode_selected;   
wire partial_mode_selected;   
wire zlp_mode_selected;       
wire stream_in_mode_selected;
wire stream_out_mode_selected;

reg [31:0] data_out_reg;

//parameters for transfers mode (fixed value)
parameter [2:0] PARTIAL    = 3'd1;   //switch position on the Board 001
parameter [2:0] ZLP        = 3'd2;   //switch position on the Board 010
parameter [2:0] STREAM_IN  = 3'd3;   //switch position on the Board 011
parameter [2:0] STREAM_OUT = 3'd4;   //switch position on the Board 100
parameter [2:0] LOOPBACK   = 3'd5;   //switch position on the Board 101


//parameters for fpga master mode state machine
parameter [2:0] fpga_master_mode_idle             = 3'd0;
parameter [2:0] fpga_master_mode_partial          = 3'd1;
parameter [2:0] fpga_master_mode_zlp              = 3'd2;
parameter [2:0] fpga_master_mode_stream_in        = 3'd3;
parameter [2:0] fpga_master_mode_stream_out       = 3'd4;
parameter [2:0] fpga_master_mode_loopback         = 3'd5;


//output signal assignment
assign slrd = slrd_;
//assign slwr = slwr_;   
always @ (posedge clk_100, negedge reset_)
begin
	if (~reset_)
		slwr <= 1'b1;
	else
		slwr <= slwr_;
end

assign faddr = fifo_address_d;
assign sloe = sloe_;
assign fdata = fpga_master_data_out;
assign slcs = slcs_;
assign pktend = pktend_;
	
reg sync_d;	

//assign clk_100 = clk;   //used for TB

clk_wiz_0 inst_sys_clock
 (
    // Clock in ports
    .clk_in1(clk),
    // Clock out ports
    .clk_out1(clk_100),
    // Status and control signals
    .reset(reset2pll),
    .locked(lock)
 );

//oddr2 is used to send out the clk(ODDR2 instantiation)
//ODDR2 oddr_y                    
//        ( 
//	  .D0(1'b0),
//	  .D1(1'b1),
//	  .C0 (clk_100),
//	  .C1(~clk_100),
//	  .Q(clk_out), 
//	  .CE(),
//	  .R(),
//	  .S()
//	); 

//instantiation of LoopBack mode
slaveFIFO2b_loopback loopback_inst
	(
		.reset_(reset_),
		.clk_100(clk_100),
		.loopback_mode_selected(loopback_mode_selected),
		.flaga_d(flaga_d),
		.flagb_d(flagb_d),
		.flagc_d(flagc_d),
		.flagd_d(flagd_d),
		.data_in_loopback(loopback_data_from_fx3),
		.slrd_loopback_(slrd_loopback_),
		.sloe_loopback_(sloe_loopback_),
		.slwr_loopback_(slwr_loopback_),
		.loopback_rd_select_slavefifo_addr(loopback_rd_select_slavefifo_addr),
		.data_out_loopback(data_out_loopback)
	); 

//instantiation of partial mode
slaveFIFO2b_partial partial_inst
	(
		.reset_(reset_),
		.clk_100(clk_100),
		.partial_mode_selected(partial_mode_selected),
		.flaga_d(flaga_d),
		.flagb_d(flagb_d),
		.slwr_partial_(slwr_partial_),
		.pktend_partial_(pktend_partial_),
		.data_out_partial(data_out_partial)
	); 

//instantiation of ZLP mode	
slaveFIFO2b_ZLP zlp_inst
	(
		.reset_(reset_),
		.clk_100(clk_100),
		.zlp_mode_selected(zlp_mode_selected),
		.flaga_d(flaga_d),
		.flagb_d(flagb_d),
		.slwr_zlp_(slwr_zlp_),
		.pktend_zlp_(pktend_zlp_),
		.data_out_zlp(data_out_zlp)
	);

//instantiation of stream_in mode	
slaveFIFO2b_streamIN stream_in_inst
	(
		.reset_(reset_),
		.clk_100(clk_100),
		.stream_in_mode_selected(stream_in_mode_selected),
		.flaga_d(flaga_d),
		.flagb_d(flagb_d),
		.slwr_streamIN_(slwr_streamIN_),
		.data_out_stream_in(data_out_stream_in)
	); 

//instantiation of stream_out mode	
slaveFIFO2b_streamOUT stream_out_inst
	(
		.reset_(reset_),
		.clk_100(clk_100),
		.stream_out_mode_selected(stream_out_mode_selected),
		.flagc_d(flagc_d),
		.flagd_d(flagd_d),
		.stream_out_data_from_fx3(stream_out_data_from_fx3),
		.slrd_streamOUT_(slrd_streamOUT_),
		.sloe_streamOUT_(sloe_streamOUT_)
	);


assign reset2pll = !reset_in_;
assign reset_ = lock;
//assign reset_ = reset_in_;

//assign loopback_data_from_fx3 = fdata;
//flopping the input data
always @(posedge clk_100, negedge reset_)begin
	if(!reset_)begin 
		fdata_d <= 32'd0;
	end else begin
		fdata_d <= fdata;
	end	
end		

//selection of input data
always@(*)begin
	if(current_fpga_master_mode == fpga_master_mode_loopback)begin
		loopback_data_from_fx3   = fdata_d;
		stream_out_data_from_fx3 = 32'd0;
	end else if(current_fpga_master_mode == fpga_master_mode_stream_out)begin
		loopback_data_from_fx3   = 32'd0;
		stream_out_data_from_fx3 = fdata_d;
	end else begin
		loopback_data_from_fx3   = 32'd0;
		stream_out_data_from_fx3 = 32'd0;
	end
end	

//floping the INPUT mode
always @(posedge clk_100, negedge reset_)begin
	if(!reset_)begin 
		mode <= 3'd0;
	end else begin
		mode <= mode_p;
	end	
end

///flopping the INPUTs flags
always @(posedge clk_100, negedge reset_)begin
	if(!reset_)begin 
		flaga_d <= 1'd0;
		flagb_d <= 1'd0;
		flagc_d <= 1'd0;
		flagd_d <= 1'd0;
	end else begin
		flaga_d <= flaga;
		flagb_d <= flagb;
		flagc_d <= flagc;
		flagd_d <= flagd;
	end	
end



//chip selection
always@(*)begin
	if(current_fpga_master_mode == fpga_master_mode_idle)begin
		slcs_ = 1'b1;
	end else begin
		slcs_ = 1'b0;
	end	
end

//selection of slave fifo address
always@(*)begin
	if(loopback_rd_select_slavefifo_addr |(current_fpga_master_mode == fpga_master_mode_stream_out))begin
		fifo_address = 2'b11;
	end else if((current_fpga_master_mode == fpga_master_mode_partial) | (current_fpga_master_mode == fpga_master_mode_zlp) | (current_fpga_master_mode == fpga_master_mode_stream_in))begin
		fifo_address = 2'b00;
	end else
		fifo_address = 2'b00;
end	

//flopping the output fifo address
always @(posedge clk_100, negedge reset_)begin
	if(!reset_)begin 
		fifo_address_d <= 2'd0;
 	end else begin
		fifo_address_d <= fifo_address;
	end	
end

//slrd an sloe signal assignments based on mode
always @(*)begin
	case(current_fpga_master_mode)
	fpga_master_mode_loopback:begin
		slrd_ = slrd_loopback_;
		sloe_ = sloe_loopback_;
	end
	fpga_master_mode_stream_out:begin
		slrd_ = slrd_streamOUT_;
		sloe_ = slrd_streamOUT_;
	end
	default:begin
		slrd_ = 1'b1;
		sloe_ = 1'b1;
	end	
	endcase
end

//slwr signal assignment based on mode	
always @(*)begin
	case(current_fpga_master_mode)
	fpga_master_mode_partial:begin
		slwr_ = slwr_partial_;
	end
	fpga_master_mode_zlp:begin
		slwr_ = slwr_zlp_;
	end	
	fpga_master_mode_stream_in:begin
		slwr_ = slwr_streamIN_;
	end
	fpga_master_mode_loopback:begin
		slwr_ = slwr_loopback_;
	end
	default:begin
		slwr_ = 1'b1;
	end	
	endcase
end

//pktend signal assignment based on mode
always @(*)begin
	case(current_fpga_master_mode)
	fpga_master_mode_partial:begin
		pktend_ = pktend_partial_;
	end
	fpga_master_mode_zlp:begin
		pktend_ = pktend_zlp_;
	end	
	default:begin
		pktend_ = 1'b1;
	end	
	endcase
end	


//mode selection
assign loopback_mode_selected   = (current_fpga_master_mode == fpga_master_mode_loopback);
assign partial_mode_selected    = (current_fpga_master_mode == fpga_master_mode_partial);
assign zlp_mode_selected        = (current_fpga_master_mode == fpga_master_mode_zlp);
assign stream_in_mode_selected  = (current_fpga_master_mode == fpga_master_mode_stream_in);
assign stream_out_mode_selected = (current_fpga_master_mode == fpga_master_mode_stream_out);


//Mode select state machine
always @(posedge clk_100, negedge reset_)begin
	if(!reset_)begin 
		current_fpga_master_mode <= fpga_master_mode_idle;
	end else begin
		current_fpga_master_mode <= next_fpga_master_mode;
	end	
end

//Mode select state machine combo   
always @(*)   
begin
	next_fpga_master_mode = current_fpga_master_mode;
	case (current_fpga_master_mode)
	fpga_master_mode_idle:begin
		case(mode)
		LOOPBACK:begin
			next_fpga_master_mode = fpga_master_mode_loopback;
		end
		PARTIAL:begin
			next_fpga_master_mode = fpga_master_mode_partial;
		end
		ZLP:begin
			next_fpga_master_mode = fpga_master_mode_zlp;
		end
		STREAM_IN:begin
			next_fpga_master_mode = fpga_master_mode_stream_in;
		end
		STREAM_OUT:begin
			next_fpga_master_mode = fpga_master_mode_stream_out;
		end
		default:begin
			next_fpga_master_mode = fpga_master_mode_idle;
                end
		endcase
	end	
	fpga_master_mode_loopback:begin
		if(mode == LOOPBACK)begin
			next_fpga_master_mode = fpga_master_mode_loopback;
		end else begin
		        next_fpga_master_mode = fpga_master_mode_idle;
		end	
	end
	fpga_master_mode_partial:begin
		if(mode == PARTIAL)begin
			next_fpga_master_mode = fpga_master_mode_partial;
		end else begin 
			next_fpga_master_mode = fpga_master_mode_idle;
		end
	end
	fpga_master_mode_zlp:begin
		if(mode == ZLP)begin
			next_fpga_master_mode = fpga_master_mode_zlp;
		end else begin 
			next_fpga_master_mode = fpga_master_mode_idle;
		end
	end	
	fpga_master_mode_stream_in:begin
		if(mode == STREAM_IN)begin
			next_fpga_master_mode = fpga_master_mode_stream_in;
		end else begin 
			next_fpga_master_mode = fpga_master_mode_idle;
		end
	end	
	fpga_master_mode_stream_out:begin
		if(mode == STREAM_OUT)begin
			next_fpga_master_mode = fpga_master_mode_stream_out;
		end else begin 
			next_fpga_master_mode = fpga_master_mode_idle;
		end
	end	
	default:begin
		next_fpga_master_mode = fpga_master_mode_idle;
	end
	endcase

end

//selection of data_out based on current mode
always @(*)begin
	case(current_fpga_master_mode)
	fpga_master_mode_partial:begin
		data_out = data_out_partial;
	end
	fpga_master_mode_zlp:begin
		data_out = data_out_zlp;
	end	
	fpga_master_mode_stream_in:begin
		data_out = data_out_stream_in;
	end
	fpga_master_mode_loopback:begin
		data_out = data_out_loopback;
	end
	default:begin
		data_out = 32'd0;
	end	
	endcase
end	

always @(posedge clk_100, negedge reset_)begin
	if(!reset_)begin 
		data_out_reg <= 32'd0;
 	end else begin
		data_out_reg <= data_out;
	end	
end

assign fpga_master_data_out = (slwr) ? 32'dz : data_out_reg;
//data_out = data_out_loopback

//for debugging on board, counter control
always@(posedge clk_100 or negedge reset_)
begin
	if(!reset_)
		begin
			count <= 32'd0;
		end
	else if(count == DLY_CNT)
		begin
			count <= 32'd0;
		end
	else
		begin
			count <= count+32'd1;
		end
end

//led output register control
always@(posedge clk_100 or negedge reset_)
begin
	if(!reset_)
		begin
			r_led <= 1'b0;
		end
	else if(count < HALF_DLY_CNT)
		begin
			r_led <= 1'b1;
		end
	else
		begin
			r_led <= 1'b0;
		end
end

assign led_1 = r_led;

endmodule
