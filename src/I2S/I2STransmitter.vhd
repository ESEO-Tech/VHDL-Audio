
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity I2STransmitter is
	generic (
        -- The general clock frequency, in Hz
        CLK_FREQUENCY_HZ    : positive;
        -- The master clock frequency for audio data processing, in Hz
        MASTER_FREQUENCY_HZ : positive range 512e3 to 50e6;
        -- The audio sample frequency, in Hz
        SAMPLE_RATE_HZ      : positive range 2e3 to 200e3;
        -- The number of data bits per samples
        BITS_PER_SAMPLE     : positive range 16 to 24
    );
    port (
        -- The general clock (from the on-board oscillator)
        clk_i            : in  std_logic;
        -- The general reset.
        reset_i          : in  std_logic;
        -- Indicates that a new sample is available (from the audio producer)
        valid_i          : in  std_logic;
        -- Request a new sample (to the audio producer)
        ready_o          : out std_logic;
        -- The sample value for the left audio channel (from the audio producer)
        left_data_i      : in  signed(BITS_PER_SAMPLE - 1 downto 0);
        -- The sample value for the right audio channel (from the audio producer)
        right_data_i     : in  signed(BITS_PER_SAMPLE - 1 downto 0);
        -- The master clock for audio data processing (to the receiver)
        master_clk_o     : out std_logic;
        -- The I2S serial communication clock (to the receiver)
        serial_clk_o     : out std_logic;
        -- The I2S serial data (to the receiver)
        serial_data_o    : out std_logic;
        -- The I2S channel selection clock (to the receiver)
        left_right_clk_o : out std_logic
	);
end I2STransmitter;

architecture RTL of I2STransmitter is
    -- Type, constant and signal declarations.
begin
    -- Concurrent statements.
end RTL;
