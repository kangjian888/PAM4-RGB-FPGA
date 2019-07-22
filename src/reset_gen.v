// =============================================================================
// Filename: reset_gen.v
// Author: KANG, Jian
// Email: jkangac@connect.ust.hk
// Affiliation: Hong Kong University of Science and Technology
// Description:
// -----------------------------------------------------------------------------
`timescale 1 ns / 1 ps
module reset_gen(
	input clk,
	input g_rst,
	output reg slow_rst
);

reg [1:0] state_reg, state_next;
reg [4:0] counter_reg, counter_next;

localparam WAIT_GEN_CLK_STABLE=0;
localparam SLOW_RESET_GEN=1;
localparam GEN_CLK_STABLE = 2;

//Outputs
always @ (*) 
    begin
        case (state_reg)
            WAIT_GEN_CLK_STABLE:
                begin
                    slow_rst = 1'b0;
                end
            SLOW_RESET_GEN:
                begin
                    slow_rst = 1'b1;
                end
            GEN_CLK_STABLE:
            	begin
            		slow_rst =1'b0;
            	end
            default:
                begin
                    slow_rst = 1'b0;
                end
        endcase
    end

//States
always @ (*)
    begin
        state_next = state_reg;
        counter_next = counter_reg;
        case (state_reg)
            WAIT_GEN_CLK_STABLE:
                begin
                	if (counter_reg == 5'd19) 
                	    begin
                			counter_next = 5'd0;
                			state_next = SLOW_RESET_GEN;
                		end
                	else 
                		begin
                			counter_next = counter_reg + 1'b1;
                			state_next = WAIT_GEN_CLK_STABLE;
                		end
                end
            SLOW_RESET_GEN:
                begin
                    if (counter_reg == 5'd19) 
                        begin
                    		counter_next = 5'd0;
                    		state_next = GEN_CLK_STABLE;
                    	end
                    else 
                    	begin
                    		counter_next = counter_reg + 1'b1;
                    		state_next = SLOW_RESET_GEN;
                    	end
                end
            GEN_CLK_STABLE:
            	begin
            		state_next = GEN_CLK_STABLE;
            	end
            default:
                begin
                    state_next = WAIT_GEN_CLK_STABLE;
                end
        endcase
    end

//Update state
always @ (posedge clk)
    begin
        if(g_rst)
            begin
                state_reg <= WAIT_GEN_CLK_STABLE;
                counter_reg <= 0;
            end
        else
            begin
                state_reg <= state_next;
                counter_reg <= counter_next;
            end
    end


endmodule