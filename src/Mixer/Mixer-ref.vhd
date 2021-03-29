library ieee;
use ieee.std_logic_1164.all;
use work.fixed_pkg.all;
use work.vocoder_pkg.all;
entity Mixer is
  port (
    clk_i: in std_logic;
    reset_i: in std_logic;
    valid_i: in std_logic;
    ready_o: out std_logic;
    env_data_i: in vocoder_data_vector_t (0 to CHANNELS - 1);
    carrier_data_i: in vocoder_coef_vector_t (0 to CHANNELS - 1);
    valid_o: out std_logic;
    ready_i: in std_logic;
    data_o: out vocoder_data_t
  );
end Mixer;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture rtl of mixer is
  signal wrap_clk_i: std_logic;
  signal wrap_reset_i: std_logic;
  signal wrap_valid_i: std_logic;
  subtype typwrap_env_data_i is std_logic_vector (215 downto 0);
  signal wrap_env_data_i: typwrap_env_data_i;
  subtype typwrap_carrier_data_i is std_logic_vector (215 downto 0);
  signal wrap_carrier_data_i: typwrap_carrier_data_i;
  signal wrap_ready_i: std_logic;
  signal wrap_ready_o: std_logic;
  signal wrap_valid_o: std_logic;
  subtype typwrap_data_o is std_logic_vector (17 downto 0);
  signal wrap_data_o: typwrap_data_o;
  signal state_reg : std_logic_vector (1 downto 0);
  signal channel_reg : std_logic_vector (3 downto 0);
  signal data_reg : std_logic_vector (17 downto 0);
  signal n4_o : std_logic;
  signal n6_o : std_logic_vector (1 downto 0);
  signal n8_o : std_logic;
  signal n9_o : std_logic_vector (31 downto 0);
  signal n11_o : std_logic;
  signal n13_o : std_logic_vector (1 downto 0);
  signal n15_o : std_logic;
  signal n17_o : std_logic_vector (1 downto 0);
  signal n19_o : std_logic;
  signal n20_o : std_logic_vector (2 downto 0);
  signal n22_o : std_logic_vector (1 downto 0);
  signal n27_q : std_logic_vector (1 downto 0);
  signal n30_o : std_logic;
  signal n31_o : std_logic;
  signal n35_o : std_logic;
  signal n36_o : std_logic;
  signal n39_o : std_logic;
  signal n41_o : std_logic_vector (3 downto 0);
  signal n43_o : std_logic;
  signal n44_o : std_logic_vector (31 downto 0);
  signal n46_o : std_logic;
  signal n47_o : std_logic_vector (31 downto 0);
  signal n49_o : std_logic_vector (31 downto 0);
  signal n50_o : std_logic_vector (3 downto 0);
  signal n52_o : std_logic_vector (3 downto 0);
  signal n54_o : std_logic;
  signal n55_o : std_logic_vector (1 downto 0);
  signal n56_o : std_logic_vector (3 downto 0);
  signal n61_q : std_logic_vector (3 downto 0);
  signal n63_o : std_logic;
  signal n65_o : std_logic;
  signal n66_o : std_logic;
  signal n68_o : std_logic;
  signal n69_o : std_logic;
  signal n74_o : std_logic_vector (3 downto 0);
  signal n78_o : std_logic_vector (3 downto 0);
  signal n95_o : std_logic_vector (35 downto 0);
  signal n96_o : std_logic_vector (35 downto 0);
  signal n97_o : std_logic_vector (35 downto 0);
  signal n114_o : std_logic_vector (20 downto 0);
  signal n120_o : std_logic;
  signal n121_o : std_logic;
  signal n124_o : std_logic;
  signal n125_o : std_logic;
  constant n127_o : std_logic_vector (36 downto 0) := "0000000000000000000000000000000000000";
  signal n128_o : std_logic_vector (15 downto 0);
  signal n129_o : std_logic_vector (36 downto 0);
  signal n140_o : std_logic_vector (36 downto 0);
  signal n146_o : std_logic;
  signal n147_o : std_logic;
  signal n150_o : std_logic;
  signal n151_o : std_logic;
  signal n164_o : std_logic_vector (36 downto 0);
  signal n175_o : std_logic_vector (35 downto 0);
  signal n176_o : std_logic;
  signal n181_o : std_logic;
  signal n182_o : std_logic;
  signal n185_o : std_logic;
  signal n186_o : std_logic;
  signal n189_o : std_logic;
  signal n190_o : std_logic;
  signal n197_o : std_logic;
  signal n203_o : std_logic;
  signal n204_o : std_logic;
  signal n205_o : std_logic;
  signal n206_o : std_logic;
  signal n207_o : std_logic;
  signal n208_o : std_logic;
  signal n209_o : std_logic;
  signal n210_o : std_logic;
  signal n211_o : std_logic;
  signal n212_o : std_logic;
  signal n213_o : std_logic;
  signal n214_o : std_logic;
  signal n215_o : std_logic;
  signal n216_o : std_logic;
  signal n217_o : std_logic;
  signal n218_o : std_logic;
  signal n219_o : std_logic;
  signal n220_o : std_logic;
  signal n221_o : std_logic;
  signal n222_o : std_logic;
  signal n223_o : std_logic;
  signal n224_o : std_logic;
  signal n225_o : std_logic;
  signal n226_o : std_logic;
  signal n227_o : std_logic;
  signal n228_o : std_logic;
  signal n229_o : std_logic;
  signal n230_o : std_logic;
  signal n231_o : std_logic;
  signal n232_o : std_logic;
  signal n233_o : std_logic;
  signal n234_o : std_logic;
  signal n235_o : std_logic;
  signal n236_o : std_logic;
  signal n237_o : std_logic;
  signal n238_o : std_logic;
  signal n239_o : std_logic_vector (3 downto 0);
  signal n240_o : std_logic_vector (3 downto 0);
  signal n241_o : std_logic_vector (3 downto 0);
  signal n242_o : std_logic_vector (3 downto 0);
  signal n243_o : std_logic_vector (3 downto 0);
  signal n244_o : std_logic_vector (3 downto 0);
  signal n245_o : std_logic_vector (3 downto 0);
  signal n246_o : std_logic_vector (3 downto 0);
  signal n247_o : std_logic_vector (3 downto 0);
  signal n248_o : std_logic_vector (15 downto 0);
  signal n249_o : std_logic_vector (15 downto 0);
  signal n250_o : std_logic_vector (35 downto 0);
  signal n251_o : std_logic_vector (34 downto 0);
  signal n252_o : std_logic_vector (35 downto 0);
  signal n253_o : std_logic_vector (35 downto 0);
  signal n269_o : std_logic_vector (33 downto 0);
  signal n270_o : std_logic;
  signal n275_o : std_logic;
  signal n276_o : std_logic;
  signal n279_o : std_logic;
  signal n280_o : std_logic;
  signal n283_o : std_logic;
  signal n284_o : std_logic;
  signal n291_o : std_logic;
  signal n295_o : std_logic;
  signal n297_o : std_logic;
  signal n298_o : std_logic;
  signal n300_o : std_logic;
  signal n306_o : std_logic;
  signal n309_o : std_logic;
  signal n311_o : std_logic;
  signal n312_o : std_logic;
  signal n313_o : std_logic;
  signal n314_o : std_logic;
  signal n315_o : std_logic;
  signal n316_o : std_logic;
  signal n317_o : std_logic;
  signal n318_o : std_logic;
  signal n319_o : std_logic;
  signal n320_o : std_logic;
  signal n321_o : std_logic;
  signal n322_o : std_logic;
  signal n323_o : std_logic;
  signal n324_o : std_logic;
  signal n325_o : std_logic;
  signal n326_o : std_logic;
  signal n327_o : std_logic;
  signal n328_o : std_logic;
  signal n329_o : std_logic_vector (3 downto 0);
  signal n330_o : std_logic_vector (3 downto 0);
  signal n331_o : std_logic_vector (3 downto 0);
  signal n332_o : std_logic_vector (3 downto 0);
  signal n333_o : std_logic_vector (1 downto 0);
  signal n334_o : std_logic_vector (15 downto 0);
  signal n335_o : std_logic_vector (17 downto 0);
  signal n336_o : std_logic_vector (16 downto 0);
  signal n337_o : std_logic_vector (17 downto 0);
  signal n338_o : std_logic_vector (17 downto 0);
  signal n339_o : std_logic_vector (17 downto 0);
  signal n342_o : std_logic;
  signal n343_o : std_logic;
  signal n345_o : std_logic_vector (17 downto 0);
  signal n346_o : std_logic_vector (17 downto 0);
  signal n355_q : std_logic_vector (17 downto 0);
  signal n356_o : std_logic_vector (17 downto 0);
  signal n357_o : std_logic_vector (17 downto 0);
  signal n358_o : std_logic_vector (17 downto 0);
  signal n359_o : std_logic_vector (17 downto 0);
  signal n360_o : std_logic_vector (17 downto 0);
  signal n361_o : std_logic_vector (17 downto 0);
  signal n362_o : std_logic_vector (17 downto 0);
  signal n363_o : std_logic_vector (17 downto 0);
  signal n364_o : std_logic_vector (17 downto 0);
  signal n365_o : std_logic_vector (17 downto 0);
  signal n366_o : std_logic_vector (17 downto 0);
  signal n367_o : std_logic_vector (17 downto 0);
  signal n368_o : std_logic_vector (1 downto 0);
  signal n369_o : std_logic_vector (17 downto 0);
  signal n370_o : std_logic_vector (1 downto 0);
  signal n371_o : std_logic_vector (17 downto 0);
  signal n372_o : std_logic_vector (1 downto 0);
  signal n373_o : std_logic_vector (17 downto 0);
  signal n374_o : std_logic;
  signal n375_o : std_logic_vector (17 downto 0);
  signal n376_o : std_logic;
  signal n377_o : std_logic_vector (17 downto 0);
  signal n378_o : std_logic_vector (17 downto 0);
  signal n379_o : std_logic_vector (17 downto 0);
  signal n380_o : std_logic_vector (17 downto 0);
  signal n381_o : std_logic_vector (17 downto 0);
  signal n382_o : std_logic_vector (17 downto 0);
  signal n383_o : std_logic_vector (17 downto 0);
  signal n384_o : std_logic_vector (17 downto 0);
  signal n385_o : std_logic_vector (17 downto 0);
  signal n386_o : std_logic_vector (17 downto 0);
  signal n387_o : std_logic_vector (17 downto 0);
  signal n388_o : std_logic_vector (17 downto 0);
  signal n389_o : std_logic_vector (17 downto 0);
  signal n390_o : std_logic_vector (1 downto 0);
  signal n391_o : std_logic_vector (17 downto 0);
  signal n392_o : std_logic_vector (1 downto 0);
  signal n393_o : std_logic_vector (17 downto 0);
  signal n394_o : std_logic_vector (1 downto 0);
  signal n395_o : std_logic_vector (17 downto 0);
  signal n396_o : std_logic;
  signal n397_o : std_logic_vector (17 downto 0);
  signal n398_o : std_logic;
  signal n399_o : std_logic_vector (17 downto 0);
