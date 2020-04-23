`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    vga_test 
//
//////////////////////////////////////////////////////////////////////////////////
module vga_test(
			input clk,
			input rstn,
			output vga_hs,
			output vga_vs,
			output [4:0] vga_r,
			output [5:0] vga_g,
			output [4:0] vga_b,
			input key1                        //按键key1
    );
//-----------------------------------------------------------//
// 水平扫描参数的设�?1024*768 60Hz VGA
//-----------------------------------------------------------//
parameter LinePeriod =1344;            //行周期数
parameter H_SyncPulse=136;             //行同步脉冲（Sync a�?
parameter H_BackPorch=160;             //显示后沿（Back porch b�?
parameter H_ActivePix=1024;            //显示时序段（Display interval c�?
parameter H_FrontPorch=24;             //显示前沿（Front porch d�?
parameter Hde_start=296;
parameter Hde_end=1320;

//-----------------------------------------------------------//
// 垂直扫描参数的设�?1024*768 60Hz VGA
//-----------------------------------------------------------//
parameter FramePeriod =806;           //列周期数
parameter V_SyncPulse=6;              //列同步脉冲（Sync o�?
parameter V_BackPorch=29;             //显示后沿（Back porch p�?
parameter V_ActivePix=768;            //显示时序段（Display interval q�?
parameter V_FrontPorch=3;             //显示前沿（Front porch r�?
parameter Vde_start=35;
parameter Vde_end=803;

//-----------------------------------------------------------//
// 水平扫描参数的设�?800*600 VGA
//-----------------------------------------------------------//
//parameter LinePeriod =1056;           //行周期数
//parameter H_SyncPulse=128;            //行同步脉冲（Sync a�?
//parameter H_BackPorch=88;             //显示后沿（Back porch b�?
//parameter H_ActivePix=800;            //显示时序段（Display interval c�?
//parameter H_FrontPorch=40;            //显示前沿（Front porch d�?

//-----------------------------------------------------------//
// 垂直扫描参数的设�?800*600 VGA
//-----------------------------------------------------------//
//parameter FramePeriod =628;           //列周期数
//parameter V_SyncPulse=4;              //列同步脉冲（Sync o�?
//parameter V_BackPorch=23;             //显示后沿（Back porch p�?
//parameter V_ActivePix=600;            //显示时序段（Display interval q�?
//parameter V_FrontPorch=1;             //显示前沿（Front porch r�?


  reg[10 : 0] x_cnt;
  reg[9 : 0]  y_cnt;
  reg[15 : 0] grid_data_1;
  reg[15 : 0] grid_data_2;
  reg[15 : 0] bar_data;
  reg[3 : 0] vga_dis_mode;
  reg[4 : 0]  vga_r_reg;
  reg[5 : 0]  vga_g_reg;
  reg[4 : 0]  vga_b_reg;  
  reg hsync_r;
  reg vsync_r; 
  reg hsync_de;
  reg vsync_de;
  
  reg [19:0] key1_counter;                 //按键�?测寄存器
  
  wire vga_clk; 
  wire [12:0]  bar_interval;
  
assign	bar_interval 	= H_ActivePix[15: 3];         //彩条宽度=H_ActivePix/8
  
//----------------------------------------------------------------
////////// 水平扫描计数
//----------------------------------------------------------------
always @ (posedge vga_clk)
       if(~rstn)    x_cnt <= 1;
       else if(x_cnt == LinePeriod) x_cnt <= 1;
       else x_cnt <= x_cnt+ 1;
		 
//----------------------------------------------------------------
////////// 水平扫描信号hsync,hsync_de产生
//----------------------------------------------------------------
always @ (posedge vga_clk)
   begin
       if(~rstn) hsync_r <= 1'b1;
       else if(x_cnt == 1) hsync_r <= 1'b0;            //产生hsync信号
       else if(x_cnt == H_SyncPulse) hsync_r <= 1'b1;
		 
		 		 
	    if(1'b0) hsync_de <= 1'b0;
       else if(x_cnt == Hde_start) hsync_de <= 1'b1;    //产生hsync_de信号
       else if(x_cnt == Hde_end) hsync_de <= 1'b0;	
	end

//----------------------------------------------------------------
////////// 垂直扫描计数
//----------------------------------------------------------------
always @ (posedge vga_clk)
       if(~rstn) y_cnt <= 1;
       else if(y_cnt == FramePeriod) y_cnt <= 1;
       else if(x_cnt == LinePeriod) y_cnt <= y_cnt+1;

//----------------------------------------------------------------
////////// 垂直扫描信号vsync, vsync_de产生
//----------------------------------------------------------------
always @ (posedge vga_clk)
  begin
       if(~rstn) vsync_r <= 1'b1;
       else if(y_cnt == 1) vsync_r <= 1'b0;    //产生vsync信号
       else if(y_cnt == V_SyncPulse) vsync_r <= 1'b1;
		 
	    if(~rstn) vsync_de <= 1'b0;
       else if(y_cnt == Vde_start) vsync_de <= 1'b1;    //产生vsync_de信号
       else if(y_cnt == Vde_end) vsync_de <= 1'b0;	 
  end
		 

//----------------------------------------------------------------
////////// 格子测试图像产生
//----------------------------------------------------------------
 always @(negedge vga_clk)   
   begin
     if ((x_cnt[4]==1'b1) ^ (y_cnt[4]==1'b1))            //产生小格子图�?
			    grid_data_1<= 16'h0000;
	  else
			    grid_data_1<= 16'hffff;
				 
	  if ((x_cnt[6]==1'b1) ^ (y_cnt[6]==1'b1))            //产生大格子图�? 
			    grid_data_2<=16'h0000;
	  else
				 grid_data_2<=16'hffff; 
   
	end
	
//----------------------------------------------------------------
////////// 彩色条测试图像产�?
//----------------------------------------------------------------
 always @(negedge vga_clk)   
   begin
     if (x_cnt==Hde_start)            
			    bar_data<= 16'hf800;              //红色彩条
	  else if (x_cnt==Hde_start + bar_interval)
			    bar_data<= 16'h07e0;              //绿色彩条				 
	  else if (x_cnt==Hde_start + bar_interval*2)            
			    bar_data<=16'h001f;               //蓝色彩条
	  else if (x_cnt==Hde_start + bar_interval*3)         
			    bar_data<=16'hf81f;               //紫色彩条
	  else if (x_cnt==Hde_start + bar_interval*4)           
			    bar_data<=16'hffe0;               //黄色彩条
	  else if (x_cnt==Hde_start + bar_interval*5)            
			    bar_data<=16'h07ff;               //青色彩条
	  else if (x_cnt==Hde_start + bar_interval*6)             
			    bar_data<=16'hffff;               //白色彩条
	  else if (x_cnt==Hde_start + bar_interval*7)            
			    bar_data<=16'hfc00;               //橙色彩条
	  else if (x_cnt==Hde_start + bar_interval*8)              
			    bar_data<=16'h0000;               //其余黑色
   
	end
	
//----------------------------------------------------------------
////////// VGA图像选择输出
//----------------------------------------------------------------
 //LCD数据信号选择 
 always @(negedge vga_clk)  
    if(~rstn) begin 
	    vga_r_reg<=0; 
	    vga_g_reg<=0;
	    vga_b_reg<=0;		 
	end
   else
     case(vga_dis_mode)
         4'b0000:begin
			        vga_r_reg<=0;                        //VGA显示全黑
                 vga_g_reg<=0;
                 vga_b_reg<=0;
			end
			4'b0001:begin
			        vga_r_reg<=5'b11111;                 //VGA显示全白
                 vga_g_reg<=6'b111111;
                 vga_b_reg<=5'b11111;
			end
			4'b0010:begin
			        vga_r_reg<=5'b11111;                 //VGA显示全红
                 vga_g_reg<=0;
                 vga_b_reg<=0;  
         end			  
	      4'b0011:begin
			        vga_r_reg<=0;                        //VGA显示全绿
                 vga_g_reg<=6'b111111;
                 vga_b_reg<=0; 
         end					  
         4'b0100:begin     
			        vga_r_reg<=0;                        //VGA显示全蓝
                 vga_g_reg<=0;
                 vga_b_reg<=5'b11111;
			end
         4'b0101:begin     
			        vga_r_reg<=grid_data_1[15:11];       // VGA显示方格1
                 vga_g_reg<=grid_data_1[10:5];
                 vga_b_reg<=grid_data_1[4:0];
         end					  
         4'b0110:begin     
			        vga_r_reg<=grid_data_2[15:11];       // VGA显示方格2
                 vga_g_reg<=grid_data_2[10:5];
                 vga_b_reg<=grid_data_2[4:0];
			end
		   4'b0111:begin     
			        vga_r_reg<=x_cnt[6:2];               //VGA显示水平渐变�?
                 vga_g_reg<=x_cnt[6:1];
                 vga_b_reg<=x_cnt[6:2];
			end
		   4'b1000:begin     
			        vga_r_reg<=y_cnt[6:2];               //VGA显示垂直渐变�?
                 vga_g_reg<=y_cnt[6:1];
                 vga_b_reg<=y_cnt[6:2];
			end
		   4'b1001:begin     
			        vga_r_reg<=x_cnt[6:2];               //VGA显示红水平渐变色
                 vga_g_reg<=0;
                 vga_b_reg<=0;
			end
		   4'b1010:begin     
			        vga_r_reg<=0;                        //VGA显示绿水平渐变色
                 vga_g_reg<=x_cnt[6:1];
                 vga_b_reg<=0;
			end
		   4'b1011:begin     
			        vga_r_reg<=0;                        //VGA显示蓝水平渐变色
                 vga_g_reg<=0;
                 vga_b_reg<=x_cnt[6:2];			
			end
		   4'b1100:begin     
			        vga_r_reg<=bar_data[15:11];          //VGA显示彩色�?
                 vga_g_reg<=bar_data[10:5];
                 vga_b_reg<=bar_data[4:0];			
			end
		   default:begin
			        vga_r_reg<=5'b11111;                 //VGA显示全白
                 vga_g_reg<=6'b111111;
                 vga_b_reg<=5'b11111;
			end					  
         endcase
	

  assign vga_hs = hsync_r;
  assign vga_vs = vsync_r;  
  assign vga_r = (hsync_de & vsync_de)?vga_r_reg:5'b00000;
  assign vga_g = (hsync_de & vsync_de)?vga_g_reg:6'b000000;
  assign vga_b = (hsync_de & vsync_de)?vga_b_reg:5'b00000;
  
 //产生65Mhz VGA Clock  
   pll pll_inst
  (
   .clk_in1(clk),               
   .clk_out1(vga_clk),               // 65.0Mhz for 1024x768(60hz)
   .reset(~rstn),              
   .locked()
	);              


  //按钮处理程序	
  always @(posedge vga_clk)
  begin
    if(~rstn) begin 
	    vga_dis_mode<=4'b0000; 
		 key1_counter<=0;	 
	 end	
	 else begin
	    if (key1==1'b1)                               //如果按钮没有按下，寄存器�?0
	       key1_counter<=0;
	    else if ((key1==1'b0)& (key1_counter<=20'd90_000))      //如果按钮按下并按下时间少�?1ms,计数(9M*0.1=900_000)     
          key1_counter<=key1_counter+1'b1;
  	  
       if (key1_counter==20'd89_999)                //�?次按钮有效，改变显示模式
		    begin
		      if(vga_dis_mode==4'b1101)
			      vga_dis_mode<=4'b0000;
			   else
			      vga_dis_mode<=vga_dis_mode+1'b1; 
          end	
     end		
  end	
	  

endmodule
