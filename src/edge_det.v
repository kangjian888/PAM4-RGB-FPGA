// =============================================================================
// Filename: edge_det.v
// Author: KANG, Jian
// Email: jkangac@connect.ust.hk
// Affiliation: Hong Kong University of Science and Technology
// Description: this module is used to detect the rising or falling edge of input data sequence
// -----------------------------------------------------------------------------
`timescale 1 ns / 1 ps
module edge_det(
	input clk,
	input rst,
	input [2:0] data_in,
	output [2:0] rising_edge,
	output [2:0] falling_edge
);
reg [2:0] data_r1;
reg [2:0] data_r2;


generate
	genvar i;
	for (i = 0; i < 3; i = i + 1)
	begin:edge_det//Add name here
		always @ (posedge clk)
		    begin
		        if(rst)
		            begin
		        	   data_r1[i] <= 1'b0;
		        	   data_r2[i] <= 1'b0;
		            end
		        else
		            begin
		        	   data_r2[i] <= data_r1[i];
		        	   data_r1[i] <= data_in[i];
		            end
		    end
		assign rising_edge[i] = ~data_r2[i] & data_r1[i];
		assign falling_edge[i] =  data_r2[i] & ~data_r1[i];
	end
endgenerate

endmodule