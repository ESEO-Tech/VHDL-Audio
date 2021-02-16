
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity I2STransmitterTestbench is
end I2STransmitterTestbench;

use work.I2STransmitterTestbench_pkg.all;

architecture Simulation of I2STransmitterTestbench is
	constant CLK_PERIOD                : time := 1 sec / CLK_FREQUENCY_HZ;
	constant I2S_MASTER_CLK_PERIOD     : time := CLK_PERIOD * (CLK_FREQUENCY_HZ / I2S_MASTER_FREQUENCY_HZ);
	constant I2S_LEFT_RIGHT_CLK_PERIOD : time := I2S_MASTER_CLK_PERIOD * (I2S_MASTER_FREQUENCY_HZ / I2S_SAMPLE_RATE_HZ);
	constant I2S_SERIAL_CLOCK_PERIOD   : time := I2S_LEFT_RIGHT_CLOCK_PERIOD / I2S_BITS_PER_SAMPLE / 2;

	signal clk                                    : std_logic := '0';
	signal i2s_ready                              : std_logic;
	signal i2s_serial_clk, serial_clk_reg         : std_logic;
	signal i2s_serial_data, serial_data_reg       : std_logic;
	signal i2s_left_right_clk, left_right_clk_reg : std_logic;
	signal i2s_master_clk, master_clk_reg         : std_logic;
begin
	clk <= not clk after CLK_PERIOD / 2;

	transmitter_inst : entity work.I2STransmitter
		generic map(
			CLK_FREQUENCY_HZ    => CLK_FREQUENCY_HZ,
			MASTER_FREQUENCY_HZ => I2S_MASTER_FREQUENCY_HZ,
			SAMPLE_RATE_HZ      => I2S_SAMPLE_RATE_HZ,
			BITS_PER_SAMPLE     => I2S_BITS_PER_SAMPLE
		)
		port map(
			clk_i            => clk,
			left_pdata_i     => I2S_LEFT_DATA,
			right_pdata_i    => I2S_RIGHT_DATA,
			ready_o          => i2s_ready,
			master_clk_o     => i2s_master_clk,
			serial_clk_o     => i2s_serial_clk,
			serial_data_o    => i2s_serial_data,
			left_right_clk_o => i2s_left_right_clk
		);

	p_check_master_clk : process
		variable t_rise, t_fall, t_low, t_high, period : time;
	begin
		wait until rising_edge(i2s_master_clk);
		t_rise := now;

		loop
            -- Measure high phase of master clock.
			wait until falling_edge(i2s_master_clk);
            t_fall := now;
			t_high := t_fall - t_rise;

            -- Measure low phase of master clock.
			wait until rising_edge(i2s_master_clk);
            t_rise := now;
            t_low  := t_rise - t_fall;

			period := t_high + t_low;

			-- Check master clock period.
			assert period = I2S_MASTER_CLOCK_PERIOD
				report "Incorrect period for master_clk: " & time'image(period) & " (expected " & time'image(MASTER_CLOCK_PERIOD) & ")"
				severity ERROR;

			-- Check master clock duty cycle.
			assert t_high >= I2S_DUTY_CYCLE_MIN * period and t_high <= I2S_DUTY_CYCLE_MAX * period
				report "Incorrect duty cycle for master_clk: high time=" &  time'image(t_high) & " low time=" & time'image(t_low)
				severity ERROR;
		end loop;
	end process p_check_master_clk;

    -- Check serial clock.

    -- Check left-right clock.

    -- Check ready.

    -- Check serial data.

end architecture Simulation;
