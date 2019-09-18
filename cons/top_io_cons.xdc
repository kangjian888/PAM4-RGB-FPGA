set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

#SYSCLK IN
set_property IOSTANDARD LVDS_25 [get_ports USER_SMA_CLOCK_P]
set_property PACKAGE_PIN J23 [get_ports USER_SMA_CLOCK_P]
set_property PACKAGE_PIN H23 [get_ports USER_SMA_CLOCK_N]
set_property IOSTANDARD LVDS_25 [get_ports USER_SMA_CLOCK_N]

#LA02
set_property IOSTANDARD LVDS_25 [get_ports red_output_ref_p]
set_property PACKAGE_PIN H14 [get_ports red_output_ref_p]
set_property PACKAGE_PIN H15 [get_ports red_output_ref_n]
set_property IOSTANDARD LVDS_25 [get_ports red_output_ref_n]
#LA04
set_property IOSTANDARD LVDS_25 [get_ports green_output_ref_p]
set_property PACKAGE_PIN F18 [get_ports green_output_ref_p]
set_property PACKAGE_PIN F19 [get_ports green_output_ref_n]
set_property IOSTANDARD LVDS_25 [get_ports green_output_ref_n]
#LA07
set_property IOSTANDARD LVDS_25 [get_ports blue_output_ref_p]
set_property PACKAGE_PIN H16 [get_ports blue_output_ref_p]
set_property PACKAGE_PIN G16 [get_ports blue_output_ref_n]
set_property IOSTANDARD LVDS_25 [get_ports blue_output_ref_n]
#LA28
set_property IOSTANDARD LVDS_25 [get_ports red_output_delay_p]
set_property PACKAGE_PIN K22 [get_ports red_output_delay_p]
set_property PACKAGE_PIN K23 [get_ports red_output_delay_n]
set_property IOSTANDARD LVDS_25 [get_ports red_output_delay_n]
#LA30
set_property IOSTANDARD LVDS_25 [get_ports green_output_delay_p]
set_property PACKAGE_PIN E25 [get_ports green_output_delay_p]
set_property PACKAGE_PIN D25 [get_ports green_output_delay_n]
set_property IOSTANDARD LVDS_25 [get_ports green_output_delay_n]
#LA32
set_property IOSTANDARD LVDS_25 [get_ports blue_output_delay_p]
set_property PACKAGE_PIN H26 [get_ports blue_output_delay_p]
set_property PACKAGE_PIN G26 [get_ports blue_output_delay_n]
set_property IOSTANDARD LVDS_25 [get_ports blue_output_delay_n]
#LA03P
set_property PACKAGE_PIN G17 [get_ports r_whole_delay_button]
set_property IOSTANDARD LVCMOS25 [get_ports r_whole_delay_button]
#LA03N
set_property PACKAGE_PIN F17 [get_ports g_whole_delay_button]
set_property IOSTANDARD LVCMOS25 [get_ports g_whole_delay_button]
#LA08P
set_property PACKAGE_PIN C17 [get_ports b_whole_delay_button]
set_property IOSTANDARD LVCMOS25 [get_ports b_whole_delay_button]
#LA08N
set_property PACKAGE_PIN B17 [get_ports r_rising_delay_button]
set_property IOSTANDARD LVCMOS25 [get_ports r_rising_delay_button]
#LA12P
set_property PACKAGE_PIN E20 [get_ports g_rising_delay_button]
set_property IOSTANDARD LVCMOS25 [get_ports g_rising_delay_button]
#LA12N
set_property PACKAGE_PIN D20 [get_ports b_rising_delay_button]
set_property IOSTANDARD LVCMOS25 [get_ports b_rising_delay_button]
#LA16P
set_property PACKAGE_PIN E21 [get_ports r_falling_delay_button]
set_property IOSTANDARD LVCMOS25 [get_ports r_falling_delay_button]
#LA16N
set_property PACKAGE_PIN D21 [get_ports g_falling_delay_button]
set_property IOSTANDARD LVCMOS25 [get_ports g_falling_delay_button]
#LA20P
set_property PACKAGE_PIN M16 [get_ports b_falling_delay_button]
set_property IOSTANDARD LVCMOS25 [get_ports b_falling_delay_button]
#LA20N
set_property PACKAGE_PIN M17 [get_ports g_rst]
set_property IOSTANDARD LVCMOS25 [get_ports g_rst]
#LA22P
set_property PACKAGE_PIN L17 [get_ports send_enable_button]
set_property IOSTANDARD LVCMOS25 [get_ports send_enable_button]
#LA22N
set_property PACKAGE_PIN L18 [get_ports send_stop_button]
set_property IOSTANDARD LVCMOS25 [get_ports send_stop_button]

