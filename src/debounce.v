// =============================================================================
// Filename: debounce.v
// Author: KANG, Jian
// Email: jkangac@connect.ust.hk
// Affiliation: Hong Kong University of Science and Technology
// Description: This is the button debounce module. The key in this module is high active

//CLOCK_PERIOD: The clock cycle of input clock.
//N: The width of the button needed to debounce.
// -----------------------------------------------------------------------------
`timescale 1 ns / 1 ps
module debounce #(
	parameter CLK_PERIOD = 5//1000/5 = 200Mhz, this is data in this application
)
(
	input clk,
	input key,//input key signal
	output key_pulse//generated pulse		
);

localparam CNT_BIT_NUM = bit_num(20_000_000/CLK_PERIOD);//refer the function below


reg  key_rst = 0;//the key value before delay
reg  key_rst_pre = 0;
wire  key_edge;
reg  key_sec = 0;//the key value after delay


always @ (posedge clk)
    begin
    	key_rst <= key;
    	key_rst_pre <= key_rst;
    end

assign key_edge = (~key_rst_pre) & key_rst;


reg [CNT_BIT_NUM - 1 : 0] counter = 0;//clk period is CLK_PERIOD ns, we need 20_000_000/CLK_PERIOD times cnt to get 20ms delay to do the key detection.
reg counter_on = 1'b0;


always @ (posedge clk)
    begin
    	if (key_edge) 
    		begin
    			counter_on <= 1'b1;
    		end
    	if (counter_on) 
    	    begin
    	        if (counter == 20_000_000/CLK_PERIOD) 
    	            begin
    	                counter <= {CNT_BIT_NUM{1'b0}};
    	                counter_on <= 1'b0;
    	            end
    	        else 
    	            begin
    	                counter <= counter + 1'b1;
    	            end
    	    end
    	else 
    	    begin
    	        counter <= {CNT_BIT_NUM{1'b0}};
    	    end

    end

//capture the key value after delay
always @ (posedge clk)
    begin
    	if(counter == 20_000_000/(CLK_PERIOD))
    		begin
    			key_sec <= key;
    		end
    	else 
    	    begin
    	        key_sec <= 0;
    	    end
    end

assign key_pulse =  key_sec;

//The function to calculate bit width.
function integer bit_num(input integer value);
	begin
		for (bit_num = 0; value > 0; bit_num = bit_num + 1)
		    begin
                value = value >> 1;
		    end
    end
endfunction

endmodule