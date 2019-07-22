// =============================================================================
// Filename: divider_even.v
// Author: KANG, Jian
// Email: jkangac@connect.ust.hk
// Affiliation: Hong Kong University of Science and Technology
// Description:
// -----------------------------------------------------------------------------
`timescale 1 ns / 1 ps
module divider_even#(
    parameter N = 2
)
(
    input clk,
    input rst,
    output reg clk_div_even
);
localparam WD = clogb2(N);
reg [WD-1:0] cnt;

always @ (posedge clk)
    begin
        if(rst)
            begin
               cnt <= 0;
            end
        else
            begin
               if (cnt == N-1) 
                begin
                    cnt <= 0;
                end
               else 
                begin
                    cnt <= cnt + 1'b1;
                end
            end
    end
always @ (posedge clk)
    begin
        if(rst)
            begin
               clk_div_even <= 1'b0;
            end
        else
            begin
                if (cnt == (N/2-1) || cnt == N-1) 
                    begin
                        clk_div_even <= ~clk_div_even;                  
                    end
                else 
                    begin
                        clk_div_even <=  clk_div_even;
                    end

            end
    end

function integer clogb2 (input integer depth);
    begin
        for (clogb2 = 0; depth > 0 ; clogb2 = clogb2 + 1)
            begin
                depth = depth >> 1;
            end
    end
endfunction
endmodule