#DIP_SW0
set_property PACKAGE_PIN R8 [get_ports inverse_sw]
set_property IOSTANDARD SSTL15 [get_ports inverse_sw]

#DIP_SW1
set_property PACKAGE_PIN P8 [get_ports r_enable]
set_property IOSTANDARD SSTL15 [get_ports r_enable]

#DIP_SW2
set_property PACKAGE_PIN R7 [get_ports g_enable]
set_property IOSTANDARD SSTL15 [get_ports g_enable]

#DIP_SW3
set_property PACKAGE_PIN R6 [get_ports b_enable]
set_property IOSTANDARD SSTL15 [get_ports b_enable]
#LED on board used as status showing

set_property PACKAGE_PIN M26 [get_ports led_status_0]
set_property IOSTANDARD LVCMOS33 [get_ports led_status_0]
set_property PACKAGE_PIN T24 [get_ports led_status_1]
set_property IOSTANDARD LVCMOS33 [get_ports led_status_1]
set_property PACKAGE_PIN T25 [get_ports led_status_2]
set_property IOSTANDARD LVCMOS33 [get_ports led_status_2]
set_property PACKAGE_PIN R26 [get_ports led_status_3]
set_property IOSTANDARD LVCMOS33 [get_ports led_status_3]

#LED on board
#set_property PACKAGE_PIN M26 [get_ports led_out_0]
#set_property IOSTANDARD LVCMOS33 [get_ports led_out_0]
#set_property PACKAGE_PIN T24 [get_ports led_out_1]
#set_property IOSTANDARD LVCMOS33 [get_ports led_out_1]
#set_property PACKAGE_PIN T25 [get_ports led_out_2]
#set_property IOSTANDARD LVCMOS33 [get_ports led_out_2]
#set_property PACKAGE_PIN R26 [get_ports led_out_3]
#set_property IOSTANDARD LVCMOS33 [get_ports led_out_3]

#LED on sub_card
#LA15P
set_property PACKAGE_PIN B22 [get_ports led_out_3]
set_property IOSTANDARD LVCMOS25 [get_ports led_out_3]
#LA15N
set_property PACKAGE_PIN A22 [get_ports led_out_2]
set_property IOSTANDARD LVCMOS25 [get_ports led_out_2]
#LA19P
set_property PACKAGE_PIN M14 [get_ports led_out_1]
set_property IOSTANDARD LVCMOS25 [get_ports led_out_1]
#LA19N
set_property PACKAGE_PIN L14 [get_ports led_out_0]
set_property IOSTANDARD LVCMOS25 [get_ports led_out_0]

#DIP Button
#SW_N
#set_property PACKAGE_PIN P6 [get_ports GPIO_SW_N]
#set_property IOSTANDARD LVCMOS15 [get_ports GPIO_SW_N]
#SW_S
#set_property PACKAGE_PIN T5 [get_ports GPIO_SW_S]
#set_property IOSTANDARD SSTL15 [get_ports GPIO_SW_S]
#SW_W
#set_property PACKAGE_PIN R5 [get_ports GPIO_SW_W]
#set_property IOSTANDARD SSTL15 [get_ports GPIO_SW_W]
#SW_C
set_property PACKAGE_PIN U6 [get_ports mode_choice_button]
set_property IOSTANDARD SSTL15 [get_ports mode_choice_button]
#SW_E
#set_property PACKAGE_PIN U5 [get_ports GPIO_SW_E]
#set_property IOSTANDARD SSTL15 [get_ports GPIO_SW_E]

#USER SMA GPIO to output clk reference used to trigger oscilloscope
set_property PACKAGE_PIN T8 [get_ports clk_reference_p]
set_property IOSTANDARD LVDS_25 [get_ports clk_reference_p]
set_property PACKAGE_PIN T7 [get_ports clk_reference_n]
set_property IOSTANDARD LVDS_25 [get_ports clk_reference_n]