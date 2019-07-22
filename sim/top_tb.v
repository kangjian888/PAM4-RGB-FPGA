// =============================================================================
// Filename: top_tb.v
// Author: KANG, Jian
// Email: jkangac@connect.ust.hk
// Affiliation: Hong Kong University of Science and Technology
//Description:
// -----------------------------------------------------------------------------
`timescale 1 ns / 1 ps

module top_tb;

// ----------------------------------
// Local parameter declaration
// ----------------------------------
// The test frequency is 500Mhz
localparam CLK_PERIOD = 2;  // clock period: 2ns


// ----------------------------------
// Interface of the tested module
// ----------------------------------
reg clk;
reg rst;
reg send_enable_button;
reg send_stop_button;
reg inverse_sw;
reg r_whole_delay_button;
reg g_whole_delay_button;
reg b_whole_delay_button;
reg r_rising_delay_button;
reg g_rising_delay_button;
reg b_rising_delay_button;
reg r_falling_delay_button;
reg g_falling_delay_button;
reg b_falling_delay_button;
wire slow_rst;
wire red_output_ref_p;
wire red_output_ref_n;
wire green_output_ref_p;
wire green_output_ref_n;
wire blue_output_ref_p;
wire blue_output_ref_n;
wire red_output_delay_p;
wire red_output_delay_n;
wire green_output_delay_p;
wire green_output_delay_n;
wire blue_output_delay_p;
wire blue_output_delay_n;
wire led_out_3;
wire led_out_2;
wire led_out_1;
wire led_out_0;
// ----------------------------------
// Instantiate the tested module
// ----------------------------------
top top_inst(
	.clk_x10(clk), //fast clock
	.g_rst(rst),
  .slow_rst(slow_rst), //for test
	.send_enable_button(send_enable_button),
	.send_stop_button(send_stop_button),
  .r_whole_delay_button(r_whole_delay_button),
  .g_whole_delay_button(g_whole_delay_button),
  .b_whole_delay_button(b_whole_delay_button),
  .r_rising_delay_button(r_rising_delay_button),
  .g_rising_delay_button(g_rising_delay_button),
  .b_rising_delay_button(b_rising_delay_button),
  .r_falling_delay_button(r_falling_delay_button),
  .g_falling_delay_button(g_falling_delay_button),
  .b_falling_delay_button(b_falling_delay_button),
  .red_output_ref_p(red_output_ref_p),
  .red_output_ref_n(red_output_ref_n),
  .green_output_ref_p(green_output_ref_p),
  .green_output_ref_n(green_output_ref_n),
  .blue_output_ref_p(blue_output_ref_p),
  .blue_output_ref_n(blue_output_ref_n),
  .red_output_delay_p(red_output_delay_p),
  .red_output_delay_n(red_output_delay_n),
  .green_output_delay_p(green_output_delay_p),
  .green_output_delay_n(green_output_delay_n),
  .blue_output_delay_p(blue_output_delay_p),
  .blue_output_delay_n(blue_output_delay_n),
  .led_out_3(led_out_3),
  .led_out_2(led_out_2),
  .led_out_1(led_out_1),
  .led_out_0(led_out_0)
);

// ----------------------------------
// Clock generation
// ----------------------------------
initial begin
  clk = 1'b0;
  forever #(CLK_PERIOD/2.0) clk = ~clk;
end

// ----------------------------------
// Input stimulus
// Generate the ad-hoc stimulus
//This is an example
//initial begin
  // Reset
  //rst         = 1'b1;
  //start       = 1'b0;
  //dividend    = 32'd0;
  //divisor     = 32'd0;
  //#(2*CLK_PERIOD) rst = 1'b0;
  //end
// ----------------------------------

initial
  begin
  //Add Your Code
  	rst = 1'b1;
  	send_enable_button = 1'b0;
  	send_stop_button = 1'b0;
    inverse_sw = 1'b1;
    r_whole_delay_button = 1'b0;
    g_whole_delay_button = 1'b0;
    b_whole_delay_button = 1'b0;
    r_rising_delay_button = 1'b0;
    g_rising_delay_button = 1'b0;
    b_rising_delay_button = 1'b0;
    r_falling_delay_button = 1'b0;
    g_falling_delay_button = 1'b0;
    b_falling_delay_button = 1'b0;
  	#(4)
  	rst = 1'b0;
    @(negedge slow_rst)
  	send_enable_button = 1'b1;
  	#(20_000_100)
  	send_enable_button = 1'b0;
  	#(100000)
  	send_stop_button = 1'b1;
  end
// ----------------------------------
// Output monitor
//This is an example
//always @(posedge clk) begin
  //if (done) begin
    //("%0d / %0d: quotient = %0d, remainder = //%0d", dividend, divisor,
      //quotient, remainder);
  //end
// ----------------------------------
//Add Your Code

endmodule