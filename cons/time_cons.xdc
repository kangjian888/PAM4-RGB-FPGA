create_clock -period 5.000 -name USER_SMA_CLOCK_P -waveform {0.000 2.500} [get_ports USER_SMA_CLOCK_P]
create_generated_clock -name divider_even_inst/clk_x1 -source [get_pins divider_even_inst/clk_div_even_reg/C] -divide_by 10 [get_pins divider_even_inst/clk_div_even_reg/Q]
