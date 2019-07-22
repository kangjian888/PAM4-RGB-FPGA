// =============================================================================
// Filename: eq_delay.v
// Author: KANG, Jian
// Email: jkangac@connect.ust.hk
// Affiliation: Hong Kong University of Science and Technology
// Description:
// -----------------------------------------------------------------------------
`timescale 1 ns / 1 ps
module eq_delay(
	input clk_x10,
	input g_rst,
	input [2:0] rising_edge,
	input [2:0] falling_edge, 
	input [3:0] rising_delay_r, //the max value is 0-9
	input [3:0] rising_delay_g, //the max value is 0-9
	input [3:0] rising_delay_b, //the max value is 0-9
	input [3:0] falling_delay_r, //the max value is 0-9
	input [3:0] falling_delay_g, //the max value is 0-9
	input [3:0] falling_delay_b, //the max value is 0-9
	output reg [2:0] eq_delay_output,
	output reg [2:0] reference_output
);

localparam IDLE = 0; //wait for the first edge coming
localparam RISE_DELAY = 1;
localparam HIGH_PERIOD = 2;
localparam FALL_DELAY = 3;
localparam LOW_PERIOD = 4;

//Inner register
reg [2:0] state_reg [2:0];
reg [2:0] state_next [2:0];
reg [3:0] counter_reg [2:0];
reg [3:0] counter_next [2:0];
//Inner wire
wire [3:0] rising_delay [2:0];
wire [3:0] falling_delay [2:0];
assign rising_delay[2] = rising_delay_r;
assign rising_delay[1] = rising_delay_g;
assign rising_delay[0] = rising_delay_b;
assign falling_delay[2] = falling_delay_r;
assign falling_delay[1] = falling_delay_g;
assign falling_delay[0] = falling_delay_b;

generate
	genvar i;
	for (i = 0; i <=2 ; i = i + 1)
	begin:eq_delay//Add name here	
	//Outputs
	always @ (*) 
	     begin
	          case (state_reg[i])
	               IDLE:
	                   begin
	                   	   eq_delay_output[i] = 1'b0;
	                   end
	               RISE_DELAY:
	                   		 begin
	                   		 	eq_delay_output[i] = 1'b0;
	                   		 end
	               HIGH_PERIOD:
	                   		  begin
	                   		  	eq_delay_output[i] = 1'b1;
	                   		  end
	               FALL_DELAY:
	                   		 begin
	                   		 	eq_delay_output[i] = 1'b1;
	                   		 end
	               LOW_PERIOD:
	                   	  	 begin
	                   	  	 	eq_delay_output[i] = 1'b0;
	                   	  	 end
	               default:
	                      begin
	                      	eq_delay_output[i] = 1'b0;
	                      end
	          endcase
	     end
	
	//States
	always @ (*)
	     begin
	     	state_next[i] = state_reg[i];
	     	counter_next[i] = counter_reg[i];
	        case (state_reg[i])
	            IDLE:
	                begin
	                	if (rising_edge[i]) 
	                	    begin
	                	        if (rising_delay[i] == 0) 
	                	            begin
	                	                state_next[i] = HIGH_PERIOD;
	                	            end
	                	        else 
	                	            begin
	                	                state_next[i] = RISE_DELAY;
	                	            end
	                	    end
	                	else if (falling_edge[i])
	                	    begin
	                	        if (falling_delay[i] == 0) 
	                	            begin
	                	                state_next[i] = LOW_PERIOD;
	                	            end
	                	        else 
	                	            begin
	                	                state_next[i] = FALL_DELAY;
	                	            end
	                	    end
	                	else 
	                	    begin
	                	        state_next[i] = IDLE;
	                	    end
	                end
	            RISE_DELAY:
	                begin
	                	if (falling_edge[i]) 
	                	    begin
	                			counter_next[i] = 0;
	                			state_next[i] = FALL_DELAY;
	                		end
	                	else 
	                		begin
	                			if (counter_reg[i] == rising_delay[i]-1'b1) 
	                    		    begin
	                    				 state_next[i] = HIGH_PERIOD;
	                    				 counter_next[i] = 0;
	                    			end
	                    		else 
	                    			begin
	                    				state_next[i] = RISE_DELAY;
	                    				counter_next[i] = counter_reg[i]+1'b1;
	                    			end
	                		end
	                end
	            HIGH_PERIOD:
	                begin
	                    if (falling_edge[i]) 
	                        begin
	                    		if (falling_delay[i] == 0) 
	                    		    begin
	                    				state_next[i] = LOW_PERIOD;
	                    			end
	                    		else 
	                    			begin
	                    				state_next[i] = FALL_DELAY;
	                    			end
	                    	end
	                    else 
	                    	begin
	                    		state_next[i] = HIGH_PERIOD;
	                    	end
	                end
	            FALL_DELAY:
	                begin
	            	if (rising_edge[i]) 
	            	    begin
	                		counter_next[i] = 0;
	                		state_next[i] = RISE_DELAY;	            			
	            		end
	            	else 
	            		begin
	            			if (counter_reg[i] == falling_delay[i]-1'b1) 
	                        	begin
	                    			state_next[i] = LOW_PERIOD;
	                    			counter_next[i] = 0;
	                    		end
	                    	else 
	                    		begin
	                    			state_next[i] = FALL_DELAY;
	                    			counter_next[i] = counter_reg[i]+1'b1;
	                    		end
	            		end
	                end
	            LOW_PERIOD:
	                begin
	                    if (rising_edge[i]) 
	                        begin
	                    		if (rising_delay[i] == 0) 
	                    		    begin
	                    				state_next[i] = HIGH_PERIOD;
	                    			end
	                    		else 
	                    			begin
	                    				state_next[i] = RISE_DELAY;
	                    			end
	                    	end
	                    else 
	                    	begin
	                    		state_next[i] = LOW_PERIOD;
	                    	end
	                end
	            default:
	                begin
	                    state_next[i] = IDLE;
	                end
	        endcase
	     end
	
	//Update state
	always @ (posedge clk_x10)
	    begin
	    	if (g_rst) 
	    	    begin
	    	        state_reg[i] <= IDLE;
	    	        counter_reg[i] <= 0;
	    	    end
	    	else 
	    	    begin
	    	        state_reg[i] <= state_next[i];
	    	        counter_reg[i] <= counter_next[i];
	    	    end
	    end
	end	
endgenerate

//Reference signal generation
generate
	genvar j;
	for (j = 0; j <= 2; j = j + 1)
	begin:no_delay//Add name here
		always @ (posedge clk_x10)
		    begin
		        if (g_rst)
		            begin
		        	   reference_output[j] <= 1'b0;
		            end
		        else
		            begin
		        	   if (rising_edge[j]) 
		        	    begin
		        	   		reference_output[j] <= 1'b1;
		        	   	end
		        	   else if (falling_edge[j]) 
		        	   	begin
		        	   		reference_output[j] <= 1'b0;
		        	   	end
		        	   else 
		        	   	begin
		        	   		reference_output[j] <= reference_output[j];
		        	   	end
		            end
		    end
	end
endgenerate

endmodule

