
library ieee;
use ieee.std_logic_1164.all;

use work.fixed_pkg.all;
use work.Vocoder_pkg.all;

entity Vocoder is
    port(
        clk_i   : in std_logic;
        reset_i : in std_logic;
        valid_i : in std_logic;
        ready_o : out std_logic;
        data_i  : in vocoder_data_t;
        valid_o : out std_logic;
        ready_i : in std_logic;
        data_o  : out vocoder_data_t
    );
end Vocoder;

architecture RTL of Vocoder is
    constant ALL_CHANNELS                        : std_logic_vector(0 to CHANNELS - 1) := (others => '1');
    signal bandpass_ready, bandpass_valid        : std_logic_vector(0 to CHANNELS - 1);
    signal lowpass_ready, lowpass_valid          : std_logic_vector(0 to CHANNELS - 1);
    signal bandpass_data, abs_data, lowpass_data : vocoder_data_vector_t(0 to CHANNELS - 1);
    signal osc_data                              : vocoder_coef_vector_t(0 to CHANNELS - 1);
    signal all_lowpass_valid, mixer_ready        : std_logic;
begin
    channels_gen : for c in 0 to CHANNELS - 1 generate
        -- Concurrent statements.
    end generate channels_gen;

    mixer_inst : entity work.Mixer
        port map(
            clk_i          => clk_i,
            reset_i        => reset_i,
            valid_i        => all_lowpass_valid,
            ready_o        => mixer_ready,
            env_data_i     => lowpass_data,
            carrier_data_i => osc_data,
            valid_o        => valid_o,
            ready_i        => ready_i,
            data_o         => data_o
        );

    all_lowpass_valid <= '1' when lowpass_valid  = ALL_CHANNELS else '0';
    ready_o           <= '1' when bandpass_ready = ALL_CHANNELS else '0';
end RTL;
