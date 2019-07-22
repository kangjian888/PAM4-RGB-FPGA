// =============================================================================
// Filename: control_top.v
// Author: KANG, Jian
// Email: jkangac@connect.ust.hk
// Affiliation: Hong Kong University of Science and Technology
// Description:
// -----------------------------------------------------------------------------
`timescale 1 ns / 1 ps
module control_top(
	input SYSCLK_P,
	input SYSCLK_N,
	input GPIO_SW_C,
	input GPIO_SW_N,
	input GPIO_SW_S,
	input GPIO_SW_E,
	input GPIO_SW_W,
	input GPIO_DIP_SW0,//inverse
	output PMOD_3,
	output PMOD_2,
	output PMOD_1,
	output PMOD_0,	
	output GPIO_LED_3,
	output GPIO_LED_2,
	output GPIO_LED_1,
	output GPIO_LED_0
);


wire clk_i;
wire [3:0] LED_OUTPUT_i;
wire [3:0] r_whole_delay_value;

assign GPIO_LED_3 = LED_OUTPUT_i[3];
assign GPIO_LED_2 = LED_OUTPUT_i[2];
assign GPIO_LED_1 = LED_OUTPUT_i[1];
assign GPIO_LED_0 = LED_OUTPUT_i[0];

assign PMOD_3 = r_whole_delay_value[3];
assign PMOD_2 = r_whole_delay_value[2];
assign PMOD_1 = r_whole_delay_value[1];
assign PMOD_0 = r_whole_delay_value[0];

clk_gen clk_gen_inst(
  // Clock out ports
  .clk_out1(clk_i),     // output clk_out1
 // Clock in ports
  .clk_in1_p(SYSCLK_P),    // input clk_in1_p
  .clk_in1_n(SYSCLK_N));    // input clk_in1_n

control #(
    .CLK_PERIOD (5)//1000/5 = 200Mhz, the input clock is assumed to 200mhz	
)
control_inst
(
	.clk_x10(clk_i),
	.g_rst(GPIO_SW_C),
	.inverse(GPIO_DIP_SW0),
	.r_whole_delay_button(GPIO_SW_N),
	.g_whole_delay_button(1'b0),
	.b_whole_delay_button(1'b0),
	.r_rising_delay_button(GPIO_SW_S),
	.g_rising_delay_button(1'b0),
	.b_rising_delay_button(1'b0),
	.r_falling_delay_button(GPIO_SW_E),
	.g_falling_delay_button(GPIO_SW_W),
	.b_falling_delay_button(1'b0),
	.r_whole_delay_value(r_whole_delay_value),
	.g_whole_delay_value(),
	.b_whole_delay_value(),
	.r_rising_delay_value(),
	.g_rising_delay_value(),
	.b_rising_delay_value(),
	.r_falling_delay_value(),
	.g_falling_delay_value(),
	.b_falling_delay_value(),	
	.LED_OUTPUT(LED_OUTPUT_i)		
);

endmodule