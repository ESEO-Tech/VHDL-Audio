
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MicrophoneReceiver is
    generic (
        -- The general clock frequency, in Hz
        CLK_FREQUENCY_HZ : positive;
        -- The serial clock frequency for data transfer, in Hz
        BIT_RATE_HZ      : positive range 1 to 20e6;
        -- The number of data bits per samples
        BITS_PER_SAMPLE  : positive range 12 to 32
    );
    port (
        -- The general clock (from the on-board oscillator)
        clk_i           : in  std_logic;
        -- The general reset.
        reset_i         : in  std_logic;
        -- Indicates that a new sample is available (to the audio consumer)
        valid_o         : out std_logic;
        -- Request a new sample (from the audio consumer)
        ready_i         : in  std_logic;
        -- Audio data sample value.
        data_o          : out signed(BITS_PER_SAMPLE - 1 downto 0);
        -- The chip select command (to the microphone)
        chip_select_n_o : out std_logic;
        -- The serial communication clock (to the microphone)
        serial_clk_o    : out std_logic;
        -- The serial data (from the microphone)
        serial_data_i   : in  std_logic
    );
end MicrophoneReceiver;

architecture Behavioral of MicrophoneReceiver is
    -- Type, constant and signal declarations.
begin
    -- Concurrent statements.
end Behavioral;
