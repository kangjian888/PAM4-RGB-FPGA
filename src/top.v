// =============================================================================
// Filename: top.v
// Author: KANG, Jian
// Email: jkangac@connect.ust.hk
// Affiliation: Hong Kong University of Science and Technology
// Description:
// -----------------------------------------------------------------------------
`timescale 1 ns / 1 ps
module top(
	input USER_SMA_CLOCK_P,
	input USER_SMA_CLOCK_N,
	input g_rst,
	input inverse_sw,
	input send_enable_button,
	input send_stop_button,
	input r_whole_delay_button,
	input g_whole_delay_button,
	input b_whole_delay_button,
	input r_rising_delay_button,
	input g_rising_delay_button,
	input b_rising_delay_button,
	input r_falling_delay_button,
	input g_falling_delay_button,
	input b_falling_delay_button,
	input r_enable,
	input g_enable,
	input b_enable,
	input mode_choice_button,//choose ook prbs or pam4
	//output slow_rst, //for simulation
	output red_output_ref_p,
	output red_output_ref_n,
	output green_output_ref_p,
	output green_output_ref_n,
	output blue_output_ref_p,
	output blue_output_ref_n,
	output red_output_delay_p,
	output red_output_delay_n,
	output green_output_delay_p,
	output green_output_delay_n,
	output blue_output_delay_p,
	output blue_output_delay_n,
	output led_out_3,
	output led_out_2,
	output led_out_1,
	output led_out_0,
	output reg led_status_3,
	output reg led_status_2,
	output reg led_status_1,
	output reg led_status_0,
	output clk_reference_p,
	output clk_reference_n
);

wire clk_x10_i;
//globle clock in
IBUFGDS IBUFGDS_inst(
	.O (clk_x10_i),
    .I (USER_SMA_CLOCK_P),
    .IB (USER_SMA_CLOCK_N)
    );

//local parameter to define the system clock frequency
localparam CLOCK_PERIOD = 5;

//Inner wire
wire clk_x1; //slow clock
wire slow_rst_i; // slow reset
wire [1:0] data_origin_i;
wire send_enable_i;
wire send_stop_i;
wire mode_choice_i;
wire [2:0] data_slow_reference_i;
reg [2:0] data_slow_reference_i_i;
wire [2:0] rising_edge_i;
wire [2:0] falling_edge_i;
wire [3:0] rising_delay_r_i;
wire [3:0] falling_delay_r_i;
wire [3:0] rising_delay_g_i;
wire [3:0] falling_delay_g_i;
wire [3:0] rising_delay_b_i;
wire [3:0] falling_delay_b_i;
wire [2:0] eq_delay_i;
wire [2:0] reference_i;
wire ook_prbs_reference_i;
wire [3:0] whole_delay_r_i;
wire [3:0] whole_delay_g_i;
wire [3:0] whole_delay_b_i;
wire [2:0] reference_output_i;
wire [2:0] eq_delay_output_i;
wire [3:0] led_output_i;

// Inner REG
reg [19:0] counter_for_status_LED;
//Control the button and LED
control #(
    .CLK_PERIOD (CLOCK_PERIOD)//1000/5 = 200Mhz, the input clock is assumed to 200mhz 
)
control_inst
(
  .clk_x10(clk_x10_i),
  .g_rst(g_rst),
  .inverse(inverse_sw), //when this is high, press button is adding; when this is low, press button is reduing
  .r_whole_delay_button(r_whole_delay_button),
  .g_whole_delay_button(g_whole_delay_button),
  .b_whole_delay_button(b_whole_delay_button),
  .r_rising_delay_button(r_rising_delay_button),
  .g_rising_delay_button(g_rising_delay_button),
  .b_rising_delay_button(b_rising_delay_button),
  .r_falling_delay_button(r_falling_delay_button),
  .g_falling_delay_button(g_falling_delay_button),
  .b_falling_delay_button(b_falling_delay_button),
  .r_whole_delay_value(whole_delay_r_i),
  .g_whole_delay_value(whole_delay_g_i),
  .b_whole_delay_value(whole_delay_b_i),
  .r_rising_delay_value(rising_delay_r_i),
  .g_rising_delay_value(rising_delay_g_i),
  .b_rising_delay_value(rising_delay_b_i),
  .r_falling_delay_value(falling_delay_r_i),
  .g_falling_delay_value(falling_delay_g_i),
  .b_falling_delay_value(falling_delay_b_i), 
  .LED_OUTPUT(led_output_i)   
);

assign led_out_3 = led_output_i[3];
assign led_out_2 = led_output_i[2];
assign led_out_1 = led_output_i[1];
assign led_out_0 = led_output_i[0];

//send_enable and send_stop debounce
debounce #(
	.CLK_PERIOD(CLOCK_PERIOD*10)//1000/50 = 200Mhz, this is data in this application
)
debounce_inst_1
(
	.clk(clk_x1),
	.key(send_enable_button),//input key signal
	.key_pulse(send_enable_i)//generated pulse		
);
debounce #(
	.CLK_PERIOD(CLOCK_PERIOD*10)//1000/5 = 200Mhz, this is data in this application
)
debounce_inst_2
(
	.clk(clk_x1),
	.key(send_stop_button),//input key signal
	.key_pulse(send_stop_i)//generated pulse		
);

debounce #(
	.CLK_PERIOD(CLOCK_PERIOD*10)//1000/5 = 200Mhz, this is data in this application
)
debounce_inst_3
(
	.clk(clk_x1),
	.key(mode_choice_button),//input key signal
	.key_pulse(mode_choice_i)//generated pulse		
);

reg mode_choice = 1'b0;
always @ (posedge clk_x1)
    begin
        if(mode_choice_i)
            begin
        	   mode_choice <= !mode_choice;
            end
        else
            begin
        	   mode_choice <= mode_choice;
            end
    end

// Status LED
always @ (posedge clk_x1)
    begin
        if(slow_rst_i)
            begin
        	   led_status_0 <= 1'b0;
        	   led_status_1 <= 1'b0;
        	   led_status_2 <= 1'b0;
        	   led_status_3 <= 1'b0;
        	   counter_for_status_LED <= 20'd0;
            end
        else
            begin
        	   counter_for_status_LED <= counter_for_status_LED + 1'b1;
        	   if (counter_for_status_LED <= 20'd262143) 
        	      begin
        	   		led_status_0 <= 1'b1;
        	   		led_status_1 <= 1'b0;
        	   		led_status_2 <= 1'b0;
        	   		led_status_3 <= 1'b0;        	   		
        	   	  end
        	   else 
        	   	begin
        	   		if (counter_for_status_LED <= 20'd524287) 
        	   		    begin
         	   				led_status_0 <= 1'b0;
        	   				led_status_1 <= 1'b1;
        	   				led_status_2 <= 1'b0;
        	   				led_status_3 <= 1'b0;       	   				
        	   			end
        	   		else 
        	   			begin
        	   				if (counter_for_status_LED <= 20'd786432) 
        	   				    begin
        	   						led_status_0 <= 1'b0;
        	   						led_status_1 <= 1'b0;
        	   						led_status_2 <= 1'b1;
        	   						led_status_3 <= 1'b0;
        	   					end
        	   				else 
        	   					begin
        	   						led_status_0 <= 1'b0;
        	   						led_status_1 <= 1'b0;
        	   						led_status_2 <= 1'b0;
        	   						led_status_3 <= 1'b1;        	   						
        	   					end
        	   			end
        	   	end
            end
    end
//Clock divider
divider_even
#(
	.N(20)
)
divider_even_inst
(
	.clk(clk_x10_i),
	.rst(g_rst),
	.clk_div_even(clk_x1)
);

//Reset generation
reset_gen reset_gen_inst(
	.clk(clk_x10_i),
	.g_rst(g_rst),
	.slow_rst(slow_rst_i)
);

//generate PAM-4 pattern
data_gen #
(
	.INV_PATTERN(0),
	.POLY_LENGHT(7),
	.POLY_TAP(1)//these parameter decide the PRBS PATTERN
)
data_gen_inst
(
	.clk(clk_x1),
	.rst(slow_rst_i),
	.send_enable(send_enable_i), //begin to send data
    .send_stop(send_stop_i), //finish to send data
	.data_out(data_origin_i)
);
encoder encoder_inst(
	.clk(clk_x1),
	.rst(slow_rst_i),
	.data_in(data_origin_i),
	.data_out(data_slow_reference_i)
);

//Generate OOK PRBS pattern
data_gen_ook #
(
	.INV_PATTERN(0),
	.POLY_LENGHT(7),
	.POLY_TAP(1)//these parameter decide the PRBS PATTERN
)
data_gen_ook_inst
(
	.clk(clk_x1),
	.rst(slow_rst_i),
	.send_enable(send_enable_i), //begin to send a frame data
	.data_out(ook_prbs_reference_i)
);
//Data enable and OOK/PAM mode
always @ (*)
	begin
		if (r_enable) 
		    begin
		    	if (!mode_choice) 
		    	    begin
						data_slow_reference_i_i[2] <= data_slow_reference_i[2];		    			
		    		end
		    	else 
		    		begin
		    			data_slow_reference_i_i[2] <= ook_prbs_reference_i;
		    		end

			end
		else 
			begin
				data_slow_reference_i_i[2] <= 1'b0;
			end
	end
always @ (*)
	begin
		if (g_enable) 
		    begin
		    	if (!mode_choice) 
		    	    begin
						data_slow_reference_i_i[1] <= data_slow_reference_i[1];		    			
		    		end
		    	else 
		    		begin
		    			data_slow_reference_i_i[1] <= ook_prbs_reference_i;
		    		end
			end
		else 
			begin
				data_slow_reference_i_i[1] <= 1'b0;
			end
	end
always @ (*)
	begin
		if (b_enable) 
		    begin
		    	if (!mode_choice) 
		    	    begin
						data_slow_reference_i_i[0] <= data_slow_reference_i[0];		    			
		    		end
		    	else 
		    		begin
		    			data_slow_reference_i_i[0] <= ook_prbs_reference_i;
		    		end
			end
		else 
			begin
				data_slow_reference_i_i[0] <= 1'b0;
			end
	end
edge_det edge_det_inst(
	.clk(clk_x10_i),
	.rst(g_rst),
	.data_in(data_slow_reference_i_i),
	.rising_edge(rising_edge_i),
	.falling_edge(falling_edge_i)
);

// this model is used to delay the rising edge or falling edge
eq_delay eq_delay_inst(
	.clk_x10(clk_x10_i),
	.g_rst(g_rst),
	.rising_edge(rising_edge_i),
	.falling_edge(falling_edge_i), 
	.rising_delay_r(rising_delay_r_i), //the max value is 0-10
	.falling_delay_r(falling_delay_r_i), //the max value is 0-10
	.rising_delay_g(rising_delay_g_i), //the max value is 0-10
	.falling_delay_g(falling_delay_g_i), //the max value is 0-10
	.rising_delay_b(rising_delay_b_i), //the max value is 0-10
	.falling_delay_b(falling_delay_b_i), //the max value is 0-10
	.eq_delay_output(eq_delay_i),
	.reference_output(reference_i)
);

// this model is used delay reference and eq_delay signal in the same time
init_delay init_delay_inst_ref(
	.clk(clk_x10_i),
	.delay_r(whole_delay_r_i),
  	.delay_g(whole_delay_g_i),
  	.delay_b(whole_delay_b_i),
	.data_in(reference_i),
	.data_out(reference_output_i)		
);

init_delay init_delay_inst_eq(
	.clk(clk_x10_i),
	.delay_r(whole_delay_r_i),
  	.delay_g(whole_delay_g_i),
  	.delay_b(whole_delay_b_i),
	.data_in(eq_delay_i),
	.data_out(eq_delay_output_i)		
);
//Output stage
OBUFDS #( 
.IOSTANDARD("LVDS_25") 
// 指名输出端口的电平标准 
) OBUFDS_1 ( 
.O(red_output_ref_p), // 差分正端输出，直接连接到顶层模块端口 
.OB(red_output_ref_n), // 差分负端输出，直接连接到顶层模块端口 
.I(reference_output_i[2]) // 缓冲器输入 
); 
OBUFDS #( 
.IOSTANDARD("LVDS_25") 
// 指名输出端口的电平标准 
) OBUFDS_2 ( 
.O(green_output_ref_p), // 差分正端输出，直接连接到顶层模块端口 
.OB(green_output_ref_n), // 差分负端输出，直接连接到顶层模块端口 
.I(reference_output_i[1]) // 缓冲器输入 
); 
OBUFDS #( 
.IOSTANDARD("LVDS_25") 
// 指名输出端口的电平标准 
) OBUFDS_3 ( 
.O(blue_output_ref_p), // 差分正端输出，直接连接到顶层模块端口 
.OB(blue_output_ref_n), // 差分负端输出，直接连接到顶层模块端口 
.I(reference_output_i[0]) // 缓冲器输入 
); 
OBUFDS #( 
.IOSTANDARD("LVDS_25") 
// 指名输出端口的电平标准 
) OBUFDS_4 ( 
.O(red_output_delay_p), // 差分正端输出，直接连接到顶层模块端口 
.OB(red_output_delay_n), // 差分负端输出，直接连接到顶层模块端口 
.I(eq_delay_output_i[2]) // 缓冲器输入 
); 
OBUFDS #( 
.IOSTANDARD("LVDS_25") 
// 指名输出端口的电平标准 
) OBUFDS_5 ( 
.O(green_output_delay_p), // 差分正端输出，直接连接到顶层模块端口 
.OB(green_output_delay_n), // 差分负端输出，直接连接到顶层模块端口 
.I(eq_delay_output_i[1]) // 缓冲器输入 
); 
OBUFDS #( 
.IOSTANDARD("LVDS_25") 
// 指名输出端口的电平标准 
) OBUFDS_6 ( 
.O(blue_output_delay_p), // 差分正端输出，直接连接到顶层模块端口 
.OB(blue_output_delay_n), // 差分负端输出，直接连接到顶层模块端口 
.I(eq_delay_output_i[0]) // 缓冲器输入 
); 
// Output CLK Reference
OBUFDS #( 
.IOSTANDARD("LVDS_25") 
// 指名输出端口的电平标准 
) OBUFDS_7 ( 
.O(clk_reference_p), // 差分正端输出，直接连接到顶层模块端口 
.OB(clk_reference_n), // 差分负端输出，直接连接到顶层模块端口 
.I(clk_x1) // 缓冲器输入 
); 
// for simulation
//assign slow_rst = slow_rst_i;
endmodule