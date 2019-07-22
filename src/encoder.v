// =============================================================================
// Filename: encoder.v
// Author: KANG, Jian
// Email: jkangac@connect.ust.hk
// Affiliation: Hong Kong University of Science and Technology
// Description: This module transform two bits binary information to THERMOMETER CODE
// -----------------------------------------------------------------------------
`timescale 1 ns / 1 ps
module encoder(
	input clk,
	input rst,
	input [1:0] data_in,
	output reg [2:0] data_out
);

always @ (posedge clk)
    begin
        if(rst)
            begin
        	   data_out <= 3'd0;
            end
        else
            begin
        	   case (data_in) 
        	       2'b00:
        	           begin
        	               data_out <= 3'b000;
        	           end
        	       2'b01:
        	           begin
        	               data_out <= 3'b001;
        	           end
        	       2'b10:
        	           begin
        	               data_out <= 3'b011;
        	           end
        	       2'b11:
        	       		begin
        	       			data_out <= 3'b111;
        	       		end
        	       default:
        	       		begin
        	       			data_out <= 3'b000;
        	       		end
        	   endcase
            end
    end
endmodule