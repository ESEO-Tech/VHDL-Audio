
library ieee;
use ieee.std_logic_1164.all;

use work.fixed_pkg.all;
use work.Vocoder_pkg.all;

entity BiquadFilter is
    generic(
        A1, A2, B0, B1, B2 : vocoder_coef_t
    );
    port(
        clk_i   : in  std_logic;
        reset_i : in  std_logic;
        valid_i : in  std_logic;
        ready_o : out std_logic;
        data_i  : in  vocoder_data_t;
        valid_o : out std_logic;
        ready_i : in  std_logic;
        data_o  : out vocoder_data_t
    );
end BiquadFilter;

architecture RTL of BiquadFilter is
    type state_t is (READY_STATE, FORWARD_STATE, FEEDBACK_STATE, VALID_STATE);
    signal state_reg : state_t;
    signal x_reg, y_reg, w_reg, v_reg : biquad_data_t;
begin
    -- Concurrent statements.
end RTL;
