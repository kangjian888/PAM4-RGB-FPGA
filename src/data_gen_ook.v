// =============================================================================
// Filename: data_gen.v
// Author: KANG, Jian
// Email: jkangac@connect.ust.hk
// Affiliation: Hong Kong University of Science and Technology
// Description: This module will generate a signal pattern
//COMMA of the frame: 
// -----------------------------------------------------------------------------
`timescale 1 ns / 1 ps
module data_gen_ook #
(
	parameter INV_PATTERN = 0,
	parameter POLY_LENGHT = 7,
	parameter POLY_TAP = 1//these parameter decide the PRBS PATTERN
)
(
	input clk,
	input rst,
	input send_enable, //begin to send a frame data
	output reg data_out
);


//State definition
localparam
IDLE = 0,
SEND_HEAD = 1,
SEND_PRBS = 2;
//SEND_TAIL = 3;
reg [3:0] counter_reg, counter_next;
reg [2:0] state_reg, state_next;
reg prbs_send_enable = 1'b0;
reg prbs_send_reset = 1'b1;
wire prbs_data_wire;

//Outputs
always @ (*) 
     begin
          case (state_reg)
               IDLE:
                    begin
                        data_out = 1'b0;
                        prbs_send_enable = 1'b0;
                        prbs_send_reset = 1'b1;
                    end
               SEND_HEAD:
                    begin
                        if (counter_reg[1] == 0) 
                            begin
                                if (counter_reg == 4'd9) 
                                    begin
                                        data_out = 1'b1;
                                        prbs_send_enable = 1'b1;//so in this next clock cycle there will be prbs generated from prbs_generation sub_module
                                    end
                                else 
                                    begin
                                        data_out = 1'b1;
                                        prbs_send_enable = 1'b0;                                      
                                    end
                            end
                        else 
                            begin
                                data_out = 1'b0;
                                prbs_send_enable = 1'b0; 
                            end
                        prbs_send_reset = 1'b0;
                    end
               SEND_PRBS:
                    begin
                        data_out = prbs_data_wire;
						prbs_send_enable = 1'b1;
                        prbs_send_reset = 1'b0;
                    end
                //SEND_TAIL:
                //	begin
                //		data_out = 10'b1100_1100_11;
                //		prbs_send_enable = 1'b0;
                //		prbs_send_reset = 1'b0;
                //	end
               default:
                    begin
                        data_out = 1'd0;
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
                    if (counter_reg == 4'd9) 
                        begin
                            state_next = SEND_PRBS;
                            counter_next = 4'd0;
                        end
                    else 
                        begin
                            state_next = SEND_HEAD;
                            counter_next = counter_reg + 1'b1;
                        end
                end
            SEND_PRBS:
            	begin
            		state_next = SEND_PRBS;
            	end
            //SEND_TAIL:
            //    begin
            //        if (send_enable) 
            //            begin
            //                state_next = SEND_HEAD;
            //            end
            //        else 
            //            begin
            //                state_next = IDLE;         
            //            end
            //    end
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
                counter_reg <= 4'd0;
    	        state_reg <= IDLE;
    	    end
    	else 
    	    begin
                counter_reg <= counter_next;
    	        state_reg <= state_next;
    	    end
    end

//call PRBS generation module to generate
  PRBS_ANY #(
    .CHK_MODE(0),
    .INV_PATTERN(INV_PATTERN),
    .POLY_LENGHT(POLY_LENGHT),
    .POLY_TAP(POLY_TAP),
    .NBITS(1))
  PRBS_GENERATE(
    .RST(prbs_send_reset),
    .CLK(clk),//using general clock in this module
    .DATA_IN(1'b0),
    .EN(prbs_send_enable),
    .DATA_OUT(prbs_data_wire)
    );

endmodule