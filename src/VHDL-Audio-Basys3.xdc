
# -----------------------------------------------------------------------------
# Push buttons
# -----------------------------------------------------------------------------

set_property PACKAGE_PIN U18     [get_ports btn_center_i]
set_property IOSTANDARD LVCMOS33 [get_ports btn_*]

# -----------------------------------------------------------------------------
# Global clock
# -----------------------------------------------------------------------------

set_property PACKAGE_PIN W5      [get_ports clk_i]
set_property IOSTANDARD LVCMOS33 [get_ports clk_i]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk_i]

# -----------------------------------------------------------------------------
# I2S output on connector PmodA
#
# The datasheet provided by Digilent shows a wrong pinout.
# See the schematics for the correct pinout.
# -----------------------------------------------------------------------------

set_property PACKAGE_PIN J1 [get_ports i2s_master_clk_o]
set_property PACKAGE_PIN L2 [get_ports i2s_left_right_clk_o]
set_property PACKAGE_PIN J2 [get_ports i2s_serial_clk_o]
set_property PACKAGE_PIN G2 [get_ports i2s_serial_data_o]
set_property IOSTANDARD LVCMOS33 [get_ports i2s_*]

# -----------------------------------------------------------------------------
# Microphone input on connector PmodB
# -----------------------------------------------------------------------------

set_property PACKAGE_PIN A14 [get_ports mic_chip_select_n_o]
set_property PACKAGE_PIN B16 [get_ports mic_serial_clk_o]
set_property PACKAGE_PIN B15 [get_ports mic_serial_data_i]
set_property IOSTANDARD LVCMOS33 [get_ports mic_*]
