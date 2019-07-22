// =============================================================================
// Filename: control.v
// Author: KANG, Jian
// Email: jkangac@connect.ust.hk
// Affiliation: Hong Kong University of Science and Technology
// Description: this model is used to control the button and the led 
// to control and show the delay value
// -----------------------------------------------------------------------------
`timescale 1 ns / 1 ps
module control #(
    parameter CLK_PERIOD = 5//1000/5 = 200Mhz, the input clock is assumed to 200mhz 
)
(
  input clk_x10,
  input g_rst,
  input inverse, //when this is high, press button is adding; when this is low, press button is reduing
  input r_whole_delay_button,
  input g_whole_delay_button,
  input b_whole_delay_button,
  input r_rising_delay_button,
  input g_rising_delay_button,
  input b_rising_delay_button,
  input r_falling_delay_button,
  input g_falling_delay_button,
  input b_falling_delay_button,
  output reg [3:0] r_whole_delay_value,
  output reg [3:0] g_whole_delay_value,
  output reg [3:0] b_whole_delay_value,
  output reg [3:0] r_rising_delay_value,
  output reg[3:0] g_rising_delay_value,
  output reg [3:0] b_rising_delay_value,
  output reg [3:0] r_falling_delay_value,
  output reg [3:0] g_falling_delay_value,
  output reg [3:0] b_falling_delay_value, 
  output reg [3:0] LED_OUTPUT   
);


// this part is used to debounce
wire [8:0] button_in;
wire [8:0] debounce_out;
assign button_in[8] = r_whole_delay_button;
assign button_in[7] = g_whole_delay_button; 
assign button_in[6] = b_whole_delay_button; 
assign button_in[5] = r_rising_delay_button; 
assign button_in[4] = g_rising_delay_button; 
assign button_in[3] = b_rising_delay_button; 
assign button_in[2] = r_falling_delay_button; 
assign button_in[1] = g_falling_delay_button; 
assign button_in[0] = b_falling_delay_button;  
generate
  genvar i;
  for (i = 0; i <= 8 ; i = i + 1)
  begin:debounce_module//Add name here
    debounce #(
        .CLK_PERIOD (CLK_PERIOD)//1000/5 = 200Mhz, the input clock is assumed to 200mhz
    )
        debounce_inst
    (
      .clk(clk_x10),
      .key(button_in[i]),//input key signal
      .key_pulse(debounce_out[i])//generated pulse    
    );
  end
endgenerate

// this part is used to control the number of output value and led
reg [8:0] show_flag;// the first time press, show on led. the second time press, add one

always @ (posedge clk_x10)
    begin
        if(g_rst)
            begin
             show_flag <= 0;
             r_whole_delay_value <= 4'd0;
         g_whole_delay_value <= 4'd0;
         b_whole_delay_value <= 4'd0;
         r_rising_delay_value <= 4'd0;
         g_rising_delay_value <= 4'd0;
         b_rising_delay_value <= 4'd0;
         r_falling_delay_value <= 4'd0;
         g_falling_delay_value <= 4'd0;
         b_falling_delay_value <= 4'd0;
             LED_OUTPUT <= 4'd0;
            end
        else
            begin
             case (debounce_out) 
                 9'd0:
                     begin                       
                         if (counter == {CNT_BIT_NUM{1'b1}}) 
                          begin
                            show_flag <= 0;
                                LED_OUTPUT <= LED_OUTPUT;
                          end
                         else 
                          begin
                            show_flag <= show_flag;
                                case (show_flag) 
                                    9'd256:
                                        begin
                                            LED_OUTPUT <= r_whole_delay_value;
                                        end
                                    9'd128:
                                        begin
                                            LED_OUTPUT <= g_whole_delay_value;
                                        end
                                    9'd64:
                                        begin
                                            LED_OUTPUT <= b_whole_delay_value;
                                        end
                                    9'd32:
                                        begin
                                            LED_OUTPUT <= r_rising_delay_value;
                                        end
                                    9'd16:
                                        begin
                                            LED_OUTPUT <= g_rising_delay_value;
                                        end
                                     9'd8:
                                        begin
                                            LED_OUTPUT <= b_rising_delay_value;
                                        end
                                    9'd4:
                                        begin
                                            LED_OUTPUT <= r_falling_delay_value;
                                        end
                                    9'd2:
                                        begin
                                            LED_OUTPUT <= g_falling_delay_value;
                                        end
                                    9'd1:
                                        begin
                                            LED_OUTPUT <= b_falling_delay_value;
                                        end                                                                                                                                                                                                                                                               
                                    default:
                                        begin
                                            LED_OUTPUT <= LED_OUTPUT;
                                        end
                                endcase
                          end
                     end
                 9'd256:
                     begin
                           LED_OUTPUT <= r_whole_delay_value;
                         if (show_flag == 9'd256) 
                          begin
                            if (r_whole_delay_value == 4'd10 && inverse) 
                                begin
                                r_whole_delay_value <= 0;
                              end
                                else if (r_whole_delay_value == 4'd0 && !inverse) 
                                    begin
                                        r_whole_delay_value <= 4'd10;
                                    end
                                else 
                                    begin
                                        if (inverse) 
                                            begin
                                                r_whole_delay_value <= r_whole_delay_value + 1'b1;                                               
                                            end
                                        else 
                                            begin
                                                r_whole_delay_value <= r_whole_delay_value - 1'b1;
                                            end
                                    end
                          end
                         else
                          begin
                            show_flag <= 9'd256;
                            r_whole_delay_value <= r_whole_delay_value;
                          end
                     end
                 9'd128:
                       begin
                           LED_OUTPUT <= g_whole_delay_value;
                           if (show_flag == 9'd128) 
                            begin
                                if (g_whole_delay_value == 4'd10 && inverse) 
                                    begin
                                        g_whole_delay_value <= 0;
                                    end
                                else if (g_whole_delay_value == 4'd0 && !inverse) 
                                    begin
                                        g_whole_delay_value <= 4'd10;
                                    end
                                else 
                                    begin
                                        if (inverse) 
                                            begin
                                                g_whole_delay_value <= g_whole_delay_value + 1'b1;                                               
                                            end
                                        else 
                                            begin
                                                g_whole_delay_value <= g_whole_delay_value - 1'b1;
                                            end
                                    end
                            end
                           else
                            begin
                                show_flag <= 9'd128;
                                g_whole_delay_value <= g_whole_delay_value;
                            end
                       end
                 9'd64:
                       begin
                           LED_OUTPUT <= b_whole_delay_value;
                           if (show_flag == 9'd64) 
                            begin
                                if (b_whole_delay_value == 4'd10 && inverse) 
                                    begin
                                        b_whole_delay_value <= 0;
                                    end
                                else if (b_whole_delay_value == 4'd0 && !inverse) 
                                    begin
                                        b_whole_delay_value <= 4'd10;
                                    end
                                else 
                                    begin
                                        if (inverse) 
                                            begin
                                                b_whole_delay_value <= b_whole_delay_value + 1'b1;                                               
                                            end
                                        else 
                                            begin
                                                b_whole_delay_value <= b_whole_delay_value - 1'b1;
                                            end
                                    end
                            end
                           else
                            begin
                                show_flag <= 9'd64;
                                b_whole_delay_value <= b_whole_delay_value;
                            end
                       end
                 9'd32:
                       begin
                           LED_OUTPUT <= r_rising_delay_value;
                           if (show_flag == 9'd32) 
                            begin
                                if (r_rising_delay_value == 4'd10 && inverse) 
                                    begin
                                        r_rising_delay_value <= 0;
                                    end
                                else if (r_rising_delay_value == 4'd0 && !inverse) 
                                    begin
                                        r_rising_delay_value <= 4'd10;
                                    end
                                else 
                                    begin
                                        if (inverse) 
                                            begin
                                                r_rising_delay_value <= r_rising_delay_value + 1'b1;                                               
                                            end
                                        else 
                                            begin
                                                r_rising_delay_value <= r_rising_delay_value - 1'b1;
                                            end
                                    end
                            end
                           else
                            begin
                                show_flag <= 9'd32;
                                r_rising_delay_value <= r_rising_delay_value;
                            end
                       end
                 9'd16:
                       begin
                           LED_OUTPUT <= g_rising_delay_value;
                           if (show_flag == 9'd16) 
                            begin
                                if (g_rising_delay_value == 4'd10 && inverse) 
                                    begin
                                        g_rising_delay_value <= 0;
                                    end
                                else if (g_rising_delay_value == 4'd0 && !inverse) 
                                    begin
                                        g_rising_delay_value <= 4'd10;
                                    end
                                else 
                                    begin
                                        if (inverse) 
                                            begin
                                                g_rising_delay_value <= g_rising_delay_value + 1'b1;                                               
                                            end
                                        else 
                                            begin
                                                g_rising_delay_value <= g_rising_delay_value - 1'b1;
                                            end
                                    end
                            end
                           else
                            begin
                                show_flag <= 9'd16;
                                g_rising_delay_value <= g_rising_delay_value;
                            end
                       end
                 9'd8:
                       begin
                           LED_OUTPUT <= b_rising_delay_value;
                           if (show_flag == 9'd8) 
                            begin
                                if (b_rising_delay_value == 4'd10 && inverse) 
                                    begin
                                        b_rising_delay_value <= 0;
                                    end
                                else if (b_rising_delay_value == 4'd0 && !inverse) 
                                    begin
                                        b_rising_delay_value <= 4'd10;
                                    end
                                else 
                                    begin
                                        if (inverse) 
                                            begin
                                                b_rising_delay_value <= b_rising_delay_value + 1'b1;                                               
                                            end
                                        else 
                                            begin
                                                b_rising_delay_value <= b_rising_delay_value - 1'b1;
                                            end
                                    end
                            end
                           else
                            begin
                                show_flag <= 9'd8;
                                b_rising_delay_value <= b_rising_delay_value;
                            end
                       end
                 9'd4:
                       begin
                           LED_OUTPUT <= r_falling_delay_value;
                           if (show_flag == 9'd4) 
                            begin
                                if (r_falling_delay_value == 4'd10 && inverse) 
                                    begin
                                        r_falling_delay_value <= 0;
                                    end
                                else if (r_falling_delay_value == 4'd0 && !inverse) 
                                    begin
                                        r_falling_delay_value <= 4'd10;
                                    end
                                else 
                                    begin
                                        if (inverse) 
                                            begin
                                                r_falling_delay_value <= r_falling_delay_value + 1'b1;                                               
                                            end
                                        else 
                                            begin
                                                r_falling_delay_value <= r_falling_delay_value - 1'b1;
                                            end
                                    end
                            end
                           else
                            begin
                                show_flag <= 9'd4;
                                r_falling_delay_value <= r_falling_delay_value;
                            end
                       end
                 9'd2:
                       begin
                           LED_OUTPUT <= g_falling_delay_value;
                           if (show_flag == 9'd2) 
                            begin
                                if (g_falling_delay_value == 4'd10 && inverse) 
                                    begin
                                        g_falling_delay_value <= 0;
                                    end
                                else if (g_falling_delay_value == 4'd0 && !inverse) 
                                    begin
                                        g_falling_delay_value <= 4'd10;
                                    end
                                else 
                                    begin
                                        if (inverse) 
                                            begin
                                                g_falling_delay_value <= g_falling_delay_value + 1'b1;                                               
                                            end
                                        else 
                                            begin
                                                g_falling_delay_value <= g_falling_delay_value - 1'b1;
                                            end
                                    end
                            end
                           else
                            begin
                                show_flag <= 9'd2;
                                g_falling_delay_value <= g_falling_delay_value;
                            end
                       end
                 9'd1:
                       begin
                           LED_OUTPUT <= b_falling_delay_value;
                           if (show_flag == 9'd1) 
                            begin
                                if (b_falling_delay_value == 4'd10 && inverse) 
                                    begin
                                        b_falling_delay_value <= 0;
                                    end
                                else if (b_falling_delay_value == 4'd0 && !inverse) 
                                    begin
                                        b_falling_delay_value <= 4'd10;
                                    end
                                else 
                                    begin
                                        if (inverse) 
                                            begin
                                                b_falling_delay_value <= b_falling_delay_value + 1'b1;                                               
                                            end
                                        else 
                                            begin
                                                b_falling_delay_value <= b_falling_delay_value - 1'b1;
                                            end
                                    end
                            end
                           else
                            begin
                                show_flag <= 9'd1;
                                b_falling_delay_value <= b_falling_delay_value;
                            end
                       end
                 default:
                     begin
                         show_flag <= show_flag;
                         LED_OUTPUT <= LED_OUTPUT;
                         r_whole_delay_value <= r_whole_delay_value;
                         g_whole_delay_value <= g_whole_delay_value;
                         b_whole_delay_value <= b_whole_delay_value;
                         r_rising_delay_value <= r_rising_delay_value;
                         g_rising_delay_value <= g_rising_delay_value;
                         b_rising_delay_value <= b_rising_delay_value;
                         r_falling_delay_value <= r_falling_delay_value;
                         g_falling_delay_value <= g_falling_delay_value;
                         b_falling_delay_value <= b_falling_delay_value;
                     end
             endcase
            end
    end

localparam CNT_BIT_NUM = bit_num(2000_000_000/CLK_PERIOD);//2s delay
reg [CNT_BIT_NUM:0] counter;
always @ (posedge clk_x10)
    begin
        if(g_rst)
            begin
             counter <= 0;
            end
        else
            begin
             if (debounce_out == 9'd0) 
              begin
                if (counter == {CNT_BIT_NUM{1'b1}}) 
                    begin
                    counter <= counter;
                  end
                else 
                  begin
                    counter <= counter + 1'b1;
                  end
              end
             else 
              begin
                counter <= 0;
              end
            end
    end


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