begin
  wrap_clk_i <= clk_i;
  wrap_reset_i <= reset_i;
  wrap_valid_i <= valid_i;
  wrap_env_data_i (17 downto 0) <= std_logic_vector(env_data_i ( 0));
  wrap_env_data_i (35 downto 18) <= std_logic_vector(env_data_i ( 1));
  wrap_env_data_i (53 downto 36) <= std_logic_vector(env_data_i ( 2));
  wrap_env_data_i (71 downto 54) <= std_logic_vector(env_data_i ( 3));
  wrap_env_data_i (89 downto 72) <= std_logic_vector(env_data_i ( 4));
  wrap_env_data_i (107 downto 90) <= std_logic_vector(env_data_i ( 5));
  wrap_env_data_i (125 downto 108) <= std_logic_vector(env_data_i ( 6));
  wrap_env_data_i (143 downto 126) <= std_logic_vector(env_data_i ( 7));
  wrap_env_data_i (161 downto 144) <= std_logic_vector(env_data_i ( 8));
  wrap_env_data_i (179 downto 162) <= std_logic_vector(env_data_i ( 9));
  wrap_env_data_i (197 downto 180) <= std_logic_vector(env_data_i ( 10));
  wrap_env_data_i (215 downto 198) <= std_logic_vector(env_data_i ( 11));
  wrap_carrier_data_i (17 downto 0) <= std_logic_vector(carrier_data_i ( 0));
  wrap_carrier_data_i (35 downto 18) <= std_logic_vector(carrier_data_i ( 1));
  wrap_carrier_data_i (53 downto 36) <= std_logic_vector(carrier_data_i ( 2));
  wrap_carrier_data_i (71 downto 54) <= std_logic_vector(carrier_data_i ( 3));
  wrap_carrier_data_i (89 downto 72) <= std_logic_vector(carrier_data_i ( 4));
  wrap_carrier_data_i (107 downto 90) <= std_logic_vector(carrier_data_i ( 5));
  wrap_carrier_data_i (125 downto 108) <= std_logic_vector(carrier_data_i ( 6));
  wrap_carrier_data_i (143 downto 126) <= std_logic_vector(carrier_data_i ( 7));
  wrap_carrier_data_i (161 downto 144) <= std_logic_vector(carrier_data_i ( 8));
  wrap_carrier_data_i (179 downto 162) <= std_logic_vector(carrier_data_i ( 9));
  wrap_carrier_data_i (197 downto 180) <= std_logic_vector(carrier_data_i ( 10));
  wrap_carrier_data_i (215 downto 198) <= std_logic_vector(carrier_data_i ( 11));
  wrap_ready_i <= ready_i;
  ready_o <= wrap_ready_o;
  valid_o <= wrap_valid_o;
  data_o <= sfixed(wrap_data_o);
  wrap_ready_o <= n31_o;
  wrap_valid_o <= n36_o;
  wrap_data_o <= data_reg;
  -- Mixer.vhd:24:12
  state_reg <= n27_q; -- (signal)
  -- Mixer.vhd:25:12
  channel_reg <= n61_q; -- (signal)
  -- Mixer.vhd:26:12
  data_reg <= n355_q; -- (signal)
  -- Mixer.vhd:32:15
  -- n4_o <= '1' when rising_edge (wrap_clk_i) else '0';
  -- Mixer.vhd:35:21
  n6_o <= state_reg when wrap_valid_i = '0' else "01";
  -- Mixer.vhd:34:17
  n8_o <= '1' when state_reg = "00" else '0';
  -- Mixer.vhd:39:36
  n9_o <= "0000000000000000000000000000" & channel_reg;  --  uext
  -- Mixer.vhd:39:36
  n11_o <= '1' when n9_o = "00000000000000000000000000001011" else '0';
  -- Mixer.vhd:39:21
  n13_o <= state_reg when n11_o = '0' else "10";
  -- Mixer.vhd:38:17
  n15_o <= '1' when state_reg = "01" else '0';
  -- Mixer.vhd:43:21
  n17_o <= state_reg when wrap_ready_i = '0' else "00";
  -- Mixer.vhd:42:17
  n19_o <= '1' when state_reg = "10" else '0';
  n20_o <= n19_o & n15_o & n8_o;
  -- Mixer.vhd:33:13
  with n20_o select n22_o <=
    n17_o when "100",
    n13_o when "010",
    n6_o when "001",
    "XX" when others;
  -- Mixer.vhd:32:9
  process (wrap_clk_i, wrap_reset_i)
  begin
    if wrap_reset_i = '1' then
      n27_q <= "00";
    elsif rising_edge (wrap_clk_i) then
      n27_q <= n22_o;
    end if;
  end process;
  -- Mixer.vhd:50:35
  n30_o <= '1' when state_reg = "00" else '0';
  -- Mixer.vhd:50:20
  n31_o <= '0' when n30_o = '0' else '1';
  -- Mixer.vhd:51:35
  n35_o <= '1' when state_reg = "10" else '0';
  -- Mixer.vhd:51:20
  n36_o <= '0' when n35_o = '0' else '1';
  -- Mixer.vhd:57:15
  -- n39_o <= '1' when rising_edge (wrap_clk_i) else '0';
  -- Mixer.vhd:60:21
  n41_o <= channel_reg when wrap_valid_i = '0' else "0001";
  -- Mixer.vhd:59:17
  n43_o <= '1' when state_reg = "00" else '0';
  -- Mixer.vhd:64:36
  n44_o <= "0000000000000000000000000000" & channel_reg;  --  uext
  -- Mixer.vhd:64:36
  n46_o <= '1' when n44_o = "00000000000000000000000000001011" else '0';
  -- Mixer.vhd:67:52
  n47_o <= "0000000000000000000000000000" & channel_reg;  --  uext
  -- Mixer.vhd:67:52
  n49_o <= std_logic_vector (unsigned (n47_o) + unsigned'("00000000000000000000000000000001"));
  -- Mixer.vhd:67:40
  n50_o <= n49_o (3 downto 0);  --  trunc
  -- Mixer.vhd:64:21
  n52_o <= n50_o when n46_o = '0' else "0000";
  -- Mixer.vhd:63:17
  n54_o <= '1' when state_reg = "01" else '0';
  n55_o <= n54_o & n43_o;
  -- Mixer.vhd:58:13
  with n55_o select n56_o <=
    n52_o when "10",
    n41_o when "01",
    channel_reg when others;
  -- Mixer.vhd:57:9
  process (wrap_clk_i, wrap_reset_i)
  begin
    if wrap_reset_i = '1' then
      n61_q <= "0000";
    elsif rising_edge (wrap_clk_i) then
      n61_q <= n56_o;
    end if;
  end process;
  -- Mixer.vhd:78:15
  -- n63_o <= '1' when rising_edge (wrap_clk_i) else '0';
  -- Mixer.vhd:79:27
  n65_o <= '1' when state_reg = "00" else '0';
  -- Mixer.vhd:79:41
  n66_o <= n65_o and wrap_valid_i;
  -- Mixer.vhd:79:73
  n68_o <= '1' when state_reg = "01" else '0';
  -- Mixer.vhd:79:60
  n69_o <= n66_o or n68_o;
  -- Mixer.vhd:80:65
  n74_o <= std_logic_vector (unsigned'("1011") - unsigned (channel_reg));
  -- Mixer.vhd:80:95
  n78_o <= std_logic_vector (unsigned'("1011") - unsigned (channel_reg));
  -- ../fixed_pkg.vhd:266:100
  n95_o <= std_logic_vector (resize (signed (n377_o), 36));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n96_o <= std_logic_vector (resize (signed (n399_o), 36));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n97_o <= std_logic_vector (resize (signed (n95_o) * signed (n96_o), 36));
  -- ../fixed_pkg.vhd:168:39
  n114_o <= std_logic_vector (resize (signed (data_reg), 21));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n120_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n121_o <= n120_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n122: postponed assert n121_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n124_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n125_o <= n124_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n126: postponed assert n125_o = '1' severity error; --  assert
  n128_o <= n127_o (15 downto 0);
  n129_o <= n114_o & n128_o;
  -- ../fixed_pkg.vhd:168:39
  n140_o <= std_logic_vector (resize (signed (n97_o), 37));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n146_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n147_o <= n146_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n148: postponed assert n147_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n150_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n151_o <= n150_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n152: postponed assert n151_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:255:67
  n164_o <= std_logic_vector (unsigned (n129_o) + unsigned (n140_o));
  -- ../fixed_pkg.vhd:168:39
  n175_o <= n164_o (35 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n176_o <= n164_o (36);
  -- ../fixed_pkg.vhd:173:9
  n181_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n182_o <= n181_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n183: postponed assert n182_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n185_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n186_o <= n185_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n187: postponed assert n186_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n189_o <= n164_o (35);
  -- ../fixed_pkg.vhd:183:27
  n190_o <= '1' when n189_o /= n176_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n197_o <= '0' when n190_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n203_o <= not n176_o;
  -- ../fixed_pkg.vhd:194:31
  n204_o <= not n176_o;
  -- ../fixed_pkg.vhd:194:31
  n205_o <= not n176_o;
  -- ../fixed_pkg.vhd:194:31
  n206_o <= not n176_o;
  -- ../fixed_pkg.vhd:194:31
  n207_o <= not n176_o;
  -- ../fixed_pkg.vhd:194:31
  n208_o <= not n176_o;
  -- ../fixed_pkg.vhd:194:31
  n209_o <= not n176_o;
  -- ../fixed_pkg.vhd:194:31
  n210_o <= not n176_o;
  -- ../fixed_pkg.vhd:194:31
  n211_o <= not n176_o;
  -- ../fixed_pkg.vhd:194:31
  n212_o <= not n176_o;
  -- ../fixed_pkg.vhd:194:31
  n213_o <= not n176_o;
  -- ../fixed_pkg.vhd:194:31
  n214_o <= not n176_o;
  -- ../fixed_pkg.vhd:194:31
  n215_o <= not n176_o;
  -- ../fixed_pkg.vhd:194:31
  n216_o <= not n176_o;
  -- ../fixed_pkg.vhd:194:31
  n217_o <= not n176_o;
  -- ../fixed_pkg.vhd:194:31
  n218_o <= not n176_o;
  -- ../fixed_pkg.vhd:194:31
  n219_o <= not n176_o;
  -- ../fixed_pkg.vhd:194:31
  n220_o <= not n176_o;
  -- ../fixed_pkg.vhd:194:31
  n221_o <= not n176_o;
  -- ../fixed_pkg.vhd:194:31
  n222_o <= not n176_o;
  -- ../fixed_pkg.vhd:194:31
  n223_o <= not n176_o;
  -- ../fixed_pkg.vhd:194:31
  n224_o <= not n176_o;
  -- ../fixed_pkg.vhd:194:31
  n225_o <= not n176_o;
  -- ../fixed_pkg.vhd:194:31
  n226_o <= not n176_o;
  -- ../fixed_pkg.vhd:194:31
  n227_o <= not n176_o;
  -- ../fixed_pkg.vhd:194:31
  n228_o <= not n176_o;
  -- ../fixed_pkg.vhd:194:31
  n229_o <= not n176_o;
  -- ../fixed_pkg.vhd:194:31
  n230_o <= not n176_o;
  -- ../fixed_pkg.vhd:194:31
  n231_o <= not n176_o;
  -- ../fixed_pkg.vhd:194:31
  n232_o <= not n176_o;
  -- ../fixed_pkg.vhd:194:31
  n233_o <= not n176_o;
  -- ../fixed_pkg.vhd:194:31
  n234_o <= not n176_o;
  -- ../fixed_pkg.vhd:194:31
  n235_o <= not n176_o;
  -- ../fixed_pkg.vhd:194:31
  n236_o <= not n176_o;
  -- ../fixed_pkg.vhd:194:31
  n237_o <= not n176_o;
  -- ../fixed_pkg.vhd:194:31
  n238_o <= not n176_o;
  n239_o <= n203_o & n204_o & n205_o & n206_o;
  n240_o <= n207_o & n208_o & n209_o & n210_o;
  n241_o <= n211_o & n212_o & n213_o & n214_o;
  n242_o <= n215_o & n216_o & n217_o & n218_o;
  n243_o <= n219_o & n220_o & n221_o & n222_o;
  n244_o <= n223_o & n224_o & n225_o & n226_o;
  n245_o <= n227_o & n228_o & n229_o & n230_o;
  n246_o <= n231_o & n232_o & n233_o & n234_o;
  n247_o <= n235_o & n236_o & n237_o & n238_o;
  n248_o <= n239_o & n240_o & n241_o & n242_o;
  n249_o <= n243_o & n244_o & n245_o & n246_o;
  n250_o <= n248_o & n249_o & n247_o;
  n251_o <= n250_o (34 downto 0);
  n252_o <= n176_o & n251_o;
  -- ../fixed_pkg.vhd:193:9
  n253_o <= n175_o when n197_o = '0' else n252_o;
  -- ../fixed_pkg.vhd:168:39
  n269_o <= n253_o (33 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n270_o <= n253_o (35);
  -- ../fixed_pkg.vhd:173:9
  n275_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n276_o <= n275_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n277: postponed assert n276_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n279_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n280_o <= n279_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n281: postponed assert n280_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n283_o <= n253_o (34);
  -- ../fixed_pkg.vhd:183:27
  n284_o <= '1' when n283_o /= n270_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n291_o <= '0' when n284_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n295_o <= '1' when n284_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n297_o <= n253_o (33);
  -- ../fixed_pkg.vhd:183:27
  n298_o <= '1' when n297_o /= n270_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n300_o <= n291_o when n309_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n306_o <= n298_o and n295_o;
  -- ../fixed_pkg.vhd:183:17
  n309_o <= n295_o and n306_o;
  -- ../fixed_pkg.vhd:194:31
  n311_o <= not n270_o;
  -- ../fixed_pkg.vhd:194:31
  n312_o <= not n270_o;
  -- ../fixed_pkg.vhd:194:31
  n313_o <= not n270_o;
  -- ../fixed_pkg.vhd:194:31
  n314_o <= not n270_o;
  -- ../fixed_pkg.vhd:194:31
  n315_o <= not n270_o;
  -- ../fixed_pkg.vhd:194:31
  n316_o <= not n270_o;
  -- ../fixed_pkg.vhd:194:31
  n317_o <= not n270_o;
  -- ../fixed_pkg.vhd:194:31
  n318_o <= not n270_o;
  -- ../fixed_pkg.vhd:194:31
  n319_o <= not n270_o;
  -- ../fixed_pkg.vhd:194:31
  n320_o <= not n270_o;
  -- ../fixed_pkg.vhd:194:31
  n321_o <= not n270_o;
  -- ../fixed_pkg.vhd:194:31
  n322_o <= not n270_o;
  -- ../fixed_pkg.vhd:194:31
  n323_o <= not n270_o;
  -- ../fixed_pkg.vhd:194:31
  n324_o <= not n270_o;
  -- ../fixed_pkg.vhd:194:31
  n325_o <= not n270_o;
  -- ../fixed_pkg.vhd:194:31
  n326_o <= not n270_o;
  -- ../fixed_pkg.vhd:194:31
  n327_o <= not n270_o;
  -- ../fixed_pkg.vhd:194:31
  n328_o <= not n270_o;
  n329_o <= n311_o & n312_o & n313_o & n314_o;
  n330_o <= n315_o & n316_o & n317_o & n318_o;
  n331_o <= n319_o & n320_o & n321_o & n322_o;
  n332_o <= n323_o & n324_o & n325_o & n326_o;
  n333_o <= n327_o & n328_o;
  n334_o <= n329_o & n330_o & n331_o & n332_o;
  n335_o <= n334_o & n333_o;
  n336_o <= n335_o (16 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n337_o <= n269_o (33 downto 16);
  n338_o <= n270_o & n336_o;
  -- ../fixed_pkg.vhd:193:9
  n339_o <= n337_o when n300_o = '0' else n338_o;
  -- Mixer.vhd:81:29
  n342_o <= '1' when state_reg = "10" else '0';
  -- Mixer.vhd:81:43
  n343_o <= n342_o and wrap_ready_i;
  -- Mixer.vhd:81:13
  n345_o <= data_reg when n343_o = '0' else "000000000000000000";
  -- Mixer.vhd:79:13
  n346_o <= n345_o when n69_o = '0' else n339_o;
  -- Mixer.vhd:78:9
  process (wrap_clk_i, wrap_reset_i)
  begin
    if wrap_reset_i = '1' then
      n355_q <= "000000000000000000";
    elsif rising_edge (wrap_clk_i) then
      n355_q <= n346_o;
    end if;
  end process;
  -- ../fixed_pkg.vhd:173:9
  n356_o <= wrap_env_data_i (17 downto 0);
  -- ../fixed_pkg.vhd:173:9
  n357_o <= wrap_env_data_i (35 downto 18);
  -- ../fixed_pkg.vhd:173:9
  n358_o <= wrap_env_data_i (53 downto 36);
  -- ../fixed_pkg.vhd:173:9
  n359_o <= wrap_env_data_i (71 downto 54);
  -- Mixer.vhd:18:9
  n360_o <= wrap_env_data_i (89 downto 72);
  -- Mixer.vhd:16:9
  n361_o <= wrap_env_data_i (107 downto 90);
  -- Mixer.vhd:13:9
  n362_o <= wrap_env_data_i (125 downto 108);
  n363_o <= wrap_env_data_i (143 downto 126);
  n364_o <= wrap_env_data_i (161 downto 144);
  -- ../fixed_pkg.vhd:183:17
  n365_o <= wrap_env_data_i (179 downto 162);
  -- ../fixed_pkg.vhd:183:17
  n366_o <= wrap_env_data_i (197 downto 180);
  -- ../fixed_pkg.vhd:183:17
  n367_o <= wrap_env_data_i (215 downto 198);
  -- Mixer.vhd:80:65
  n368_o <= n74_o (1 downto 0);
  -- Mixer.vhd:80:65
  with n368_o select n369_o <=
    n356_o when "00",
    n357_o when "01",
    n358_o when "10",
    n359_o when "11",
    (17 downto 0 => 'X') when others;
  -- Mixer.vhd:80:65
  n370_o <= n74_o (1 downto 0);
  -- Mixer.vhd:80:65
  with n370_o select n371_o <=
    n360_o when "00",
    n361_o when "01",
    n362_o when "10",
    n363_o when "11",
    (17 downto 0 => 'X') when others;
  -- Mixer.vhd:80:65
  n372_o <= n74_o (1 downto 0);
  -- Mixer.vhd:80:65
  with n372_o select n373_o <=
    n364_o when "00",
    n365_o when "01",
    n366_o when "10",
    n367_o when "11",
    (17 downto 0 => 'X') when others;
  n374_o <= n74_o (2);
  -- Mixer.vhd:80:65
  n375_o <= n369_o when n374_o = '0' else n371_o;
  -- ../fixed_pkg.vhd:183:17
  n376_o <= n74_o (3);
  -- Mixer.vhd:80:65
  n377_o <= n375_o when n376_o = '0' else n373_o;
  -- Mixer.vhd:80:66
  n378_o <= wrap_carrier_data_i (17 downto 0);
  -- Mixer.vhd:80:65
  n379_o <= wrap_carrier_data_i (35 downto 18);
  n380_o <= wrap_carrier_data_i (53 downto 36);
  -- ../fixed_pkg.vhd:182:13
  n381_o <= wrap_carrier_data_i (71 downto 54);
  -- ../fixed_pkg.vhd:171:18
  n382_o <= wrap_carrier_data_i (89 downto 72);
  n383_o <= wrap_carrier_data_i (107 downto 90);
  -- ../fixed_pkg.vhd:170:18
  n384_o <= wrap_carrier_data_i (125 downto 108);
  n385_o <= wrap_carrier_data_i (143 downto 126);
  -- ../fixed_pkg.vhd:9:14
  n386_o <= wrap_carrier_data_i (161 downto 144);
  -- ../fixed_pkg.vhd:9:14
  n387_o <= wrap_carrier_data_i (179 downto 162);
  n388_o <= wrap_carrier_data_i (197 downto 180);
  -- ../fixed_pkg.vhd:9:14
  n389_o <= wrap_carrier_data_i (215 downto 198);
  -- Mixer.vhd:80:95
  n390_o <= n78_o (1 downto 0);
  -- Mixer.vhd:80:95
  with n390_o select n391_o <=
    n378_o when "00",
    n379_o when "01",
    n380_o when "10",
    n381_o when "11",
    (17 downto 0 => 'X') when others;
  -- Mixer.vhd:80:95
  n392_o <= n78_o (1 downto 0);
  -- Mixer.vhd:80:95
  with n392_o select n393_o <=
    n382_o when "00",
    n383_o when "01",
    n384_o when "10",
    n385_o when "11",
    (17 downto 0 => 'X') when others;
  -- Mixer.vhd:80:95
  n394_o <= n78_o (1 downto 0);
  -- Mixer.vhd:80:95
  with n394_o select n395_o <=
    n386_o when "00",
    n387_o when "01",
    n388_o when "10",
    n389_o when "11",
    (17 downto 0 => 'X') when others;
  n396_o <= n78_o (2);
  -- Mixer.vhd:80:95
  n397_o <= n391_o when n396_o = '0' else n393_o;
  n398_o <= n78_o (3);
  -- Mixer.vhd:80:95
  n399_o <= n397_o when n398_o = '0' else n395_o;
end rtl;
