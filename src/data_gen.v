// =============================================================================
// Filename: data_gen.v
// Author: KANG, Jian
// Email: jkangac@connect.ust.hk
// Affiliation: Hong Kong University of Science and Technology
// Description: This module will generate a signal pattern
//COMMA of the frame: 
// -----------------------------------------------------------------------------
`timescale 1 ns / 1 ps
module data_gen #
(
	parameter INV_PATTERN = 1,
	parameter POLY_LENGHT = 9,
	parameter POLY_TAP = 5,//these parameter decide the PRBS PATTERN
    parameter HEAD_LENGTH = 10
)
(
	input clk,
	input rst,
	input send_enable, //begin to send data
    input send_stop, //finish to send data
	output reg [1:0] data_out
);


//State definition
localparam
IDLE = 0,
SEND_HEAD = 1,
SEND_PRBS = 2;

reg [1:0] state_reg, state_next;
reg [8:0] counter_reg, counter_next;
reg prbs_send_enable = 1'b0;
reg prbs_send_reset = 1'b1;
wire [1:0] prbs_data_wire;

//Outputs
always @ (*) 
     begin
          case (state_reg)
               IDLE:
                    begin
                        data_out = 2'd0;
                        prbs_send_enable = 1'b0;
                        prbs_send_reset = 1'b1;
                    end
                SEND_HEAD:
                    begin
                        if (counter_reg[1] == 1'b0) 
                            begin
                                if (counter_reg == HEAD_LENGTH - 1) 
                                    begin
                                        data_out = 2'd0;
                                        prbs_send_enable = 1'b1;
                                        prbs_send_reset = 1'b0;                                        
                                    end
                                else 
                                    begin
                                        data_out = 2'd0;
                                        prbs_send_enable = 1'b0;
                                        prbs_send_reset = 1'b0; 
                                    end
                                
                            end
                        else 
                            begin
                                data_out = 2'd3;
                                prbs_send_enable = 1'b0;
                                prbs_send_reset = 1'b0;                           
                            end                      
                    end
               SEND_PRBS:
                    begin
                        data_out = prbs_data_wire;
                        prbs_send_enable = 1'b1;
                        prbs_send_reset = 1'b0;
                    end
               default:
                    begin
                        data_out = 10'd0;
                        prbs_send_enable = 1'b0;
                        prbs_send_reset = 1'b1;
                    end
          endcase
     end

//States
always @ (*)
     begin
     	state_next = state_reg;
     	counter_next = counter_reg;
        case (state_reg)
            IDLE:
                begin
                	if (send_enable) 
                	    begin
                	        state_next = SEND_HEAD;
                	    end
                	else 
                	    begin
                	        state_next = IDLE;
                	    end
                end
            SEND_HEAD:
                begin
                    if (counter_reg == 9'd9) 
                        begin
                            state_next = SEND_PRBS;
                            counter_next = 0;
                        end
                    else 
                        begin
                            state_next = SEND_HEAD;
                            counter_next = counter_reg + 1'b1;
                        end
                end
            SEND_PRBS:
            	begin
            		if (send_stop) 
            		    begin
            		        state_next = IDLE;
            		    end
            		else 
            		    begin
                            state_next = SEND_PRBS;                                    
            		    end
            	end
            default:
                begin
                    state_next = IDLE;
                end
        endcase
     end

//Update state
always @ (posedge clk)
    begin
    	if (rst) 
    	    begin
                counter_reg <= 0;
    	        state_reg <= IDLE;
    	    end
    	else 
    	    begin
    	        state_reg <= state_next;
                counter_reg <= counter_next;
    	    end
    end

//call PRBS generation module to generate
  PRBS_ANY #(
    .CHK_MODE(0),
    .INV_PATTERN(INV_PATTERN),
    .POLY_LENGHT(POLY_LENGHT),
    .POLY_TAP(POLY_TAP),
    .NBITS(2))
  PRBS_GENERATE(
    .RST(prbs_send_reset),
    .CLK(clk),//using general clock in this module
    .DATA_IN(2'b0),
    .EN(prbs_send_enable),
    .DATA_OUT(prbs_data_wire)
    );

endmodule