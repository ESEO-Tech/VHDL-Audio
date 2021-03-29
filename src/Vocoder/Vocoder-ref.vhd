library ieee;
use ieee.std_logic_1164.all;
use work.fixed_pkg.all;
use work.vocoder_pkg.all;
entity Vocoder is
  port (
    clk_i: in std_logic;
    reset_i: in std_logic;
    valid_i: in std_logic;
    ready_o: out std_logic;
    data_i: in vocoder_data_t;
    valid_o: out std_logic;
    ready_i: in std_logic;
    data_o: out vocoder_data_t
  );
end Vocoder;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mixer is
  port (
    clk_i : in std_logic;
    reset_i : in std_logic;
    valid_i : in std_logic;
    env_data_i : in std_logic_vector (215 downto 0);
    carrier_data_i : in std_logic_vector (215 downto 0);
    ready_i : in std_logic;
    ready_o : out std_logic;
    valid_o : out std_logic;
    data_o : out std_logic_vector (17 downto 0));
end entity mixer;

architecture rtl of mixer is
  signal state_reg : std_logic_vector (1 downto 0);
  signal channel_reg : std_logic_vector (3 downto 0);
  signal data_reg : std_logic_vector (17 downto 0);
  signal n17572_o : std_logic;
  signal n17574_o : std_logic_vector (1 downto 0);
  signal n17576_o : std_logic;
  signal n17577_o : std_logic_vector (31 downto 0);
  signal n17579_o : std_logic;
  signal n17581_o : std_logic_vector (1 downto 0);
  signal n17583_o : std_logic;
  signal n17585_o : std_logic_vector (1 downto 0);
  signal n17587_o : std_logic;
  signal n17588_o : std_logic_vector (2 downto 0);
  signal n17590_o : std_logic_vector (1 downto 0);
  signal n17595_q : std_logic_vector (1 downto 0);
  signal n17598_o : std_logic;
  signal n17599_o : std_logic;
  signal n17603_o : std_logic;
  signal n17604_o : std_logic;
  signal n17607_o : std_logic;
  signal n17609_o : std_logic_vector (3 downto 0);
  signal n17611_o : std_logic;
  signal n17612_o : std_logic_vector (31 downto 0);
  signal n17614_o : std_logic;
  signal n17615_o : std_logic_vector (31 downto 0);
  signal n17617_o : std_logic_vector (31 downto 0);
  signal n17618_o : std_logic_vector (3 downto 0);
  signal n17620_o : std_logic_vector (3 downto 0);
  signal n17622_o : std_logic;
  signal n17623_o : std_logic_vector (1 downto 0);
  signal n17624_o : std_logic_vector (3 downto 0);
  signal n17629_q : std_logic_vector (3 downto 0);
  signal n17631_o : std_logic;
  signal n17633_o : std_logic;
  signal n17634_o : std_logic;
  signal n17636_o : std_logic;
  signal n17637_o : std_logic;
  signal n17642_o : std_logic_vector (3 downto 0);
  signal n17646_o : std_logic_vector (3 downto 0);
  signal n17663_o : std_logic_vector (35 downto 0);
  signal n17664_o : std_logic_vector (35 downto 0);
  signal n17665_o : std_logic_vector (35 downto 0);
  signal n17682_o : std_logic_vector (20 downto 0);
  signal n17688_o : std_logic;
  signal n17689_o : std_logic;
  signal n17692_o : std_logic;
  signal n17693_o : std_logic;
  constant n17695_o : std_logic_vector (36 downto 0) := "0000000000000000000000000000000000000";
  signal n17696_o : std_logic_vector (15 downto 0);
  signal n17697_o : std_logic_vector (36 downto 0);
  signal n17708_o : std_logic_vector (36 downto 0);
  signal n17714_o : std_logic;
  signal n17715_o : std_logic;
  signal n17718_o : std_logic;
  signal n17719_o : std_logic;
  signal n17732_o : std_logic_vector (36 downto 0);
  signal n17743_o : std_logic_vector (35 downto 0);
  signal n17744_o : std_logic;
  signal n17749_o : std_logic;
  signal n17750_o : std_logic;
  signal n17753_o : std_logic;
  signal n17754_o : std_logic;
  signal n17757_o : std_logic;
  signal n17758_o : std_logic;
  signal n17765_o : std_logic;
  signal n17771_o : std_logic;
  signal n17772_o : std_logic;
  signal n17773_o : std_logic;
  signal n17774_o : std_logic;
  signal n17775_o : std_logic;
  signal n17776_o : std_logic;
  signal n17777_o : std_logic;
  signal n17778_o : std_logic;
  signal n17779_o : std_logic;
  signal n17780_o : std_logic;
  signal n17781_o : std_logic;
  signal n17782_o : std_logic;
  signal n17783_o : std_logic;
  signal n17784_o : std_logic;
  signal n17785_o : std_logic;
  signal n17786_o : std_logic;
  signal n17787_o : std_logic;
  signal n17788_o : std_logic;
  signal n17789_o : std_logic;
  signal n17790_o : std_logic;
  signal n17791_o : std_logic;
  signal n17792_o : std_logic;
  signal n17793_o : std_logic;
  signal n17794_o : std_logic;
  signal n17795_o : std_logic;
  signal n17796_o : std_logic;
  signal n17797_o : std_logic;
  signal n17798_o : std_logic;
  signal n17799_o : std_logic;
  signal n17800_o : std_logic;
  signal n17801_o : std_logic;
  signal n17802_o : std_logic;
  signal n17803_o : std_logic;
  signal n17804_o : std_logic;
  signal n17805_o : std_logic;
  signal n17806_o : std_logic;
  signal n17807_o : std_logic_vector (3 downto 0);
  signal n17808_o : std_logic_vector (3 downto 0);
  signal n17809_o : std_logic_vector (3 downto 0);
  signal n17810_o : std_logic_vector (3 downto 0);
  signal n17811_o : std_logic_vector (3 downto 0);
  signal n17812_o : std_logic_vector (3 downto 0);
  signal n17813_o : std_logic_vector (3 downto 0);
  signal n17814_o : std_logic_vector (3 downto 0);
  signal n17815_o : std_logic_vector (3 downto 0);
  signal n17816_o : std_logic_vector (15 downto 0);
  signal n17817_o : std_logic_vector (15 downto 0);
  signal n17818_o : std_logic_vector (35 downto 0);
  signal n17819_o : std_logic_vector (34 downto 0);
  signal n17820_o : std_logic_vector (35 downto 0);
  signal n17821_o : std_logic_vector (35 downto 0);
  signal n17837_o : std_logic_vector (33 downto 0);
  signal n17838_o : std_logic;
  signal n17843_o : std_logic;
  signal n17844_o : std_logic;
  signal n17847_o : std_logic;
  signal n17848_o : std_logic;
  signal n17851_o : std_logic;
  signal n17852_o : std_logic;
  signal n17859_o : std_logic;
  signal n17863_o : std_logic;
  signal n17865_o : std_logic;
  signal n17866_o : std_logic;
  signal n17868_o : std_logic;
  signal n17874_o : std_logic;
  signal n17877_o : std_logic;
  signal n17879_o : std_logic;
  signal n17880_o : std_logic;
  signal n17881_o : std_logic;
  signal n17882_o : std_logic;
  signal n17883_o : std_logic;
  signal n17884_o : std_logic;
  signal n17885_o : std_logic;
  signal n17886_o : std_logic;
  signal n17887_o : std_logic;
  signal n17888_o : std_logic;
  signal n17889_o : std_logic;
  signal n17890_o : std_logic;
  signal n17891_o : std_logic;
  signal n17892_o : std_logic;
  signal n17893_o : std_logic;
  signal n17894_o : std_logic;
  signal n17895_o : std_logic;
  signal n17896_o : std_logic;
  signal n17897_o : std_logic_vector (3 downto 0);
  signal n17898_o : std_logic_vector (3 downto 0);
  signal n17899_o : std_logic_vector (3 downto 0);
  signal n17900_o : std_logic_vector (3 downto 0);
  signal n17901_o : std_logic_vector (1 downto 0);
  signal n17902_o : std_logic_vector (15 downto 0);
  signal n17903_o : std_logic_vector (17 downto 0);
  signal n17904_o : std_logic_vector (16 downto 0);
  signal n17905_o : std_logic_vector (17 downto 0);
  signal n17906_o : std_logic_vector (17 downto 0);
  signal n17907_o : std_logic_vector (17 downto 0);
  signal n17910_o : std_logic;
  signal n17911_o : std_logic;
  signal n17913_o : std_logic_vector (17 downto 0);
  signal n17914_o : std_logic_vector (17 downto 0);
  signal n17923_q : std_logic_vector (17 downto 0);
  signal n17924_o : std_logic_vector (17 downto 0);
  signal n17925_o : std_logic_vector (17 downto 0);
  signal n17926_o : std_logic_vector (17 downto 0);
  signal n17927_o : std_logic_vector (17 downto 0);
  signal n17928_o : std_logic_vector (17 downto 0);
  signal n17929_o : std_logic_vector (17 downto 0);
  signal n17930_o : std_logic_vector (17 downto 0);
  signal n17931_o : std_logic_vector (17 downto 0);
  signal n17932_o : std_logic_vector (17 downto 0);
  signal n17933_o : std_logic_vector (17 downto 0);
  signal n17934_o : std_logic_vector (17 downto 0);
  signal n17935_o : std_logic_vector (17 downto 0);
  signal n17936_o : std_logic_vector (1 downto 0);
  signal n17937_o : std_logic_vector (17 downto 0);
  signal n17938_o : std_logic_vector (1 downto 0);
  signal n17939_o : std_logic_vector (17 downto 0);
  signal n17940_o : std_logic_vector (1 downto 0);
  signal n17941_o : std_logic_vector (17 downto 0);
  signal n17942_o : std_logic;
  signal n17943_o : std_logic_vector (17 downto 0);
  signal n17944_o : std_logic;
  signal n17945_o : std_logic_vector (17 downto 0);
  signal n17946_o : std_logic_vector (17 downto 0);
  signal n17947_o : std_logic_vector (17 downto 0);
  signal n17948_o : std_logic_vector (17 downto 0);
  signal n17949_o : std_logic_vector (17 downto 0);
  signal n17950_o : std_logic_vector (17 downto 0);
  signal n17951_o : std_logic_vector (17 downto 0);
  signal n17952_o : std_logic_vector (17 downto 0);
  signal n17953_o : std_logic_vector (17 downto 0);
  signal n17954_o : std_logic_vector (17 downto 0);
  signal n17955_o : std_logic_vector (17 downto 0);
  signal n17956_o : std_logic_vector (17 downto 0);
  signal n17957_o : std_logic_vector (17 downto 0);
  signal n17958_o : std_logic_vector (1 downto 0);
  signal n17959_o : std_logic_vector (17 downto 0);
  signal n17960_o : std_logic_vector (1 downto 0);
  signal n17961_o : std_logic_vector (17 downto 0);
  signal n17962_o : std_logic_vector (1 downto 0);
  signal n17963_o : std_logic_vector (17 downto 0);
  signal n17964_o : std_logic;
  signal n17965_o : std_logic_vector (17 downto 0);
  signal n17966_o : std_logic;
  signal n17967_o : std_logic_vector (17 downto 0);
begin
  ready_o <= n17599_o;
  valid_o <= n17604_o;
  data_o <= data_reg;
  -- ../Mixer/Mixer.vhd:24:12
  state_reg <= n17595_q; -- (signal)
  -- ../Mixer/Mixer.vhd:25:12
  channel_reg <= n17629_q; -- (signal)
  -- ../Mixer/Mixer.vhd:26:12
  data_reg <= n17923_q; -- (signal)
  -- ../Mixer/Mixer.vhd:32:15
  -- n17572_o <= '1' when rising_edge (clk_i) else '0';
  -- ../Mixer/Mixer.vhd:35:21
  n17574_o <= state_reg when valid_i = '0' else "01";
  -- ../Mixer/Mixer.vhd:34:17
  n17576_o <= '1' when state_reg = "00" else '0';
  -- ../Mixer/Mixer.vhd:39:36
  n17577_o <= "0000000000000000000000000000" & channel_reg;  --  uext
  -- ../Mixer/Mixer.vhd:39:36
  n17579_o <= '1' when n17577_o = "00000000000000000000000000001011" else '0';
  -- ../Mixer/Mixer.vhd:39:21
  n17581_o <= state_reg when n17579_o = '0' else "10";
  -- ../Mixer/Mixer.vhd:38:17
  n17583_o <= '1' when state_reg = "01" else '0';
  -- ../Mixer/Mixer.vhd:43:21
  n17585_o <= state_reg when ready_i = '0' else "00";
  -- ../Mixer/Mixer.vhd:42:17
  n17587_o <= '1' when state_reg = "10" else '0';
  -- ../fixed_pkg.vhd:183:17
  n17588_o <= n17587_o & n17583_o & n17576_o;
  -- ../Mixer/Mixer.vhd:33:13
  with n17588_o select n17590_o <=
    n17585_o when "100",
    n17581_o when "010",
    n17574_o when "001",
    "XX" when others;
  -- ../Mixer/Mixer.vhd:32:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n17595_q <= "00";
    elsif rising_edge (clk_i) then
      n17595_q <= n17590_o;
    end if;
  end process;
  -- ../Mixer/Mixer.vhd:50:35
  n17598_o <= '1' when state_reg = "00" else '0';
  -- ../Mixer/Mixer.vhd:50:20
  n17599_o <= '0' when n17598_o = '0' else '1';
  -- ../Mixer/Mixer.vhd:51:35
  n17603_o <= '1' when state_reg = "10" else '0';
  -- ../Mixer/Mixer.vhd:51:20
  n17604_o <= '0' when n17603_o = '0' else '1';
  -- ../Mixer/Mixer.vhd:57:15
  -- n17607_o <= '1' when rising_edge (clk_i) else '0';
  -- ../Mixer/Mixer.vhd:60:21
  n17609_o <= channel_reg when valid_i = '0' else "0001";
  -- ../Mixer/Mixer.vhd:59:17
  n17611_o <= '1' when state_reg = "00" else '0';
  -- ../Mixer/Mixer.vhd:64:36
  n17612_o <= "0000000000000000000000000000" & channel_reg;  --  uext
  -- ../Mixer/Mixer.vhd:64:36
  n17614_o <= '1' when n17612_o = "00000000000000000000000000001011" else '0';
  -- ../Mixer/Mixer.vhd:67:52
  n17615_o <= "0000000000000000000000000000" & channel_reg;  --  uext
  -- ../Mixer/Mixer.vhd:67:52
  n17617_o <= std_logic_vector (unsigned (n17615_o) + unsigned'("00000000000000000000000000000001"));
  -- ../Mixer/Mixer.vhd:67:40
  n17618_o <= n17617_o (3 downto 0);  --  trunc
  -- ../Mixer/Mixer.vhd:64:21
  n17620_o <= n17618_o when n17614_o = '0' else "0000";
  -- ../Mixer/Mixer.vhd:63:17
  n17622_o <= '1' when state_reg = "01" else '0';
  -- ../fixed_pkg.vhd:183:17
  n17623_o <= n17622_o & n17611_o;
  -- ../Mixer/Mixer.vhd:58:13
  with n17623_o select n17624_o <=
    n17620_o when "10",
    n17609_o when "01",
    channel_reg when others;
  -- ../Mixer/Mixer.vhd:57:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n17629_q <= "0000";
    elsif rising_edge (clk_i) then
      n17629_q <= n17624_o;
    end if;
  end process;
  -- ../Mixer/Mixer.vhd:78:15
  -- n17631_o <= '1' when rising_edge (clk_i) else '0';
  -- ../Mixer/Mixer.vhd:79:27
  n17633_o <= '1' when state_reg = "00" else '0';
  -- ../Mixer/Mixer.vhd:79:41
  n17634_o <= n17633_o and valid_i;
  -- ../Mixer/Mixer.vhd:79:73
  n17636_o <= '1' when state_reg = "01" else '0';
  -- ../Mixer/Mixer.vhd:79:60
  n17637_o <= n17634_o or n17636_o;
  -- ../Mixer/Mixer.vhd:80:65
  n17642_o <= std_logic_vector (unsigned'("1011") - unsigned (channel_reg));
  -- ../Mixer/Mixer.vhd:80:95
  n17646_o <= std_logic_vector (unsigned'("1011") - unsigned (channel_reg));
  -- ../fixed_pkg.vhd:266:100
  n17663_o <= std_logic_vector (resize (signed (n17945_o), 36));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n17664_o <= std_logic_vector (resize (signed (n17967_o), 36));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n17665_o <= std_logic_vector (resize (signed (n17663_o) * signed (n17664_o), 36));
  -- ../fixed_pkg.vhd:168:39
  n17682_o <= std_logic_vector (resize (signed (data_reg), 21));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n17688_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n17689_o <= n17688_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n17690: postponed assert n17689_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n17692_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n17693_o <= n17692_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n17694: postponed assert n17693_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:169:40
  n17696_o <= n17695_o (15 downto 0);
  -- ../fixed_pkg.vhd:9:14
  n17697_o <= n17682_o & n17696_o;
  -- ../fixed_pkg.vhd:168:39
  n17708_o <= std_logic_vector (resize (signed (n17665_o), 37));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n17714_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n17715_o <= n17714_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n17716: postponed assert n17715_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n17718_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n17719_o <= n17718_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n17720: postponed assert n17719_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:255:67
  n17732_o <= std_logic_vector (unsigned (n17697_o) + unsigned (n17708_o));
  -- ../fixed_pkg.vhd:168:39
  n17743_o <= n17732_o (35 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n17744_o <= n17732_o (36);
  -- ../fixed_pkg.vhd:173:9
  n17749_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n17750_o <= n17749_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n17751: postponed assert n17750_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n17753_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n17754_o <= n17753_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n17755: postponed assert n17754_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n17757_o <= n17732_o (35);
  -- ../fixed_pkg.vhd:183:27
  n17758_o <= '1' when n17757_o /= n17744_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n17765_o <= '0' when n17758_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n17771_o <= not n17744_o;
  -- ../fixed_pkg.vhd:194:31
  n17772_o <= not n17744_o;
  -- ../fixed_pkg.vhd:194:31
  n17773_o <= not n17744_o;
  -- ../fixed_pkg.vhd:194:31
  n17774_o <= not n17744_o;
  -- ../fixed_pkg.vhd:194:31
  n17775_o <= not n17744_o;
  -- ../fixed_pkg.vhd:194:31
  n17776_o <= not n17744_o;
  -- ../fixed_pkg.vhd:194:31
  n17777_o <= not n17744_o;
  -- ../fixed_pkg.vhd:194:31
  n17778_o <= not n17744_o;
  -- ../fixed_pkg.vhd:194:31
  n17779_o <= not n17744_o;
  -- ../fixed_pkg.vhd:194:31
  n17780_o <= not n17744_o;
  -- ../fixed_pkg.vhd:194:31
  n17781_o <= not n17744_o;
  -- ../fixed_pkg.vhd:194:31
  n17782_o <= not n17744_o;
  -- ../fixed_pkg.vhd:194:31
  n17783_o <= not n17744_o;
  -- ../fixed_pkg.vhd:194:31
  n17784_o <= not n17744_o;
  -- ../fixed_pkg.vhd:194:31
  n17785_o <= not n17744_o;
  -- ../fixed_pkg.vhd:194:31
  n17786_o <= not n17744_o;
  -- ../fixed_pkg.vhd:194:31
  n17787_o <= not n17744_o;
  -- ../fixed_pkg.vhd:194:31
  n17788_o <= not n17744_o;
  -- ../fixed_pkg.vhd:194:31
  n17789_o <= not n17744_o;
  -- ../fixed_pkg.vhd:194:31
  n17790_o <= not n17744_o;
  -- ../fixed_pkg.vhd:194:31
  n17791_o <= not n17744_o;
  -- ../fixed_pkg.vhd:194:31
  n17792_o <= not n17744_o;
  -- ../fixed_pkg.vhd:194:31
  n17793_o <= not n17744_o;
  -- ../fixed_pkg.vhd:194:31
  n17794_o <= not n17744_o;
  -- ../fixed_pkg.vhd:194:31
  n17795_o <= not n17744_o;
  -- ../fixed_pkg.vhd:194:31
  n17796_o <= not n17744_o;
  -- ../fixed_pkg.vhd:194:31
  n17797_o <= not n17744_o;
  -- ../fixed_pkg.vhd:194:31
  n17798_o <= not n17744_o;
  -- ../fixed_pkg.vhd:194:31
  n17799_o <= not n17744_o;
  -- ../fixed_pkg.vhd:194:31
  n17800_o <= not n17744_o;
  -- ../fixed_pkg.vhd:194:31
  n17801_o <= not n17744_o;
  -- ../fixed_pkg.vhd:194:31
  n17802_o <= not n17744_o;
  -- ../fixed_pkg.vhd:194:31
  n17803_o <= not n17744_o;
  -- ../fixed_pkg.vhd:194:31
  n17804_o <= not n17744_o;
  -- ../fixed_pkg.vhd:194:31
  n17805_o <= not n17744_o;
  -- ../fixed_pkg.vhd:194:31
  n17806_o <= not n17744_o;
  n17807_o <= n17771_o & n17772_o & n17773_o & n17774_o;
  -- ../fixed_pkg.vhd:170:18
  n17808_o <= n17775_o & n17776_o & n17777_o & n17778_o;
  n17809_o <= n17779_o & n17780_o & n17781_o & n17782_o;
  -- ../fixed_pkg.vhd:169:40
  n17810_o <= n17783_o & n17784_o & n17785_o & n17786_o;
  -- ../fixed_pkg.vhd:9:14
  n17811_o <= n17787_o & n17788_o & n17789_o & n17790_o;
  -- ../fixed_pkg.vhd:9:14
  n17812_o <= n17791_o & n17792_o & n17793_o & n17794_o;
  n17813_o <= n17795_o & n17796_o & n17797_o & n17798_o;
  -- ../fixed_pkg.vhd:9:14
  n17814_o <= n17799_o & n17800_o & n17801_o & n17802_o;
  -- ../fixed_pkg.vhd:24:14
  n17815_o <= n17803_o & n17804_o & n17805_o & n17806_o;
  -- ../fixed_pkg.vhd:24:14
  n17816_o <= n17807_o & n17808_o & n17809_o & n17810_o;
  n17817_o <= n17811_o & n17812_o & n17813_o & n17814_o;
  -- ../fixed_pkg.vhd:24:14
  n17818_o <= n17816_o & n17817_o & n17815_o;
  n17819_o <= n17818_o (34 downto 0);
  -- ../fixed_pkg.vhd:171:18
  n17820_o <= n17744_o & n17819_o;
  -- ../fixed_pkg.vhd:193:9
  n17821_o <= n17743_o when n17765_o = '0' else n17820_o;
  -- ../fixed_pkg.vhd:168:39
  n17837_o <= n17821_o (33 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n17838_o <= n17821_o (35);
  -- ../fixed_pkg.vhd:173:9
  n17843_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n17844_o <= n17843_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n17845: postponed assert n17844_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n17847_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n17848_o <= n17847_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n17849: postponed assert n17848_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n17851_o <= n17821_o (34);
  -- ../fixed_pkg.vhd:183:27
  n17852_o <= '1' when n17851_o /= n17838_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n17859_o <= '0' when n17852_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n17863_o <= '1' when n17852_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n17865_o <= n17821_o (33);
  -- ../fixed_pkg.vhd:183:27
  n17866_o <= '1' when n17865_o /= n17838_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n17868_o <= n17859_o when n17877_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n17874_o <= n17866_o and n17863_o;
  -- ../fixed_pkg.vhd:183:17
  n17877_o <= n17863_o and n17874_o;
  -- ../fixed_pkg.vhd:194:31
  n17879_o <= not n17838_o;
  -- ../fixed_pkg.vhd:194:31
  n17880_o <= not n17838_o;
  -- ../fixed_pkg.vhd:194:31
  n17881_o <= not n17838_o;
  -- ../fixed_pkg.vhd:194:31
  n17882_o <= not n17838_o;
  -- ../fixed_pkg.vhd:194:31
  n17883_o <= not n17838_o;
  -- ../fixed_pkg.vhd:194:31
  n17884_o <= not n17838_o;
  -- ../fixed_pkg.vhd:194:31
  n17885_o <= not n17838_o;
  -- ../fixed_pkg.vhd:194:31
  n17886_o <= not n17838_o;
  -- ../fixed_pkg.vhd:194:31
  n17887_o <= not n17838_o;
  -- ../fixed_pkg.vhd:194:31
  n17888_o <= not n17838_o;
  -- ../fixed_pkg.vhd:194:31
  n17889_o <= not n17838_o;
  -- ../fixed_pkg.vhd:194:31
  n17890_o <= not n17838_o;
  -- ../fixed_pkg.vhd:194:31
  n17891_o <= not n17838_o;
  -- ../fixed_pkg.vhd:194:31
  n17892_o <= not n17838_o;
  -- ../fixed_pkg.vhd:194:31
  n17893_o <= not n17838_o;
  -- ../fixed_pkg.vhd:194:31
  n17894_o <= not n17838_o;
  -- ../fixed_pkg.vhd:194:31
  n17895_o <= not n17838_o;
  -- ../fixed_pkg.vhd:194:31
  n17896_o <= not n17838_o;
  -- ../fixed_pkg.vhd:34:14
  n17897_o <= n17879_o & n17880_o & n17881_o & n17882_o;
  n17898_o <= n17883_o & n17884_o & n17885_o & n17886_o;
  -- ../fixed_pkg.vhd:34:14
  n17899_o <= n17887_o & n17888_o & n17889_o & n17890_o;
  -- ../Vocoder/Vocoder_pkg.vhd:14:14
  n17900_o <= n17891_o & n17892_o & n17893_o & n17894_o;
  -- ../fixed_pkg.vhd:9:14
  n17901_o <= n17895_o & n17896_o;
  -- ../fixed_pkg.vhd:9:14
  n17902_o <= n17897_o & n17898_o & n17899_o & n17900_o;
  -- ../fixed_pkg.vhd:24:14
  n17903_o <= n17902_o & n17901_o;
  -- ../fixed_pkg.vhd:9:14
  n17904_o <= n17903_o (16 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n17905_o <= n17837_o (33 downto 16);
  -- ../fixed_pkg.vhd:40:14
  n17906_o <= n17838_o & n17904_o;
  -- ../fixed_pkg.vhd:193:9
  n17907_o <= n17905_o when n17868_o = '0' else n17906_o;
  -- ../Mixer/Mixer.vhd:81:29
  n17910_o <= '1' when state_reg = "10" else '0';
  -- ../Mixer/Mixer.vhd:81:43
  n17911_o <= n17910_o and ready_i;
  -- ../Mixer/Mixer.vhd:81:13
  n17913_o <= data_reg when n17911_o = '0' else "000000000000000000";
  -- ../Mixer/Mixer.vhd:79:13
  n17914_o <= n17913_o when n17637_o = '0' else n17907_o;
  -- ../Mixer/Mixer.vhd:78:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n17923_q <= "000000000000000000";
    elsif rising_edge (clk_i) then
      n17923_q <= n17914_o;
    end if;
  end process;
  -- ../fixed_pkg.vhd:173:9
  n17924_o <= env_data_i (17 downto 0);
  -- ../fixed_pkg.vhd:173:9
  n17925_o <= env_data_i (35 downto 18);
  -- ../fixed_pkg.vhd:173:9
  n17926_o <= env_data_i (53 downto 36);
  -- ../fixed_pkg.vhd:173:9
  n17927_o <= env_data_i (71 downto 54);
  -- ../Mixer/Mixer.vhd:18:9
  n17928_o <= env_data_i (89 downto 72);
  -- ../Mixer/Mixer.vhd:16:9
  n17929_o <= env_data_i (107 downto 90);
  -- ../Mixer/Mixer.vhd:13:9
  n17930_o <= env_data_i (125 downto 108);
  -- ../fixed_pkg.vhd:183:17
  n17931_o <= env_data_i (143 downto 126);
  -- ../fixed_pkg.vhd:40:14
  n17932_o <= env_data_i (161 downto 144);
  -- ../fixed_pkg.vhd:183:17
  n17933_o <= env_data_i (179 downto 162);
  -- ../fixed_pkg.vhd:183:17
  n17934_o <= env_data_i (197 downto 180);
  -- ../fixed_pkg.vhd:183:17
  n17935_o <= env_data_i (215 downto 198);
  -- ../Mixer/Mixer.vhd:80:65
  n17936_o <= n17642_o (1 downto 0);
  -- ../Mixer/Mixer.vhd:80:65
  with n17936_o select n17937_o <=
    n17924_o when "00",
    n17925_o when "01",
    n17926_o when "10",
    n17927_o when "11",
    (17 downto 0 => 'X') when others;
  -- ../Mixer/Mixer.vhd:80:65
  n17938_o <= n17642_o (1 downto 0);
  -- ../Mixer/Mixer.vhd:80:65
  with n17938_o select n17939_o <=
    n17928_o when "00",
    n17929_o when "01",
    n17930_o when "10",
    n17931_o when "11",
    (17 downto 0 => 'X') when others;
  -- ../Mixer/Mixer.vhd:80:65
  n17940_o <= n17642_o (1 downto 0);
  -- ../Mixer/Mixer.vhd:80:65
  with n17940_o select n17941_o <=
    n17932_o when "00",
    n17933_o when "01",
    n17934_o when "10",
    n17935_o when "11",
    (17 downto 0 => 'X') when others;
  -- ../fixed_pkg.vhd:9:14
  n17942_o <= n17642_o (2);
  -- ../Mixer/Mixer.vhd:80:65
  n17943_o <= n17937_o when n17942_o = '0' else n17939_o;
  -- ../fixed_pkg.vhd:183:17
  n17944_o <= n17642_o (3);
  -- ../Mixer/Mixer.vhd:80:65
  n17945_o <= n17943_o when n17944_o = '0' else n17941_o;
  -- ../Mixer/Mixer.vhd:80:66
  n17946_o <= carrier_data_i (17 downto 0);
  -- ../Mixer/Mixer.vhd:80:65
  n17947_o <= carrier_data_i (35 downto 18);
  -- ../fixed_pkg.vhd:9:14
  n17948_o <= carrier_data_i (53 downto 36);
  -- ../fixed_pkg.vhd:182:13
  n17949_o <= carrier_data_i (71 downto 54);
  -- ../fixed_pkg.vhd:171:18
  n17950_o <= carrier_data_i (89 downto 72);
  -- ../fixed_pkg.vhd:183:17
  n17951_o <= carrier_data_i (107 downto 90);
  -- ../fixed_pkg.vhd:170:18
  n17952_o <= carrier_data_i (125 downto 108);
  n17953_o <= carrier_data_i (143 downto 126);
  -- ../fixed_pkg.vhd:9:14
  n17954_o <= carrier_data_i (161 downto 144);
  -- ../fixed_pkg.vhd:9:14
  n17955_o <= carrier_data_i (179 downto 162);
  -- ../fixed_pkg.vhd:24:14
  n17956_o <= carrier_data_i (197 downto 180);
  -- ../fixed_pkg.vhd:9:14
  n17957_o <= carrier_data_i (215 downto 198);
  -- ../Mixer/Mixer.vhd:80:95
  n17958_o <= n17646_o (1 downto 0);
  -- ../Mixer/Mixer.vhd:80:95
  with n17958_o select n17959_o <=
    n17946_o when "00",
    n17947_o when "01",
    n17948_o when "10",
    n17949_o when "11",
    (17 downto 0 => 'X') when others;
  -- ../Mixer/Mixer.vhd:80:95
  n17960_o <= n17646_o (1 downto 0);
  -- ../Mixer/Mixer.vhd:80:95
  with n17960_o select n17961_o <=
    n17950_o when "00",
    n17951_o when "01",
    n17952_o when "10",
    n17953_o when "11",
    (17 downto 0 => 'X') when others;
  -- ../Mixer/Mixer.vhd:80:95
  n17962_o <= n17646_o (1 downto 0);
  -- ../Mixer/Mixer.vhd:80:95
  with n17962_o select n17963_o <=
    n17954_o when "00",
    n17955_o when "01",
    n17956_o when "10",
    n17957_o when "11",
    (17 downto 0 => 'X') when others;
  -- ../fixed_pkg.vhd:169:40
  n17964_o <= n17646_o (2);
  -- ../Mixer/Mixer.vhd:80:95
  n17965_o <= n17959_o when n17964_o = '0' else n17961_o;
  -- ../fixed_pkg.vhd:170:18
  n17966_o <= n17646_o (3);
  -- ../Mixer/Mixer.vhd:80:95
  n17967_o <= n17965_o when n17966_o = '0' else n17963_o;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity biquadfilter_123a8c06fd239d8db9e24de2ddc3cf87b860aaca is
  port (
    clk_i : in std_logic;
    reset_i : in std_logic;
    valid_i : in std_logic;
    data_i : in std_logic_vector (17 downto 0);
    ready_i : in std_logic;
    ready_o : out std_logic;
    valid_o : out std_logic;
    data_o : out std_logic_vector (17 downto 0));
end entity biquadfilter_123a8c06fd239d8db9e24de2ddc3cf87b860aaca;

architecture rtl of biquadfilter_123a8c06fd239d8db9e24de2ddc3cf87b860aaca is
  signal state_reg : std_logic_vector (1 downto 0);
  signal x_reg : std_logic_vector (24 downto 0);
  signal y_reg : std_logic_vector (24 downto 0);
  signal w_reg : std_logic_vector (24 downto 0);
  signal v_reg : std_logic_vector (24 downto 0);
  signal n16336_o : std_logic;
  signal n16338_o : std_logic_vector (1 downto 0);
  signal n16340_o : std_logic;
  signal n16342_o : std_logic;
  signal n16344_o : std_logic;
  signal n16346_o : std_logic_vector (1 downto 0);
  signal n16348_o : std_logic;
  signal n16349_o : std_logic_vector (3 downto 0);
  signal n16353_o : std_logic_vector (1 downto 0);
  signal n16358_q : std_logic_vector (1 downto 0);
  signal n16361_o : std_logic;
  signal n16362_o : std_logic;
  signal n16366_o : std_logic;
  signal n16367_o : std_logic;
  signal n16370_o : std_logic;
  signal n16386_o : std_logic_vector (19 downto 0);
  signal n16392_o : std_logic;
  signal n16393_o : std_logic;
  signal n16396_o : std_logic;
  signal n16397_o : std_logic;
  constant n16399_o : std_logic_vector (24 downto 0) := "0000000000000000000000000";
  signal n16400_o : std_logic_vector (4 downto 0);
  signal n16401_o : std_logic_vector (24 downto 0);
  signal n16402_o : std_logic_vector (24 downto 0);
  signal n16404_o : std_logic;
  signal n16418_o : std_logic_vector (42 downto 0);
  signal n16421_o : std_logic_vector (42 downto 0);
  signal n16438_o : std_logic_vector (43 downto 0);
  signal n16444_o : std_logic;
  signal n16445_o : std_logic;
  signal n16448_o : std_logic;
  signal n16449_o : std_logic;
  signal n16462_o : std_logic_vector (27 downto 0);
  signal n16468_o : std_logic;
  signal n16469_o : std_logic;
  signal n16472_o : std_logic;
  signal n16473_o : std_logic;
  constant n16475_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n16476_o : std_logic_vector (15 downto 0);
  signal n16477_o : std_logic_vector (43 downto 0);
  signal n16488_o : std_logic_vector (43 downto 0);
  signal n16499_o : std_logic_vector (42 downto 0);
  signal n16500_o : std_logic;
  signal n16505_o : std_logic;
  signal n16506_o : std_logic;
  signal n16509_o : std_logic;
  signal n16510_o : std_logic;
  signal n16513_o : std_logic;
  signal n16514_o : std_logic;
  signal n16521_o : std_logic;
  signal n16527_o : std_logic;
  signal n16528_o : std_logic;
  signal n16529_o : std_logic;
  signal n16530_o : std_logic;
  signal n16531_o : std_logic;
  signal n16532_o : std_logic;
  signal n16533_o : std_logic;
  signal n16534_o : std_logic;
  signal n16535_o : std_logic;
  signal n16536_o : std_logic;
  signal n16537_o : std_logic;
  signal n16538_o : std_logic;
  signal n16539_o : std_logic;
  signal n16540_o : std_logic;
  signal n16541_o : std_logic;
  signal n16542_o : std_logic;
  signal n16543_o : std_logic;
  signal n16544_o : std_logic;
  signal n16545_o : std_logic;
  signal n16546_o : std_logic;
  signal n16547_o : std_logic;
  signal n16548_o : std_logic;
  signal n16549_o : std_logic;
  signal n16550_o : std_logic;
  signal n16551_o : std_logic;
  signal n16552_o : std_logic;
  signal n16553_o : std_logic;
  signal n16554_o : std_logic;
  signal n16555_o : std_logic;
  signal n16556_o : std_logic;
  signal n16557_o : std_logic;
  signal n16558_o : std_logic;
  signal n16559_o : std_logic;
  signal n16560_o : std_logic;
  signal n16561_o : std_logic;
  signal n16562_o : std_logic;
  signal n16563_o : std_logic;
  signal n16564_o : std_logic;
  signal n16565_o : std_logic;
  signal n16566_o : std_logic;
  signal n16567_o : std_logic;
  signal n16568_o : std_logic;
  signal n16569_o : std_logic;
  signal n16570_o : std_logic_vector (3 downto 0);
  signal n16571_o : std_logic_vector (3 downto 0);
  signal n16572_o : std_logic_vector (3 downto 0);
  signal n16573_o : std_logic_vector (3 downto 0);
  signal n16574_o : std_logic_vector (3 downto 0);
  signal n16575_o : std_logic_vector (3 downto 0);
  signal n16576_o : std_logic_vector (3 downto 0);
  signal n16577_o : std_logic_vector (3 downto 0);
  signal n16578_o : std_logic_vector (3 downto 0);
  signal n16579_o : std_logic_vector (3 downto 0);
  signal n16580_o : std_logic_vector (2 downto 0);
  signal n16581_o : std_logic_vector (15 downto 0);
  signal n16582_o : std_logic_vector (15 downto 0);
  signal n16583_o : std_logic_vector (10 downto 0);
  signal n16584_o : std_logic_vector (42 downto 0);
  signal n16585_o : std_logic_vector (41 downto 0);
  signal n16586_o : std_logic_vector (42 downto 0);
  signal n16587_o : std_logic_vector (42 downto 0);
  signal n16603_o : std_logic_vector (40 downto 0);
  signal n16604_o : std_logic;
  signal n16609_o : std_logic;
  signal n16610_o : std_logic;
  signal n16613_o : std_logic;
  signal n16614_o : std_logic;
  signal n16617_o : std_logic;
  signal n16618_o : std_logic;
  signal n16625_o : std_logic;
  signal n16629_o : std_logic;
  signal n16631_o : std_logic;
  signal n16632_o : std_logic;
  signal n16634_o : std_logic;
  signal n16640_o : std_logic;
  signal n16643_o : std_logic;
  signal n16645_o : std_logic;
  signal n16646_o : std_logic;
  signal n16647_o : std_logic;
  signal n16648_o : std_logic;
  signal n16649_o : std_logic;
  signal n16650_o : std_logic;
  signal n16651_o : std_logic;
  signal n16652_o : std_logic;
  signal n16653_o : std_logic;
  signal n16654_o : std_logic;
  signal n16655_o : std_logic;
  signal n16656_o : std_logic;
  signal n16657_o : std_logic;
  signal n16658_o : std_logic;
  signal n16659_o : std_logic;
  signal n16660_o : std_logic;
  signal n16661_o : std_logic;
  signal n16662_o : std_logic;
  signal n16663_o : std_logic;
  signal n16664_o : std_logic;
  signal n16665_o : std_logic;
  signal n16666_o : std_logic;
  signal n16667_o : std_logic;
  signal n16668_o : std_logic;
  signal n16669_o : std_logic;
  signal n16670_o : std_logic_vector (3 downto 0);
  signal n16671_o : std_logic_vector (3 downto 0);
  signal n16672_o : std_logic_vector (3 downto 0);
  signal n16673_o : std_logic_vector (3 downto 0);
  signal n16674_o : std_logic_vector (3 downto 0);
  signal n16675_o : std_logic_vector (3 downto 0);
  signal n16676_o : std_logic_vector (15 downto 0);
  signal n16677_o : std_logic_vector (8 downto 0);
  signal n16678_o : std_logic_vector (24 downto 0);
  signal n16679_o : std_logic_vector (23 downto 0);
  signal n16680_o : std_logic_vector (24 downto 0);
  signal n16681_o : std_logic_vector (24 downto 0);
  signal n16682_o : std_logic_vector (24 downto 0);
  signal n16685_o : std_logic;
  signal n16700_o : std_logic_vector (42 downto 0);
  signal n16703_o : std_logic_vector (42 downto 0);
  signal n16715_o : std_logic_vector (42 downto 0);
  signal n16718_o : std_logic_vector (42 downto 0);
  signal n16735_o : std_logic_vector (43 downto 0);
  signal n16741_o : std_logic;
  signal n16742_o : std_logic;
  signal n16745_o : std_logic;
  signal n16746_o : std_logic;
  signal n16759_o : std_logic_vector (43 downto 0);
  signal n16765_o : std_logic;
  signal n16766_o : std_logic;
  signal n16769_o : std_logic;
  signal n16770_o : std_logic;
  signal n16783_o : std_logic_vector (43 downto 0);
  signal n16794_o : std_logic_vector (42 downto 0);
  signal n16795_o : std_logic;
  signal n16800_o : std_logic;
  signal n16801_o : std_logic;
  signal n16804_o : std_logic;
  signal n16805_o : std_logic;
  signal n16808_o : std_logic;
  signal n16809_o : std_logic;
  signal n16816_o : std_logic;
  signal n16822_o : std_logic;
  signal n16823_o : std_logic;
  signal n16824_o : std_logic;
  signal n16825_o : std_logic;
  signal n16826_o : std_logic;
  signal n16827_o : std_logic;
  signal n16828_o : std_logic;
  signal n16829_o : std_logic;
  signal n16830_o : std_logic;
  signal n16831_o : std_logic;
  signal n16832_o : std_logic;
  signal n16833_o : std_logic;
  signal n16834_o : std_logic;
  signal n16835_o : std_logic;
  signal n16836_o : std_logic;
  signal n16837_o : std_logic;
  signal n16838_o : std_logic;
  signal n16839_o : std_logic;
  signal n16840_o : std_logic;
  signal n16841_o : std_logic;
  signal n16842_o : std_logic;
  signal n16843_o : std_logic;
  signal n16844_o : std_logic;
  signal n16845_o : std_logic;
  signal n16846_o : std_logic;
  signal n16847_o : std_logic;
  signal n16848_o : std_logic;
  signal n16849_o : std_logic;
  signal n16850_o : std_logic;
  signal n16851_o : std_logic;
  signal n16852_o : std_logic;
  signal n16853_o : std_logic;
  signal n16854_o : std_logic;
  signal n16855_o : std_logic;
  signal n16856_o : std_logic;
  signal n16857_o : std_logic;
  signal n16858_o : std_logic;
  signal n16859_o : std_logic;
  signal n16860_o : std_logic;
  signal n16861_o : std_logic;
  signal n16862_o : std_logic;
  signal n16863_o : std_logic;
  signal n16864_o : std_logic;
  signal n16865_o : std_logic_vector (3 downto 0);
  signal n16866_o : std_logic_vector (3 downto 0);
  signal n16867_o : std_logic_vector (3 downto 0);
  signal n16868_o : std_logic_vector (3 downto 0);
  signal n16869_o : std_logic_vector (3 downto 0);
  signal n16870_o : std_logic_vector (3 downto 0);
  signal n16871_o : std_logic_vector (3 downto 0);
  signal n16872_o : std_logic_vector (3 downto 0);
  signal n16873_o : std_logic_vector (3 downto 0);
  signal n16874_o : std_logic_vector (3 downto 0);
  signal n16875_o : std_logic_vector (2 downto 0);
  signal n16876_o : std_logic_vector (15 downto 0);
  signal n16877_o : std_logic_vector (15 downto 0);
  signal n16878_o : std_logic_vector (10 downto 0);
  signal n16879_o : std_logic_vector (42 downto 0);
  signal n16880_o : std_logic_vector (41 downto 0);
  signal n16881_o : std_logic_vector (42 downto 0);
  signal n16882_o : std_logic_vector (42 downto 0);
  signal n16900_o : std_logic_vector (43 downto 0);
  signal n16906_o : std_logic;
  signal n16907_o : std_logic;
  signal n16910_o : std_logic;
  signal n16911_o : std_logic;
  signal n16924_o : std_logic_vector (27 downto 0);
  signal n16930_o : std_logic;
  signal n16931_o : std_logic;
  signal n16934_o : std_logic;
  signal n16935_o : std_logic;
  constant n16937_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n16938_o : std_logic_vector (15 downto 0);
  signal n16939_o : std_logic_vector (43 downto 0);
  signal n16950_o : std_logic_vector (43 downto 0);
  signal n16961_o : std_logic_vector (42 downto 0);
  signal n16962_o : std_logic;
  signal n16967_o : std_logic;
  signal n16968_o : std_logic;
  signal n16971_o : std_logic;
  signal n16972_o : std_logic;
  signal n16975_o : std_logic;
  signal n16976_o : std_logic;
  signal n16983_o : std_logic;
  signal n16989_o : std_logic;
  signal n16990_o : std_logic;
  signal n16991_o : std_logic;
  signal n16992_o : std_logic;
  signal n16993_o : std_logic;
  signal n16994_o : std_logic;
  signal n16995_o : std_logic;
  signal n16996_o : std_logic;
  signal n16997_o : std_logic;
  signal n16998_o : std_logic;
  signal n16999_o : std_logic;
  signal n17000_o : std_logic;
  signal n17001_o : std_logic;
  signal n17002_o : std_logic;
  signal n17003_o : std_logic;
  signal n17004_o : std_logic;
  signal n17005_o : std_logic;
  signal n17006_o : std_logic;
  signal n17007_o : std_logic;
  signal n17008_o : std_logic;
  signal n17009_o : std_logic;
  signal n17010_o : std_logic;
  signal n17011_o : std_logic;
  signal n17012_o : std_logic;
  signal n17013_o : std_logic;
  signal n17014_o : std_logic;
  signal n17015_o : std_logic;
  signal n17016_o : std_logic;
  signal n17017_o : std_logic;
  signal n17018_o : std_logic;
  signal n17019_o : std_logic;
  signal n17020_o : std_logic;
  signal n17021_o : std_logic;
  signal n17022_o : std_logic;
  signal n17023_o : std_logic;
  signal n17024_o : std_logic;
  signal n17025_o : std_logic;
  signal n17026_o : std_logic;
  signal n17027_o : std_logic;
  signal n17028_o : std_logic;
  signal n17029_o : std_logic;
  signal n17030_o : std_logic;
  signal n17031_o : std_logic;
  signal n17032_o : std_logic_vector (3 downto 0);
  signal n17033_o : std_logic_vector (3 downto 0);
  signal n17034_o : std_logic_vector (3 downto 0);
  signal n17035_o : std_logic_vector (3 downto 0);
  signal n17036_o : std_logic_vector (3 downto 0);
  signal n17037_o : std_logic_vector (3 downto 0);
  signal n17038_o : std_logic_vector (3 downto 0);
  signal n17039_o : std_logic_vector (3 downto 0);
  signal n17040_o : std_logic_vector (3 downto 0);
  signal n17041_o : std_logic_vector (3 downto 0);
  signal n17042_o : std_logic_vector (2 downto 0);
  signal n17043_o : std_logic_vector (15 downto 0);
  signal n17044_o : std_logic_vector (15 downto 0);
  signal n17045_o : std_logic_vector (10 downto 0);
  signal n17046_o : std_logic_vector (42 downto 0);
  signal n17047_o : std_logic_vector (41 downto 0);
  signal n17048_o : std_logic_vector (42 downto 0);
  signal n17049_o : std_logic_vector (42 downto 0);
  signal n17065_o : std_logic_vector (40 downto 0);
  signal n17066_o : std_logic;
  signal n17071_o : std_logic;
  signal n17072_o : std_logic;
  signal n17075_o : std_logic;
  signal n17076_o : std_logic;
  signal n17079_o : std_logic;
  signal n17080_o : std_logic;
  signal n17087_o : std_logic;
  signal n17091_o : std_logic;
  signal n17093_o : std_logic;
  signal n17094_o : std_logic;
  signal n17096_o : std_logic;
  signal n17102_o : std_logic;
  signal n17105_o : std_logic;
  signal n17107_o : std_logic;
  signal n17108_o : std_logic;
  signal n17109_o : std_logic;
  signal n17110_o : std_logic;
  signal n17111_o : std_logic;
  signal n17112_o : std_logic;
  signal n17113_o : std_logic;
  signal n17114_o : std_logic;
  signal n17115_o : std_logic;
  signal n17116_o : std_logic;
  signal n17117_o : std_logic;
  signal n17118_o : std_logic;
  signal n17119_o : std_logic;
  signal n17120_o : std_logic;
  signal n17121_o : std_logic;
  signal n17122_o : std_logic;
  signal n17123_o : std_logic;
  signal n17124_o : std_logic;
  signal n17125_o : std_logic;
  signal n17126_o : std_logic;
  signal n17127_o : std_logic;
  signal n17128_o : std_logic;
  signal n17129_o : std_logic;
  signal n17130_o : std_logic;
  signal n17131_o : std_logic;
  signal n17132_o : std_logic_vector (3 downto 0);
  signal n17133_o : std_logic_vector (3 downto 0);
  signal n17134_o : std_logic_vector (3 downto 0);
  signal n17135_o : std_logic_vector (3 downto 0);
  signal n17136_o : std_logic_vector (3 downto 0);
  signal n17137_o : std_logic_vector (3 downto 0);
  signal n17138_o : std_logic_vector (15 downto 0);
  signal n17139_o : std_logic_vector (8 downto 0);
  signal n17140_o : std_logic_vector (24 downto 0);
  signal n17141_o : std_logic_vector (23 downto 0);
  signal n17142_o : std_logic_vector (24 downto 0);
  signal n17143_o : std_logic_vector (24 downto 0);
  signal n17144_o : std_logic_vector (24 downto 0);
  signal n17159_o : std_logic_vector (42 downto 0);
  signal n17162_o : std_logic_vector (42 downto 0);
  signal n17174_o : std_logic_vector (42 downto 0);
  signal n17177_o : std_logic_vector (42 downto 0);
  signal n17194_o : std_logic_vector (43 downto 0);
  signal n17200_o : std_logic;
  signal n17201_o : std_logic;
  signal n17204_o : std_logic;
  signal n17205_o : std_logic;
  signal n17218_o : std_logic_vector (43 downto 0);
  signal n17224_o : std_logic;
  signal n17225_o : std_logic;
  signal n17228_o : std_logic;
  signal n17229_o : std_logic;
  signal n17242_o : std_logic_vector (43 downto 0);
  signal n17253_o : std_logic_vector (42 downto 0);
  signal n17254_o : std_logic;
  signal n17259_o : std_logic;
  signal n17260_o : std_logic;
  signal n17263_o : std_logic;
  signal n17264_o : std_logic;
  signal n17267_o : std_logic;
  signal n17268_o : std_logic;
  signal n17275_o : std_logic;
  signal n17281_o : std_logic;
  signal n17282_o : std_logic;
  signal n17283_o : std_logic;
  signal n17284_o : std_logic;
  signal n17285_o : std_logic;
  signal n17286_o : std_logic;
  signal n17287_o : std_logic;
  signal n17288_o : std_logic;
  signal n17289_o : std_logic;
  signal n17290_o : std_logic;
  signal n17291_o : std_logic;
  signal n17292_o : std_logic;
  signal n17293_o : std_logic;
  signal n17294_o : std_logic;
  signal n17295_o : std_logic;
  signal n17296_o : std_logic;
  signal n17297_o : std_logic;
  signal n17298_o : std_logic;
  signal n17299_o : std_logic;
  signal n17300_o : std_logic;
  signal n17301_o : std_logic;
  signal n17302_o : std_logic;
  signal n17303_o : std_logic;
  signal n17304_o : std_logic;
  signal n17305_o : std_logic;
  signal n17306_o : std_logic;
  signal n17307_o : std_logic;
  signal n17308_o : std_logic;
  signal n17309_o : std_logic;
  signal n17310_o : std_logic;
  signal n17311_o : std_logic;
  signal n17312_o : std_logic;
  signal n17313_o : std_logic;
  signal n17314_o : std_logic;
  signal n17315_o : std_logic;
  signal n17316_o : std_logic;
  signal n17317_o : std_logic;
  signal n17318_o : std_logic;
  signal n17319_o : std_logic;
  signal n17320_o : std_logic;
  signal n17321_o : std_logic;
  signal n17322_o : std_logic;
  signal n17323_o : std_logic;
  signal n17324_o : std_logic_vector (3 downto 0);
  signal n17325_o : std_logic_vector (3 downto 0);
  signal n17326_o : std_logic_vector (3 downto 0);
  signal n17327_o : std_logic_vector (3 downto 0);
  signal n17328_o : std_logic_vector (3 downto 0);
  signal n17329_o : std_logic_vector (3 downto 0);
  signal n17330_o : std_logic_vector (3 downto 0);
  signal n17331_o : std_logic_vector (3 downto 0);
  signal n17332_o : std_logic_vector (3 downto 0);
  signal n17333_o : std_logic_vector (3 downto 0);
  signal n17334_o : std_logic_vector (2 downto 0);
  signal n17335_o : std_logic_vector (15 downto 0);
  signal n17336_o : std_logic_vector (15 downto 0);
  signal n17337_o : std_logic_vector (10 downto 0);
  signal n17338_o : std_logic_vector (42 downto 0);
  signal n17339_o : std_logic_vector (41 downto 0);
  signal n17340_o : std_logic_vector (42 downto 0);
  signal n17341_o : std_logic_vector (42 downto 0);
  signal n17357_o : std_logic_vector (40 downto 0);
  signal n17358_o : std_logic;
  signal n17363_o : std_logic;
  signal n17364_o : std_logic;
  signal n17367_o : std_logic;
  signal n17368_o : std_logic;
  signal n17371_o : std_logic;
  signal n17372_o : std_logic;
  signal n17379_o : std_logic;
  signal n17383_o : std_logic;
  signal n17385_o : std_logic;
  signal n17386_o : std_logic;
  signal n17388_o : std_logic;
  signal n17394_o : std_logic;
  signal n17397_o : std_logic;
  signal n17399_o : std_logic;
  signal n17400_o : std_logic;
  signal n17401_o : std_logic;
  signal n17402_o : std_logic;
  signal n17403_o : std_logic;
  signal n17404_o : std_logic;
  signal n17405_o : std_logic;
  signal n17406_o : std_logic;
  signal n17407_o : std_logic;
  signal n17408_o : std_logic;
  signal n17409_o : std_logic;
  signal n17410_o : std_logic;
  signal n17411_o : std_logic;
  signal n17412_o : std_logic;
  signal n17413_o : std_logic;
  signal n17414_o : std_logic;
  signal n17415_o : std_logic;
  signal n17416_o : std_logic;
  signal n17417_o : std_logic;
  signal n17418_o : std_logic;
  signal n17419_o : std_logic;
  signal n17420_o : std_logic;
  signal n17421_o : std_logic;
  signal n17422_o : std_logic;
  signal n17423_o : std_logic;
  signal n17424_o : std_logic_vector (3 downto 0);
  signal n17425_o : std_logic_vector (3 downto 0);
  signal n17426_o : std_logic_vector (3 downto 0);
  signal n17427_o : std_logic_vector (3 downto 0);
  signal n17428_o : std_logic_vector (3 downto 0);
  signal n17429_o : std_logic_vector (3 downto 0);
  signal n17430_o : std_logic_vector (15 downto 0);
  signal n17431_o : std_logic_vector (8 downto 0);
  signal n17432_o : std_logic_vector (24 downto 0);
  signal n17433_o : std_logic_vector (23 downto 0);
  signal n17434_o : std_logic_vector (24 downto 0);
  signal n17435_o : std_logic_vector (24 downto 0);
  signal n17436_o : std_logic_vector (24 downto 0);
  signal n17439_o : std_logic;
  signal n17440_o : std_logic_vector (2 downto 0);
  signal n17441_o : std_logic_vector (24 downto 0);
  signal n17442_o : std_logic_vector (24 downto 0);
  signal n17443_o : std_logic_vector (24 downto 0);
  signal n17444_o : std_logic_vector (24 downto 0);
  signal n17472_o : std_logic;
  signal n17473_o : std_logic_vector (24 downto 0);
  signal n17474_q : std_logic_vector (24 downto 0);
  signal n17475_o : std_logic;
  signal n17476_o : std_logic_vector (24 downto 0);
  signal n17477_q : std_logic_vector (24 downto 0);
  signal n17478_q : std_logic_vector (24 downto 0);
  signal n17479_q : std_logic_vector (24 downto 0);
  signal n17495_o : std_logic_vector (22 downto 0);
  signal n17496_o : std_logic;
  signal n17501_o : std_logic;
  signal n17502_o : std_logic;
  signal n17505_o : std_logic;
  signal n17506_o : std_logic;
  signal n17509_o : std_logic;
  signal n17510_o : std_logic;
  signal n17517_o : std_logic;
  signal n17521_o : std_logic;
  signal n17523_o : std_logic;
  signal n17524_o : std_logic;
  signal n17526_o : std_logic;
  signal n17532_o : std_logic;
  signal n17535_o : std_logic;
  signal n17537_o : std_logic;
  signal n17538_o : std_logic;
  signal n17539_o : std_logic;
  signal n17540_o : std_logic;
  signal n17541_o : std_logic;
  signal n17542_o : std_logic;
  signal n17543_o : std_logic;
  signal n17544_o : std_logic;
  signal n17545_o : std_logic;
  signal n17546_o : std_logic;
  signal n17547_o : std_logic;
  signal n17548_o : std_logic;
  signal n17549_o : std_logic;
  signal n17550_o : std_logic;
  signal n17551_o : std_logic;
  signal n17552_o : std_logic;
  signal n17553_o : std_logic;
  signal n17554_o : std_logic;
  signal n17555_o : std_logic_vector (3 downto 0);
  signal n17556_o : std_logic_vector (3 downto 0);
  signal n17557_o : std_logic_vector (3 downto 0);
  signal n17558_o : std_logic_vector (3 downto 0);
  signal n17559_o : std_logic_vector (1 downto 0);
  signal n17560_o : std_logic_vector (15 downto 0);
  signal n17561_o : std_logic_vector (17 downto 0);
  signal n17562_o : std_logic_vector (16 downto 0);
  signal n17563_o : std_logic_vector (17 downto 0);
  signal n17564_o : std_logic_vector (17 downto 0);
  signal n17565_o : std_logic_vector (17 downto 0);
begin
  ready_o <= n16362_o;
  valid_o <= n16367_o;
  data_o <= n17565_o;
  -- ../BiquadFilter/BiquadFilter.vhd:26:12
  state_reg <= n16358_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:12
  x_reg <= n17474_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:19
  y_reg <= n17477_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:26
  w_reg <= n17478_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:33
  v_reg <= n17479_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:33:15
  -- n16336_o <= '1' when rising_edge (clk_i) else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:36:21
  n16338_o <= state_reg when valid_i = '0' else "01";
  -- ../BiquadFilter/BiquadFilter.vhd:35:17
  n16340_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:39:17
  n16342_o <= '1' when state_reg = "01" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:41:17
  n16344_o <= '1' when state_reg = "10" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:44:21
  n16346_o <= state_reg when ready_i = '0' else "00";
  -- ../BiquadFilter/BiquadFilter.vhd:43:17
  n16348_o <= '1' when state_reg = "11" else '0';
  -- ../fixed_pkg.vhd:183:17
  n16349_o <= n16348_o & n16344_o & n16342_o & n16340_o;
  -- ../BiquadFilter/BiquadFilter.vhd:34:13
  with n16349_o select n16353_o <=
    n16346_o when "1000",
    "11" when "0100",
    "10" when "0010",
    n16338_o when "0001",
    "XX" when others;
  -- ../BiquadFilter/BiquadFilter.vhd:33:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n16358_q <= "00";
    elsif rising_edge (clk_i) then
      n16358_q <= n16353_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:51:35
  n16361_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:51:20
  n16362_o <= '0' when n16361_o = '0' else '1';
  -- ../BiquadFilter/BiquadFilter.vhd:52:35
  n16366_o <= '1' when state_reg = "11" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:52:20
  n16367_o <= '0' when n16366_o = '0' else '1';
  -- ../BiquadFilter/BiquadFilter.vhd:59:15
  -- n16370_o <= '1' when rising_edge (clk_i) else '0';
  -- ../fixed_pkg.vhd:168:39
  n16386_o <= std_logic_vector (resize (signed (data_i), 20));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n16392_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n16393_o <= n16392_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n16394: postponed assert n16393_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n16396_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n16397_o <= n16396_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n16398: postponed assert n16397_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:170:18
  n16400_o <= n16399_o (4 downto 0);
  n16401_o <= n16386_o & n16400_o;
  -- ../BiquadFilter/BiquadFilter.vhd:62:21
  n16402_o <= x_reg when valid_i = '0' else n16401_o;
  -- ../BiquadFilter/BiquadFilter.vhd:61:17
  n16404_o <= '1' when state_reg = "00" else '0';
  -- ../fixed_pkg.vhd:266:100
  n16418_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n16421_o <= std_logic_vector (resize (signed (n16418_o) * signed'("0000000000000000000000000000000100001111001"), 43));
  -- ../fixed_pkg.vhd:168:39
  n16438_o <= std_logic_vector (resize (signed (n16421_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n16444_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n16445_o <= n16444_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n16446: postponed assert n16445_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n16448_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n16449_o <= n16448_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n16450: postponed assert n16449_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n16462_o <= std_logic_vector (resize (signed (w_reg), 28));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n16468_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n16469_o <= n16468_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n16470: postponed assert n16469_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n16472_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n16473_o <= n16472_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n16474: postponed assert n16473_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:24:14
  n16476_o <= n16475_o (15 downto 0);
  -- ../fixed_pkg.vhd:24:14
  n16477_o <= n16462_o & n16476_o;
  -- ../fixed_pkg.vhd:255:67
  n16488_o <= std_logic_vector (unsigned (n16438_o) + unsigned (n16477_o));
  -- ../fixed_pkg.vhd:168:39
  n16499_o <= n16488_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n16500_o <= n16488_o (43);
  -- ../fixed_pkg.vhd:173:9
  n16505_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n16506_o <= n16505_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n16507: postponed assert n16506_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n16509_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n16510_o <= n16509_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n16511: postponed assert n16510_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n16513_o <= n16488_o (42);
  -- ../fixed_pkg.vhd:183:27
  n16514_o <= '1' when n16513_o /= n16500_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n16521_o <= '0' when n16514_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n16527_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16528_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16529_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16530_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16531_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16532_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16533_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16534_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16535_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16536_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16537_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16538_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16539_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16540_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16541_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16542_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16543_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16544_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16545_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16546_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16547_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16548_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16549_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16550_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16551_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16552_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16553_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16554_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16555_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16556_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16557_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16558_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16559_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16560_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16561_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16562_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16563_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16564_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16565_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16566_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16567_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16568_o <= not n16500_o;
  -- ../fixed_pkg.vhd:194:31
  n16569_o <= not n16500_o;
  n16570_o <= n16527_o & n16528_o & n16529_o & n16530_o;
  -- ../fixed_pkg.vhd:169:40
  n16571_o <= n16531_o & n16532_o & n16533_o & n16534_o;
  -- ../fixed_pkg.vhd:9:14
  n16572_o <= n16535_o & n16536_o & n16537_o & n16538_o;
  -- ../fixed_pkg.vhd:9:14
  n16573_o <= n16539_o & n16540_o & n16541_o & n16542_o;
  n16574_o <= n16543_o & n16544_o & n16545_o & n16546_o;
  -- ../fixed_pkg.vhd:9:14
  n16575_o <= n16547_o & n16548_o & n16549_o & n16550_o;
  -- ../fixed_pkg.vhd:24:14
  n16576_o <= n16551_o & n16552_o & n16553_o & n16554_o;
  -- ../fixed_pkg.vhd:24:14
  n16577_o <= n16555_o & n16556_o & n16557_o & n16558_o;
  n16578_o <= n16559_o & n16560_o & n16561_o & n16562_o;
  -- ../fixed_pkg.vhd:24:14
  n16579_o <= n16563_o & n16564_o & n16565_o & n16566_o;
  n16580_o <= n16567_o & n16568_o & n16569_o;
  -- ../fixed_pkg.vhd:171:18
  n16581_o <= n16570_o & n16571_o & n16572_o & n16573_o;
  n16582_o <= n16574_o & n16575_o & n16576_o & n16577_o;
  -- ../fixed_pkg.vhd:170:18
  n16583_o <= n16578_o & n16579_o & n16580_o;
  n16584_o <= n16581_o & n16582_o & n16583_o;
  -- ../fixed_pkg.vhd:169:40
  n16585_o <= n16584_o (41 downto 0);
  -- ../fixed_pkg.vhd:9:14
  n16586_o <= n16500_o & n16585_o;
  -- ../fixed_pkg.vhd:193:9
  n16587_o <= n16499_o when n16521_o = '0' else n16586_o;
  -- ../fixed_pkg.vhd:168:39
  n16603_o <= n16587_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n16604_o <= n16587_o (42);
  -- ../fixed_pkg.vhd:173:9
  n16609_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n16610_o <= n16609_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n16611: postponed assert n16610_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n16613_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n16614_o <= n16613_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n16615: postponed assert n16614_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n16617_o <= n16587_o (41);
  -- ../fixed_pkg.vhd:183:27
  n16618_o <= '1' when n16617_o /= n16604_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n16625_o <= '0' when n16618_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n16629_o <= '1' when n16618_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n16631_o <= n16587_o (40);
  -- ../fixed_pkg.vhd:183:27
  n16632_o <= '1' when n16631_o /= n16604_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n16634_o <= n16625_o when n16643_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n16640_o <= n16632_o and n16629_o;
  -- ../fixed_pkg.vhd:183:17
  n16643_o <= n16629_o and n16640_o;
  -- ../fixed_pkg.vhd:194:31
  n16645_o <= not n16604_o;
  -- ../fixed_pkg.vhd:194:31
  n16646_o <= not n16604_o;
  -- ../fixed_pkg.vhd:194:31
  n16647_o <= not n16604_o;
  -- ../fixed_pkg.vhd:194:31
  n16648_o <= not n16604_o;
  -- ../fixed_pkg.vhd:194:31
  n16649_o <= not n16604_o;
  -- ../fixed_pkg.vhd:194:31
  n16650_o <= not n16604_o;
  -- ../fixed_pkg.vhd:194:31
  n16651_o <= not n16604_o;
  -- ../fixed_pkg.vhd:194:31
  n16652_o <= not n16604_o;
  -- ../fixed_pkg.vhd:194:31
  n16653_o <= not n16604_o;
  -- ../fixed_pkg.vhd:194:31
  n16654_o <= not n16604_o;
  -- ../fixed_pkg.vhd:194:31
  n16655_o <= not n16604_o;
  -- ../fixed_pkg.vhd:194:31
  n16656_o <= not n16604_o;
  -- ../fixed_pkg.vhd:194:31
  n16657_o <= not n16604_o;
  -- ../fixed_pkg.vhd:194:31
  n16658_o <= not n16604_o;
  -- ../fixed_pkg.vhd:194:31
  n16659_o <= not n16604_o;
  -- ../fixed_pkg.vhd:194:31
  n16660_o <= not n16604_o;
  -- ../fixed_pkg.vhd:194:31
  n16661_o <= not n16604_o;
  -- ../fixed_pkg.vhd:194:31
  n16662_o <= not n16604_o;
  -- ../fixed_pkg.vhd:194:31
  n16663_o <= not n16604_o;
  -- ../fixed_pkg.vhd:194:31
  n16664_o <= not n16604_o;
  -- ../fixed_pkg.vhd:194:31
  n16665_o <= not n16604_o;
  -- ../fixed_pkg.vhd:194:31
  n16666_o <= not n16604_o;
  -- ../fixed_pkg.vhd:194:31
  n16667_o <= not n16604_o;
  -- ../fixed_pkg.vhd:194:31
  n16668_o <= not n16604_o;
  -- ../fixed_pkg.vhd:194:31
  n16669_o <= not n16604_o;
  -- ../fixed_pkg.vhd:171:18
  n16670_o <= n16645_o & n16646_o & n16647_o & n16648_o;
  -- ../fixed_pkg.vhd:9:14
  n16671_o <= n16649_o & n16650_o & n16651_o & n16652_o;
  -- ../fixed_pkg.vhd:9:14
  n16672_o <= n16653_o & n16654_o & n16655_o & n16656_o;
  -- ../fixed_pkg.vhd:183:17
  n16673_o <= n16657_o & n16658_o & n16659_o & n16660_o;
  -- ../fixed_pkg.vhd:9:14
  n16674_o <= n16661_o & n16662_o & n16663_o & n16664_o;
  -- ../fixed_pkg.vhd:40:14
  n16675_o <= n16665_o & n16666_o & n16667_o & n16668_o;
  -- ../fixed_pkg.vhd:40:14
  n16676_o <= n16670_o & n16671_o & n16672_o & n16673_o;
  -- ../fixed_pkg.vhd:9:14
  n16677_o <= n16674_o & n16675_o & n16669_o;
  -- ../fixed_pkg.vhd:40:14
  n16678_o <= n16676_o & n16677_o;
  -- ../fixed_pkg.vhd:183:17
  n16679_o <= n16678_o (23 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n16680_o <= n16603_o (40 downto 16);
  -- ../fixed_pkg.vhd:183:17
  n16681_o <= n16604_o & n16679_o;
  -- ../fixed_pkg.vhd:193:9
  n16682_o <= n16680_o when n16634_o = '0' else n16681_o;
  -- ../BiquadFilter/BiquadFilter.vhd:65:17
  n16685_o <= '1' when state_reg = "01" else '0';
  -- ../fixed_pkg.vhd:266:100
  n16700_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n16703_o <= std_logic_vector (resize (signed (n16700_o) * signed'("0000000000000000000000000000000000000000000"), 43));
  -- ../fixed_pkg.vhd:266:100
  n16715_o <= std_logic_vector (resize (signed (y_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n16718_o <= std_logic_vector (resize (signed (n16715_o) * signed'("0000000000011111111111111101001011100011111"), 43));
  -- ../fixed_pkg.vhd:168:39
  n16735_o <= std_logic_vector (resize (signed (n16703_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n16741_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n16742_o <= n16741_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n16743: postponed assert n16742_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n16745_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n16746_o <= n16745_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n16747: postponed assert n16746_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n16759_o <= std_logic_vector (resize (signed (n16718_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n16765_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n16766_o <= n16765_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n16767: postponed assert n16766_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n16769_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n16770_o <= n16769_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n16771: postponed assert n16770_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:240:67
  n16783_o <= std_logic_vector (unsigned (n16735_o) - unsigned (n16759_o));
  -- ../fixed_pkg.vhd:168:39
  n16794_o <= n16783_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n16795_o <= n16783_o (43);
  -- ../fixed_pkg.vhd:173:9
  n16800_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n16801_o <= n16800_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n16802: postponed assert n16801_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n16804_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n16805_o <= n16804_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n16806: postponed assert n16805_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n16808_o <= n16783_o (42);
  -- ../fixed_pkg.vhd:183:27
  n16809_o <= '1' when n16808_o /= n16795_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n16816_o <= '0' when n16809_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n16822_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16823_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16824_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16825_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16826_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16827_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16828_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16829_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16830_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16831_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16832_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16833_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16834_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16835_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16836_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16837_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16838_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16839_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16840_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16841_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16842_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16843_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16844_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16845_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16846_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16847_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16848_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16849_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16850_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16851_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16852_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16853_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16854_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16855_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16856_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16857_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16858_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16859_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16860_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16861_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16862_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16863_o <= not n16795_o;
  -- ../fixed_pkg.vhd:194:31
  n16864_o <= not n16795_o;
  n16865_o <= n16822_o & n16823_o & n16824_o & n16825_o;
  n16866_o <= n16826_o & n16827_o & n16828_o & n16829_o;
  n16867_o <= n16830_o & n16831_o & n16832_o & n16833_o;
  n16868_o <= n16834_o & n16835_o & n16836_o & n16837_o;
  n16869_o <= n16838_o & n16839_o & n16840_o & n16841_o;
  n16870_o <= n16842_o & n16843_o & n16844_o & n16845_o;
  n16871_o <= n16846_o & n16847_o & n16848_o & n16849_o;
  n16872_o <= n16850_o & n16851_o & n16852_o & n16853_o;
  n16873_o <= n16854_o & n16855_o & n16856_o & n16857_o;
  n16874_o <= n16858_o & n16859_o & n16860_o & n16861_o;
  n16875_o <= n16862_o & n16863_o & n16864_o;
  n16876_o <= n16865_o & n16866_o & n16867_o & n16868_o;
  n16877_o <= n16869_o & n16870_o & n16871_o & n16872_o;
  n16878_o <= n16873_o & n16874_o & n16875_o;
  n16879_o <= n16876_o & n16877_o & n16878_o;
  n16880_o <= n16879_o (41 downto 0);
  n16881_o <= n16795_o & n16880_o;
  -- ../fixed_pkg.vhd:193:9
  n16882_o <= n16794_o when n16816_o = '0' else n16881_o;
  -- ../fixed_pkg.vhd:168:39
  n16900_o <= std_logic_vector (resize (signed (n16882_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n16906_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n16907_o <= n16906_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n16908: postponed assert n16907_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n16910_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n16911_o <= n16910_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n16912: postponed assert n16911_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n16924_o <= std_logic_vector (resize (signed (v_reg), 28));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n16930_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n16931_o <= n16930_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n16932: postponed assert n16931_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n16934_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n16935_o <= n16934_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n16936: postponed assert n16935_o = '1' severity error; --  assert
  n16938_o <= n16937_o (15 downto 0);
  n16939_o <= n16924_o & n16938_o;
  -- ../fixed_pkg.vhd:255:67
  n16950_o <= std_logic_vector (unsigned (n16900_o) + unsigned (n16939_o));
  -- ../fixed_pkg.vhd:168:39
  n16961_o <= n16950_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n16962_o <= n16950_o (43);
  -- ../fixed_pkg.vhd:173:9
  n16967_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n16968_o <= n16967_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n16969: postponed assert n16968_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n16971_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n16972_o <= n16971_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n16973: postponed assert n16972_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n16975_o <= n16950_o (42);
  -- ../fixed_pkg.vhd:183:27
  n16976_o <= '1' when n16975_o /= n16962_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n16983_o <= '0' when n16976_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n16989_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n16990_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n16991_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n16992_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n16993_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n16994_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n16995_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n16996_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n16997_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n16998_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n16999_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n17000_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n17001_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n17002_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n17003_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n17004_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n17005_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n17006_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n17007_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n17008_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n17009_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n17010_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n17011_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n17012_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n17013_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n17014_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n17015_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n17016_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n17017_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n17018_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n17019_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n17020_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n17021_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n17022_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n17023_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n17024_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n17025_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n17026_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n17027_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n17028_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n17029_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n17030_o <= not n16962_o;
  -- ../fixed_pkg.vhd:194:31
  n17031_o <= not n16962_o;
  n17032_o <= n16989_o & n16990_o & n16991_o & n16992_o;
  n17033_o <= n16993_o & n16994_o & n16995_o & n16996_o;
  n17034_o <= n16997_o & n16998_o & n16999_o & n17000_o;
  n17035_o <= n17001_o & n17002_o & n17003_o & n17004_o;
  n17036_o <= n17005_o & n17006_o & n17007_o & n17008_o;
  n17037_o <= n17009_o & n17010_o & n17011_o & n17012_o;
  n17038_o <= n17013_o & n17014_o & n17015_o & n17016_o;
  n17039_o <= n17017_o & n17018_o & n17019_o & n17020_o;
  n17040_o <= n17021_o & n17022_o & n17023_o & n17024_o;
  n17041_o <= n17025_o & n17026_o & n17027_o & n17028_o;
  n17042_o <= n17029_o & n17030_o & n17031_o;
  n17043_o <= n17032_o & n17033_o & n17034_o & n17035_o;
  n17044_o <= n17036_o & n17037_o & n17038_o & n17039_o;
  n17045_o <= n17040_o & n17041_o & n17042_o;
  n17046_o <= n17043_o & n17044_o & n17045_o;
  n17047_o <= n17046_o (41 downto 0);
  n17048_o <= n16962_o & n17047_o;
  -- ../fixed_pkg.vhd:193:9
  n17049_o <= n16961_o when n16983_o = '0' else n17048_o;
  -- ../fixed_pkg.vhd:168:39
  n17065_o <= n17049_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n17066_o <= n17049_o (42);
  -- ../fixed_pkg.vhd:173:9
  n17071_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n17072_o <= n17071_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n17073: postponed assert n17072_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n17075_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n17076_o <= n17075_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n17077: postponed assert n17076_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n17079_o <= n17049_o (41);
  -- ../fixed_pkg.vhd:183:27
  n17080_o <= '1' when n17079_o /= n17066_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n17087_o <= '0' when n17080_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n17091_o <= '1' when n17080_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n17093_o <= n17049_o (40);
  -- ../fixed_pkg.vhd:183:27
  n17094_o <= '1' when n17093_o /= n17066_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n17096_o <= n17087_o when n17105_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n17102_o <= n17094_o and n17091_o;
  -- ../fixed_pkg.vhd:183:17
  n17105_o <= n17091_o and n17102_o;
  -- ../fixed_pkg.vhd:194:31
  n17107_o <= not n17066_o;
  -- ../fixed_pkg.vhd:194:31
  n17108_o <= not n17066_o;
  -- ../fixed_pkg.vhd:194:31
  n17109_o <= not n17066_o;
  -- ../fixed_pkg.vhd:194:31
  n17110_o <= not n17066_o;
  -- ../fixed_pkg.vhd:194:31
  n17111_o <= not n17066_o;
  -- ../fixed_pkg.vhd:194:31
  n17112_o <= not n17066_o;
  -- ../fixed_pkg.vhd:194:31
  n17113_o <= not n17066_o;
  -- ../fixed_pkg.vhd:194:31
  n17114_o <= not n17066_o;
  -- ../fixed_pkg.vhd:194:31
  n17115_o <= not n17066_o;
  -- ../fixed_pkg.vhd:194:31
  n17116_o <= not n17066_o;
  -- ../fixed_pkg.vhd:194:31
  n17117_o <= not n17066_o;
  -- ../fixed_pkg.vhd:194:31
  n17118_o <= not n17066_o;
  -- ../fixed_pkg.vhd:194:31
  n17119_o <= not n17066_o;
  -- ../fixed_pkg.vhd:194:31
  n17120_o <= not n17066_o;
  -- ../fixed_pkg.vhd:194:31
  n17121_o <= not n17066_o;
  -- ../fixed_pkg.vhd:194:31
  n17122_o <= not n17066_o;
  -- ../fixed_pkg.vhd:194:31
  n17123_o <= not n17066_o;
  -- ../fixed_pkg.vhd:194:31
  n17124_o <= not n17066_o;
  -- ../fixed_pkg.vhd:194:31
  n17125_o <= not n17066_o;
  -- ../fixed_pkg.vhd:194:31
  n17126_o <= not n17066_o;
  -- ../fixed_pkg.vhd:194:31
  n17127_o <= not n17066_o;
  -- ../fixed_pkg.vhd:194:31
  n17128_o <= not n17066_o;
  -- ../fixed_pkg.vhd:194:31
  n17129_o <= not n17066_o;
  -- ../fixed_pkg.vhd:194:31
  n17130_o <= not n17066_o;
  -- ../fixed_pkg.vhd:194:31
  n17131_o <= not n17066_o;
  n17132_o <= n17107_o & n17108_o & n17109_o & n17110_o;
  n17133_o <= n17111_o & n17112_o & n17113_o & n17114_o;
  n17134_o <= n17115_o & n17116_o & n17117_o & n17118_o;
  n17135_o <= n17119_o & n17120_o & n17121_o & n17122_o;
  n17136_o <= n17123_o & n17124_o & n17125_o & n17126_o;
  n17137_o <= n17127_o & n17128_o & n17129_o & n17130_o;
  n17138_o <= n17132_o & n17133_o & n17134_o & n17135_o;
  n17139_o <= n17136_o & n17137_o & n17131_o;
  n17140_o <= n17138_o & n17139_o;
  n17141_o <= n17140_o (23 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n17142_o <= n17065_o (40 downto 16);
  n17143_o <= n17066_o & n17141_o;
  -- ../fixed_pkg.vhd:193:9
  n17144_o <= n17142_o when n17096_o = '0' else n17143_o;
  -- ../fixed_pkg.vhd:266:100
  n17159_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n17162_o <= std_logic_vector (resize (signed (n17159_o) * signed'("0000000000011111111111111111111011110000111"), 43));
  -- ../fixed_pkg.vhd:266:100
  n17174_o <= std_logic_vector (resize (signed (y_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n17177_o <= std_logic_vector (resize (signed (n17174_o) * signed'("0000000000000000000000000001110111100001110"), 43));
  -- ../fixed_pkg.vhd:168:39
  n17194_o <= std_logic_vector (resize (signed (n17162_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n17200_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n17201_o <= n17200_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n17202: postponed assert n17201_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n17204_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n17205_o <= n17204_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n17206: postponed assert n17205_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n17218_o <= std_logic_vector (resize (signed (n17177_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n17224_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n17225_o <= n17224_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n17226: postponed assert n17225_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n17228_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n17229_o <= n17228_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n17230: postponed assert n17229_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:240:67
  n17242_o <= std_logic_vector (unsigned (n17194_o) - unsigned (n17218_o));
  -- ../fixed_pkg.vhd:168:39
  n17253_o <= n17242_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n17254_o <= n17242_o (43);
  -- ../fixed_pkg.vhd:173:9
  n17259_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n17260_o <= n17259_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n17261: postponed assert n17260_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n17263_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n17264_o <= n17263_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n17265: postponed assert n17264_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n17267_o <= n17242_o (42);
  -- ../fixed_pkg.vhd:183:27
  n17268_o <= '1' when n17267_o /= n17254_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n17275_o <= '0' when n17268_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n17281_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17282_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17283_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17284_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17285_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17286_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17287_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17288_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17289_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17290_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17291_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17292_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17293_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17294_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17295_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17296_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17297_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17298_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17299_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17300_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17301_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17302_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17303_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17304_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17305_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17306_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17307_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17308_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17309_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17310_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17311_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17312_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17313_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17314_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17315_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17316_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17317_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17318_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17319_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17320_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17321_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17322_o <= not n17254_o;
  -- ../fixed_pkg.vhd:194:31
  n17323_o <= not n17254_o;
  n17324_o <= n17281_o & n17282_o & n17283_o & n17284_o;
  n17325_o <= n17285_o & n17286_o & n17287_o & n17288_o;
  n17326_o <= n17289_o & n17290_o & n17291_o & n17292_o;
  n17327_o <= n17293_o & n17294_o & n17295_o & n17296_o;
  n17328_o <= n17297_o & n17298_o & n17299_o & n17300_o;
  n17329_o <= n17301_o & n17302_o & n17303_o & n17304_o;
  n17330_o <= n17305_o & n17306_o & n17307_o & n17308_o;
  n17331_o <= n17309_o & n17310_o & n17311_o & n17312_o;
  n17332_o <= n17313_o & n17314_o & n17315_o & n17316_o;
  n17333_o <= n17317_o & n17318_o & n17319_o & n17320_o;
  n17334_o <= n17321_o & n17322_o & n17323_o;
  n17335_o <= n17324_o & n17325_o & n17326_o & n17327_o;
  n17336_o <= n17328_o & n17329_o & n17330_o & n17331_o;
  n17337_o <= n17332_o & n17333_o & n17334_o;
  n17338_o <= n17335_o & n17336_o & n17337_o;
  n17339_o <= n17338_o (41 downto 0);
  n17340_o <= n17254_o & n17339_o;
  -- ../fixed_pkg.vhd:193:9
  n17341_o <= n17253_o when n17275_o = '0' else n17340_o;
  -- ../fixed_pkg.vhd:168:39
  n17357_o <= n17341_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n17358_o <= n17341_o (42);
  -- ../fixed_pkg.vhd:173:9
  n17363_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n17364_o <= n17363_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n17365: postponed assert n17364_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n17367_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n17368_o <= n17367_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n17369: postponed assert n17368_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n17371_o <= n17341_o (41);
  -- ../fixed_pkg.vhd:183:27
  n17372_o <= '1' when n17371_o /= n17358_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n17379_o <= '0' when n17372_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n17383_o <= '1' when n17372_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n17385_o <= n17341_o (40);
  -- ../fixed_pkg.vhd:183:27
  n17386_o <= '1' when n17385_o /= n17358_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n17388_o <= n17379_o when n17397_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n17394_o <= n17386_o and n17383_o;
  -- ../fixed_pkg.vhd:183:17
  n17397_o <= n17383_o and n17394_o;
  -- ../fixed_pkg.vhd:194:31
  n17399_o <= not n17358_o;
  -- ../fixed_pkg.vhd:194:31
  n17400_o <= not n17358_o;
  -- ../fixed_pkg.vhd:194:31
  n17401_o <= not n17358_o;
  -- ../fixed_pkg.vhd:194:31
  n17402_o <= not n17358_o;
  -- ../fixed_pkg.vhd:194:31
  n17403_o <= not n17358_o;
  -- ../fixed_pkg.vhd:194:31
  n17404_o <= not n17358_o;
  -- ../fixed_pkg.vhd:194:31
  n17405_o <= not n17358_o;
  -- ../fixed_pkg.vhd:194:31
  n17406_o <= not n17358_o;
  -- ../fixed_pkg.vhd:194:31
  n17407_o <= not n17358_o;
  -- ../fixed_pkg.vhd:194:31
  n17408_o <= not n17358_o;
  -- ../fixed_pkg.vhd:194:31
  n17409_o <= not n17358_o;
  -- ../fixed_pkg.vhd:194:31
  n17410_o <= not n17358_o;
  -- ../fixed_pkg.vhd:194:31
  n17411_o <= not n17358_o;
  -- ../fixed_pkg.vhd:194:31
  n17412_o <= not n17358_o;
  -- ../fixed_pkg.vhd:194:31
  n17413_o <= not n17358_o;
  -- ../fixed_pkg.vhd:194:31
  n17414_o <= not n17358_o;
  -- ../fixed_pkg.vhd:194:31
  n17415_o <= not n17358_o;
  -- ../fixed_pkg.vhd:194:31
  n17416_o <= not n17358_o;
  -- ../fixed_pkg.vhd:194:31
  n17417_o <= not n17358_o;
  -- ../fixed_pkg.vhd:194:31
  n17418_o <= not n17358_o;
  -- ../fixed_pkg.vhd:194:31
  n17419_o <= not n17358_o;
  -- ../fixed_pkg.vhd:194:31
  n17420_o <= not n17358_o;
  -- ../fixed_pkg.vhd:194:31
  n17421_o <= not n17358_o;
  -- ../fixed_pkg.vhd:194:31
  n17422_o <= not n17358_o;
  -- ../fixed_pkg.vhd:194:31
  n17423_o <= not n17358_o;
  n17424_o <= n17399_o & n17400_o & n17401_o & n17402_o;
  n17425_o <= n17403_o & n17404_o & n17405_o & n17406_o;
  n17426_o <= n17407_o & n17408_o & n17409_o & n17410_o;
  n17427_o <= n17411_o & n17412_o & n17413_o & n17414_o;
  n17428_o <= n17415_o & n17416_o & n17417_o & n17418_o;
  n17429_o <= n17419_o & n17420_o & n17421_o & n17422_o;
  n17430_o <= n17424_o & n17425_o & n17426_o & n17427_o;
  n17431_o <= n17428_o & n17429_o & n17423_o;
  n17432_o <= n17430_o & n17431_o;
  n17433_o <= n17432_o (23 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n17434_o <= n17357_o (40 downto 16);
  n17435_o <= n17358_o & n17433_o;
  -- ../fixed_pkg.vhd:193:9
  n17436_o <= n17434_o when n17388_o = '0' else n17435_o;
  -- ../BiquadFilter/BiquadFilter.vhd:67:17
  n17439_o <= '1' when state_reg = "10" else '0';
  n17440_o <= n17439_o & n16685_o & n16404_o;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n17440_o select n17441_o <=
    x_reg when "100",
    x_reg when "010",
    n16402_o when "001",
    x_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n17440_o select n17442_o <=
    y_reg when "100",
    n16682_o when "010",
    y_reg when "001",
    y_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n17440_o select n17443_o <=
    n17144_o when "100",
    w_reg when "010",
    w_reg when "001",
    w_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n17440_o select n17444_o <=
    n17436_o when "100",
    v_reg when "010",
    v_reg when "001",
    v_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n17472_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n17473_o <= x_reg when n17472_o = '0' else n17441_o;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n17474_q <= n17473_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n17475_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n17476_o <= y_reg when n17475_o = '0' else n17442_o;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n17477_q <= n17476_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n17478_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n17478_q <= n17443_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n17479_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n17479_q <= n17444_o;
    end if;
  end process;
  -- ../fixed_pkg.vhd:168:39
  n17495_o <= y_reg (22 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n17496_o <= y_reg (24);
  -- ../fixed_pkg.vhd:173:9
  n17501_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n17502_o <= n17501_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n17503: postponed assert n17502_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n17505_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n17506_o <= n17505_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n17507: postponed assert n17506_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n17509_o <= y_reg (23);
  -- ../fixed_pkg.vhd:183:27
  n17510_o <= '1' when n17509_o /= n17496_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n17517_o <= '0' when n17510_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n17521_o <= '1' when n17510_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n17523_o <= y_reg (22);
  -- ../fixed_pkg.vhd:183:27
  n17524_o <= '1' when n17523_o /= n17496_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n17526_o <= n17517_o when n17535_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n17532_o <= n17524_o and n17521_o;
  -- ../fixed_pkg.vhd:183:17
  n17535_o <= n17521_o and n17532_o;
  -- ../fixed_pkg.vhd:194:31
  n17537_o <= not n17496_o;
  -- ../fixed_pkg.vhd:194:31
  n17538_o <= not n17496_o;
  -- ../fixed_pkg.vhd:194:31
  n17539_o <= not n17496_o;
  -- ../fixed_pkg.vhd:194:31
  n17540_o <= not n17496_o;
  -- ../fixed_pkg.vhd:194:31
  n17541_o <= not n17496_o;
  -- ../fixed_pkg.vhd:194:31
  n17542_o <= not n17496_o;
  -- ../fixed_pkg.vhd:194:31
  n17543_o <= not n17496_o;
  -- ../fixed_pkg.vhd:194:31
  n17544_o <= not n17496_o;
  -- ../fixed_pkg.vhd:194:31
  n17545_o <= not n17496_o;
  -- ../fixed_pkg.vhd:194:31
  n17546_o <= not n17496_o;
  -- ../fixed_pkg.vhd:194:31
  n17547_o <= not n17496_o;
  -- ../fixed_pkg.vhd:194:31
  n17548_o <= not n17496_o;
  -- ../fixed_pkg.vhd:194:31
  n17549_o <= not n17496_o;
  -- ../fixed_pkg.vhd:194:31
  n17550_o <= not n17496_o;
  -- ../fixed_pkg.vhd:194:31
  n17551_o <= not n17496_o;
  -- ../fixed_pkg.vhd:194:31
  n17552_o <= not n17496_o;
  -- ../fixed_pkg.vhd:194:31
  n17553_o <= not n17496_o;
  -- ../fixed_pkg.vhd:194:31
  n17554_o <= not n17496_o;
  n17555_o <= n17537_o & n17538_o & n17539_o & n17540_o;
  n17556_o <= n17541_o & n17542_o & n17543_o & n17544_o;
  n17557_o <= n17545_o & n17546_o & n17547_o & n17548_o;
  n17558_o <= n17549_o & n17550_o & n17551_o & n17552_o;
  n17559_o <= n17553_o & n17554_o;
  n17560_o <= n17555_o & n17556_o & n17557_o & n17558_o;
  n17561_o <= n17560_o & n17559_o;
  n17562_o <= n17561_o (16 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n17563_o <= n17495_o (22 downto 5);
  n17564_o <= n17496_o & n17562_o;
  -- ../fixed_pkg.vhd:193:9
  n17565_o <= n17563_o when n17526_o = '0' else n17564_o;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity biquadfilter_58287565aee2fcf069d75b2ada116df2a3195e1e is
  port (
    clk_i : in std_logic;
    reset_i : in std_logic;
    valid_i : in std_logic;
    data_i : in std_logic_vector (17 downto 0);
    ready_i : in std_logic;
    ready_o : out std_logic;
    valid_o : out std_logic;
    data_o : out std_logic_vector (17 downto 0));
end entity biquadfilter_58287565aee2fcf069d75b2ada116df2a3195e1e;

architecture rtl of biquadfilter_58287565aee2fcf069d75b2ada116df2a3195e1e is
  signal state_reg : std_logic_vector (1 downto 0);
  signal x_reg : std_logic_vector (24 downto 0);
  signal y_reg : std_logic_vector (24 downto 0);
  signal w_reg : std_logic_vector (24 downto 0);
  signal v_reg : std_logic_vector (24 downto 0);
  signal n15100_o : std_logic;
  signal n15102_o : std_logic_vector (1 downto 0);
  signal n15104_o : std_logic;
  signal n15106_o : std_logic;
  signal n15108_o : std_logic;
  signal n15110_o : std_logic_vector (1 downto 0);
  signal n15112_o : std_logic;
  signal n15113_o : std_logic_vector (3 downto 0);
  signal n15117_o : std_logic_vector (1 downto 0);
  signal n15122_q : std_logic_vector (1 downto 0);
  signal n15125_o : std_logic;
  signal n15126_o : std_logic;
  signal n15130_o : std_logic;
  signal n15131_o : std_logic;
  signal n15134_o : std_logic;
  signal n15150_o : std_logic_vector (19 downto 0);
  signal n15156_o : std_logic;
  signal n15157_o : std_logic;
  signal n15160_o : std_logic;
  signal n15161_o : std_logic;
  constant n15163_o : std_logic_vector (24 downto 0) := "0000000000000000000000000";
  signal n15164_o : std_logic_vector (4 downto 0);
  signal n15165_o : std_logic_vector (24 downto 0);
  signal n15166_o : std_logic_vector (24 downto 0);
  signal n15168_o : std_logic;
  signal n15182_o : std_logic_vector (42 downto 0);
  signal n15185_o : std_logic_vector (42 downto 0);
  signal n15202_o : std_logic_vector (43 downto 0);
  signal n15208_o : std_logic;
  signal n15209_o : std_logic;
  signal n15212_o : std_logic;
  signal n15213_o : std_logic;
  signal n15226_o : std_logic_vector (27 downto 0);
  signal n15232_o : std_logic;
  signal n15233_o : std_logic;
  signal n15236_o : std_logic;
  signal n15237_o : std_logic;
  constant n15239_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n15240_o : std_logic_vector (15 downto 0);
  signal n15241_o : std_logic_vector (43 downto 0);
  signal n15252_o : std_logic_vector (43 downto 0);
  signal n15263_o : std_logic_vector (42 downto 0);
  signal n15264_o : std_logic;
  signal n15269_o : std_logic;
  signal n15270_o : std_logic;
  signal n15273_o : std_logic;
  signal n15274_o : std_logic;
  signal n15277_o : std_logic;
  signal n15278_o : std_logic;
  signal n15285_o : std_logic;
  signal n15291_o : std_logic;
  signal n15292_o : std_logic;
  signal n15293_o : std_logic;
  signal n15294_o : std_logic;
  signal n15295_o : std_logic;
  signal n15296_o : std_logic;
  signal n15297_o : std_logic;
  signal n15298_o : std_logic;
  signal n15299_o : std_logic;
  signal n15300_o : std_logic;
  signal n15301_o : std_logic;
  signal n15302_o : std_logic;
  signal n15303_o : std_logic;
  signal n15304_o : std_logic;
  signal n15305_o : std_logic;
  signal n15306_o : std_logic;
  signal n15307_o : std_logic;
  signal n15308_o : std_logic;
  signal n15309_o : std_logic;
  signal n15310_o : std_logic;
  signal n15311_o : std_logic;
  signal n15312_o : std_logic;
  signal n15313_o : std_logic;
  signal n15314_o : std_logic;
  signal n15315_o : std_logic;
  signal n15316_o : std_logic;
  signal n15317_o : std_logic;
  signal n15318_o : std_logic;
  signal n15319_o : std_logic;
  signal n15320_o : std_logic;
  signal n15321_o : std_logic;
  signal n15322_o : std_logic;
  signal n15323_o : std_logic;
  signal n15324_o : std_logic;
  signal n15325_o : std_logic;
  signal n15326_o : std_logic;
  signal n15327_o : std_logic;
  signal n15328_o : std_logic;
  signal n15329_o : std_logic;
  signal n15330_o : std_logic;
  signal n15331_o : std_logic;
  signal n15332_o : std_logic;
  signal n15333_o : std_logic;
  signal n15334_o : std_logic_vector (3 downto 0);
  signal n15335_o : std_logic_vector (3 downto 0);
  signal n15336_o : std_logic_vector (3 downto 0);
  signal n15337_o : std_logic_vector (3 downto 0);
  signal n15338_o : std_logic_vector (3 downto 0);
  signal n15339_o : std_logic_vector (3 downto 0);
  signal n15340_o : std_logic_vector (3 downto 0);
  signal n15341_o : std_logic_vector (3 downto 0);
  signal n15342_o : std_logic_vector (3 downto 0);
  signal n15343_o : std_logic_vector (3 downto 0);
  signal n15344_o : std_logic_vector (2 downto 0);
  signal n15345_o : std_logic_vector (15 downto 0);
  signal n15346_o : std_logic_vector (15 downto 0);
  signal n15347_o : std_logic_vector (10 downto 0);
  signal n15348_o : std_logic_vector (42 downto 0);
  signal n15349_o : std_logic_vector (41 downto 0);
  signal n15350_o : std_logic_vector (42 downto 0);
  signal n15351_o : std_logic_vector (42 downto 0);
  signal n15367_o : std_logic_vector (40 downto 0);
  signal n15368_o : std_logic;
  signal n15373_o : std_logic;
  signal n15374_o : std_logic;
  signal n15377_o : std_logic;
  signal n15378_o : std_logic;
  signal n15381_o : std_logic;
  signal n15382_o : std_logic;
  signal n15389_o : std_logic;
  signal n15393_o : std_logic;
  signal n15395_o : std_logic;
  signal n15396_o : std_logic;
  signal n15398_o : std_logic;
  signal n15404_o : std_logic;
  signal n15407_o : std_logic;
  signal n15409_o : std_logic;
  signal n15410_o : std_logic;
  signal n15411_o : std_logic;
  signal n15412_o : std_logic;
  signal n15413_o : std_logic;
  signal n15414_o : std_logic;
  signal n15415_o : std_logic;
  signal n15416_o : std_logic;
  signal n15417_o : std_logic;
  signal n15418_o : std_logic;
  signal n15419_o : std_logic;
  signal n15420_o : std_logic;
  signal n15421_o : std_logic;
  signal n15422_o : std_logic;
  signal n15423_o : std_logic;
  signal n15424_o : std_logic;
  signal n15425_o : std_logic;
  signal n15426_o : std_logic;
  signal n15427_o : std_logic;
  signal n15428_o : std_logic;
  signal n15429_o : std_logic;
  signal n15430_o : std_logic;
  signal n15431_o : std_logic;
  signal n15432_o : std_logic;
  signal n15433_o : std_logic;
  signal n15434_o : std_logic_vector (3 downto 0);
  signal n15435_o : std_logic_vector (3 downto 0);
  signal n15436_o : std_logic_vector (3 downto 0);
  signal n15437_o : std_logic_vector (3 downto 0);
  signal n15438_o : std_logic_vector (3 downto 0);
  signal n15439_o : std_logic_vector (3 downto 0);
  signal n15440_o : std_logic_vector (15 downto 0);
  signal n15441_o : std_logic_vector (8 downto 0);
  signal n15442_o : std_logic_vector (24 downto 0);
  signal n15443_o : std_logic_vector (23 downto 0);
  signal n15444_o : std_logic_vector (24 downto 0);
  signal n15445_o : std_logic_vector (24 downto 0);
  signal n15446_o : std_logic_vector (24 downto 0);
  signal n15449_o : std_logic;
  signal n15464_o : std_logic_vector (42 downto 0);
  signal n15467_o : std_logic_vector (42 downto 0);
  signal n15479_o : std_logic_vector (42 downto 0);
  signal n15482_o : std_logic_vector (42 downto 0);
  signal n15499_o : std_logic_vector (43 downto 0);
  signal n15505_o : std_logic;
  signal n15506_o : std_logic;
  signal n15509_o : std_logic;
  signal n15510_o : std_logic;
  signal n15523_o : std_logic_vector (43 downto 0);
  signal n15529_o : std_logic;
  signal n15530_o : std_logic;
  signal n15533_o : std_logic;
  signal n15534_o : std_logic;
  signal n15547_o : std_logic_vector (43 downto 0);
  signal n15558_o : std_logic_vector (42 downto 0);
  signal n15559_o : std_logic;
  signal n15564_o : std_logic;
  signal n15565_o : std_logic;
  signal n15568_o : std_logic;
  signal n15569_o : std_logic;
  signal n15572_o : std_logic;
  signal n15573_o : std_logic;
  signal n15580_o : std_logic;
  signal n15586_o : std_logic;
  signal n15587_o : std_logic;
  signal n15588_o : std_logic;
  signal n15589_o : std_logic;
  signal n15590_o : std_logic;
  signal n15591_o : std_logic;
  signal n15592_o : std_logic;
  signal n15593_o : std_logic;
  signal n15594_o : std_logic;
  signal n15595_o : std_logic;
  signal n15596_o : std_logic;
  signal n15597_o : std_logic;
  signal n15598_o : std_logic;
  signal n15599_o : std_logic;
  signal n15600_o : std_logic;
  signal n15601_o : std_logic;
  signal n15602_o : std_logic;
  signal n15603_o : std_logic;
  signal n15604_o : std_logic;
  signal n15605_o : std_logic;
  signal n15606_o : std_logic;
  signal n15607_o : std_logic;
  signal n15608_o : std_logic;
  signal n15609_o : std_logic;
  signal n15610_o : std_logic;
  signal n15611_o : std_logic;
  signal n15612_o : std_logic;
  signal n15613_o : std_logic;
  signal n15614_o : std_logic;
  signal n15615_o : std_logic;
  signal n15616_o : std_logic;
  signal n15617_o : std_logic;
  signal n15618_o : std_logic;
  signal n15619_o : std_logic;
  signal n15620_o : std_logic;
  signal n15621_o : std_logic;
  signal n15622_o : std_logic;
  signal n15623_o : std_logic;
  signal n15624_o : std_logic;
  signal n15625_o : std_logic;
  signal n15626_o : std_logic;
  signal n15627_o : std_logic;
  signal n15628_o : std_logic;
  signal n15629_o : std_logic_vector (3 downto 0);
  signal n15630_o : std_logic_vector (3 downto 0);
  signal n15631_o : std_logic_vector (3 downto 0);
  signal n15632_o : std_logic_vector (3 downto 0);
  signal n15633_o : std_logic_vector (3 downto 0);
  signal n15634_o : std_logic_vector (3 downto 0);
  signal n15635_o : std_logic_vector (3 downto 0);
  signal n15636_o : std_logic_vector (3 downto 0);
  signal n15637_o : std_logic_vector (3 downto 0);
  signal n15638_o : std_logic_vector (3 downto 0);
  signal n15639_o : std_logic_vector (2 downto 0);
  signal n15640_o : std_logic_vector (15 downto 0);
  signal n15641_o : std_logic_vector (15 downto 0);
  signal n15642_o : std_logic_vector (10 downto 0);
  signal n15643_o : std_logic_vector (42 downto 0);
  signal n15644_o : std_logic_vector (41 downto 0);
  signal n15645_o : std_logic_vector (42 downto 0);
  signal n15646_o : std_logic_vector (42 downto 0);
  signal n15664_o : std_logic_vector (43 downto 0);
  signal n15670_o : std_logic;
  signal n15671_o : std_logic;
  signal n15674_o : std_logic;
  signal n15675_o : std_logic;
  signal n15688_o : std_logic_vector (27 downto 0);
  signal n15694_o : std_logic;
  signal n15695_o : std_logic;
  signal n15698_o : std_logic;
  signal n15699_o : std_logic;
  constant n15701_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n15702_o : std_logic_vector (15 downto 0);
  signal n15703_o : std_logic_vector (43 downto 0);
  signal n15714_o : std_logic_vector (43 downto 0);
  signal n15725_o : std_logic_vector (42 downto 0);
  signal n15726_o : std_logic;
  signal n15731_o : std_logic;
  signal n15732_o : std_logic;
  signal n15735_o : std_logic;
  signal n15736_o : std_logic;
  signal n15739_o : std_logic;
  signal n15740_o : std_logic;
  signal n15747_o : std_logic;
  signal n15753_o : std_logic;
  signal n15754_o : std_logic;
  signal n15755_o : std_logic;
  signal n15756_o : std_logic;
  signal n15757_o : std_logic;
  signal n15758_o : std_logic;
  signal n15759_o : std_logic;
  signal n15760_o : std_logic;
  signal n15761_o : std_logic;
  signal n15762_o : std_logic;
  signal n15763_o : std_logic;
  signal n15764_o : std_logic;
  signal n15765_o : std_logic;
  signal n15766_o : std_logic;
  signal n15767_o : std_logic;
  signal n15768_o : std_logic;
  signal n15769_o : std_logic;
  signal n15770_o : std_logic;
  signal n15771_o : std_logic;
  signal n15772_o : std_logic;
  signal n15773_o : std_logic;
  signal n15774_o : std_logic;
  signal n15775_o : std_logic;
  signal n15776_o : std_logic;
  signal n15777_o : std_logic;
  signal n15778_o : std_logic;
  signal n15779_o : std_logic;
  signal n15780_o : std_logic;
  signal n15781_o : std_logic;
  signal n15782_o : std_logic;
  signal n15783_o : std_logic;
  signal n15784_o : std_logic;
  signal n15785_o : std_logic;
  signal n15786_o : std_logic;
  signal n15787_o : std_logic;
  signal n15788_o : std_logic;
  signal n15789_o : std_logic;
  signal n15790_o : std_logic;
  signal n15791_o : std_logic;
  signal n15792_o : std_logic;
  signal n15793_o : std_logic;
  signal n15794_o : std_logic;
  signal n15795_o : std_logic;
  signal n15796_o : std_logic_vector (3 downto 0);
  signal n15797_o : std_logic_vector (3 downto 0);
  signal n15798_o : std_logic_vector (3 downto 0);
  signal n15799_o : std_logic_vector (3 downto 0);
  signal n15800_o : std_logic_vector (3 downto 0);
  signal n15801_o : std_logic_vector (3 downto 0);
  signal n15802_o : std_logic_vector (3 downto 0);
  signal n15803_o : std_logic_vector (3 downto 0);
  signal n15804_o : std_logic_vector (3 downto 0);
  signal n15805_o : std_logic_vector (3 downto 0);
  signal n15806_o : std_logic_vector (2 downto 0);
  signal n15807_o : std_logic_vector (15 downto 0);
  signal n15808_o : std_logic_vector (15 downto 0);
  signal n15809_o : std_logic_vector (10 downto 0);
  signal n15810_o : std_logic_vector (42 downto 0);
  signal n15811_o : std_logic_vector (41 downto 0);
  signal n15812_o : std_logic_vector (42 downto 0);
  signal n15813_o : std_logic_vector (42 downto 0);
  signal n15829_o : std_logic_vector (40 downto 0);
  signal n15830_o : std_logic;
  signal n15835_o : std_logic;
  signal n15836_o : std_logic;
  signal n15839_o : std_logic;
  signal n15840_o : std_logic;
  signal n15843_o : std_logic;
  signal n15844_o : std_logic;
  signal n15851_o : std_logic;
  signal n15855_o : std_logic;
  signal n15857_o : std_logic;
  signal n15858_o : std_logic;
  signal n15860_o : std_logic;
  signal n15866_o : std_logic;
  signal n15869_o : std_logic;
  signal n15871_o : std_logic;
  signal n15872_o : std_logic;
  signal n15873_o : std_logic;
  signal n15874_o : std_logic;
  signal n15875_o : std_logic;
  signal n15876_o : std_logic;
  signal n15877_o : std_logic;
  signal n15878_o : std_logic;
  signal n15879_o : std_logic;
  signal n15880_o : std_logic;
  signal n15881_o : std_logic;
  signal n15882_o : std_logic;
  signal n15883_o : std_logic;
  signal n15884_o : std_logic;
  signal n15885_o : std_logic;
  signal n15886_o : std_logic;
  signal n15887_o : std_logic;
  signal n15888_o : std_logic;
  signal n15889_o : std_logic;
  signal n15890_o : std_logic;
  signal n15891_o : std_logic;
  signal n15892_o : std_logic;
  signal n15893_o : std_logic;
  signal n15894_o : std_logic;
  signal n15895_o : std_logic;
  signal n15896_o : std_logic_vector (3 downto 0);
  signal n15897_o : std_logic_vector (3 downto 0);
  signal n15898_o : std_logic_vector (3 downto 0);
  signal n15899_o : std_logic_vector (3 downto 0);
  signal n15900_o : std_logic_vector (3 downto 0);
  signal n15901_o : std_logic_vector (3 downto 0);
  signal n15902_o : std_logic_vector (15 downto 0);
  signal n15903_o : std_logic_vector (8 downto 0);
  signal n15904_o : std_logic_vector (24 downto 0);
  signal n15905_o : std_logic_vector (23 downto 0);
  signal n15906_o : std_logic_vector (24 downto 0);
  signal n15907_o : std_logic_vector (24 downto 0);
  signal n15908_o : std_logic_vector (24 downto 0);
  signal n15923_o : std_logic_vector (42 downto 0);
  signal n15926_o : std_logic_vector (42 downto 0);
  signal n15938_o : std_logic_vector (42 downto 0);
  signal n15941_o : std_logic_vector (42 downto 0);
  signal n15958_o : std_logic_vector (43 downto 0);
  signal n15964_o : std_logic;
  signal n15965_o : std_logic;
  signal n15968_o : std_logic;
  signal n15969_o : std_logic;
  signal n15982_o : std_logic_vector (43 downto 0);
  signal n15988_o : std_logic;
  signal n15989_o : std_logic;
  signal n15992_o : std_logic;
  signal n15993_o : std_logic;
  signal n16006_o : std_logic_vector (43 downto 0);
  signal n16017_o : std_logic_vector (42 downto 0);
  signal n16018_o : std_logic;
  signal n16023_o : std_logic;
  signal n16024_o : std_logic;
  signal n16027_o : std_logic;
  signal n16028_o : std_logic;
  signal n16031_o : std_logic;
  signal n16032_o : std_logic;
  signal n16039_o : std_logic;
  signal n16045_o : std_logic;
  signal n16046_o : std_logic;
  signal n16047_o : std_logic;
  signal n16048_o : std_logic;
  signal n16049_o : std_logic;
  signal n16050_o : std_logic;
  signal n16051_o : std_logic;
  signal n16052_o : std_logic;
  signal n16053_o : std_logic;
  signal n16054_o : std_logic;
  signal n16055_o : std_logic;
  signal n16056_o : std_logic;
  signal n16057_o : std_logic;
  signal n16058_o : std_logic;
  signal n16059_o : std_logic;
  signal n16060_o : std_logic;
  signal n16061_o : std_logic;
  signal n16062_o : std_logic;
  signal n16063_o : std_logic;
  signal n16064_o : std_logic;
  signal n16065_o : std_logic;
  signal n16066_o : std_logic;
  signal n16067_o : std_logic;
  signal n16068_o : std_logic;
  signal n16069_o : std_logic;
  signal n16070_o : std_logic;
  signal n16071_o : std_logic;
  signal n16072_o : std_logic;
  signal n16073_o : std_logic;
  signal n16074_o : std_logic;
  signal n16075_o : std_logic;
  signal n16076_o : std_logic;
  signal n16077_o : std_logic;
  signal n16078_o : std_logic;
  signal n16079_o : std_logic;
  signal n16080_o : std_logic;
  signal n16081_o : std_logic;
  signal n16082_o : std_logic;
  signal n16083_o : std_logic;
  signal n16084_o : std_logic;
  signal n16085_o : std_logic;
  signal n16086_o : std_logic;
  signal n16087_o : std_logic;
  signal n16088_o : std_logic_vector (3 downto 0);
  signal n16089_o : std_logic_vector (3 downto 0);
  signal n16090_o : std_logic_vector (3 downto 0);
  signal n16091_o : std_logic_vector (3 downto 0);
  signal n16092_o : std_logic_vector (3 downto 0);
  signal n16093_o : std_logic_vector (3 downto 0);
  signal n16094_o : std_logic_vector (3 downto 0);
  signal n16095_o : std_logic_vector (3 downto 0);
  signal n16096_o : std_logic_vector (3 downto 0);
  signal n16097_o : std_logic_vector (3 downto 0);
  signal n16098_o : std_logic_vector (2 downto 0);
  signal n16099_o : std_logic_vector (15 downto 0);
  signal n16100_o : std_logic_vector (15 downto 0);
  signal n16101_o : std_logic_vector (10 downto 0);
  signal n16102_o : std_logic_vector (42 downto 0);
  signal n16103_o : std_logic_vector (41 downto 0);
  signal n16104_o : std_logic_vector (42 downto 0);
  signal n16105_o : std_logic_vector (42 downto 0);
  signal n16121_o : std_logic_vector (40 downto 0);
  signal n16122_o : std_logic;
  signal n16127_o : std_logic;
  signal n16128_o : std_logic;
  signal n16131_o : std_logic;
  signal n16132_o : std_logic;
  signal n16135_o : std_logic;
  signal n16136_o : std_logic;
  signal n16143_o : std_logic;
  signal n16147_o : std_logic;
  signal n16149_o : std_logic;
  signal n16150_o : std_logic;
  signal n16152_o : std_logic;
  signal n16158_o : std_logic;
  signal n16161_o : std_logic;
  signal n16163_o : std_logic;
  signal n16164_o : std_logic;
  signal n16165_o : std_logic;
  signal n16166_o : std_logic;
  signal n16167_o : std_logic;
  signal n16168_o : std_logic;
  signal n16169_o : std_logic;
  signal n16170_o : std_logic;
  signal n16171_o : std_logic;
  signal n16172_o : std_logic;
  signal n16173_o : std_logic;
  signal n16174_o : std_logic;
  signal n16175_o : std_logic;
  signal n16176_o : std_logic;
  signal n16177_o : std_logic;
  signal n16178_o : std_logic;
  signal n16179_o : std_logic;
  signal n16180_o : std_logic;
  signal n16181_o : std_logic;
  signal n16182_o : std_logic;
  signal n16183_o : std_logic;
  signal n16184_o : std_logic;
  signal n16185_o : std_logic;
  signal n16186_o : std_logic;
  signal n16187_o : std_logic;
  signal n16188_o : std_logic_vector (3 downto 0);
  signal n16189_o : std_logic_vector (3 downto 0);
  signal n16190_o : std_logic_vector (3 downto 0);
  signal n16191_o : std_logic_vector (3 downto 0);
  signal n16192_o : std_logic_vector (3 downto 0);
  signal n16193_o : std_logic_vector (3 downto 0);
  signal n16194_o : std_logic_vector (15 downto 0);
  signal n16195_o : std_logic_vector (8 downto 0);
  signal n16196_o : std_logic_vector (24 downto 0);
  signal n16197_o : std_logic_vector (23 downto 0);
  signal n16198_o : std_logic_vector (24 downto 0);
  signal n16199_o : std_logic_vector (24 downto 0);
  signal n16200_o : std_logic_vector (24 downto 0);
  signal n16203_o : std_logic;
  signal n16204_o : std_logic_vector (2 downto 0);
  signal n16205_o : std_logic_vector (24 downto 0);
  signal n16206_o : std_logic_vector (24 downto 0);
  signal n16207_o : std_logic_vector (24 downto 0);
  signal n16208_o : std_logic_vector (24 downto 0);
  signal n16236_o : std_logic;
  signal n16237_o : std_logic_vector (24 downto 0);
  signal n16238_q : std_logic_vector (24 downto 0);
  signal n16239_o : std_logic;
  signal n16240_o : std_logic_vector (24 downto 0);
  signal n16241_q : std_logic_vector (24 downto 0);
  signal n16242_q : std_logic_vector (24 downto 0);
  signal n16243_q : std_logic_vector (24 downto 0);
  signal n16259_o : std_logic_vector (22 downto 0);
  signal n16260_o : std_logic;
  signal n16265_o : std_logic;
  signal n16266_o : std_logic;
  signal n16269_o : std_logic;
  signal n16270_o : std_logic;
  signal n16273_o : std_logic;
  signal n16274_o : std_logic;
  signal n16281_o : std_logic;
  signal n16285_o : std_logic;
  signal n16287_o : std_logic;
  signal n16288_o : std_logic;
  signal n16290_o : std_logic;
  signal n16296_o : std_logic;
  signal n16299_o : std_logic;
  signal n16301_o : std_logic;
  signal n16302_o : std_logic;
  signal n16303_o : std_logic;
  signal n16304_o : std_logic;
  signal n16305_o : std_logic;
  signal n16306_o : std_logic;
  signal n16307_o : std_logic;
  signal n16308_o : std_logic;
  signal n16309_o : std_logic;
  signal n16310_o : std_logic;
  signal n16311_o : std_logic;
  signal n16312_o : std_logic;
  signal n16313_o : std_logic;
  signal n16314_o : std_logic;
  signal n16315_o : std_logic;
  signal n16316_o : std_logic;
  signal n16317_o : std_logic;
  signal n16318_o : std_logic;
  signal n16319_o : std_logic_vector (3 downto 0);
  signal n16320_o : std_logic_vector (3 downto 0);
  signal n16321_o : std_logic_vector (3 downto 0);
  signal n16322_o : std_logic_vector (3 downto 0);
  signal n16323_o : std_logic_vector (1 downto 0);
  signal n16324_o : std_logic_vector (15 downto 0);
  signal n16325_o : std_logic_vector (17 downto 0);
  signal n16326_o : std_logic_vector (16 downto 0);
  signal n16327_o : std_logic_vector (17 downto 0);
  signal n16328_o : std_logic_vector (17 downto 0);
  signal n16329_o : std_logic_vector (17 downto 0);
begin
  ready_o <= n15126_o;
  valid_o <= n15131_o;
  data_o <= n16329_o;
  -- ../BiquadFilter/BiquadFilter.vhd:26:12
  state_reg <= n15122_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:12
  x_reg <= n16238_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:19
  y_reg <= n16241_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:26
  w_reg <= n16242_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:33
  v_reg <= n16243_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:33:15
  -- n15100_o <= '1' when rising_edge (clk_i) else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:36:21
  n15102_o <= state_reg when valid_i = '0' else "01";
  -- ../BiquadFilter/BiquadFilter.vhd:35:17
  n15104_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:39:17
  n15106_o <= '1' when state_reg = "01" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:41:17
  n15108_o <= '1' when state_reg = "10" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:44:21
  n15110_o <= state_reg when ready_i = '0' else "00";
  -- ../BiquadFilter/BiquadFilter.vhd:43:17
  n15112_o <= '1' when state_reg = "11" else '0';
  -- ../fixed_pkg.vhd:183:17
  n15113_o <= n15112_o & n15108_o & n15106_o & n15104_o;
  -- ../BiquadFilter/BiquadFilter.vhd:34:13
  with n15113_o select n15117_o <=
    n15110_o when "1000",
    "11" when "0100",
    "10" when "0010",
    n15102_o when "0001",
    "XX" when others;
  -- ../BiquadFilter/BiquadFilter.vhd:33:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n15122_q <= "00";
    elsif rising_edge (clk_i) then
      n15122_q <= n15117_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:51:35
  n15125_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:51:20
  n15126_o <= '0' when n15125_o = '0' else '1';
  -- ../BiquadFilter/BiquadFilter.vhd:52:35
  n15130_o <= '1' when state_reg = "11" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:52:20
  n15131_o <= '0' when n15130_o = '0' else '1';
  -- ../BiquadFilter/BiquadFilter.vhd:59:15
  -- n15134_o <= '1' when rising_edge (clk_i) else '0';
  -- ../fixed_pkg.vhd:168:39
  n15150_o <= std_logic_vector (resize (signed (data_i), 20));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n15156_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n15157_o <= n15156_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n15158: postponed assert n15157_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n15160_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n15161_o <= n15160_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n15162: postponed assert n15161_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:170:18
  n15164_o <= n15163_o (4 downto 0);
  n15165_o <= n15150_o & n15164_o;
  -- ../BiquadFilter/BiquadFilter.vhd:62:21
  n15166_o <= x_reg when valid_i = '0' else n15165_o;
  -- ../BiquadFilter/BiquadFilter.vhd:61:17
  n15168_o <= '1' when state_reg = "00" else '0';
  -- ../fixed_pkg.vhd:266:100
  n15182_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n15185_o <= std_logic_vector (resize (signed (n15182_o) * signed'("0000000000000000000000000000000011111101000"), 43));
  -- ../fixed_pkg.vhd:168:39
  n15202_o <= std_logic_vector (resize (signed (n15185_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n15208_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n15209_o <= n15208_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n15210: postponed assert n15209_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n15212_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n15213_o <= n15212_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n15214: postponed assert n15213_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n15226_o <= std_logic_vector (resize (signed (w_reg), 28));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n15232_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n15233_o <= n15232_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n15234: postponed assert n15233_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n15236_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n15237_o <= n15236_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n15238: postponed assert n15237_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:24:14
  n15240_o <= n15239_o (15 downto 0);
  -- ../fixed_pkg.vhd:24:14
  n15241_o <= n15226_o & n15240_o;
  -- ../fixed_pkg.vhd:255:67
  n15252_o <= std_logic_vector (unsigned (n15202_o) + unsigned (n15241_o));
  -- ../fixed_pkg.vhd:168:39
  n15263_o <= n15252_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n15264_o <= n15252_o (43);
  -- ../fixed_pkg.vhd:173:9
  n15269_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n15270_o <= n15269_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n15271: postponed assert n15270_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n15273_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n15274_o <= n15273_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n15275: postponed assert n15274_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n15277_o <= n15252_o (42);
  -- ../fixed_pkg.vhd:183:27
  n15278_o <= '1' when n15277_o /= n15264_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n15285_o <= '0' when n15278_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n15291_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15292_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15293_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15294_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15295_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15296_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15297_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15298_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15299_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15300_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15301_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15302_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15303_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15304_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15305_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15306_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15307_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15308_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15309_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15310_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15311_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15312_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15313_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15314_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15315_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15316_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15317_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15318_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15319_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15320_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15321_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15322_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15323_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15324_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15325_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15326_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15327_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15328_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15329_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15330_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15331_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15332_o <= not n15264_o;
  -- ../fixed_pkg.vhd:194:31
  n15333_o <= not n15264_o;
  n15334_o <= n15291_o & n15292_o & n15293_o & n15294_o;
  -- ../fixed_pkg.vhd:169:40
  n15335_o <= n15295_o & n15296_o & n15297_o & n15298_o;
  -- ../fixed_pkg.vhd:9:14
  n15336_o <= n15299_o & n15300_o & n15301_o & n15302_o;
  -- ../fixed_pkg.vhd:9:14
  n15337_o <= n15303_o & n15304_o & n15305_o & n15306_o;
  n15338_o <= n15307_o & n15308_o & n15309_o & n15310_o;
  -- ../fixed_pkg.vhd:9:14
  n15339_o <= n15311_o & n15312_o & n15313_o & n15314_o;
  -- ../fixed_pkg.vhd:24:14
  n15340_o <= n15315_o & n15316_o & n15317_o & n15318_o;
  -- ../fixed_pkg.vhd:24:14
  n15341_o <= n15319_o & n15320_o & n15321_o & n15322_o;
  n15342_o <= n15323_o & n15324_o & n15325_o & n15326_o;
  -- ../fixed_pkg.vhd:24:14
  n15343_o <= n15327_o & n15328_o & n15329_o & n15330_o;
  n15344_o <= n15331_o & n15332_o & n15333_o;
  -- ../fixed_pkg.vhd:171:18
  n15345_o <= n15334_o & n15335_o & n15336_o & n15337_o;
  n15346_o <= n15338_o & n15339_o & n15340_o & n15341_o;
  -- ../fixed_pkg.vhd:170:18
  n15347_o <= n15342_o & n15343_o & n15344_o;
  n15348_o <= n15345_o & n15346_o & n15347_o;
  -- ../fixed_pkg.vhd:169:40
  n15349_o <= n15348_o (41 downto 0);
  -- ../fixed_pkg.vhd:9:14
  n15350_o <= n15264_o & n15349_o;
  -- ../fixed_pkg.vhd:193:9
  n15351_o <= n15263_o when n15285_o = '0' else n15350_o;
  -- ../fixed_pkg.vhd:168:39
  n15367_o <= n15351_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n15368_o <= n15351_o (42);
  -- ../fixed_pkg.vhd:173:9
  n15373_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n15374_o <= n15373_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n15375: postponed assert n15374_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n15377_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n15378_o <= n15377_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n15379: postponed assert n15378_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n15381_o <= n15351_o (41);
  -- ../fixed_pkg.vhd:183:27
  n15382_o <= '1' when n15381_o /= n15368_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n15389_o <= '0' when n15382_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n15393_o <= '1' when n15382_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n15395_o <= n15351_o (40);
  -- ../fixed_pkg.vhd:183:27
  n15396_o <= '1' when n15395_o /= n15368_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n15398_o <= n15389_o when n15407_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n15404_o <= n15396_o and n15393_o;
  -- ../fixed_pkg.vhd:183:17
  n15407_o <= n15393_o and n15404_o;
  -- ../fixed_pkg.vhd:194:31
  n15409_o <= not n15368_o;
  -- ../fixed_pkg.vhd:194:31
  n15410_o <= not n15368_o;
  -- ../fixed_pkg.vhd:194:31
  n15411_o <= not n15368_o;
  -- ../fixed_pkg.vhd:194:31
  n15412_o <= not n15368_o;
  -- ../fixed_pkg.vhd:194:31
  n15413_o <= not n15368_o;
  -- ../fixed_pkg.vhd:194:31
  n15414_o <= not n15368_o;
  -- ../fixed_pkg.vhd:194:31
  n15415_o <= not n15368_o;
  -- ../fixed_pkg.vhd:194:31
  n15416_o <= not n15368_o;
  -- ../fixed_pkg.vhd:194:31
  n15417_o <= not n15368_o;
  -- ../fixed_pkg.vhd:194:31
  n15418_o <= not n15368_o;
  -- ../fixed_pkg.vhd:194:31
  n15419_o <= not n15368_o;
  -- ../fixed_pkg.vhd:194:31
  n15420_o <= not n15368_o;
  -- ../fixed_pkg.vhd:194:31
  n15421_o <= not n15368_o;
  -- ../fixed_pkg.vhd:194:31
  n15422_o <= not n15368_o;
  -- ../fixed_pkg.vhd:194:31
  n15423_o <= not n15368_o;
  -- ../fixed_pkg.vhd:194:31
  n15424_o <= not n15368_o;
  -- ../fixed_pkg.vhd:194:31
  n15425_o <= not n15368_o;
  -- ../fixed_pkg.vhd:194:31
  n15426_o <= not n15368_o;
  -- ../fixed_pkg.vhd:194:31
  n15427_o <= not n15368_o;
  -- ../fixed_pkg.vhd:194:31
  n15428_o <= not n15368_o;
  -- ../fixed_pkg.vhd:194:31
  n15429_o <= not n15368_o;
  -- ../fixed_pkg.vhd:194:31
  n15430_o <= not n15368_o;
  -- ../fixed_pkg.vhd:194:31
  n15431_o <= not n15368_o;
  -- ../fixed_pkg.vhd:194:31
  n15432_o <= not n15368_o;
  -- ../fixed_pkg.vhd:194:31
  n15433_o <= not n15368_o;
  -- ../fixed_pkg.vhd:171:18
  n15434_o <= n15409_o & n15410_o & n15411_o & n15412_o;
  -- ../fixed_pkg.vhd:9:14
  n15435_o <= n15413_o & n15414_o & n15415_o & n15416_o;
  -- ../fixed_pkg.vhd:9:14
  n15436_o <= n15417_o & n15418_o & n15419_o & n15420_o;
  -- ../fixed_pkg.vhd:183:17
  n15437_o <= n15421_o & n15422_o & n15423_o & n15424_o;
  -- ../fixed_pkg.vhd:9:14
  n15438_o <= n15425_o & n15426_o & n15427_o & n15428_o;
  -- ../fixed_pkg.vhd:40:14
  n15439_o <= n15429_o & n15430_o & n15431_o & n15432_o;
  -- ../fixed_pkg.vhd:40:14
  n15440_o <= n15434_o & n15435_o & n15436_o & n15437_o;
  -- ../fixed_pkg.vhd:9:14
  n15441_o <= n15438_o & n15439_o & n15433_o;
  -- ../fixed_pkg.vhd:40:14
  n15442_o <= n15440_o & n15441_o;
  -- ../fixed_pkg.vhd:183:17
  n15443_o <= n15442_o (23 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n15444_o <= n15367_o (40 downto 16);
  -- ../fixed_pkg.vhd:183:17
  n15445_o <= n15368_o & n15443_o;
  -- ../fixed_pkg.vhd:193:9
  n15446_o <= n15444_o when n15398_o = '0' else n15445_o;
  -- ../BiquadFilter/BiquadFilter.vhd:65:17
  n15449_o <= '1' when state_reg = "01" else '0';
  -- ../fixed_pkg.vhd:266:100
  n15464_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n15467_o <= std_logic_vector (resize (signed (n15464_o) * signed'("0000000000000000000000000000000000000000000"), 43));
  -- ../fixed_pkg.vhd:266:100
  n15479_o <= std_logic_vector (resize (signed (y_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n15482_o <= std_logic_vector (resize (signed (n15479_o) * signed'("0000000000011111111111111101000000110101111"), 43));
  -- ../fixed_pkg.vhd:168:39
  n15499_o <= std_logic_vector (resize (signed (n15467_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n15505_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n15506_o <= n15505_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n15507: postponed assert n15506_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n15509_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n15510_o <= n15509_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n15511: postponed assert n15510_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n15523_o <= std_logic_vector (resize (signed (n15482_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n15529_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n15530_o <= n15529_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n15531: postponed assert n15530_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n15533_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n15534_o <= n15533_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n15535: postponed assert n15534_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:240:67
  n15547_o <= std_logic_vector (unsigned (n15499_o) - unsigned (n15523_o));
  -- ../fixed_pkg.vhd:168:39
  n15558_o <= n15547_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n15559_o <= n15547_o (43);
  -- ../fixed_pkg.vhd:173:9
  n15564_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n15565_o <= n15564_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n15566: postponed assert n15565_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n15568_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n15569_o <= n15568_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n15570: postponed assert n15569_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n15572_o <= n15547_o (42);
  -- ../fixed_pkg.vhd:183:27
  n15573_o <= '1' when n15572_o /= n15559_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n15580_o <= '0' when n15573_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n15586_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15587_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15588_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15589_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15590_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15591_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15592_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15593_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15594_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15595_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15596_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15597_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15598_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15599_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15600_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15601_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15602_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15603_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15604_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15605_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15606_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15607_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15608_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15609_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15610_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15611_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15612_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15613_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15614_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15615_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15616_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15617_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15618_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15619_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15620_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15621_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15622_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15623_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15624_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15625_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15626_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15627_o <= not n15559_o;
  -- ../fixed_pkg.vhd:194:31
  n15628_o <= not n15559_o;
  n15629_o <= n15586_o & n15587_o & n15588_o & n15589_o;
  n15630_o <= n15590_o & n15591_o & n15592_o & n15593_o;
  n15631_o <= n15594_o & n15595_o & n15596_o & n15597_o;
  n15632_o <= n15598_o & n15599_o & n15600_o & n15601_o;
  n15633_o <= n15602_o & n15603_o & n15604_o & n15605_o;
  n15634_o <= n15606_o & n15607_o & n15608_o & n15609_o;
  n15635_o <= n15610_o & n15611_o & n15612_o & n15613_o;
  n15636_o <= n15614_o & n15615_o & n15616_o & n15617_o;
  n15637_o <= n15618_o & n15619_o & n15620_o & n15621_o;
  n15638_o <= n15622_o & n15623_o & n15624_o & n15625_o;
  n15639_o <= n15626_o & n15627_o & n15628_o;
  n15640_o <= n15629_o & n15630_o & n15631_o & n15632_o;
  n15641_o <= n15633_o & n15634_o & n15635_o & n15636_o;
  n15642_o <= n15637_o & n15638_o & n15639_o;
  n15643_o <= n15640_o & n15641_o & n15642_o;
  n15644_o <= n15643_o (41 downto 0);
  n15645_o <= n15559_o & n15644_o;
  -- ../fixed_pkg.vhd:193:9
  n15646_o <= n15558_o when n15580_o = '0' else n15645_o;
  -- ../fixed_pkg.vhd:168:39
  n15664_o <= std_logic_vector (resize (signed (n15646_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n15670_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n15671_o <= n15670_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n15672: postponed assert n15671_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n15674_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n15675_o <= n15674_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n15676: postponed assert n15675_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n15688_o <= std_logic_vector (resize (signed (v_reg), 28));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n15694_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n15695_o <= n15694_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n15696: postponed assert n15695_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n15698_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n15699_o <= n15698_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n15700: postponed assert n15699_o = '1' severity error; --  assert
  n15702_o <= n15701_o (15 downto 0);
  n15703_o <= n15688_o & n15702_o;
  -- ../fixed_pkg.vhd:255:67
  n15714_o <= std_logic_vector (unsigned (n15664_o) + unsigned (n15703_o));
  -- ../fixed_pkg.vhd:168:39
  n15725_o <= n15714_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n15726_o <= n15714_o (43);
  -- ../fixed_pkg.vhd:173:9
  n15731_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n15732_o <= n15731_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n15733: postponed assert n15732_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n15735_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n15736_o <= n15735_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n15737: postponed assert n15736_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n15739_o <= n15714_o (42);
  -- ../fixed_pkg.vhd:183:27
  n15740_o <= '1' when n15739_o /= n15726_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n15747_o <= '0' when n15740_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n15753_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15754_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15755_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15756_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15757_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15758_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15759_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15760_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15761_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15762_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15763_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15764_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15765_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15766_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15767_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15768_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15769_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15770_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15771_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15772_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15773_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15774_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15775_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15776_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15777_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15778_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15779_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15780_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15781_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15782_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15783_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15784_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15785_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15786_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15787_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15788_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15789_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15790_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15791_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15792_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15793_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15794_o <= not n15726_o;
  -- ../fixed_pkg.vhd:194:31
  n15795_o <= not n15726_o;
  n15796_o <= n15753_o & n15754_o & n15755_o & n15756_o;
  n15797_o <= n15757_o & n15758_o & n15759_o & n15760_o;
  n15798_o <= n15761_o & n15762_o & n15763_o & n15764_o;
  n15799_o <= n15765_o & n15766_o & n15767_o & n15768_o;
  n15800_o <= n15769_o & n15770_o & n15771_o & n15772_o;
  n15801_o <= n15773_o & n15774_o & n15775_o & n15776_o;
  n15802_o <= n15777_o & n15778_o & n15779_o & n15780_o;
  n15803_o <= n15781_o & n15782_o & n15783_o & n15784_o;
  n15804_o <= n15785_o & n15786_o & n15787_o & n15788_o;
  n15805_o <= n15789_o & n15790_o & n15791_o & n15792_o;
  n15806_o <= n15793_o & n15794_o & n15795_o;
  n15807_o <= n15796_o & n15797_o & n15798_o & n15799_o;
  n15808_o <= n15800_o & n15801_o & n15802_o & n15803_o;
  n15809_o <= n15804_o & n15805_o & n15806_o;
  n15810_o <= n15807_o & n15808_o & n15809_o;
  n15811_o <= n15810_o (41 downto 0);
  n15812_o <= n15726_o & n15811_o;
  -- ../fixed_pkg.vhd:193:9
  n15813_o <= n15725_o when n15747_o = '0' else n15812_o;
  -- ../fixed_pkg.vhd:168:39
  n15829_o <= n15813_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n15830_o <= n15813_o (42);
  -- ../fixed_pkg.vhd:173:9
  n15835_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n15836_o <= n15835_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n15837: postponed assert n15836_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n15839_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n15840_o <= n15839_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n15841: postponed assert n15840_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n15843_o <= n15813_o (41);
  -- ../fixed_pkg.vhd:183:27
  n15844_o <= '1' when n15843_o /= n15830_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n15851_o <= '0' when n15844_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n15855_o <= '1' when n15844_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n15857_o <= n15813_o (40);
  -- ../fixed_pkg.vhd:183:27
  n15858_o <= '1' when n15857_o /= n15830_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n15860_o <= n15851_o when n15869_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n15866_o <= n15858_o and n15855_o;
  -- ../fixed_pkg.vhd:183:17
  n15869_o <= n15855_o and n15866_o;
  -- ../fixed_pkg.vhd:194:31
  n15871_o <= not n15830_o;
  -- ../fixed_pkg.vhd:194:31
  n15872_o <= not n15830_o;
  -- ../fixed_pkg.vhd:194:31
  n15873_o <= not n15830_o;
  -- ../fixed_pkg.vhd:194:31
  n15874_o <= not n15830_o;
  -- ../fixed_pkg.vhd:194:31
  n15875_o <= not n15830_o;
  -- ../fixed_pkg.vhd:194:31
  n15876_o <= not n15830_o;
  -- ../fixed_pkg.vhd:194:31
  n15877_o <= not n15830_o;
  -- ../fixed_pkg.vhd:194:31
  n15878_o <= not n15830_o;
  -- ../fixed_pkg.vhd:194:31
  n15879_o <= not n15830_o;
  -- ../fixed_pkg.vhd:194:31
  n15880_o <= not n15830_o;
  -- ../fixed_pkg.vhd:194:31
  n15881_o <= not n15830_o;
  -- ../fixed_pkg.vhd:194:31
  n15882_o <= not n15830_o;
  -- ../fixed_pkg.vhd:194:31
  n15883_o <= not n15830_o;
  -- ../fixed_pkg.vhd:194:31
  n15884_o <= not n15830_o;
  -- ../fixed_pkg.vhd:194:31
  n15885_o <= not n15830_o;
  -- ../fixed_pkg.vhd:194:31
  n15886_o <= not n15830_o;
  -- ../fixed_pkg.vhd:194:31
  n15887_o <= not n15830_o;
  -- ../fixed_pkg.vhd:194:31
  n15888_o <= not n15830_o;
  -- ../fixed_pkg.vhd:194:31
  n15889_o <= not n15830_o;
  -- ../fixed_pkg.vhd:194:31
  n15890_o <= not n15830_o;
  -- ../fixed_pkg.vhd:194:31
  n15891_o <= not n15830_o;
  -- ../fixed_pkg.vhd:194:31
  n15892_o <= not n15830_o;
  -- ../fixed_pkg.vhd:194:31
  n15893_o <= not n15830_o;
  -- ../fixed_pkg.vhd:194:31
  n15894_o <= not n15830_o;
  -- ../fixed_pkg.vhd:194:31
  n15895_o <= not n15830_o;
  n15896_o <= n15871_o & n15872_o & n15873_o & n15874_o;
  n15897_o <= n15875_o & n15876_o & n15877_o & n15878_o;
  n15898_o <= n15879_o & n15880_o & n15881_o & n15882_o;
  n15899_o <= n15883_o & n15884_o & n15885_o & n15886_o;
  n15900_o <= n15887_o & n15888_o & n15889_o & n15890_o;
  n15901_o <= n15891_o & n15892_o & n15893_o & n15894_o;
  n15902_o <= n15896_o & n15897_o & n15898_o & n15899_o;
  n15903_o <= n15900_o & n15901_o & n15895_o;
  n15904_o <= n15902_o & n15903_o;
  n15905_o <= n15904_o (23 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n15906_o <= n15829_o (40 downto 16);
  n15907_o <= n15830_o & n15905_o;
  -- ../fixed_pkg.vhd:193:9
  n15908_o <= n15906_o when n15860_o = '0' else n15907_o;
  -- ../fixed_pkg.vhd:266:100
  n15923_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n15926_o <= std_logic_vector (resize (signed (n15923_o) * signed'("0000000000011111111111111111111100000011000"), 43));
  -- ../fixed_pkg.vhd:266:100
  n15938_o <= std_logic_vector (resize (signed (y_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n15941_o <= std_logic_vector (resize (signed (n15938_o) * signed'("0000000000000000000000000001111000000110000"), 43));
  -- ../fixed_pkg.vhd:168:39
  n15958_o <= std_logic_vector (resize (signed (n15926_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n15964_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n15965_o <= n15964_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n15966: postponed assert n15965_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n15968_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n15969_o <= n15968_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n15970: postponed assert n15969_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n15982_o <= std_logic_vector (resize (signed (n15941_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n15988_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n15989_o <= n15988_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n15990: postponed assert n15989_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n15992_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n15993_o <= n15992_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n15994: postponed assert n15993_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:240:67
  n16006_o <= std_logic_vector (unsigned (n15958_o) - unsigned (n15982_o));
  -- ../fixed_pkg.vhd:168:39
  n16017_o <= n16006_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n16018_o <= n16006_o (43);
  -- ../fixed_pkg.vhd:173:9
  n16023_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n16024_o <= n16023_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n16025: postponed assert n16024_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n16027_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n16028_o <= n16027_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n16029: postponed assert n16028_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n16031_o <= n16006_o (42);
  -- ../fixed_pkg.vhd:183:27
  n16032_o <= '1' when n16031_o /= n16018_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n16039_o <= '0' when n16032_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n16045_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16046_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16047_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16048_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16049_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16050_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16051_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16052_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16053_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16054_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16055_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16056_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16057_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16058_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16059_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16060_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16061_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16062_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16063_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16064_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16065_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16066_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16067_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16068_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16069_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16070_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16071_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16072_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16073_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16074_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16075_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16076_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16077_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16078_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16079_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16080_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16081_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16082_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16083_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16084_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16085_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16086_o <= not n16018_o;
  -- ../fixed_pkg.vhd:194:31
  n16087_o <= not n16018_o;
  n16088_o <= n16045_o & n16046_o & n16047_o & n16048_o;
  n16089_o <= n16049_o & n16050_o & n16051_o & n16052_o;
  n16090_o <= n16053_o & n16054_o & n16055_o & n16056_o;
  n16091_o <= n16057_o & n16058_o & n16059_o & n16060_o;
  n16092_o <= n16061_o & n16062_o & n16063_o & n16064_o;
  n16093_o <= n16065_o & n16066_o & n16067_o & n16068_o;
  n16094_o <= n16069_o & n16070_o & n16071_o & n16072_o;
  n16095_o <= n16073_o & n16074_o & n16075_o & n16076_o;
  n16096_o <= n16077_o & n16078_o & n16079_o & n16080_o;
  n16097_o <= n16081_o & n16082_o & n16083_o & n16084_o;
  n16098_o <= n16085_o & n16086_o & n16087_o;
  n16099_o <= n16088_o & n16089_o & n16090_o & n16091_o;
  n16100_o <= n16092_o & n16093_o & n16094_o & n16095_o;
  n16101_o <= n16096_o & n16097_o & n16098_o;
  n16102_o <= n16099_o & n16100_o & n16101_o;
  n16103_o <= n16102_o (41 downto 0);
  n16104_o <= n16018_o & n16103_o;
  -- ../fixed_pkg.vhd:193:9
  n16105_o <= n16017_o when n16039_o = '0' else n16104_o;
  -- ../fixed_pkg.vhd:168:39
  n16121_o <= n16105_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n16122_o <= n16105_o (42);
  -- ../fixed_pkg.vhd:173:9
  n16127_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n16128_o <= n16127_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n16129: postponed assert n16128_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n16131_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n16132_o <= n16131_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n16133: postponed assert n16132_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n16135_o <= n16105_o (41);
  -- ../fixed_pkg.vhd:183:27
  n16136_o <= '1' when n16135_o /= n16122_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n16143_o <= '0' when n16136_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n16147_o <= '1' when n16136_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n16149_o <= n16105_o (40);
  -- ../fixed_pkg.vhd:183:27
  n16150_o <= '1' when n16149_o /= n16122_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n16152_o <= n16143_o when n16161_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n16158_o <= n16150_o and n16147_o;
  -- ../fixed_pkg.vhd:183:17
  n16161_o <= n16147_o and n16158_o;
  -- ../fixed_pkg.vhd:194:31
  n16163_o <= not n16122_o;
  -- ../fixed_pkg.vhd:194:31
  n16164_o <= not n16122_o;
  -- ../fixed_pkg.vhd:194:31
  n16165_o <= not n16122_o;
  -- ../fixed_pkg.vhd:194:31
  n16166_o <= not n16122_o;
  -- ../fixed_pkg.vhd:194:31
  n16167_o <= not n16122_o;
  -- ../fixed_pkg.vhd:194:31
  n16168_o <= not n16122_o;
  -- ../fixed_pkg.vhd:194:31
  n16169_o <= not n16122_o;
  -- ../fixed_pkg.vhd:194:31
  n16170_o <= not n16122_o;
  -- ../fixed_pkg.vhd:194:31
  n16171_o <= not n16122_o;
  -- ../fixed_pkg.vhd:194:31
  n16172_o <= not n16122_o;
  -- ../fixed_pkg.vhd:194:31
  n16173_o <= not n16122_o;
  -- ../fixed_pkg.vhd:194:31
  n16174_o <= not n16122_o;
  -- ../fixed_pkg.vhd:194:31
  n16175_o <= not n16122_o;
  -- ../fixed_pkg.vhd:194:31
  n16176_o <= not n16122_o;
  -- ../fixed_pkg.vhd:194:31
  n16177_o <= not n16122_o;
  -- ../fixed_pkg.vhd:194:31
  n16178_o <= not n16122_o;
  -- ../fixed_pkg.vhd:194:31
  n16179_o <= not n16122_o;
  -- ../fixed_pkg.vhd:194:31
  n16180_o <= not n16122_o;
  -- ../fixed_pkg.vhd:194:31
  n16181_o <= not n16122_o;
  -- ../fixed_pkg.vhd:194:31
  n16182_o <= not n16122_o;
  -- ../fixed_pkg.vhd:194:31
  n16183_o <= not n16122_o;
  -- ../fixed_pkg.vhd:194:31
  n16184_o <= not n16122_o;
  -- ../fixed_pkg.vhd:194:31
  n16185_o <= not n16122_o;
  -- ../fixed_pkg.vhd:194:31
  n16186_o <= not n16122_o;
  -- ../fixed_pkg.vhd:194:31
  n16187_o <= not n16122_o;
  n16188_o <= n16163_o & n16164_o & n16165_o & n16166_o;
  n16189_o <= n16167_o & n16168_o & n16169_o & n16170_o;
  n16190_o <= n16171_o & n16172_o & n16173_o & n16174_o;
  n16191_o <= n16175_o & n16176_o & n16177_o & n16178_o;
  n16192_o <= n16179_o & n16180_o & n16181_o & n16182_o;
  n16193_o <= n16183_o & n16184_o & n16185_o & n16186_o;
  n16194_o <= n16188_o & n16189_o & n16190_o & n16191_o;
  n16195_o <= n16192_o & n16193_o & n16187_o;
  n16196_o <= n16194_o & n16195_o;
  n16197_o <= n16196_o (23 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n16198_o <= n16121_o (40 downto 16);
  n16199_o <= n16122_o & n16197_o;
  -- ../fixed_pkg.vhd:193:9
  n16200_o <= n16198_o when n16152_o = '0' else n16199_o;
  -- ../BiquadFilter/BiquadFilter.vhd:67:17
  n16203_o <= '1' when state_reg = "10" else '0';
  n16204_o <= n16203_o & n15449_o & n15168_o;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n16204_o select n16205_o <=
    x_reg when "100",
    x_reg when "010",
    n15166_o when "001",
    x_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n16204_o select n16206_o <=
    y_reg when "100",
    n15446_o when "010",
    y_reg when "001",
    y_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n16204_o select n16207_o <=
    n15908_o when "100",
    w_reg when "010",
    w_reg when "001",
    w_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n16204_o select n16208_o <=
    n16200_o when "100",
    v_reg when "010",
    v_reg when "001",
    v_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n16236_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n16237_o <= x_reg when n16236_o = '0' else n16205_o;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n16238_q <= n16237_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n16239_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n16240_o <= y_reg when n16239_o = '0' else n16206_o;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n16241_q <= n16240_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n16242_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n16242_q <= n16207_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n16243_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n16243_q <= n16208_o;
    end if;
  end process;
  -- ../fixed_pkg.vhd:168:39
  n16259_o <= y_reg (22 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n16260_o <= y_reg (24);
  -- ../fixed_pkg.vhd:173:9
  n16265_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n16266_o <= n16265_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n16267: postponed assert n16266_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n16269_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n16270_o <= n16269_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n16271: postponed assert n16270_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n16273_o <= y_reg (23);
  -- ../fixed_pkg.vhd:183:27
  n16274_o <= '1' when n16273_o /= n16260_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n16281_o <= '0' when n16274_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n16285_o <= '1' when n16274_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n16287_o <= y_reg (22);
  -- ../fixed_pkg.vhd:183:27
  n16288_o <= '1' when n16287_o /= n16260_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n16290_o <= n16281_o when n16299_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n16296_o <= n16288_o and n16285_o;
  -- ../fixed_pkg.vhd:183:17
  n16299_o <= n16285_o and n16296_o;
  -- ../fixed_pkg.vhd:194:31
  n16301_o <= not n16260_o;
  -- ../fixed_pkg.vhd:194:31
  n16302_o <= not n16260_o;
  -- ../fixed_pkg.vhd:194:31
  n16303_o <= not n16260_o;
  -- ../fixed_pkg.vhd:194:31
  n16304_o <= not n16260_o;
  -- ../fixed_pkg.vhd:194:31
  n16305_o <= not n16260_o;
  -- ../fixed_pkg.vhd:194:31
  n16306_o <= not n16260_o;
  -- ../fixed_pkg.vhd:194:31
  n16307_o <= not n16260_o;
  -- ../fixed_pkg.vhd:194:31
  n16308_o <= not n16260_o;
  -- ../fixed_pkg.vhd:194:31
  n16309_o <= not n16260_o;
  -- ../fixed_pkg.vhd:194:31
  n16310_o <= not n16260_o;
  -- ../fixed_pkg.vhd:194:31
  n16311_o <= not n16260_o;
  -- ../fixed_pkg.vhd:194:31
  n16312_o <= not n16260_o;
  -- ../fixed_pkg.vhd:194:31
  n16313_o <= not n16260_o;
  -- ../fixed_pkg.vhd:194:31
  n16314_o <= not n16260_o;
  -- ../fixed_pkg.vhd:194:31
  n16315_o <= not n16260_o;
  -- ../fixed_pkg.vhd:194:31
  n16316_o <= not n16260_o;
  -- ../fixed_pkg.vhd:194:31
  n16317_o <= not n16260_o;
  -- ../fixed_pkg.vhd:194:31
  n16318_o <= not n16260_o;
  n16319_o <= n16301_o & n16302_o & n16303_o & n16304_o;
  n16320_o <= n16305_o & n16306_o & n16307_o & n16308_o;
  n16321_o <= n16309_o & n16310_o & n16311_o & n16312_o;
  n16322_o <= n16313_o & n16314_o & n16315_o & n16316_o;
  n16323_o <= n16317_o & n16318_o;
  n16324_o <= n16319_o & n16320_o & n16321_o & n16322_o;
  n16325_o <= n16324_o & n16323_o;
  n16326_o <= n16325_o (16 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n16327_o <= n16259_o (22 downto 5);
  n16328_o <= n16260_o & n16326_o;
  -- ../fixed_pkg.vhd:193:9
  n16329_o <= n16327_o when n16290_o = '0' else n16328_o;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity biquadfilter_7ee7919464c974e1ea4a8e43f5092f05f8be8f05 is
  port (
    clk_i : in std_logic;
    reset_i : in std_logic;
    valid_i : in std_logic;
    data_i : in std_logic_vector (17 downto 0);
    ready_i : in std_logic;
    ready_o : out std_logic;
    valid_o : out std_logic;
    data_o : out std_logic_vector (17 downto 0));
end entity biquadfilter_7ee7919464c974e1ea4a8e43f5092f05f8be8f05;

architecture rtl of biquadfilter_7ee7919464c974e1ea4a8e43f5092f05f8be8f05 is
  signal state_reg : std_logic_vector (1 downto 0);
  signal x_reg : std_logic_vector (24 downto 0);
  signal y_reg : std_logic_vector (24 downto 0);
  signal w_reg : std_logic_vector (24 downto 0);
  signal v_reg : std_logic_vector (24 downto 0);
  signal n13864_o : std_logic;
  signal n13866_o : std_logic_vector (1 downto 0);
  signal n13868_o : std_logic;
  signal n13870_o : std_logic;
  signal n13872_o : std_logic;
  signal n13874_o : std_logic_vector (1 downto 0);
  signal n13876_o : std_logic;
  signal n13877_o : std_logic_vector (3 downto 0);
  signal n13881_o : std_logic_vector (1 downto 0);
  signal n13886_q : std_logic_vector (1 downto 0);
  signal n13889_o : std_logic;
  signal n13890_o : std_logic;
  signal n13894_o : std_logic;
  signal n13895_o : std_logic;
  signal n13898_o : std_logic;
  signal n13914_o : std_logic_vector (19 downto 0);
  signal n13920_o : std_logic;
  signal n13921_o : std_logic;
  signal n13924_o : std_logic;
  signal n13925_o : std_logic;
  constant n13927_o : std_logic_vector (24 downto 0) := "0000000000000000000000000";
  signal n13928_o : std_logic_vector (4 downto 0);
  signal n13929_o : std_logic_vector (24 downto 0);
  signal n13930_o : std_logic_vector (24 downto 0);
  signal n13932_o : std_logic;
  signal n13946_o : std_logic_vector (42 downto 0);
  signal n13949_o : std_logic_vector (42 downto 0);
  signal n13966_o : std_logic_vector (43 downto 0);
  signal n13972_o : std_logic;
  signal n13973_o : std_logic;
  signal n13976_o : std_logic;
  signal n13977_o : std_logic;
  signal n13990_o : std_logic_vector (27 downto 0);
  signal n13996_o : std_logic;
  signal n13997_o : std_logic;
  signal n14000_o : std_logic;
  signal n14001_o : std_logic;
  constant n14003_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n14004_o : std_logic_vector (15 downto 0);
  signal n14005_o : std_logic_vector (43 downto 0);
  signal n14016_o : std_logic_vector (43 downto 0);
  signal n14027_o : std_logic_vector (42 downto 0);
  signal n14028_o : std_logic;
  signal n14033_o : std_logic;
  signal n14034_o : std_logic;
  signal n14037_o : std_logic;
  signal n14038_o : std_logic;
  signal n14041_o : std_logic;
  signal n14042_o : std_logic;
  signal n14049_o : std_logic;
  signal n14055_o : std_logic;
  signal n14056_o : std_logic;
  signal n14057_o : std_logic;
  signal n14058_o : std_logic;
  signal n14059_o : std_logic;
  signal n14060_o : std_logic;
  signal n14061_o : std_logic;
  signal n14062_o : std_logic;
  signal n14063_o : std_logic;
  signal n14064_o : std_logic;
  signal n14065_o : std_logic;
  signal n14066_o : std_logic;
  signal n14067_o : std_logic;
  signal n14068_o : std_logic;
  signal n14069_o : std_logic;
  signal n14070_o : std_logic;
  signal n14071_o : std_logic;
  signal n14072_o : std_logic;
  signal n14073_o : std_logic;
  signal n14074_o : std_logic;
  signal n14075_o : std_logic;
  signal n14076_o : std_logic;
  signal n14077_o : std_logic;
  signal n14078_o : std_logic;
  signal n14079_o : std_logic;
  signal n14080_o : std_logic;
  signal n14081_o : std_logic;
  signal n14082_o : std_logic;
  signal n14083_o : std_logic;
  signal n14084_o : std_logic;
  signal n14085_o : std_logic;
  signal n14086_o : std_logic;
  signal n14087_o : std_logic;
  signal n14088_o : std_logic;
  signal n14089_o : std_logic;
  signal n14090_o : std_logic;
  signal n14091_o : std_logic;
  signal n14092_o : std_logic;
  signal n14093_o : std_logic;
  signal n14094_o : std_logic;
  signal n14095_o : std_logic;
  signal n14096_o : std_logic;
  signal n14097_o : std_logic;
  signal n14098_o : std_logic_vector (3 downto 0);
  signal n14099_o : std_logic_vector (3 downto 0);
  signal n14100_o : std_logic_vector (3 downto 0);
  signal n14101_o : std_logic_vector (3 downto 0);
  signal n14102_o : std_logic_vector (3 downto 0);
  signal n14103_o : std_logic_vector (3 downto 0);
  signal n14104_o : std_logic_vector (3 downto 0);
  signal n14105_o : std_logic_vector (3 downto 0);
  signal n14106_o : std_logic_vector (3 downto 0);
  signal n14107_o : std_logic_vector (3 downto 0);
  signal n14108_o : std_logic_vector (2 downto 0);
  signal n14109_o : std_logic_vector (15 downto 0);
  signal n14110_o : std_logic_vector (15 downto 0);
  signal n14111_o : std_logic_vector (10 downto 0);
  signal n14112_o : std_logic_vector (42 downto 0);
  signal n14113_o : std_logic_vector (41 downto 0);
  signal n14114_o : std_logic_vector (42 downto 0);
  signal n14115_o : std_logic_vector (42 downto 0);
  signal n14131_o : std_logic_vector (40 downto 0);
  signal n14132_o : std_logic;
  signal n14137_o : std_logic;
  signal n14138_o : std_logic;
  signal n14141_o : std_logic;
  signal n14142_o : std_logic;
  signal n14145_o : std_logic;
  signal n14146_o : std_logic;
  signal n14153_o : std_logic;
  signal n14157_o : std_logic;
  signal n14159_o : std_logic;
  signal n14160_o : std_logic;
  signal n14162_o : std_logic;
  signal n14168_o : std_logic;
  signal n14171_o : std_logic;
  signal n14173_o : std_logic;
  signal n14174_o : std_logic;
  signal n14175_o : std_logic;
  signal n14176_o : std_logic;
  signal n14177_o : std_logic;
  signal n14178_o : std_logic;
  signal n14179_o : std_logic;
  signal n14180_o : std_logic;
  signal n14181_o : std_logic;
  signal n14182_o : std_logic;
  signal n14183_o : std_logic;
  signal n14184_o : std_logic;
  signal n14185_o : std_logic;
  signal n14186_o : std_logic;
  signal n14187_o : std_logic;
  signal n14188_o : std_logic;
  signal n14189_o : std_logic;
  signal n14190_o : std_logic;
  signal n14191_o : std_logic;
  signal n14192_o : std_logic;
  signal n14193_o : std_logic;
  signal n14194_o : std_logic;
  signal n14195_o : std_logic;
  signal n14196_o : std_logic;
  signal n14197_o : std_logic;
  signal n14198_o : std_logic_vector (3 downto 0);
  signal n14199_o : std_logic_vector (3 downto 0);
  signal n14200_o : std_logic_vector (3 downto 0);
  signal n14201_o : std_logic_vector (3 downto 0);
  signal n14202_o : std_logic_vector (3 downto 0);
  signal n14203_o : std_logic_vector (3 downto 0);
  signal n14204_o : std_logic_vector (15 downto 0);
  signal n14205_o : std_logic_vector (8 downto 0);
  signal n14206_o : std_logic_vector (24 downto 0);
  signal n14207_o : std_logic_vector (23 downto 0);
  signal n14208_o : std_logic_vector (24 downto 0);
  signal n14209_o : std_logic_vector (24 downto 0);
  signal n14210_o : std_logic_vector (24 downto 0);
  signal n14213_o : std_logic;
  signal n14228_o : std_logic_vector (42 downto 0);
  signal n14231_o : std_logic_vector (42 downto 0);
  signal n14243_o : std_logic_vector (42 downto 0);
  signal n14246_o : std_logic_vector (42 downto 0);
  signal n14263_o : std_logic_vector (43 downto 0);
  signal n14269_o : std_logic;
  signal n14270_o : std_logic;
  signal n14273_o : std_logic;
  signal n14274_o : std_logic;
  signal n14287_o : std_logic_vector (43 downto 0);
  signal n14293_o : std_logic;
  signal n14294_o : std_logic;
  signal n14297_o : std_logic;
  signal n14298_o : std_logic;
  signal n14311_o : std_logic_vector (43 downto 0);
  signal n14322_o : std_logic_vector (42 downto 0);
  signal n14323_o : std_logic;
  signal n14328_o : std_logic;
  signal n14329_o : std_logic;
  signal n14332_o : std_logic;
  signal n14333_o : std_logic;
  signal n14336_o : std_logic;
  signal n14337_o : std_logic;
  signal n14344_o : std_logic;
  signal n14350_o : std_logic;
  signal n14351_o : std_logic;
  signal n14352_o : std_logic;
  signal n14353_o : std_logic;
  signal n14354_o : std_logic;
  signal n14355_o : std_logic;
  signal n14356_o : std_logic;
  signal n14357_o : std_logic;
  signal n14358_o : std_logic;
  signal n14359_o : std_logic;
  signal n14360_o : std_logic;
  signal n14361_o : std_logic;
  signal n14362_o : std_logic;
  signal n14363_o : std_logic;
  signal n14364_o : std_logic;
  signal n14365_o : std_logic;
  signal n14366_o : std_logic;
  signal n14367_o : std_logic;
  signal n14368_o : std_logic;
  signal n14369_o : std_logic;
  signal n14370_o : std_logic;
  signal n14371_o : std_logic;
  signal n14372_o : std_logic;
  signal n14373_o : std_logic;
  signal n14374_o : std_logic;
  signal n14375_o : std_logic;
  signal n14376_o : std_logic;
  signal n14377_o : std_logic;
  signal n14378_o : std_logic;
  signal n14379_o : std_logic;
  signal n14380_o : std_logic;
  signal n14381_o : std_logic;
  signal n14382_o : std_logic;
  signal n14383_o : std_logic;
  signal n14384_o : std_logic;
  signal n14385_o : std_logic;
  signal n14386_o : std_logic;
  signal n14387_o : std_logic;
  signal n14388_o : std_logic;
  signal n14389_o : std_logic;
  signal n14390_o : std_logic;
  signal n14391_o : std_logic;
  signal n14392_o : std_logic;
  signal n14393_o : std_logic_vector (3 downto 0);
  signal n14394_o : std_logic_vector (3 downto 0);
  signal n14395_o : std_logic_vector (3 downto 0);
  signal n14396_o : std_logic_vector (3 downto 0);
  signal n14397_o : std_logic_vector (3 downto 0);
  signal n14398_o : std_logic_vector (3 downto 0);
  signal n14399_o : std_logic_vector (3 downto 0);
  signal n14400_o : std_logic_vector (3 downto 0);
  signal n14401_o : std_logic_vector (3 downto 0);
  signal n14402_o : std_logic_vector (3 downto 0);
  signal n14403_o : std_logic_vector (2 downto 0);
  signal n14404_o : std_logic_vector (15 downto 0);
  signal n14405_o : std_logic_vector (15 downto 0);
  signal n14406_o : std_logic_vector (10 downto 0);
  signal n14407_o : std_logic_vector (42 downto 0);
  signal n14408_o : std_logic_vector (41 downto 0);
  signal n14409_o : std_logic_vector (42 downto 0);
  signal n14410_o : std_logic_vector (42 downto 0);
  signal n14428_o : std_logic_vector (43 downto 0);
  signal n14434_o : std_logic;
  signal n14435_o : std_logic;
  signal n14438_o : std_logic;
  signal n14439_o : std_logic;
  signal n14452_o : std_logic_vector (27 downto 0);
  signal n14458_o : std_logic;
  signal n14459_o : std_logic;
  signal n14462_o : std_logic;
  signal n14463_o : std_logic;
  constant n14465_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n14466_o : std_logic_vector (15 downto 0);
  signal n14467_o : std_logic_vector (43 downto 0);
  signal n14478_o : std_logic_vector (43 downto 0);
  signal n14489_o : std_logic_vector (42 downto 0);
  signal n14490_o : std_logic;
  signal n14495_o : std_logic;
  signal n14496_o : std_logic;
  signal n14499_o : std_logic;
  signal n14500_o : std_logic;
  signal n14503_o : std_logic;
  signal n14504_o : std_logic;
  signal n14511_o : std_logic;
  signal n14517_o : std_logic;
  signal n14518_o : std_logic;
  signal n14519_o : std_logic;
  signal n14520_o : std_logic;
  signal n14521_o : std_logic;
  signal n14522_o : std_logic;
  signal n14523_o : std_logic;
  signal n14524_o : std_logic;
  signal n14525_o : std_logic;
  signal n14526_o : std_logic;
  signal n14527_o : std_logic;
  signal n14528_o : std_logic;
  signal n14529_o : std_logic;
  signal n14530_o : std_logic;
  signal n14531_o : std_logic;
  signal n14532_o : std_logic;
  signal n14533_o : std_logic;
  signal n14534_o : std_logic;
  signal n14535_o : std_logic;
  signal n14536_o : std_logic;
  signal n14537_o : std_logic;
  signal n14538_o : std_logic;
  signal n14539_o : std_logic;
  signal n14540_o : std_logic;
  signal n14541_o : std_logic;
  signal n14542_o : std_logic;
  signal n14543_o : std_logic;
  signal n14544_o : std_logic;
  signal n14545_o : std_logic;
  signal n14546_o : std_logic;
  signal n14547_o : std_logic;
  signal n14548_o : std_logic;
  signal n14549_o : std_logic;
  signal n14550_o : std_logic;
  signal n14551_o : std_logic;
  signal n14552_o : std_logic;
  signal n14553_o : std_logic;
  signal n14554_o : std_logic;
  signal n14555_o : std_logic;
  signal n14556_o : std_logic;
  signal n14557_o : std_logic;
  signal n14558_o : std_logic;
  signal n14559_o : std_logic;
  signal n14560_o : std_logic_vector (3 downto 0);
  signal n14561_o : std_logic_vector (3 downto 0);
  signal n14562_o : std_logic_vector (3 downto 0);
  signal n14563_o : std_logic_vector (3 downto 0);
  signal n14564_o : std_logic_vector (3 downto 0);
  signal n14565_o : std_logic_vector (3 downto 0);
  signal n14566_o : std_logic_vector (3 downto 0);
  signal n14567_o : std_logic_vector (3 downto 0);
  signal n14568_o : std_logic_vector (3 downto 0);
  signal n14569_o : std_logic_vector (3 downto 0);
  signal n14570_o : std_logic_vector (2 downto 0);
  signal n14571_o : std_logic_vector (15 downto 0);
  signal n14572_o : std_logic_vector (15 downto 0);
  signal n14573_o : std_logic_vector (10 downto 0);
  signal n14574_o : std_logic_vector (42 downto 0);
  signal n14575_o : std_logic_vector (41 downto 0);
  signal n14576_o : std_logic_vector (42 downto 0);
  signal n14577_o : std_logic_vector (42 downto 0);
  signal n14593_o : std_logic_vector (40 downto 0);
  signal n14594_o : std_logic;
  signal n14599_o : std_logic;
  signal n14600_o : std_logic;
  signal n14603_o : std_logic;
  signal n14604_o : std_logic;
  signal n14607_o : std_logic;
  signal n14608_o : std_logic;
  signal n14615_o : std_logic;
  signal n14619_o : std_logic;
  signal n14621_o : std_logic;
  signal n14622_o : std_logic;
  signal n14624_o : std_logic;
  signal n14630_o : std_logic;
  signal n14633_o : std_logic;
  signal n14635_o : std_logic;
  signal n14636_o : std_logic;
  signal n14637_o : std_logic;
  signal n14638_o : std_logic;
  signal n14639_o : std_logic;
  signal n14640_o : std_logic;
  signal n14641_o : std_logic;
  signal n14642_o : std_logic;
  signal n14643_o : std_logic;
  signal n14644_o : std_logic;
  signal n14645_o : std_logic;
  signal n14646_o : std_logic;
  signal n14647_o : std_logic;
  signal n14648_o : std_logic;
  signal n14649_o : std_logic;
  signal n14650_o : std_logic;
  signal n14651_o : std_logic;
  signal n14652_o : std_logic;
  signal n14653_o : std_logic;
  signal n14654_o : std_logic;
  signal n14655_o : std_logic;
  signal n14656_o : std_logic;
  signal n14657_o : std_logic;
  signal n14658_o : std_logic;
  signal n14659_o : std_logic;
  signal n14660_o : std_logic_vector (3 downto 0);
  signal n14661_o : std_logic_vector (3 downto 0);
  signal n14662_o : std_logic_vector (3 downto 0);
  signal n14663_o : std_logic_vector (3 downto 0);
  signal n14664_o : std_logic_vector (3 downto 0);
  signal n14665_o : std_logic_vector (3 downto 0);
  signal n14666_o : std_logic_vector (15 downto 0);
  signal n14667_o : std_logic_vector (8 downto 0);
  signal n14668_o : std_logic_vector (24 downto 0);
  signal n14669_o : std_logic_vector (23 downto 0);
  signal n14670_o : std_logic_vector (24 downto 0);
  signal n14671_o : std_logic_vector (24 downto 0);
  signal n14672_o : std_logic_vector (24 downto 0);
  signal n14687_o : std_logic_vector (42 downto 0);
  signal n14690_o : std_logic_vector (42 downto 0);
  signal n14702_o : std_logic_vector (42 downto 0);
  signal n14705_o : std_logic_vector (42 downto 0);
  signal n14722_o : std_logic_vector (43 downto 0);
  signal n14728_o : std_logic;
  signal n14729_o : std_logic;
  signal n14732_o : std_logic;
  signal n14733_o : std_logic;
  signal n14746_o : std_logic_vector (43 downto 0);
  signal n14752_o : std_logic;
  signal n14753_o : std_logic;
  signal n14756_o : std_logic;
  signal n14757_o : std_logic;
  signal n14770_o : std_logic_vector (43 downto 0);
  signal n14781_o : std_logic_vector (42 downto 0);
  signal n14782_o : std_logic;
  signal n14787_o : std_logic;
  signal n14788_o : std_logic;
  signal n14791_o : std_logic;
  signal n14792_o : std_logic;
  signal n14795_o : std_logic;
  signal n14796_o : std_logic;
  signal n14803_o : std_logic;
  signal n14809_o : std_logic;
  signal n14810_o : std_logic;
  signal n14811_o : std_logic;
  signal n14812_o : std_logic;
  signal n14813_o : std_logic;
  signal n14814_o : std_logic;
  signal n14815_o : std_logic;
  signal n14816_o : std_logic;
  signal n14817_o : std_logic;
  signal n14818_o : std_logic;
  signal n14819_o : std_logic;
  signal n14820_o : std_logic;
  signal n14821_o : std_logic;
  signal n14822_o : std_logic;
  signal n14823_o : std_logic;
  signal n14824_o : std_logic;
  signal n14825_o : std_logic;
  signal n14826_o : std_logic;
  signal n14827_o : std_logic;
  signal n14828_o : std_logic;
  signal n14829_o : std_logic;
  signal n14830_o : std_logic;
  signal n14831_o : std_logic;
  signal n14832_o : std_logic;
  signal n14833_o : std_logic;
  signal n14834_o : std_logic;
  signal n14835_o : std_logic;
  signal n14836_o : std_logic;
  signal n14837_o : std_logic;
  signal n14838_o : std_logic;
  signal n14839_o : std_logic;
  signal n14840_o : std_logic;
  signal n14841_o : std_logic;
  signal n14842_o : std_logic;
  signal n14843_o : std_logic;
  signal n14844_o : std_logic;
  signal n14845_o : std_logic;
  signal n14846_o : std_logic;
  signal n14847_o : std_logic;
  signal n14848_o : std_logic;
  signal n14849_o : std_logic;
  signal n14850_o : std_logic;
  signal n14851_o : std_logic;
  signal n14852_o : std_logic_vector (3 downto 0);
  signal n14853_o : std_logic_vector (3 downto 0);
  signal n14854_o : std_logic_vector (3 downto 0);
  signal n14855_o : std_logic_vector (3 downto 0);
  signal n14856_o : std_logic_vector (3 downto 0);
  signal n14857_o : std_logic_vector (3 downto 0);
  signal n14858_o : std_logic_vector (3 downto 0);
  signal n14859_o : std_logic_vector (3 downto 0);
  signal n14860_o : std_logic_vector (3 downto 0);
  signal n14861_o : std_logic_vector (3 downto 0);
  signal n14862_o : std_logic_vector (2 downto 0);
  signal n14863_o : std_logic_vector (15 downto 0);
  signal n14864_o : std_logic_vector (15 downto 0);
  signal n14865_o : std_logic_vector (10 downto 0);
  signal n14866_o : std_logic_vector (42 downto 0);
  signal n14867_o : std_logic_vector (41 downto 0);
  signal n14868_o : std_logic_vector (42 downto 0);
  signal n14869_o : std_logic_vector (42 downto 0);
  signal n14885_o : std_logic_vector (40 downto 0);
  signal n14886_o : std_logic;
  signal n14891_o : std_logic;
  signal n14892_o : std_logic;
  signal n14895_o : std_logic;
  signal n14896_o : std_logic;
  signal n14899_o : std_logic;
  signal n14900_o : std_logic;
  signal n14907_o : std_logic;
  signal n14911_o : std_logic;
  signal n14913_o : std_logic;
  signal n14914_o : std_logic;
  signal n14916_o : std_logic;
  signal n14922_o : std_logic;
  signal n14925_o : std_logic;
  signal n14927_o : std_logic;
  signal n14928_o : std_logic;
  signal n14929_o : std_logic;
  signal n14930_o : std_logic;
  signal n14931_o : std_logic;
  signal n14932_o : std_logic;
  signal n14933_o : std_logic;
  signal n14934_o : std_logic;
  signal n14935_o : std_logic;
  signal n14936_o : std_logic;
  signal n14937_o : std_logic;
  signal n14938_o : std_logic;
  signal n14939_o : std_logic;
  signal n14940_o : std_logic;
  signal n14941_o : std_logic;
  signal n14942_o : std_logic;
  signal n14943_o : std_logic;
  signal n14944_o : std_logic;
  signal n14945_o : std_logic;
  signal n14946_o : std_logic;
  signal n14947_o : std_logic;
  signal n14948_o : std_logic;
  signal n14949_o : std_logic;
  signal n14950_o : std_logic;
  signal n14951_o : std_logic;
  signal n14952_o : std_logic_vector (3 downto 0);
  signal n14953_o : std_logic_vector (3 downto 0);
  signal n14954_o : std_logic_vector (3 downto 0);
  signal n14955_o : std_logic_vector (3 downto 0);
  signal n14956_o : std_logic_vector (3 downto 0);
  signal n14957_o : std_logic_vector (3 downto 0);
  signal n14958_o : std_logic_vector (15 downto 0);
  signal n14959_o : std_logic_vector (8 downto 0);
  signal n14960_o : std_logic_vector (24 downto 0);
  signal n14961_o : std_logic_vector (23 downto 0);
  signal n14962_o : std_logic_vector (24 downto 0);
  signal n14963_o : std_logic_vector (24 downto 0);
  signal n14964_o : std_logic_vector (24 downto 0);
  signal n14967_o : std_logic;
  signal n14968_o : std_logic_vector (2 downto 0);
  signal n14969_o : std_logic_vector (24 downto 0);
  signal n14970_o : std_logic_vector (24 downto 0);
  signal n14971_o : std_logic_vector (24 downto 0);
  signal n14972_o : std_logic_vector (24 downto 0);
  signal n15000_o : std_logic;
  signal n15001_o : std_logic_vector (24 downto 0);
  signal n15002_q : std_logic_vector (24 downto 0);
  signal n15003_o : std_logic;
  signal n15004_o : std_logic_vector (24 downto 0);
  signal n15005_q : std_logic_vector (24 downto 0);
  signal n15006_q : std_logic_vector (24 downto 0);
  signal n15007_q : std_logic_vector (24 downto 0);
  signal n15023_o : std_logic_vector (22 downto 0);
  signal n15024_o : std_logic;
  signal n15029_o : std_logic;
  signal n15030_o : std_logic;
  signal n15033_o : std_logic;
  signal n15034_o : std_logic;
  signal n15037_o : std_logic;
  signal n15038_o : std_logic;
  signal n15045_o : std_logic;
  signal n15049_o : std_logic;
  signal n15051_o : std_logic;
  signal n15052_o : std_logic;
  signal n15054_o : std_logic;
  signal n15060_o : std_logic;
  signal n15063_o : std_logic;
  signal n15065_o : std_logic;
  signal n15066_o : std_logic;
  signal n15067_o : std_logic;
  signal n15068_o : std_logic;
  signal n15069_o : std_logic;
  signal n15070_o : std_logic;
  signal n15071_o : std_logic;
  signal n15072_o : std_logic;
  signal n15073_o : std_logic;
  signal n15074_o : std_logic;
  signal n15075_o : std_logic;
  signal n15076_o : std_logic;
  signal n15077_o : std_logic;
  signal n15078_o : std_logic;
  signal n15079_o : std_logic;
  signal n15080_o : std_logic;
  signal n15081_o : std_logic;
  signal n15082_o : std_logic;
  signal n15083_o : std_logic_vector (3 downto 0);
  signal n15084_o : std_logic_vector (3 downto 0);
  signal n15085_o : std_logic_vector (3 downto 0);
  signal n15086_o : std_logic_vector (3 downto 0);
  signal n15087_o : std_logic_vector (1 downto 0);
  signal n15088_o : std_logic_vector (15 downto 0);
  signal n15089_o : std_logic_vector (17 downto 0);
  signal n15090_o : std_logic_vector (16 downto 0);
  signal n15091_o : std_logic_vector (17 downto 0);
  signal n15092_o : std_logic_vector (17 downto 0);
  signal n15093_o : std_logic_vector (17 downto 0);
begin
  ready_o <= n13890_o;
  valid_o <= n13895_o;
  data_o <= n15093_o;
  -- ../BiquadFilter/BiquadFilter.vhd:26:12
  state_reg <= n13886_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:12
  x_reg <= n15002_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:19
  y_reg <= n15005_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:26
  w_reg <= n15006_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:33
  v_reg <= n15007_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:33:15
  -- n13864_o <= '1' when rising_edge (clk_i) else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:36:21
  n13866_o <= state_reg when valid_i = '0' else "01";
  -- ../BiquadFilter/BiquadFilter.vhd:35:17
  n13868_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:39:17
  n13870_o <= '1' when state_reg = "01" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:41:17
  n13872_o <= '1' when state_reg = "10" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:44:21
  n13874_o <= state_reg when ready_i = '0' else "00";
  -- ../BiquadFilter/BiquadFilter.vhd:43:17
  n13876_o <= '1' when state_reg = "11" else '0';
  -- ../fixed_pkg.vhd:183:17
  n13877_o <= n13876_o & n13872_o & n13870_o & n13868_o;
  -- ../BiquadFilter/BiquadFilter.vhd:34:13
  with n13877_o select n13881_o <=
    n13874_o when "1000",
    "11" when "0100",
    "10" when "0010",
    n13866_o when "0001",
    "XX" when others;
  -- ../BiquadFilter/BiquadFilter.vhd:33:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n13886_q <= "00";
    elsif rising_edge (clk_i) then
      n13886_q <= n13881_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:51:35
  n13889_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:51:20
  n13890_o <= '0' when n13889_o = '0' else '1';
  -- ../BiquadFilter/BiquadFilter.vhd:52:35
  n13894_o <= '1' when state_reg = "11" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:52:20
  n13895_o <= '0' when n13894_o = '0' else '1';
  -- ../BiquadFilter/BiquadFilter.vhd:59:15
  -- n13898_o <= '1' when rising_edge (clk_i) else '0';
  -- ../fixed_pkg.vhd:168:39
  n13914_o <= std_logic_vector (resize (signed (data_i), 20));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n13920_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n13921_o <= n13920_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n13922: postponed assert n13921_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n13924_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n13925_o <= n13924_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n13926: postponed assert n13925_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:170:18
  n13928_o <= n13927_o (4 downto 0);
  n13929_o <= n13914_o & n13928_o;
  -- ../BiquadFilter/BiquadFilter.vhd:62:21
  n13930_o <= x_reg when valid_i = '0' else n13929_o;
  -- ../BiquadFilter/BiquadFilter.vhd:61:17
  n13932_o <= '1' when state_reg = "00" else '0';
  -- ../fixed_pkg.vhd:266:100
  n13946_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n13949_o <= std_logic_vector (resize (signed (n13946_o) * signed'("0000000000000000000000000000000011101001111"), 43));
  -- ../fixed_pkg.vhd:168:39
  n13966_o <= std_logic_vector (resize (signed (n13949_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n13972_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n13973_o <= n13972_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n13974: postponed assert n13973_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n13976_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n13977_o <= n13976_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n13978: postponed assert n13977_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n13990_o <= std_logic_vector (resize (signed (w_reg), 28));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n13996_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n13997_o <= n13996_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n13998: postponed assert n13997_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n14000_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n14001_o <= n14000_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n14002: postponed assert n14001_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:24:14
  n14004_o <= n14003_o (15 downto 0);
  -- ../fixed_pkg.vhd:24:14
  n14005_o <= n13990_o & n14004_o;
  -- ../fixed_pkg.vhd:255:67
  n14016_o <= std_logic_vector (unsigned (n13966_o) + unsigned (n14005_o));
  -- ../fixed_pkg.vhd:168:39
  n14027_o <= n14016_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n14028_o <= n14016_o (43);
  -- ../fixed_pkg.vhd:173:9
  n14033_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n14034_o <= n14033_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n14035: postponed assert n14034_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n14037_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n14038_o <= n14037_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n14039: postponed assert n14038_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n14041_o <= n14016_o (42);
  -- ../fixed_pkg.vhd:183:27
  n14042_o <= '1' when n14041_o /= n14028_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n14049_o <= '0' when n14042_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n14055_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14056_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14057_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14058_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14059_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14060_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14061_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14062_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14063_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14064_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14065_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14066_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14067_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14068_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14069_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14070_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14071_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14072_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14073_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14074_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14075_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14076_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14077_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14078_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14079_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14080_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14081_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14082_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14083_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14084_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14085_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14086_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14087_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14088_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14089_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14090_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14091_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14092_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14093_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14094_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14095_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14096_o <= not n14028_o;
  -- ../fixed_pkg.vhd:194:31
  n14097_o <= not n14028_o;
  n14098_o <= n14055_o & n14056_o & n14057_o & n14058_o;
  -- ../fixed_pkg.vhd:169:40
  n14099_o <= n14059_o & n14060_o & n14061_o & n14062_o;
  -- ../fixed_pkg.vhd:9:14
  n14100_o <= n14063_o & n14064_o & n14065_o & n14066_o;
  -- ../fixed_pkg.vhd:9:14
  n14101_o <= n14067_o & n14068_o & n14069_o & n14070_o;
  n14102_o <= n14071_o & n14072_o & n14073_o & n14074_o;
  -- ../fixed_pkg.vhd:9:14
  n14103_o <= n14075_o & n14076_o & n14077_o & n14078_o;
  -- ../fixed_pkg.vhd:24:14
  n14104_o <= n14079_o & n14080_o & n14081_o & n14082_o;
  -- ../fixed_pkg.vhd:24:14
  n14105_o <= n14083_o & n14084_o & n14085_o & n14086_o;
  n14106_o <= n14087_o & n14088_o & n14089_o & n14090_o;
  -- ../fixed_pkg.vhd:24:14
  n14107_o <= n14091_o & n14092_o & n14093_o & n14094_o;
  n14108_o <= n14095_o & n14096_o & n14097_o;
  -- ../fixed_pkg.vhd:171:18
  n14109_o <= n14098_o & n14099_o & n14100_o & n14101_o;
  n14110_o <= n14102_o & n14103_o & n14104_o & n14105_o;
  -- ../fixed_pkg.vhd:170:18
  n14111_o <= n14106_o & n14107_o & n14108_o;
  n14112_o <= n14109_o & n14110_o & n14111_o;
  -- ../fixed_pkg.vhd:169:40
  n14113_o <= n14112_o (41 downto 0);
  -- ../fixed_pkg.vhd:9:14
  n14114_o <= n14028_o & n14113_o;
  -- ../fixed_pkg.vhd:193:9
  n14115_o <= n14027_o when n14049_o = '0' else n14114_o;
  -- ../fixed_pkg.vhd:168:39
  n14131_o <= n14115_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n14132_o <= n14115_o (42);
  -- ../fixed_pkg.vhd:173:9
  n14137_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n14138_o <= n14137_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n14139: postponed assert n14138_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n14141_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n14142_o <= n14141_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n14143: postponed assert n14142_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n14145_o <= n14115_o (41);
  -- ../fixed_pkg.vhd:183:27
  n14146_o <= '1' when n14145_o /= n14132_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n14153_o <= '0' when n14146_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n14157_o <= '1' when n14146_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n14159_o <= n14115_o (40);
  -- ../fixed_pkg.vhd:183:27
  n14160_o <= '1' when n14159_o /= n14132_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n14162_o <= n14153_o when n14171_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n14168_o <= n14160_o and n14157_o;
  -- ../fixed_pkg.vhd:183:17
  n14171_o <= n14157_o and n14168_o;
  -- ../fixed_pkg.vhd:194:31
  n14173_o <= not n14132_o;
  -- ../fixed_pkg.vhd:194:31
  n14174_o <= not n14132_o;
  -- ../fixed_pkg.vhd:194:31
  n14175_o <= not n14132_o;
  -- ../fixed_pkg.vhd:194:31
  n14176_o <= not n14132_o;
  -- ../fixed_pkg.vhd:194:31
  n14177_o <= not n14132_o;
  -- ../fixed_pkg.vhd:194:31
  n14178_o <= not n14132_o;
  -- ../fixed_pkg.vhd:194:31
  n14179_o <= not n14132_o;
  -- ../fixed_pkg.vhd:194:31
  n14180_o <= not n14132_o;
  -- ../fixed_pkg.vhd:194:31
  n14181_o <= not n14132_o;
  -- ../fixed_pkg.vhd:194:31
  n14182_o <= not n14132_o;
  -- ../fixed_pkg.vhd:194:31
  n14183_o <= not n14132_o;
  -- ../fixed_pkg.vhd:194:31
  n14184_o <= not n14132_o;
  -- ../fixed_pkg.vhd:194:31
  n14185_o <= not n14132_o;
  -- ../fixed_pkg.vhd:194:31
  n14186_o <= not n14132_o;
  -- ../fixed_pkg.vhd:194:31
  n14187_o <= not n14132_o;
  -- ../fixed_pkg.vhd:194:31
  n14188_o <= not n14132_o;
  -- ../fixed_pkg.vhd:194:31
  n14189_o <= not n14132_o;
  -- ../fixed_pkg.vhd:194:31
  n14190_o <= not n14132_o;
  -- ../fixed_pkg.vhd:194:31
  n14191_o <= not n14132_o;
  -- ../fixed_pkg.vhd:194:31
  n14192_o <= not n14132_o;
  -- ../fixed_pkg.vhd:194:31
  n14193_o <= not n14132_o;
  -- ../fixed_pkg.vhd:194:31
  n14194_o <= not n14132_o;
  -- ../fixed_pkg.vhd:194:31
  n14195_o <= not n14132_o;
  -- ../fixed_pkg.vhd:194:31
  n14196_o <= not n14132_o;
  -- ../fixed_pkg.vhd:194:31
  n14197_o <= not n14132_o;
  -- ../fixed_pkg.vhd:171:18
  n14198_o <= n14173_o & n14174_o & n14175_o & n14176_o;
  -- ../fixed_pkg.vhd:9:14
  n14199_o <= n14177_o & n14178_o & n14179_o & n14180_o;
  -- ../fixed_pkg.vhd:9:14
  n14200_o <= n14181_o & n14182_o & n14183_o & n14184_o;
  -- ../fixed_pkg.vhd:183:17
  n14201_o <= n14185_o & n14186_o & n14187_o & n14188_o;
  -- ../fixed_pkg.vhd:9:14
  n14202_o <= n14189_o & n14190_o & n14191_o & n14192_o;
  -- ../fixed_pkg.vhd:40:14
  n14203_o <= n14193_o & n14194_o & n14195_o & n14196_o;
  -- ../fixed_pkg.vhd:40:14
  n14204_o <= n14198_o & n14199_o & n14200_o & n14201_o;
  -- ../fixed_pkg.vhd:9:14
  n14205_o <= n14202_o & n14203_o & n14197_o;
  -- ../fixed_pkg.vhd:40:14
  n14206_o <= n14204_o & n14205_o;
  -- ../fixed_pkg.vhd:183:17
  n14207_o <= n14206_o (23 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n14208_o <= n14131_o (40 downto 16);
  -- ../fixed_pkg.vhd:183:17
  n14209_o <= n14132_o & n14207_o;
  -- ../fixed_pkg.vhd:193:9
  n14210_o <= n14208_o when n14162_o = '0' else n14209_o;
  -- ../BiquadFilter/BiquadFilter.vhd:65:17
  n14213_o <= '1' when state_reg = "01" else '0';
  -- ../fixed_pkg.vhd:266:100
  n14228_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n14231_o <= std_logic_vector (resize (signed (n14228_o) * signed'("0000000000000000000000000000000000000000000"), 43));
  -- ../fixed_pkg.vhd:266:100
  n14243_o <= std_logic_vector (resize (signed (y_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n14246_o <= std_logic_vector (resize (signed (n14243_o) * signed'("0000000000011111111111111100110110110011100"), 43));
  -- ../fixed_pkg.vhd:168:39
  n14263_o <= std_logic_vector (resize (signed (n14231_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n14269_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n14270_o <= n14269_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n14271: postponed assert n14270_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n14273_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n14274_o <= n14273_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n14275: postponed assert n14274_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n14287_o <= std_logic_vector (resize (signed (n14246_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n14293_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n14294_o <= n14293_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n14295: postponed assert n14294_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n14297_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n14298_o <= n14297_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n14299: postponed assert n14298_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:240:67
  n14311_o <= std_logic_vector (unsigned (n14263_o) - unsigned (n14287_o));
  -- ../fixed_pkg.vhd:168:39
  n14322_o <= n14311_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n14323_o <= n14311_o (43);
  -- ../fixed_pkg.vhd:173:9
  n14328_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n14329_o <= n14328_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n14330: postponed assert n14329_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n14332_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n14333_o <= n14332_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n14334: postponed assert n14333_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n14336_o <= n14311_o (42);
  -- ../fixed_pkg.vhd:183:27
  n14337_o <= '1' when n14336_o /= n14323_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n14344_o <= '0' when n14337_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n14350_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14351_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14352_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14353_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14354_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14355_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14356_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14357_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14358_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14359_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14360_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14361_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14362_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14363_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14364_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14365_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14366_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14367_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14368_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14369_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14370_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14371_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14372_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14373_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14374_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14375_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14376_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14377_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14378_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14379_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14380_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14381_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14382_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14383_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14384_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14385_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14386_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14387_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14388_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14389_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14390_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14391_o <= not n14323_o;
  -- ../fixed_pkg.vhd:194:31
  n14392_o <= not n14323_o;
  n14393_o <= n14350_o & n14351_o & n14352_o & n14353_o;
  n14394_o <= n14354_o & n14355_o & n14356_o & n14357_o;
  n14395_o <= n14358_o & n14359_o & n14360_o & n14361_o;
  n14396_o <= n14362_o & n14363_o & n14364_o & n14365_o;
  n14397_o <= n14366_o & n14367_o & n14368_o & n14369_o;
  n14398_o <= n14370_o & n14371_o & n14372_o & n14373_o;
  n14399_o <= n14374_o & n14375_o & n14376_o & n14377_o;
  n14400_o <= n14378_o & n14379_o & n14380_o & n14381_o;
  n14401_o <= n14382_o & n14383_o & n14384_o & n14385_o;
  n14402_o <= n14386_o & n14387_o & n14388_o & n14389_o;
  n14403_o <= n14390_o & n14391_o & n14392_o;
  n14404_o <= n14393_o & n14394_o & n14395_o & n14396_o;
  n14405_o <= n14397_o & n14398_o & n14399_o & n14400_o;
  n14406_o <= n14401_o & n14402_o & n14403_o;
  n14407_o <= n14404_o & n14405_o & n14406_o;
  n14408_o <= n14407_o (41 downto 0);
  n14409_o <= n14323_o & n14408_o;
  -- ../fixed_pkg.vhd:193:9
  n14410_o <= n14322_o when n14344_o = '0' else n14409_o;
  -- ../fixed_pkg.vhd:168:39
  n14428_o <= std_logic_vector (resize (signed (n14410_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n14434_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n14435_o <= n14434_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n14436: postponed assert n14435_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n14438_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n14439_o <= n14438_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n14440: postponed assert n14439_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n14452_o <= std_logic_vector (resize (signed (v_reg), 28));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n14458_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n14459_o <= n14458_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n14460: postponed assert n14459_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n14462_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n14463_o <= n14462_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n14464: postponed assert n14463_o = '1' severity error; --  assert
  n14466_o <= n14465_o (15 downto 0);
  n14467_o <= n14452_o & n14466_o;
  -- ../fixed_pkg.vhd:255:67
  n14478_o <= std_logic_vector (unsigned (n14428_o) + unsigned (n14467_o));
  -- ../fixed_pkg.vhd:168:39
  n14489_o <= n14478_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n14490_o <= n14478_o (43);
  -- ../fixed_pkg.vhd:173:9
  n14495_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n14496_o <= n14495_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n14497: postponed assert n14496_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n14499_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n14500_o <= n14499_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n14501: postponed assert n14500_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n14503_o <= n14478_o (42);
  -- ../fixed_pkg.vhd:183:27
  n14504_o <= '1' when n14503_o /= n14490_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n14511_o <= '0' when n14504_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n14517_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14518_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14519_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14520_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14521_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14522_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14523_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14524_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14525_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14526_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14527_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14528_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14529_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14530_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14531_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14532_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14533_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14534_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14535_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14536_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14537_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14538_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14539_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14540_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14541_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14542_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14543_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14544_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14545_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14546_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14547_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14548_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14549_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14550_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14551_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14552_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14553_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14554_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14555_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14556_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14557_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14558_o <= not n14490_o;
  -- ../fixed_pkg.vhd:194:31
  n14559_o <= not n14490_o;
  n14560_o <= n14517_o & n14518_o & n14519_o & n14520_o;
  n14561_o <= n14521_o & n14522_o & n14523_o & n14524_o;
  n14562_o <= n14525_o & n14526_o & n14527_o & n14528_o;
  n14563_o <= n14529_o & n14530_o & n14531_o & n14532_o;
  n14564_o <= n14533_o & n14534_o & n14535_o & n14536_o;
  n14565_o <= n14537_o & n14538_o & n14539_o & n14540_o;
  n14566_o <= n14541_o & n14542_o & n14543_o & n14544_o;
  n14567_o <= n14545_o & n14546_o & n14547_o & n14548_o;
  n14568_o <= n14549_o & n14550_o & n14551_o & n14552_o;
  n14569_o <= n14553_o & n14554_o & n14555_o & n14556_o;
  n14570_o <= n14557_o & n14558_o & n14559_o;
  n14571_o <= n14560_o & n14561_o & n14562_o & n14563_o;
  n14572_o <= n14564_o & n14565_o & n14566_o & n14567_o;
  n14573_o <= n14568_o & n14569_o & n14570_o;
  n14574_o <= n14571_o & n14572_o & n14573_o;
  n14575_o <= n14574_o (41 downto 0);
  n14576_o <= n14490_o & n14575_o;
  -- ../fixed_pkg.vhd:193:9
  n14577_o <= n14489_o when n14511_o = '0' else n14576_o;
  -- ../fixed_pkg.vhd:168:39
  n14593_o <= n14577_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n14594_o <= n14577_o (42);
  -- ../fixed_pkg.vhd:173:9
  n14599_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n14600_o <= n14599_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n14601: postponed assert n14600_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n14603_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n14604_o <= n14603_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n14605: postponed assert n14604_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n14607_o <= n14577_o (41);
  -- ../fixed_pkg.vhd:183:27
  n14608_o <= '1' when n14607_o /= n14594_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n14615_o <= '0' when n14608_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n14619_o <= '1' when n14608_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n14621_o <= n14577_o (40);
  -- ../fixed_pkg.vhd:183:27
  n14622_o <= '1' when n14621_o /= n14594_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n14624_o <= n14615_o when n14633_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n14630_o <= n14622_o and n14619_o;
  -- ../fixed_pkg.vhd:183:17
  n14633_o <= n14619_o and n14630_o;
  -- ../fixed_pkg.vhd:194:31
  n14635_o <= not n14594_o;
  -- ../fixed_pkg.vhd:194:31
  n14636_o <= not n14594_o;
  -- ../fixed_pkg.vhd:194:31
  n14637_o <= not n14594_o;
  -- ../fixed_pkg.vhd:194:31
  n14638_o <= not n14594_o;
  -- ../fixed_pkg.vhd:194:31
  n14639_o <= not n14594_o;
  -- ../fixed_pkg.vhd:194:31
  n14640_o <= not n14594_o;
  -- ../fixed_pkg.vhd:194:31
  n14641_o <= not n14594_o;
  -- ../fixed_pkg.vhd:194:31
  n14642_o <= not n14594_o;
  -- ../fixed_pkg.vhd:194:31
  n14643_o <= not n14594_o;
  -- ../fixed_pkg.vhd:194:31
  n14644_o <= not n14594_o;
  -- ../fixed_pkg.vhd:194:31
  n14645_o <= not n14594_o;
  -- ../fixed_pkg.vhd:194:31
  n14646_o <= not n14594_o;
  -- ../fixed_pkg.vhd:194:31
  n14647_o <= not n14594_o;
  -- ../fixed_pkg.vhd:194:31
  n14648_o <= not n14594_o;
  -- ../fixed_pkg.vhd:194:31
  n14649_o <= not n14594_o;
  -- ../fixed_pkg.vhd:194:31
  n14650_o <= not n14594_o;
  -- ../fixed_pkg.vhd:194:31
  n14651_o <= not n14594_o;
  -- ../fixed_pkg.vhd:194:31
  n14652_o <= not n14594_o;
  -- ../fixed_pkg.vhd:194:31
  n14653_o <= not n14594_o;
  -- ../fixed_pkg.vhd:194:31
  n14654_o <= not n14594_o;
  -- ../fixed_pkg.vhd:194:31
  n14655_o <= not n14594_o;
  -- ../fixed_pkg.vhd:194:31
  n14656_o <= not n14594_o;
  -- ../fixed_pkg.vhd:194:31
  n14657_o <= not n14594_o;
  -- ../fixed_pkg.vhd:194:31
  n14658_o <= not n14594_o;
  -- ../fixed_pkg.vhd:194:31
  n14659_o <= not n14594_o;
  n14660_o <= n14635_o & n14636_o & n14637_o & n14638_o;
  n14661_o <= n14639_o & n14640_o & n14641_o & n14642_o;
  n14662_o <= n14643_o & n14644_o & n14645_o & n14646_o;
  n14663_o <= n14647_o & n14648_o & n14649_o & n14650_o;
  n14664_o <= n14651_o & n14652_o & n14653_o & n14654_o;
  n14665_o <= n14655_o & n14656_o & n14657_o & n14658_o;
  n14666_o <= n14660_o & n14661_o & n14662_o & n14663_o;
  n14667_o <= n14664_o & n14665_o & n14659_o;
  n14668_o <= n14666_o & n14667_o;
  n14669_o <= n14668_o (23 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n14670_o <= n14593_o (40 downto 16);
  n14671_o <= n14594_o & n14669_o;
  -- ../fixed_pkg.vhd:193:9
  n14672_o <= n14670_o when n14624_o = '0' else n14671_o;
  -- ../fixed_pkg.vhd:266:100
  n14687_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n14690_o <= std_logic_vector (resize (signed (n14687_o) * signed'("0000000000011111111111111111111100010110001"), 43));
  -- ../fixed_pkg.vhd:266:100
  n14702_o <= std_logic_vector (resize (signed (y_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n14705_o <= std_logic_vector (resize (signed (n14702_o) * signed'("0000000000000000000000000001111000101100010"), 43));
  -- ../fixed_pkg.vhd:168:39
  n14722_o <= std_logic_vector (resize (signed (n14690_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n14728_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n14729_o <= n14728_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n14730: postponed assert n14729_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n14732_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n14733_o <= n14732_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n14734: postponed assert n14733_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n14746_o <= std_logic_vector (resize (signed (n14705_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n14752_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n14753_o <= n14752_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n14754: postponed assert n14753_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n14756_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n14757_o <= n14756_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n14758: postponed assert n14757_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:240:67
  n14770_o <= std_logic_vector (unsigned (n14722_o) - unsigned (n14746_o));
  -- ../fixed_pkg.vhd:168:39
  n14781_o <= n14770_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n14782_o <= n14770_o (43);
  -- ../fixed_pkg.vhd:173:9
  n14787_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n14788_o <= n14787_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n14789: postponed assert n14788_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n14791_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n14792_o <= n14791_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n14793: postponed assert n14792_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n14795_o <= n14770_o (42);
  -- ../fixed_pkg.vhd:183:27
  n14796_o <= '1' when n14795_o /= n14782_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n14803_o <= '0' when n14796_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n14809_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14810_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14811_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14812_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14813_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14814_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14815_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14816_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14817_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14818_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14819_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14820_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14821_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14822_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14823_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14824_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14825_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14826_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14827_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14828_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14829_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14830_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14831_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14832_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14833_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14834_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14835_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14836_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14837_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14838_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14839_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14840_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14841_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14842_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14843_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14844_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14845_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14846_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14847_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14848_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14849_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14850_o <= not n14782_o;
  -- ../fixed_pkg.vhd:194:31
  n14851_o <= not n14782_o;
  n14852_o <= n14809_o & n14810_o & n14811_o & n14812_o;
  n14853_o <= n14813_o & n14814_o & n14815_o & n14816_o;
  n14854_o <= n14817_o & n14818_o & n14819_o & n14820_o;
  n14855_o <= n14821_o & n14822_o & n14823_o & n14824_o;
  n14856_o <= n14825_o & n14826_o & n14827_o & n14828_o;
  n14857_o <= n14829_o & n14830_o & n14831_o & n14832_o;
  n14858_o <= n14833_o & n14834_o & n14835_o & n14836_o;
  n14859_o <= n14837_o & n14838_o & n14839_o & n14840_o;
  n14860_o <= n14841_o & n14842_o & n14843_o & n14844_o;
  n14861_o <= n14845_o & n14846_o & n14847_o & n14848_o;
  n14862_o <= n14849_o & n14850_o & n14851_o;
  n14863_o <= n14852_o & n14853_o & n14854_o & n14855_o;
  n14864_o <= n14856_o & n14857_o & n14858_o & n14859_o;
  n14865_o <= n14860_o & n14861_o & n14862_o;
  n14866_o <= n14863_o & n14864_o & n14865_o;
  n14867_o <= n14866_o (41 downto 0);
  n14868_o <= n14782_o & n14867_o;
  -- ../fixed_pkg.vhd:193:9
  n14869_o <= n14781_o when n14803_o = '0' else n14868_o;
  -- ../fixed_pkg.vhd:168:39
  n14885_o <= n14869_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n14886_o <= n14869_o (42);
  -- ../fixed_pkg.vhd:173:9
  n14891_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n14892_o <= n14891_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n14893: postponed assert n14892_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n14895_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n14896_o <= n14895_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n14897: postponed assert n14896_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n14899_o <= n14869_o (41);
  -- ../fixed_pkg.vhd:183:27
  n14900_o <= '1' when n14899_o /= n14886_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n14907_o <= '0' when n14900_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n14911_o <= '1' when n14900_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n14913_o <= n14869_o (40);
  -- ../fixed_pkg.vhd:183:27
  n14914_o <= '1' when n14913_o /= n14886_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n14916_o <= n14907_o when n14925_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n14922_o <= n14914_o and n14911_o;
  -- ../fixed_pkg.vhd:183:17
  n14925_o <= n14911_o and n14922_o;
  -- ../fixed_pkg.vhd:194:31
  n14927_o <= not n14886_o;
  -- ../fixed_pkg.vhd:194:31
  n14928_o <= not n14886_o;
  -- ../fixed_pkg.vhd:194:31
  n14929_o <= not n14886_o;
  -- ../fixed_pkg.vhd:194:31
  n14930_o <= not n14886_o;
  -- ../fixed_pkg.vhd:194:31
  n14931_o <= not n14886_o;
  -- ../fixed_pkg.vhd:194:31
  n14932_o <= not n14886_o;
  -- ../fixed_pkg.vhd:194:31
  n14933_o <= not n14886_o;
  -- ../fixed_pkg.vhd:194:31
  n14934_o <= not n14886_o;
  -- ../fixed_pkg.vhd:194:31
  n14935_o <= not n14886_o;
  -- ../fixed_pkg.vhd:194:31
  n14936_o <= not n14886_o;
  -- ../fixed_pkg.vhd:194:31
  n14937_o <= not n14886_o;
  -- ../fixed_pkg.vhd:194:31
  n14938_o <= not n14886_o;
  -- ../fixed_pkg.vhd:194:31
  n14939_o <= not n14886_o;
  -- ../fixed_pkg.vhd:194:31
  n14940_o <= not n14886_o;
  -- ../fixed_pkg.vhd:194:31
  n14941_o <= not n14886_o;
  -- ../fixed_pkg.vhd:194:31
  n14942_o <= not n14886_o;
  -- ../fixed_pkg.vhd:194:31
  n14943_o <= not n14886_o;
  -- ../fixed_pkg.vhd:194:31
  n14944_o <= not n14886_o;
  -- ../fixed_pkg.vhd:194:31
  n14945_o <= not n14886_o;
  -- ../fixed_pkg.vhd:194:31
  n14946_o <= not n14886_o;
  -- ../fixed_pkg.vhd:194:31
  n14947_o <= not n14886_o;
  -- ../fixed_pkg.vhd:194:31
  n14948_o <= not n14886_o;
  -- ../fixed_pkg.vhd:194:31
  n14949_o <= not n14886_o;
  -- ../fixed_pkg.vhd:194:31
  n14950_o <= not n14886_o;
  -- ../fixed_pkg.vhd:194:31
  n14951_o <= not n14886_o;
  n14952_o <= n14927_o & n14928_o & n14929_o & n14930_o;
  n14953_o <= n14931_o & n14932_o & n14933_o & n14934_o;
  n14954_o <= n14935_o & n14936_o & n14937_o & n14938_o;
  n14955_o <= n14939_o & n14940_o & n14941_o & n14942_o;
  n14956_o <= n14943_o & n14944_o & n14945_o & n14946_o;
  n14957_o <= n14947_o & n14948_o & n14949_o & n14950_o;
  n14958_o <= n14952_o & n14953_o & n14954_o & n14955_o;
  n14959_o <= n14956_o & n14957_o & n14951_o;
  n14960_o <= n14958_o & n14959_o;
  n14961_o <= n14960_o (23 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n14962_o <= n14885_o (40 downto 16);
  n14963_o <= n14886_o & n14961_o;
  -- ../fixed_pkg.vhd:193:9
  n14964_o <= n14962_o when n14916_o = '0' else n14963_o;
  -- ../BiquadFilter/BiquadFilter.vhd:67:17
  n14967_o <= '1' when state_reg = "10" else '0';
  n14968_o <= n14967_o & n14213_o & n13932_o;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n14968_o select n14969_o <=
    x_reg when "100",
    x_reg when "010",
    n13930_o when "001",
    x_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n14968_o select n14970_o <=
    y_reg when "100",
    n14210_o when "010",
    y_reg when "001",
    y_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n14968_o select n14971_o <=
    n14672_o when "100",
    w_reg when "010",
    w_reg when "001",
    w_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n14968_o select n14972_o <=
    n14964_o when "100",
    v_reg when "010",
    v_reg when "001",
    v_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n15000_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n15001_o <= x_reg when n15000_o = '0' else n14969_o;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n15002_q <= n15001_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n15003_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n15004_o <= y_reg when n15003_o = '0' else n14970_o;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n15005_q <= n15004_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n15006_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n15006_q <= n14971_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n15007_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n15007_q <= n14972_o;
    end if;
  end process;
  -- ../fixed_pkg.vhd:168:39
  n15023_o <= y_reg (22 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n15024_o <= y_reg (24);
  -- ../fixed_pkg.vhd:173:9
  n15029_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n15030_o <= n15029_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n15031: postponed assert n15030_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n15033_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n15034_o <= n15033_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n15035: postponed assert n15034_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n15037_o <= y_reg (23);
  -- ../fixed_pkg.vhd:183:27
  n15038_o <= '1' when n15037_o /= n15024_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n15045_o <= '0' when n15038_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n15049_o <= '1' when n15038_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n15051_o <= y_reg (22);
  -- ../fixed_pkg.vhd:183:27
  n15052_o <= '1' when n15051_o /= n15024_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n15054_o <= n15045_o when n15063_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n15060_o <= n15052_o and n15049_o;
  -- ../fixed_pkg.vhd:183:17
  n15063_o <= n15049_o and n15060_o;
  -- ../fixed_pkg.vhd:194:31
  n15065_o <= not n15024_o;
  -- ../fixed_pkg.vhd:194:31
  n15066_o <= not n15024_o;
  -- ../fixed_pkg.vhd:194:31
  n15067_o <= not n15024_o;
  -- ../fixed_pkg.vhd:194:31
  n15068_o <= not n15024_o;
  -- ../fixed_pkg.vhd:194:31
  n15069_o <= not n15024_o;
  -- ../fixed_pkg.vhd:194:31
  n15070_o <= not n15024_o;
  -- ../fixed_pkg.vhd:194:31
  n15071_o <= not n15024_o;
  -- ../fixed_pkg.vhd:194:31
  n15072_o <= not n15024_o;
  -- ../fixed_pkg.vhd:194:31
  n15073_o <= not n15024_o;
  -- ../fixed_pkg.vhd:194:31
  n15074_o <= not n15024_o;
  -- ../fixed_pkg.vhd:194:31
  n15075_o <= not n15024_o;
  -- ../fixed_pkg.vhd:194:31
  n15076_o <= not n15024_o;
  -- ../fixed_pkg.vhd:194:31
  n15077_o <= not n15024_o;
  -- ../fixed_pkg.vhd:194:31
  n15078_o <= not n15024_o;
  -- ../fixed_pkg.vhd:194:31
  n15079_o <= not n15024_o;
  -- ../fixed_pkg.vhd:194:31
  n15080_o <= not n15024_o;
  -- ../fixed_pkg.vhd:194:31
  n15081_o <= not n15024_o;
  -- ../fixed_pkg.vhd:194:31
  n15082_o <= not n15024_o;
  n15083_o <= n15065_o & n15066_o & n15067_o & n15068_o;
  n15084_o <= n15069_o & n15070_o & n15071_o & n15072_o;
  n15085_o <= n15073_o & n15074_o & n15075_o & n15076_o;
  n15086_o <= n15077_o & n15078_o & n15079_o & n15080_o;
  n15087_o <= n15081_o & n15082_o;
  n15088_o <= n15083_o & n15084_o & n15085_o & n15086_o;
  n15089_o <= n15088_o & n15087_o;
  n15090_o <= n15089_o (16 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n15091_o <= n15023_o (22 downto 5);
  n15092_o <= n15024_o & n15090_o;
  -- ../fixed_pkg.vhd:193:9
  n15093_o <= n15091_o when n15054_o = '0' else n15092_o;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity biquadfilter_6b9c8d91c4218fd4ae537b4bb7758bc18f168a30 is
  port (
    clk_i : in std_logic;
    reset_i : in std_logic;
    valid_i : in std_logic;
    data_i : in std_logic_vector (17 downto 0);
    ready_i : in std_logic;
    ready_o : out std_logic;
    valid_o : out std_logic;
    data_o : out std_logic_vector (17 downto 0));
end entity biquadfilter_6b9c8d91c4218fd4ae537b4bb7758bc18f168a30;

architecture rtl of biquadfilter_6b9c8d91c4218fd4ae537b4bb7758bc18f168a30 is
  signal state_reg : std_logic_vector (1 downto 0);
  signal x_reg : std_logic_vector (24 downto 0);
  signal y_reg : std_logic_vector (24 downto 0);
  signal w_reg : std_logic_vector (24 downto 0);
  signal v_reg : std_logic_vector (24 downto 0);
  signal n12628_o : std_logic;
  signal n12630_o : std_logic_vector (1 downto 0);
  signal n12632_o : std_logic;
  signal n12634_o : std_logic;
  signal n12636_o : std_logic;
  signal n12638_o : std_logic_vector (1 downto 0);
  signal n12640_o : std_logic;
  signal n12641_o : std_logic_vector (3 downto 0);
  signal n12645_o : std_logic_vector (1 downto 0);
  signal n12650_q : std_logic_vector (1 downto 0);
  signal n12653_o : std_logic;
  signal n12654_o : std_logic;
  signal n12658_o : std_logic;
  signal n12659_o : std_logic;
  signal n12662_o : std_logic;
  signal n12678_o : std_logic_vector (19 downto 0);
  signal n12684_o : std_logic;
  signal n12685_o : std_logic;
  signal n12688_o : std_logic;
  signal n12689_o : std_logic;
  constant n12691_o : std_logic_vector (24 downto 0) := "0000000000000000000000000";
  signal n12692_o : std_logic_vector (4 downto 0);
  signal n12693_o : std_logic_vector (24 downto 0);
  signal n12694_o : std_logic_vector (24 downto 0);
  signal n12696_o : std_logic;
  signal n12710_o : std_logic_vector (42 downto 0);
  signal n12713_o : std_logic_vector (42 downto 0);
  signal n12730_o : std_logic_vector (43 downto 0);
  signal n12736_o : std_logic;
  signal n12737_o : std_logic;
  signal n12740_o : std_logic;
  signal n12741_o : std_logic;
  signal n12754_o : std_logic_vector (27 downto 0);
  signal n12760_o : std_logic;
  signal n12761_o : std_logic;
  signal n12764_o : std_logic;
  signal n12765_o : std_logic;
  constant n12767_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n12768_o : std_logic_vector (15 downto 0);
  signal n12769_o : std_logic_vector (43 downto 0);
  signal n12780_o : std_logic_vector (43 downto 0);
  signal n12791_o : std_logic_vector (42 downto 0);
  signal n12792_o : std_logic;
  signal n12797_o : std_logic;
  signal n12798_o : std_logic;
  signal n12801_o : std_logic;
  signal n12802_o : std_logic;
  signal n12805_o : std_logic;
  signal n12806_o : std_logic;
  signal n12813_o : std_logic;
  signal n12819_o : std_logic;
  signal n12820_o : std_logic;
  signal n12821_o : std_logic;
  signal n12822_o : std_logic;
  signal n12823_o : std_logic;
  signal n12824_o : std_logic;
  signal n12825_o : std_logic;
  signal n12826_o : std_logic;
  signal n12827_o : std_logic;
  signal n12828_o : std_logic;
  signal n12829_o : std_logic;
  signal n12830_o : std_logic;
  signal n12831_o : std_logic;
  signal n12832_o : std_logic;
  signal n12833_o : std_logic;
  signal n12834_o : std_logic;
  signal n12835_o : std_logic;
  signal n12836_o : std_logic;
  signal n12837_o : std_logic;
  signal n12838_o : std_logic;
  signal n12839_o : std_logic;
  signal n12840_o : std_logic;
  signal n12841_o : std_logic;
  signal n12842_o : std_logic;
  signal n12843_o : std_logic;
  signal n12844_o : std_logic;
  signal n12845_o : std_logic;
  signal n12846_o : std_logic;
  signal n12847_o : std_logic;
  signal n12848_o : std_logic;
  signal n12849_o : std_logic;
  signal n12850_o : std_logic;
  signal n12851_o : std_logic;
  signal n12852_o : std_logic;
  signal n12853_o : std_logic;
  signal n12854_o : std_logic;
  signal n12855_o : std_logic;
  signal n12856_o : std_logic;
  signal n12857_o : std_logic;
  signal n12858_o : std_logic;
  signal n12859_o : std_logic;
  signal n12860_o : std_logic;
  signal n12861_o : std_logic;
  signal n12862_o : std_logic_vector (3 downto 0);
  signal n12863_o : std_logic_vector (3 downto 0);
  signal n12864_o : std_logic_vector (3 downto 0);
  signal n12865_o : std_logic_vector (3 downto 0);
  signal n12866_o : std_logic_vector (3 downto 0);
  signal n12867_o : std_logic_vector (3 downto 0);
  signal n12868_o : std_logic_vector (3 downto 0);
  signal n12869_o : std_logic_vector (3 downto 0);
  signal n12870_o : std_logic_vector (3 downto 0);
  signal n12871_o : std_logic_vector (3 downto 0);
  signal n12872_o : std_logic_vector (2 downto 0);
  signal n12873_o : std_logic_vector (15 downto 0);
  signal n12874_o : std_logic_vector (15 downto 0);
  signal n12875_o : std_logic_vector (10 downto 0);
  signal n12876_o : std_logic_vector (42 downto 0);
  signal n12877_o : std_logic_vector (41 downto 0);
  signal n12878_o : std_logic_vector (42 downto 0);
  signal n12879_o : std_logic_vector (42 downto 0);
  signal n12895_o : std_logic_vector (40 downto 0);
  signal n12896_o : std_logic;
  signal n12901_o : std_logic;
  signal n12902_o : std_logic;
  signal n12905_o : std_logic;
  signal n12906_o : std_logic;
  signal n12909_o : std_logic;
  signal n12910_o : std_logic;
  signal n12917_o : std_logic;
  signal n12921_o : std_logic;
  signal n12923_o : std_logic;
  signal n12924_o : std_logic;
  signal n12926_o : std_logic;
  signal n12932_o : std_logic;
  signal n12935_o : std_logic;
  signal n12937_o : std_logic;
  signal n12938_o : std_logic;
  signal n12939_o : std_logic;
  signal n12940_o : std_logic;
  signal n12941_o : std_logic;
  signal n12942_o : std_logic;
  signal n12943_o : std_logic;
  signal n12944_o : std_logic;
  signal n12945_o : std_logic;
  signal n12946_o : std_logic;
  signal n12947_o : std_logic;
  signal n12948_o : std_logic;
  signal n12949_o : std_logic;
  signal n12950_o : std_logic;
  signal n12951_o : std_logic;
  signal n12952_o : std_logic;
  signal n12953_o : std_logic;
  signal n12954_o : std_logic;
  signal n12955_o : std_logic;
  signal n12956_o : std_logic;
  signal n12957_o : std_logic;
  signal n12958_o : std_logic;
  signal n12959_o : std_logic;
  signal n12960_o : std_logic;
  signal n12961_o : std_logic;
  signal n12962_o : std_logic_vector (3 downto 0);
  signal n12963_o : std_logic_vector (3 downto 0);
  signal n12964_o : std_logic_vector (3 downto 0);
  signal n12965_o : std_logic_vector (3 downto 0);
  signal n12966_o : std_logic_vector (3 downto 0);
  signal n12967_o : std_logic_vector (3 downto 0);
  signal n12968_o : std_logic_vector (15 downto 0);
  signal n12969_o : std_logic_vector (8 downto 0);
  signal n12970_o : std_logic_vector (24 downto 0);
  signal n12971_o : std_logic_vector (23 downto 0);
  signal n12972_o : std_logic_vector (24 downto 0);
  signal n12973_o : std_logic_vector (24 downto 0);
  signal n12974_o : std_logic_vector (24 downto 0);
  signal n12977_o : std_logic;
  signal n12992_o : std_logic_vector (42 downto 0);
  signal n12995_o : std_logic_vector (42 downto 0);
  signal n13007_o : std_logic_vector (42 downto 0);
  signal n13010_o : std_logic_vector (42 downto 0);
  signal n13027_o : std_logic_vector (43 downto 0);
  signal n13033_o : std_logic;
  signal n13034_o : std_logic;
  signal n13037_o : std_logic;
  signal n13038_o : std_logic;
  signal n13051_o : std_logic_vector (43 downto 0);
  signal n13057_o : std_logic;
  signal n13058_o : std_logic;
  signal n13061_o : std_logic;
  signal n13062_o : std_logic;
  signal n13075_o : std_logic_vector (43 downto 0);
  signal n13086_o : std_logic_vector (42 downto 0);
  signal n13087_o : std_logic;
  signal n13092_o : std_logic;
  signal n13093_o : std_logic;
  signal n13096_o : std_logic;
  signal n13097_o : std_logic;
  signal n13100_o : std_logic;
  signal n13101_o : std_logic;
  signal n13108_o : std_logic;
  signal n13114_o : std_logic;
  signal n13115_o : std_logic;
  signal n13116_o : std_logic;
  signal n13117_o : std_logic;
  signal n13118_o : std_logic;
  signal n13119_o : std_logic;
  signal n13120_o : std_logic;
  signal n13121_o : std_logic;
  signal n13122_o : std_logic;
  signal n13123_o : std_logic;
  signal n13124_o : std_logic;
  signal n13125_o : std_logic;
  signal n13126_o : std_logic;
  signal n13127_o : std_logic;
  signal n13128_o : std_logic;
  signal n13129_o : std_logic;
  signal n13130_o : std_logic;
  signal n13131_o : std_logic;
  signal n13132_o : std_logic;
  signal n13133_o : std_logic;
  signal n13134_o : std_logic;
  signal n13135_o : std_logic;
  signal n13136_o : std_logic;
  signal n13137_o : std_logic;
  signal n13138_o : std_logic;
  signal n13139_o : std_logic;
  signal n13140_o : std_logic;
  signal n13141_o : std_logic;
  signal n13142_o : std_logic;
  signal n13143_o : std_logic;
  signal n13144_o : std_logic;
  signal n13145_o : std_logic;
  signal n13146_o : std_logic;
  signal n13147_o : std_logic;
  signal n13148_o : std_logic;
  signal n13149_o : std_logic;
  signal n13150_o : std_logic;
  signal n13151_o : std_logic;
  signal n13152_o : std_logic;
  signal n13153_o : std_logic;
  signal n13154_o : std_logic;
  signal n13155_o : std_logic;
  signal n13156_o : std_logic;
  signal n13157_o : std_logic_vector (3 downto 0);
  signal n13158_o : std_logic_vector (3 downto 0);
  signal n13159_o : std_logic_vector (3 downto 0);
  signal n13160_o : std_logic_vector (3 downto 0);
  signal n13161_o : std_logic_vector (3 downto 0);
  signal n13162_o : std_logic_vector (3 downto 0);
  signal n13163_o : std_logic_vector (3 downto 0);
  signal n13164_o : std_logic_vector (3 downto 0);
  signal n13165_o : std_logic_vector (3 downto 0);
  signal n13166_o : std_logic_vector (3 downto 0);
  signal n13167_o : std_logic_vector (2 downto 0);
  signal n13168_o : std_logic_vector (15 downto 0);
  signal n13169_o : std_logic_vector (15 downto 0);
  signal n13170_o : std_logic_vector (10 downto 0);
  signal n13171_o : std_logic_vector (42 downto 0);
  signal n13172_o : std_logic_vector (41 downto 0);
  signal n13173_o : std_logic_vector (42 downto 0);
  signal n13174_o : std_logic_vector (42 downto 0);
  signal n13192_o : std_logic_vector (43 downto 0);
  signal n13198_o : std_logic;
  signal n13199_o : std_logic;
  signal n13202_o : std_logic;
  signal n13203_o : std_logic;
  signal n13216_o : std_logic_vector (27 downto 0);
  signal n13222_o : std_logic;
  signal n13223_o : std_logic;
  signal n13226_o : std_logic;
  signal n13227_o : std_logic;
  constant n13229_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n13230_o : std_logic_vector (15 downto 0);
  signal n13231_o : std_logic_vector (43 downto 0);
  signal n13242_o : std_logic_vector (43 downto 0);
  signal n13253_o : std_logic_vector (42 downto 0);
  signal n13254_o : std_logic;
  signal n13259_o : std_logic;
  signal n13260_o : std_logic;
  signal n13263_o : std_logic;
  signal n13264_o : std_logic;
  signal n13267_o : std_logic;
  signal n13268_o : std_logic;
  signal n13275_o : std_logic;
  signal n13281_o : std_logic;
  signal n13282_o : std_logic;
  signal n13283_o : std_logic;
  signal n13284_o : std_logic;
  signal n13285_o : std_logic;
  signal n13286_o : std_logic;
  signal n13287_o : std_logic;
  signal n13288_o : std_logic;
  signal n13289_o : std_logic;
  signal n13290_o : std_logic;
  signal n13291_o : std_logic;
  signal n13292_o : std_logic;
  signal n13293_o : std_logic;
  signal n13294_o : std_logic;
  signal n13295_o : std_logic;
  signal n13296_o : std_logic;
  signal n13297_o : std_logic;
  signal n13298_o : std_logic;
  signal n13299_o : std_logic;
  signal n13300_o : std_logic;
  signal n13301_o : std_logic;
  signal n13302_o : std_logic;
  signal n13303_o : std_logic;
  signal n13304_o : std_logic;
  signal n13305_o : std_logic;
  signal n13306_o : std_logic;
  signal n13307_o : std_logic;
  signal n13308_o : std_logic;
  signal n13309_o : std_logic;
  signal n13310_o : std_logic;
  signal n13311_o : std_logic;
  signal n13312_o : std_logic;
  signal n13313_o : std_logic;
  signal n13314_o : std_logic;
  signal n13315_o : std_logic;
  signal n13316_o : std_logic;
  signal n13317_o : std_logic;
  signal n13318_o : std_logic;
  signal n13319_o : std_logic;
  signal n13320_o : std_logic;
  signal n13321_o : std_logic;
  signal n13322_o : std_logic;
  signal n13323_o : std_logic;
  signal n13324_o : std_logic_vector (3 downto 0);
  signal n13325_o : std_logic_vector (3 downto 0);
  signal n13326_o : std_logic_vector (3 downto 0);
  signal n13327_o : std_logic_vector (3 downto 0);
  signal n13328_o : std_logic_vector (3 downto 0);
  signal n13329_o : std_logic_vector (3 downto 0);
  signal n13330_o : std_logic_vector (3 downto 0);
  signal n13331_o : std_logic_vector (3 downto 0);
  signal n13332_o : std_logic_vector (3 downto 0);
  signal n13333_o : std_logic_vector (3 downto 0);
  signal n13334_o : std_logic_vector (2 downto 0);
  signal n13335_o : std_logic_vector (15 downto 0);
  signal n13336_o : std_logic_vector (15 downto 0);
  signal n13337_o : std_logic_vector (10 downto 0);
  signal n13338_o : std_logic_vector (42 downto 0);
  signal n13339_o : std_logic_vector (41 downto 0);
  signal n13340_o : std_logic_vector (42 downto 0);
  signal n13341_o : std_logic_vector (42 downto 0);
  signal n13357_o : std_logic_vector (40 downto 0);
  signal n13358_o : std_logic;
  signal n13363_o : std_logic;
  signal n13364_o : std_logic;
  signal n13367_o : std_logic;
  signal n13368_o : std_logic;
  signal n13371_o : std_logic;
  signal n13372_o : std_logic;
  signal n13379_o : std_logic;
  signal n13383_o : std_logic;
  signal n13385_o : std_logic;
  signal n13386_o : std_logic;
  signal n13388_o : std_logic;
  signal n13394_o : std_logic;
  signal n13397_o : std_logic;
  signal n13399_o : std_logic;
  signal n13400_o : std_logic;
  signal n13401_o : std_logic;
  signal n13402_o : std_logic;
  signal n13403_o : std_logic;
  signal n13404_o : std_logic;
  signal n13405_o : std_logic;
  signal n13406_o : std_logic;
  signal n13407_o : std_logic;
  signal n13408_o : std_logic;
  signal n13409_o : std_logic;
  signal n13410_o : std_logic;
  signal n13411_o : std_logic;
  signal n13412_o : std_logic;
  signal n13413_o : std_logic;
  signal n13414_o : std_logic;
  signal n13415_o : std_logic;
  signal n13416_o : std_logic;
  signal n13417_o : std_logic;
  signal n13418_o : std_logic;
  signal n13419_o : std_logic;
  signal n13420_o : std_logic;
  signal n13421_o : std_logic;
  signal n13422_o : std_logic;
  signal n13423_o : std_logic;
  signal n13424_o : std_logic_vector (3 downto 0);
  signal n13425_o : std_logic_vector (3 downto 0);
  signal n13426_o : std_logic_vector (3 downto 0);
  signal n13427_o : std_logic_vector (3 downto 0);
  signal n13428_o : std_logic_vector (3 downto 0);
  signal n13429_o : std_logic_vector (3 downto 0);
  signal n13430_o : std_logic_vector (15 downto 0);
  signal n13431_o : std_logic_vector (8 downto 0);
  signal n13432_o : std_logic_vector (24 downto 0);
  signal n13433_o : std_logic_vector (23 downto 0);
  signal n13434_o : std_logic_vector (24 downto 0);
  signal n13435_o : std_logic_vector (24 downto 0);
  signal n13436_o : std_logic_vector (24 downto 0);
  signal n13451_o : std_logic_vector (42 downto 0);
  signal n13454_o : std_logic_vector (42 downto 0);
  signal n13466_o : std_logic_vector (42 downto 0);
  signal n13469_o : std_logic_vector (42 downto 0);
  signal n13486_o : std_logic_vector (43 downto 0);
  signal n13492_o : std_logic;
  signal n13493_o : std_logic;
  signal n13496_o : std_logic;
  signal n13497_o : std_logic;
  signal n13510_o : std_logic_vector (43 downto 0);
  signal n13516_o : std_logic;
  signal n13517_o : std_logic;
  signal n13520_o : std_logic;
  signal n13521_o : std_logic;
  signal n13534_o : std_logic_vector (43 downto 0);
  signal n13545_o : std_logic_vector (42 downto 0);
  signal n13546_o : std_logic;
  signal n13551_o : std_logic;
  signal n13552_o : std_logic;
  signal n13555_o : std_logic;
  signal n13556_o : std_logic;
  signal n13559_o : std_logic;
  signal n13560_o : std_logic;
  signal n13567_o : std_logic;
  signal n13573_o : std_logic;
  signal n13574_o : std_logic;
  signal n13575_o : std_logic;
  signal n13576_o : std_logic;
  signal n13577_o : std_logic;
  signal n13578_o : std_logic;
  signal n13579_o : std_logic;
  signal n13580_o : std_logic;
  signal n13581_o : std_logic;
  signal n13582_o : std_logic;
  signal n13583_o : std_logic;
  signal n13584_o : std_logic;
  signal n13585_o : std_logic;
  signal n13586_o : std_logic;
  signal n13587_o : std_logic;
  signal n13588_o : std_logic;
  signal n13589_o : std_logic;
  signal n13590_o : std_logic;
  signal n13591_o : std_logic;
  signal n13592_o : std_logic;
  signal n13593_o : std_logic;
  signal n13594_o : std_logic;
  signal n13595_o : std_logic;
  signal n13596_o : std_logic;
  signal n13597_o : std_logic;
  signal n13598_o : std_logic;
  signal n13599_o : std_logic;
  signal n13600_o : std_logic;
  signal n13601_o : std_logic;
  signal n13602_o : std_logic;
  signal n13603_o : std_logic;
  signal n13604_o : std_logic;
  signal n13605_o : std_logic;
  signal n13606_o : std_logic;
  signal n13607_o : std_logic;
  signal n13608_o : std_logic;
  signal n13609_o : std_logic;
  signal n13610_o : std_logic;
  signal n13611_o : std_logic;
  signal n13612_o : std_logic;
  signal n13613_o : std_logic;
  signal n13614_o : std_logic;
  signal n13615_o : std_logic;
  signal n13616_o : std_logic_vector (3 downto 0);
  signal n13617_o : std_logic_vector (3 downto 0);
  signal n13618_o : std_logic_vector (3 downto 0);
  signal n13619_o : std_logic_vector (3 downto 0);
  signal n13620_o : std_logic_vector (3 downto 0);
  signal n13621_o : std_logic_vector (3 downto 0);
  signal n13622_o : std_logic_vector (3 downto 0);
  signal n13623_o : std_logic_vector (3 downto 0);
  signal n13624_o : std_logic_vector (3 downto 0);
  signal n13625_o : std_logic_vector (3 downto 0);
  signal n13626_o : std_logic_vector (2 downto 0);
  signal n13627_o : std_logic_vector (15 downto 0);
  signal n13628_o : std_logic_vector (15 downto 0);
  signal n13629_o : std_logic_vector (10 downto 0);
  signal n13630_o : std_logic_vector (42 downto 0);
  signal n13631_o : std_logic_vector (41 downto 0);
  signal n13632_o : std_logic_vector (42 downto 0);
  signal n13633_o : std_logic_vector (42 downto 0);
  signal n13649_o : std_logic_vector (40 downto 0);
  signal n13650_o : std_logic;
  signal n13655_o : std_logic;
  signal n13656_o : std_logic;
  signal n13659_o : std_logic;
  signal n13660_o : std_logic;
  signal n13663_o : std_logic;
  signal n13664_o : std_logic;
  signal n13671_o : std_logic;
  signal n13675_o : std_logic;
  signal n13677_o : std_logic;
  signal n13678_o : std_logic;
  signal n13680_o : std_logic;
  signal n13686_o : std_logic;
  signal n13689_o : std_logic;
  signal n13691_o : std_logic;
  signal n13692_o : std_logic;
  signal n13693_o : std_logic;
  signal n13694_o : std_logic;
  signal n13695_o : std_logic;
  signal n13696_o : std_logic;
  signal n13697_o : std_logic;
  signal n13698_o : std_logic;
  signal n13699_o : std_logic;
  signal n13700_o : std_logic;
  signal n13701_o : std_logic;
  signal n13702_o : std_logic;
  signal n13703_o : std_logic;
  signal n13704_o : std_logic;
  signal n13705_o : std_logic;
  signal n13706_o : std_logic;
  signal n13707_o : std_logic;
  signal n13708_o : std_logic;
  signal n13709_o : std_logic;
  signal n13710_o : std_logic;
  signal n13711_o : std_logic;
  signal n13712_o : std_logic;
  signal n13713_o : std_logic;
  signal n13714_o : std_logic;
  signal n13715_o : std_logic;
  signal n13716_o : std_logic_vector (3 downto 0);
  signal n13717_o : std_logic_vector (3 downto 0);
  signal n13718_o : std_logic_vector (3 downto 0);
  signal n13719_o : std_logic_vector (3 downto 0);
  signal n13720_o : std_logic_vector (3 downto 0);
  signal n13721_o : std_logic_vector (3 downto 0);
  signal n13722_o : std_logic_vector (15 downto 0);
  signal n13723_o : std_logic_vector (8 downto 0);
  signal n13724_o : std_logic_vector (24 downto 0);
  signal n13725_o : std_logic_vector (23 downto 0);
  signal n13726_o : std_logic_vector (24 downto 0);
  signal n13727_o : std_logic_vector (24 downto 0);
  signal n13728_o : std_logic_vector (24 downto 0);
  signal n13731_o : std_logic;
  signal n13732_o : std_logic_vector (2 downto 0);
  signal n13733_o : std_logic_vector (24 downto 0);
  signal n13734_o : std_logic_vector (24 downto 0);
  signal n13735_o : std_logic_vector (24 downto 0);
  signal n13736_o : std_logic_vector (24 downto 0);
  signal n13764_o : std_logic;
  signal n13765_o : std_logic_vector (24 downto 0);
  signal n13766_q : std_logic_vector (24 downto 0);
  signal n13767_o : std_logic;
  signal n13768_o : std_logic_vector (24 downto 0);
  signal n13769_q : std_logic_vector (24 downto 0);
  signal n13770_q : std_logic_vector (24 downto 0);
  signal n13771_q : std_logic_vector (24 downto 0);
  signal n13787_o : std_logic_vector (22 downto 0);
  signal n13788_o : std_logic;
  signal n13793_o : std_logic;
  signal n13794_o : std_logic;
  signal n13797_o : std_logic;
  signal n13798_o : std_logic;
  signal n13801_o : std_logic;
  signal n13802_o : std_logic;
  signal n13809_o : std_logic;
  signal n13813_o : std_logic;
  signal n13815_o : std_logic;
  signal n13816_o : std_logic;
  signal n13818_o : std_logic;
  signal n13824_o : std_logic;
  signal n13827_o : std_logic;
  signal n13829_o : std_logic;
  signal n13830_o : std_logic;
  signal n13831_o : std_logic;
  signal n13832_o : std_logic;
  signal n13833_o : std_logic;
  signal n13834_o : std_logic;
  signal n13835_o : std_logic;
  signal n13836_o : std_logic;
  signal n13837_o : std_logic;
  signal n13838_o : std_logic;
  signal n13839_o : std_logic;
  signal n13840_o : std_logic;
  signal n13841_o : std_logic;
  signal n13842_o : std_logic;
  signal n13843_o : std_logic;
  signal n13844_o : std_logic;
  signal n13845_o : std_logic;
  signal n13846_o : std_logic;
  signal n13847_o : std_logic_vector (3 downto 0);
  signal n13848_o : std_logic_vector (3 downto 0);
  signal n13849_o : std_logic_vector (3 downto 0);
  signal n13850_o : std_logic_vector (3 downto 0);
  signal n13851_o : std_logic_vector (1 downto 0);
  signal n13852_o : std_logic_vector (15 downto 0);
  signal n13853_o : std_logic_vector (17 downto 0);
  signal n13854_o : std_logic_vector (16 downto 0);
  signal n13855_o : std_logic_vector (17 downto 0);
  signal n13856_o : std_logic_vector (17 downto 0);
  signal n13857_o : std_logic_vector (17 downto 0);
begin
  ready_o <= n12654_o;
  valid_o <= n12659_o;
  data_o <= n13857_o;
  -- ../BiquadFilter/BiquadFilter.vhd:26:12
  state_reg <= n12650_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:12
  x_reg <= n13766_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:19
  y_reg <= n13769_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:26
  w_reg <= n13770_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:33
  v_reg <= n13771_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:33:15
  -- n12628_o <= '1' when rising_edge (clk_i) else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:36:21
  n12630_o <= state_reg when valid_i = '0' else "01";
  -- ../BiquadFilter/BiquadFilter.vhd:35:17
  n12632_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:39:17
  n12634_o <= '1' when state_reg = "01" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:41:17
  n12636_o <= '1' when state_reg = "10" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:44:21
  n12638_o <= state_reg when ready_i = '0' else "00";
  -- ../BiquadFilter/BiquadFilter.vhd:43:17
  n12640_o <= '1' when state_reg = "11" else '0';
  -- ../fixed_pkg.vhd:183:17
  n12641_o <= n12640_o & n12636_o & n12634_o & n12632_o;
  -- ../BiquadFilter/BiquadFilter.vhd:34:13
  with n12641_o select n12645_o <=
    n12638_o when "1000",
    "11" when "0100",
    "10" when "0010",
    n12630_o when "0001",
    "XX" when others;
  -- ../BiquadFilter/BiquadFilter.vhd:33:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n12650_q <= "00";
    elsif rising_edge (clk_i) then
      n12650_q <= n12645_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:51:35
  n12653_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:51:20
  n12654_o <= '0' when n12653_o = '0' else '1';
  -- ../BiquadFilter/BiquadFilter.vhd:52:35
  n12658_o <= '1' when state_reg = "11" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:52:20
  n12659_o <= '0' when n12658_o = '0' else '1';
  -- ../BiquadFilter/BiquadFilter.vhd:59:15
  -- n12662_o <= '1' when rising_edge (clk_i) else '0';
  -- ../fixed_pkg.vhd:168:39
  n12678_o <= std_logic_vector (resize (signed (data_i), 20));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n12684_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n12685_o <= n12684_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n12686: postponed assert n12685_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n12688_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n12689_o <= n12688_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n12690: postponed assert n12689_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:170:18
  n12692_o <= n12691_o (4 downto 0);
  n12693_o <= n12678_o & n12692_o;
  -- ../BiquadFilter/BiquadFilter.vhd:62:21
  n12694_o <= x_reg when valid_i = '0' else n12693_o;
  -- ../BiquadFilter/BiquadFilter.vhd:61:17
  n12696_o <= '1' when state_reg = "00" else '0';
  -- ../fixed_pkg.vhd:266:100
  n12710_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n12713_o <= std_logic_vector (resize (signed (n12710_o) * signed'("0000000000000000000000000000000011010101110"), 43));
  -- ../fixed_pkg.vhd:168:39
  n12730_o <= std_logic_vector (resize (signed (n12713_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n12736_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n12737_o <= n12736_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n12738: postponed assert n12737_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n12740_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n12741_o <= n12740_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n12742: postponed assert n12741_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n12754_o <= std_logic_vector (resize (signed (w_reg), 28));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n12760_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n12761_o <= n12760_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n12762: postponed assert n12761_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n12764_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n12765_o <= n12764_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n12766: postponed assert n12765_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:24:14
  n12768_o <= n12767_o (15 downto 0);
  -- ../fixed_pkg.vhd:24:14
  n12769_o <= n12754_o & n12768_o;
  -- ../fixed_pkg.vhd:255:67
  n12780_o <= std_logic_vector (unsigned (n12730_o) + unsigned (n12769_o));
  -- ../fixed_pkg.vhd:168:39
  n12791_o <= n12780_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n12792_o <= n12780_o (43);
  -- ../fixed_pkg.vhd:173:9
  n12797_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n12798_o <= n12797_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n12799: postponed assert n12798_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n12801_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n12802_o <= n12801_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n12803: postponed assert n12802_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n12805_o <= n12780_o (42);
  -- ../fixed_pkg.vhd:183:27
  n12806_o <= '1' when n12805_o /= n12792_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n12813_o <= '0' when n12806_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n12819_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12820_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12821_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12822_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12823_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12824_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12825_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12826_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12827_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12828_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12829_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12830_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12831_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12832_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12833_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12834_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12835_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12836_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12837_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12838_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12839_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12840_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12841_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12842_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12843_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12844_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12845_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12846_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12847_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12848_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12849_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12850_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12851_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12852_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12853_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12854_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12855_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12856_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12857_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12858_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12859_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12860_o <= not n12792_o;
  -- ../fixed_pkg.vhd:194:31
  n12861_o <= not n12792_o;
  n12862_o <= n12819_o & n12820_o & n12821_o & n12822_o;
  -- ../fixed_pkg.vhd:169:40
  n12863_o <= n12823_o & n12824_o & n12825_o & n12826_o;
  -- ../fixed_pkg.vhd:9:14
  n12864_o <= n12827_o & n12828_o & n12829_o & n12830_o;
  -- ../fixed_pkg.vhd:9:14
  n12865_o <= n12831_o & n12832_o & n12833_o & n12834_o;
  n12866_o <= n12835_o & n12836_o & n12837_o & n12838_o;
  -- ../fixed_pkg.vhd:9:14
  n12867_o <= n12839_o & n12840_o & n12841_o & n12842_o;
  -- ../fixed_pkg.vhd:24:14
  n12868_o <= n12843_o & n12844_o & n12845_o & n12846_o;
  -- ../fixed_pkg.vhd:24:14
  n12869_o <= n12847_o & n12848_o & n12849_o & n12850_o;
  n12870_o <= n12851_o & n12852_o & n12853_o & n12854_o;
  -- ../fixed_pkg.vhd:24:14
  n12871_o <= n12855_o & n12856_o & n12857_o & n12858_o;
  n12872_o <= n12859_o & n12860_o & n12861_o;
  -- ../fixed_pkg.vhd:171:18
  n12873_o <= n12862_o & n12863_o & n12864_o & n12865_o;
  n12874_o <= n12866_o & n12867_o & n12868_o & n12869_o;
  -- ../fixed_pkg.vhd:170:18
  n12875_o <= n12870_o & n12871_o & n12872_o;
  n12876_o <= n12873_o & n12874_o & n12875_o;
  -- ../fixed_pkg.vhd:169:40
  n12877_o <= n12876_o (41 downto 0);
  -- ../fixed_pkg.vhd:9:14
  n12878_o <= n12792_o & n12877_o;
  -- ../fixed_pkg.vhd:193:9
  n12879_o <= n12791_o when n12813_o = '0' else n12878_o;
  -- ../fixed_pkg.vhd:168:39
  n12895_o <= n12879_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n12896_o <= n12879_o (42);
  -- ../fixed_pkg.vhd:173:9
  n12901_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n12902_o <= n12901_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n12903: postponed assert n12902_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n12905_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n12906_o <= n12905_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n12907: postponed assert n12906_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n12909_o <= n12879_o (41);
  -- ../fixed_pkg.vhd:183:27
  n12910_o <= '1' when n12909_o /= n12896_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n12917_o <= '0' when n12910_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n12921_o <= '1' when n12910_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n12923_o <= n12879_o (40);
  -- ../fixed_pkg.vhd:183:27
  n12924_o <= '1' when n12923_o /= n12896_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n12926_o <= n12917_o when n12935_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n12932_o <= n12924_o and n12921_o;
  -- ../fixed_pkg.vhd:183:17
  n12935_o <= n12921_o and n12932_o;
  -- ../fixed_pkg.vhd:194:31
  n12937_o <= not n12896_o;
  -- ../fixed_pkg.vhd:194:31
  n12938_o <= not n12896_o;
  -- ../fixed_pkg.vhd:194:31
  n12939_o <= not n12896_o;
  -- ../fixed_pkg.vhd:194:31
  n12940_o <= not n12896_o;
  -- ../fixed_pkg.vhd:194:31
  n12941_o <= not n12896_o;
  -- ../fixed_pkg.vhd:194:31
  n12942_o <= not n12896_o;
  -- ../fixed_pkg.vhd:194:31
  n12943_o <= not n12896_o;
  -- ../fixed_pkg.vhd:194:31
  n12944_o <= not n12896_o;
  -- ../fixed_pkg.vhd:194:31
  n12945_o <= not n12896_o;
  -- ../fixed_pkg.vhd:194:31
  n12946_o <= not n12896_o;
  -- ../fixed_pkg.vhd:194:31
  n12947_o <= not n12896_o;
  -- ../fixed_pkg.vhd:194:31
  n12948_o <= not n12896_o;
  -- ../fixed_pkg.vhd:194:31
  n12949_o <= not n12896_o;
  -- ../fixed_pkg.vhd:194:31
  n12950_o <= not n12896_o;
  -- ../fixed_pkg.vhd:194:31
  n12951_o <= not n12896_o;
  -- ../fixed_pkg.vhd:194:31
  n12952_o <= not n12896_o;
  -- ../fixed_pkg.vhd:194:31
  n12953_o <= not n12896_o;
  -- ../fixed_pkg.vhd:194:31
  n12954_o <= not n12896_o;
  -- ../fixed_pkg.vhd:194:31
  n12955_o <= not n12896_o;
  -- ../fixed_pkg.vhd:194:31
  n12956_o <= not n12896_o;
  -- ../fixed_pkg.vhd:194:31
  n12957_o <= not n12896_o;
  -- ../fixed_pkg.vhd:194:31
  n12958_o <= not n12896_o;
  -- ../fixed_pkg.vhd:194:31
  n12959_o <= not n12896_o;
  -- ../fixed_pkg.vhd:194:31
  n12960_o <= not n12896_o;
  -- ../fixed_pkg.vhd:194:31
  n12961_o <= not n12896_o;
  -- ../fixed_pkg.vhd:171:18
  n12962_o <= n12937_o & n12938_o & n12939_o & n12940_o;
  -- ../fixed_pkg.vhd:9:14
  n12963_o <= n12941_o & n12942_o & n12943_o & n12944_o;
  -- ../fixed_pkg.vhd:9:14
  n12964_o <= n12945_o & n12946_o & n12947_o & n12948_o;
  -- ../fixed_pkg.vhd:183:17
  n12965_o <= n12949_o & n12950_o & n12951_o & n12952_o;
  -- ../fixed_pkg.vhd:9:14
  n12966_o <= n12953_o & n12954_o & n12955_o & n12956_o;
  -- ../fixed_pkg.vhd:40:14
  n12967_o <= n12957_o & n12958_o & n12959_o & n12960_o;
  -- ../fixed_pkg.vhd:40:14
  n12968_o <= n12962_o & n12963_o & n12964_o & n12965_o;
  -- ../fixed_pkg.vhd:9:14
  n12969_o <= n12966_o & n12967_o & n12961_o;
  -- ../fixed_pkg.vhd:40:14
  n12970_o <= n12968_o & n12969_o;
  -- ../fixed_pkg.vhd:183:17
  n12971_o <= n12970_o (23 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n12972_o <= n12895_o (40 downto 16);
  -- ../fixed_pkg.vhd:183:17
  n12973_o <= n12896_o & n12971_o;
  -- ../fixed_pkg.vhd:193:9
  n12974_o <= n12972_o when n12926_o = '0' else n12973_o;
  -- ../BiquadFilter/BiquadFilter.vhd:65:17
  n12977_o <= '1' when state_reg = "01" else '0';
  -- ../fixed_pkg.vhd:266:100
  n12992_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n12995_o <= std_logic_vector (resize (signed (n12992_o) * signed'("0000000000000000000000000000000000000000000"), 43));
  -- ../fixed_pkg.vhd:266:100
  n13007_o <= std_logic_vector (resize (signed (y_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n13010_o <= std_logic_vector (resize (signed (n13007_o) * signed'("0000000000011111111111111100101101011111100"), 43));
  -- ../fixed_pkg.vhd:168:39
  n13027_o <= std_logic_vector (resize (signed (n12995_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n13033_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n13034_o <= n13033_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n13035: postponed assert n13034_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n13037_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n13038_o <= n13037_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n13039: postponed assert n13038_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n13051_o <= std_logic_vector (resize (signed (n13010_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n13057_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n13058_o <= n13057_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n13059: postponed assert n13058_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n13061_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n13062_o <= n13061_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n13063: postponed assert n13062_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:240:67
  n13075_o <= std_logic_vector (unsigned (n13027_o) - unsigned (n13051_o));
  -- ../fixed_pkg.vhd:168:39
  n13086_o <= n13075_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n13087_o <= n13075_o (43);
  -- ../fixed_pkg.vhd:173:9
  n13092_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n13093_o <= n13092_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n13094: postponed assert n13093_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n13096_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n13097_o <= n13096_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n13098: postponed assert n13097_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n13100_o <= n13075_o (42);
  -- ../fixed_pkg.vhd:183:27
  n13101_o <= '1' when n13100_o /= n13087_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n13108_o <= '0' when n13101_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n13114_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13115_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13116_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13117_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13118_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13119_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13120_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13121_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13122_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13123_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13124_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13125_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13126_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13127_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13128_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13129_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13130_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13131_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13132_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13133_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13134_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13135_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13136_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13137_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13138_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13139_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13140_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13141_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13142_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13143_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13144_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13145_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13146_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13147_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13148_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13149_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13150_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13151_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13152_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13153_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13154_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13155_o <= not n13087_o;
  -- ../fixed_pkg.vhd:194:31
  n13156_o <= not n13087_o;
  n13157_o <= n13114_o & n13115_o & n13116_o & n13117_o;
  n13158_o <= n13118_o & n13119_o & n13120_o & n13121_o;
  n13159_o <= n13122_o & n13123_o & n13124_o & n13125_o;
  n13160_o <= n13126_o & n13127_o & n13128_o & n13129_o;
  n13161_o <= n13130_o & n13131_o & n13132_o & n13133_o;
  n13162_o <= n13134_o & n13135_o & n13136_o & n13137_o;
  n13163_o <= n13138_o & n13139_o & n13140_o & n13141_o;
  n13164_o <= n13142_o & n13143_o & n13144_o & n13145_o;
  n13165_o <= n13146_o & n13147_o & n13148_o & n13149_o;
  n13166_o <= n13150_o & n13151_o & n13152_o & n13153_o;
  n13167_o <= n13154_o & n13155_o & n13156_o;
  n13168_o <= n13157_o & n13158_o & n13159_o & n13160_o;
  n13169_o <= n13161_o & n13162_o & n13163_o & n13164_o;
  n13170_o <= n13165_o & n13166_o & n13167_o;
  n13171_o <= n13168_o & n13169_o & n13170_o;
  n13172_o <= n13171_o (41 downto 0);
  n13173_o <= n13087_o & n13172_o;
  -- ../fixed_pkg.vhd:193:9
  n13174_o <= n13086_o when n13108_o = '0' else n13173_o;
  -- ../fixed_pkg.vhd:168:39
  n13192_o <= std_logic_vector (resize (signed (n13174_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n13198_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n13199_o <= n13198_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n13200: postponed assert n13199_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n13202_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n13203_o <= n13202_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n13204: postponed assert n13203_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n13216_o <= std_logic_vector (resize (signed (v_reg), 28));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n13222_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n13223_o <= n13222_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n13224: postponed assert n13223_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n13226_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n13227_o <= n13226_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n13228: postponed assert n13227_o = '1' severity error; --  assert
  n13230_o <= n13229_o (15 downto 0);
  n13231_o <= n13216_o & n13230_o;
  -- ../fixed_pkg.vhd:255:67
  n13242_o <= std_logic_vector (unsigned (n13192_o) + unsigned (n13231_o));
  -- ../fixed_pkg.vhd:168:39
  n13253_o <= n13242_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n13254_o <= n13242_o (43);
  -- ../fixed_pkg.vhd:173:9
  n13259_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n13260_o <= n13259_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n13261: postponed assert n13260_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n13263_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n13264_o <= n13263_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n13265: postponed assert n13264_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n13267_o <= n13242_o (42);
  -- ../fixed_pkg.vhd:183:27
  n13268_o <= '1' when n13267_o /= n13254_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n13275_o <= '0' when n13268_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n13281_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13282_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13283_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13284_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13285_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13286_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13287_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13288_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13289_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13290_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13291_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13292_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13293_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13294_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13295_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13296_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13297_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13298_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13299_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13300_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13301_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13302_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13303_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13304_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13305_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13306_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13307_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13308_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13309_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13310_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13311_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13312_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13313_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13314_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13315_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13316_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13317_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13318_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13319_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13320_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13321_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13322_o <= not n13254_o;
  -- ../fixed_pkg.vhd:194:31
  n13323_o <= not n13254_o;
  n13324_o <= n13281_o & n13282_o & n13283_o & n13284_o;
  n13325_o <= n13285_o & n13286_o & n13287_o & n13288_o;
  n13326_o <= n13289_o & n13290_o & n13291_o & n13292_o;
  n13327_o <= n13293_o & n13294_o & n13295_o & n13296_o;
  n13328_o <= n13297_o & n13298_o & n13299_o & n13300_o;
  n13329_o <= n13301_o & n13302_o & n13303_o & n13304_o;
  n13330_o <= n13305_o & n13306_o & n13307_o & n13308_o;
  n13331_o <= n13309_o & n13310_o & n13311_o & n13312_o;
  n13332_o <= n13313_o & n13314_o & n13315_o & n13316_o;
  n13333_o <= n13317_o & n13318_o & n13319_o & n13320_o;
  n13334_o <= n13321_o & n13322_o & n13323_o;
  n13335_o <= n13324_o & n13325_o & n13326_o & n13327_o;
  n13336_o <= n13328_o & n13329_o & n13330_o & n13331_o;
  n13337_o <= n13332_o & n13333_o & n13334_o;
  n13338_o <= n13335_o & n13336_o & n13337_o;
  n13339_o <= n13338_o (41 downto 0);
  n13340_o <= n13254_o & n13339_o;
  -- ../fixed_pkg.vhd:193:9
  n13341_o <= n13253_o when n13275_o = '0' else n13340_o;
  -- ../fixed_pkg.vhd:168:39
  n13357_o <= n13341_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n13358_o <= n13341_o (42);
  -- ../fixed_pkg.vhd:173:9
  n13363_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n13364_o <= n13363_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n13365: postponed assert n13364_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n13367_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n13368_o <= n13367_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n13369: postponed assert n13368_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n13371_o <= n13341_o (41);
  -- ../fixed_pkg.vhd:183:27
  n13372_o <= '1' when n13371_o /= n13358_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n13379_o <= '0' when n13372_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n13383_o <= '1' when n13372_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n13385_o <= n13341_o (40);
  -- ../fixed_pkg.vhd:183:27
  n13386_o <= '1' when n13385_o /= n13358_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n13388_o <= n13379_o when n13397_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n13394_o <= n13386_o and n13383_o;
  -- ../fixed_pkg.vhd:183:17
  n13397_o <= n13383_o and n13394_o;
  -- ../fixed_pkg.vhd:194:31
  n13399_o <= not n13358_o;
  -- ../fixed_pkg.vhd:194:31
  n13400_o <= not n13358_o;
  -- ../fixed_pkg.vhd:194:31
  n13401_o <= not n13358_o;
  -- ../fixed_pkg.vhd:194:31
  n13402_o <= not n13358_o;
  -- ../fixed_pkg.vhd:194:31
  n13403_o <= not n13358_o;
  -- ../fixed_pkg.vhd:194:31
  n13404_o <= not n13358_o;
  -- ../fixed_pkg.vhd:194:31
  n13405_o <= not n13358_o;
  -- ../fixed_pkg.vhd:194:31
  n13406_o <= not n13358_o;
  -- ../fixed_pkg.vhd:194:31
  n13407_o <= not n13358_o;
  -- ../fixed_pkg.vhd:194:31
  n13408_o <= not n13358_o;
  -- ../fixed_pkg.vhd:194:31
  n13409_o <= not n13358_o;
  -- ../fixed_pkg.vhd:194:31
  n13410_o <= not n13358_o;
  -- ../fixed_pkg.vhd:194:31
  n13411_o <= not n13358_o;
  -- ../fixed_pkg.vhd:194:31
  n13412_o <= not n13358_o;
  -- ../fixed_pkg.vhd:194:31
  n13413_o <= not n13358_o;
  -- ../fixed_pkg.vhd:194:31
  n13414_o <= not n13358_o;
  -- ../fixed_pkg.vhd:194:31
  n13415_o <= not n13358_o;
  -- ../fixed_pkg.vhd:194:31
  n13416_o <= not n13358_o;
  -- ../fixed_pkg.vhd:194:31
  n13417_o <= not n13358_o;
  -- ../fixed_pkg.vhd:194:31
  n13418_o <= not n13358_o;
  -- ../fixed_pkg.vhd:194:31
  n13419_o <= not n13358_o;
  -- ../fixed_pkg.vhd:194:31
  n13420_o <= not n13358_o;
  -- ../fixed_pkg.vhd:194:31
  n13421_o <= not n13358_o;
  -- ../fixed_pkg.vhd:194:31
  n13422_o <= not n13358_o;
  -- ../fixed_pkg.vhd:194:31
  n13423_o <= not n13358_o;
  n13424_o <= n13399_o & n13400_o & n13401_o & n13402_o;
  n13425_o <= n13403_o & n13404_o & n13405_o & n13406_o;
  n13426_o <= n13407_o & n13408_o & n13409_o & n13410_o;
  n13427_o <= n13411_o & n13412_o & n13413_o & n13414_o;
  n13428_o <= n13415_o & n13416_o & n13417_o & n13418_o;
  n13429_o <= n13419_o & n13420_o & n13421_o & n13422_o;
  n13430_o <= n13424_o & n13425_o & n13426_o & n13427_o;
  n13431_o <= n13428_o & n13429_o & n13423_o;
  n13432_o <= n13430_o & n13431_o;
  n13433_o <= n13432_o (23 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n13434_o <= n13357_o (40 downto 16);
  n13435_o <= n13358_o & n13433_o;
  -- ../fixed_pkg.vhd:193:9
  n13436_o <= n13434_o when n13388_o = '0' else n13435_o;
  -- ../fixed_pkg.vhd:266:100
  n13451_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n13454_o <= std_logic_vector (resize (signed (n13451_o) * signed'("0000000000011111111111111111111100101010010"), 43));
  -- ../fixed_pkg.vhd:266:100
  n13466_o <= std_logic_vector (resize (signed (y_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n13469_o <= std_logic_vector (resize (signed (n13466_o) * signed'("0000000000000000000000000001111001010100100"), 43));
  -- ../fixed_pkg.vhd:168:39
  n13486_o <= std_logic_vector (resize (signed (n13454_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n13492_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n13493_o <= n13492_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n13494: postponed assert n13493_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n13496_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n13497_o <= n13496_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n13498: postponed assert n13497_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n13510_o <= std_logic_vector (resize (signed (n13469_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n13516_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n13517_o <= n13516_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n13518: postponed assert n13517_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n13520_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n13521_o <= n13520_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n13522: postponed assert n13521_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:240:67
  n13534_o <= std_logic_vector (unsigned (n13486_o) - unsigned (n13510_o));
  -- ../fixed_pkg.vhd:168:39
  n13545_o <= n13534_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n13546_o <= n13534_o (43);
  -- ../fixed_pkg.vhd:173:9
  n13551_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n13552_o <= n13551_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n13553: postponed assert n13552_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n13555_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n13556_o <= n13555_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n13557: postponed assert n13556_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n13559_o <= n13534_o (42);
  -- ../fixed_pkg.vhd:183:27
  n13560_o <= '1' when n13559_o /= n13546_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n13567_o <= '0' when n13560_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n13573_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13574_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13575_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13576_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13577_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13578_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13579_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13580_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13581_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13582_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13583_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13584_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13585_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13586_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13587_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13588_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13589_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13590_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13591_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13592_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13593_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13594_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13595_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13596_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13597_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13598_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13599_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13600_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13601_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13602_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13603_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13604_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13605_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13606_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13607_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13608_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13609_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13610_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13611_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13612_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13613_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13614_o <= not n13546_o;
  -- ../fixed_pkg.vhd:194:31
  n13615_o <= not n13546_o;
  n13616_o <= n13573_o & n13574_o & n13575_o & n13576_o;
  n13617_o <= n13577_o & n13578_o & n13579_o & n13580_o;
  n13618_o <= n13581_o & n13582_o & n13583_o & n13584_o;
  n13619_o <= n13585_o & n13586_o & n13587_o & n13588_o;
  n13620_o <= n13589_o & n13590_o & n13591_o & n13592_o;
  n13621_o <= n13593_o & n13594_o & n13595_o & n13596_o;
  n13622_o <= n13597_o & n13598_o & n13599_o & n13600_o;
  n13623_o <= n13601_o & n13602_o & n13603_o & n13604_o;
  n13624_o <= n13605_o & n13606_o & n13607_o & n13608_o;
  n13625_o <= n13609_o & n13610_o & n13611_o & n13612_o;
  n13626_o <= n13613_o & n13614_o & n13615_o;
  n13627_o <= n13616_o & n13617_o & n13618_o & n13619_o;
  n13628_o <= n13620_o & n13621_o & n13622_o & n13623_o;
  n13629_o <= n13624_o & n13625_o & n13626_o;
  n13630_o <= n13627_o & n13628_o & n13629_o;
  n13631_o <= n13630_o (41 downto 0);
  n13632_o <= n13546_o & n13631_o;
  -- ../fixed_pkg.vhd:193:9
  n13633_o <= n13545_o when n13567_o = '0' else n13632_o;
  -- ../fixed_pkg.vhd:168:39
  n13649_o <= n13633_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n13650_o <= n13633_o (42);
  -- ../fixed_pkg.vhd:173:9
  n13655_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n13656_o <= n13655_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n13657: postponed assert n13656_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n13659_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n13660_o <= n13659_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n13661: postponed assert n13660_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n13663_o <= n13633_o (41);
  -- ../fixed_pkg.vhd:183:27
  n13664_o <= '1' when n13663_o /= n13650_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n13671_o <= '0' when n13664_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n13675_o <= '1' when n13664_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n13677_o <= n13633_o (40);
  -- ../fixed_pkg.vhd:183:27
  n13678_o <= '1' when n13677_o /= n13650_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n13680_o <= n13671_o when n13689_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n13686_o <= n13678_o and n13675_o;
  -- ../fixed_pkg.vhd:183:17
  n13689_o <= n13675_o and n13686_o;
  -- ../fixed_pkg.vhd:194:31
  n13691_o <= not n13650_o;
  -- ../fixed_pkg.vhd:194:31
  n13692_o <= not n13650_o;
  -- ../fixed_pkg.vhd:194:31
  n13693_o <= not n13650_o;
  -- ../fixed_pkg.vhd:194:31
  n13694_o <= not n13650_o;
  -- ../fixed_pkg.vhd:194:31
  n13695_o <= not n13650_o;
  -- ../fixed_pkg.vhd:194:31
  n13696_o <= not n13650_o;
  -- ../fixed_pkg.vhd:194:31
  n13697_o <= not n13650_o;
  -- ../fixed_pkg.vhd:194:31
  n13698_o <= not n13650_o;
  -- ../fixed_pkg.vhd:194:31
  n13699_o <= not n13650_o;
  -- ../fixed_pkg.vhd:194:31
  n13700_o <= not n13650_o;
  -- ../fixed_pkg.vhd:194:31
  n13701_o <= not n13650_o;
  -- ../fixed_pkg.vhd:194:31
  n13702_o <= not n13650_o;
  -- ../fixed_pkg.vhd:194:31
  n13703_o <= not n13650_o;
  -- ../fixed_pkg.vhd:194:31
  n13704_o <= not n13650_o;
  -- ../fixed_pkg.vhd:194:31
  n13705_o <= not n13650_o;
  -- ../fixed_pkg.vhd:194:31
  n13706_o <= not n13650_o;
  -- ../fixed_pkg.vhd:194:31
  n13707_o <= not n13650_o;
  -- ../fixed_pkg.vhd:194:31
  n13708_o <= not n13650_o;
  -- ../fixed_pkg.vhd:194:31
  n13709_o <= not n13650_o;
  -- ../fixed_pkg.vhd:194:31
  n13710_o <= not n13650_o;
  -- ../fixed_pkg.vhd:194:31
  n13711_o <= not n13650_o;
  -- ../fixed_pkg.vhd:194:31
  n13712_o <= not n13650_o;
  -- ../fixed_pkg.vhd:194:31
  n13713_o <= not n13650_o;
  -- ../fixed_pkg.vhd:194:31
  n13714_o <= not n13650_o;
  -- ../fixed_pkg.vhd:194:31
  n13715_o <= not n13650_o;
  n13716_o <= n13691_o & n13692_o & n13693_o & n13694_o;
  n13717_o <= n13695_o & n13696_o & n13697_o & n13698_o;
  n13718_o <= n13699_o & n13700_o & n13701_o & n13702_o;
  n13719_o <= n13703_o & n13704_o & n13705_o & n13706_o;
  n13720_o <= n13707_o & n13708_o & n13709_o & n13710_o;
  n13721_o <= n13711_o & n13712_o & n13713_o & n13714_o;
  n13722_o <= n13716_o & n13717_o & n13718_o & n13719_o;
  n13723_o <= n13720_o & n13721_o & n13715_o;
  n13724_o <= n13722_o & n13723_o;
  n13725_o <= n13724_o (23 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n13726_o <= n13649_o (40 downto 16);
  n13727_o <= n13650_o & n13725_o;
  -- ../fixed_pkg.vhd:193:9
  n13728_o <= n13726_o when n13680_o = '0' else n13727_o;
  -- ../BiquadFilter/BiquadFilter.vhd:67:17
  n13731_o <= '1' when state_reg = "10" else '0';
  n13732_o <= n13731_o & n12977_o & n12696_o;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n13732_o select n13733_o <=
    x_reg when "100",
    x_reg when "010",
    n12694_o when "001",
    x_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n13732_o select n13734_o <=
    y_reg when "100",
    n12974_o when "010",
    y_reg when "001",
    y_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n13732_o select n13735_o <=
    n13436_o when "100",
    w_reg when "010",
    w_reg when "001",
    w_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n13732_o select n13736_o <=
    n13728_o when "100",
    v_reg when "010",
    v_reg when "001",
    v_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n13764_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n13765_o <= x_reg when n13764_o = '0' else n13733_o;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n13766_q <= n13765_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n13767_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n13768_o <= y_reg when n13767_o = '0' else n13734_o;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n13769_q <= n13768_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n13770_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n13770_q <= n13735_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n13771_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n13771_q <= n13736_o;
    end if;
  end process;
  -- ../fixed_pkg.vhd:168:39
  n13787_o <= y_reg (22 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n13788_o <= y_reg (24);
  -- ../fixed_pkg.vhd:173:9
  n13793_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n13794_o <= n13793_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n13795: postponed assert n13794_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n13797_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n13798_o <= n13797_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n13799: postponed assert n13798_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n13801_o <= y_reg (23);
  -- ../fixed_pkg.vhd:183:27
  n13802_o <= '1' when n13801_o /= n13788_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n13809_o <= '0' when n13802_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n13813_o <= '1' when n13802_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n13815_o <= y_reg (22);
  -- ../fixed_pkg.vhd:183:27
  n13816_o <= '1' when n13815_o /= n13788_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n13818_o <= n13809_o when n13827_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n13824_o <= n13816_o and n13813_o;
  -- ../fixed_pkg.vhd:183:17
  n13827_o <= n13813_o and n13824_o;
  -- ../fixed_pkg.vhd:194:31
  n13829_o <= not n13788_o;
  -- ../fixed_pkg.vhd:194:31
  n13830_o <= not n13788_o;
  -- ../fixed_pkg.vhd:194:31
  n13831_o <= not n13788_o;
  -- ../fixed_pkg.vhd:194:31
  n13832_o <= not n13788_o;
  -- ../fixed_pkg.vhd:194:31
  n13833_o <= not n13788_o;
  -- ../fixed_pkg.vhd:194:31
  n13834_o <= not n13788_o;
  -- ../fixed_pkg.vhd:194:31
  n13835_o <= not n13788_o;
  -- ../fixed_pkg.vhd:194:31
  n13836_o <= not n13788_o;
  -- ../fixed_pkg.vhd:194:31
  n13837_o <= not n13788_o;
  -- ../fixed_pkg.vhd:194:31
  n13838_o <= not n13788_o;
  -- ../fixed_pkg.vhd:194:31
  n13839_o <= not n13788_o;
  -- ../fixed_pkg.vhd:194:31
  n13840_o <= not n13788_o;
  -- ../fixed_pkg.vhd:194:31
  n13841_o <= not n13788_o;
  -- ../fixed_pkg.vhd:194:31
  n13842_o <= not n13788_o;
  -- ../fixed_pkg.vhd:194:31
  n13843_o <= not n13788_o;
  -- ../fixed_pkg.vhd:194:31
  n13844_o <= not n13788_o;
  -- ../fixed_pkg.vhd:194:31
  n13845_o <= not n13788_o;
  -- ../fixed_pkg.vhd:194:31
  n13846_o <= not n13788_o;
  n13847_o <= n13829_o & n13830_o & n13831_o & n13832_o;
  n13848_o <= n13833_o & n13834_o & n13835_o & n13836_o;
  n13849_o <= n13837_o & n13838_o & n13839_o & n13840_o;
  n13850_o <= n13841_o & n13842_o & n13843_o & n13844_o;
  n13851_o <= n13845_o & n13846_o;
  n13852_o <= n13847_o & n13848_o & n13849_o & n13850_o;
  n13853_o <= n13852_o & n13851_o;
  n13854_o <= n13853_o (16 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n13855_o <= n13787_o (22 downto 5);
  n13856_o <= n13788_o & n13854_o;
  -- ../fixed_pkg.vhd:193:9
  n13857_o <= n13855_o when n13818_o = '0' else n13856_o;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity biquadfilter_ec985945a1ffc882d4b5d12ff1518d1a793a38b9 is
  port (
    clk_i : in std_logic;
    reset_i : in std_logic;
    valid_i : in std_logic;
    data_i : in std_logic_vector (17 downto 0);
    ready_i : in std_logic;
    ready_o : out std_logic;
    valid_o : out std_logic;
    data_o : out std_logic_vector (17 downto 0));
end entity biquadfilter_ec985945a1ffc882d4b5d12ff1518d1a793a38b9;

architecture rtl of biquadfilter_ec985945a1ffc882d4b5d12ff1518d1a793a38b9 is
  signal state_reg : std_logic_vector (1 downto 0);
  signal x_reg : std_logic_vector (24 downto 0);
  signal y_reg : std_logic_vector (24 downto 0);
  signal w_reg : std_logic_vector (24 downto 0);
  signal v_reg : std_logic_vector (24 downto 0);
  signal n11392_o : std_logic;
  signal n11394_o : std_logic_vector (1 downto 0);
  signal n11396_o : std_logic;
  signal n11398_o : std_logic;
  signal n11400_o : std_logic;
  signal n11402_o : std_logic_vector (1 downto 0);
  signal n11404_o : std_logic;
  signal n11405_o : std_logic_vector (3 downto 0);
  signal n11409_o : std_logic_vector (1 downto 0);
  signal n11414_q : std_logic_vector (1 downto 0);
  signal n11417_o : std_logic;
  signal n11418_o : std_logic;
  signal n11422_o : std_logic;
  signal n11423_o : std_logic;
  signal n11426_o : std_logic;
  signal n11442_o : std_logic_vector (19 downto 0);
  signal n11448_o : std_logic;
  signal n11449_o : std_logic;
  signal n11452_o : std_logic;
  signal n11453_o : std_logic;
  constant n11455_o : std_logic_vector (24 downto 0) := "0000000000000000000000000";
  signal n11456_o : std_logic_vector (4 downto 0);
  signal n11457_o : std_logic_vector (24 downto 0);
  signal n11458_o : std_logic_vector (24 downto 0);
  signal n11460_o : std_logic;
  signal n11474_o : std_logic_vector (42 downto 0);
  signal n11477_o : std_logic_vector (42 downto 0);
  signal n11494_o : std_logic_vector (43 downto 0);
  signal n11500_o : std_logic;
  signal n11501_o : std_logic;
  signal n11504_o : std_logic;
  signal n11505_o : std_logic;
  signal n11518_o : std_logic_vector (27 downto 0);
  signal n11524_o : std_logic;
  signal n11525_o : std_logic;
  signal n11528_o : std_logic;
  signal n11529_o : std_logic;
  constant n11531_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n11532_o : std_logic_vector (15 downto 0);
  signal n11533_o : std_logic_vector (43 downto 0);
  signal n11544_o : std_logic_vector (43 downto 0);
  signal n11555_o : std_logic_vector (42 downto 0);
  signal n11556_o : std_logic;
  signal n11561_o : std_logic;
  signal n11562_o : std_logic;
  signal n11565_o : std_logic;
  signal n11566_o : std_logic;
  signal n11569_o : std_logic;
  signal n11570_o : std_logic;
  signal n11577_o : std_logic;
  signal n11583_o : std_logic;
  signal n11584_o : std_logic;
  signal n11585_o : std_logic;
  signal n11586_o : std_logic;
  signal n11587_o : std_logic;
  signal n11588_o : std_logic;
  signal n11589_o : std_logic;
  signal n11590_o : std_logic;
  signal n11591_o : std_logic;
  signal n11592_o : std_logic;
  signal n11593_o : std_logic;
  signal n11594_o : std_logic;
  signal n11595_o : std_logic;
  signal n11596_o : std_logic;
  signal n11597_o : std_logic;
  signal n11598_o : std_logic;
  signal n11599_o : std_logic;
  signal n11600_o : std_logic;
  signal n11601_o : std_logic;
  signal n11602_o : std_logic;
  signal n11603_o : std_logic;
  signal n11604_o : std_logic;
  signal n11605_o : std_logic;
  signal n11606_o : std_logic;
  signal n11607_o : std_logic;
  signal n11608_o : std_logic;
  signal n11609_o : std_logic;
  signal n11610_o : std_logic;
  signal n11611_o : std_logic;
  signal n11612_o : std_logic;
  signal n11613_o : std_logic;
  signal n11614_o : std_logic;
  signal n11615_o : std_logic;
  signal n11616_o : std_logic;
  signal n11617_o : std_logic;
  signal n11618_o : std_logic;
  signal n11619_o : std_logic;
  signal n11620_o : std_logic;
  signal n11621_o : std_logic;
  signal n11622_o : std_logic;
  signal n11623_o : std_logic;
  signal n11624_o : std_logic;
  signal n11625_o : std_logic;
  signal n11626_o : std_logic_vector (3 downto 0);
  signal n11627_o : std_logic_vector (3 downto 0);
  signal n11628_o : std_logic_vector (3 downto 0);
  signal n11629_o : std_logic_vector (3 downto 0);
  signal n11630_o : std_logic_vector (3 downto 0);
  signal n11631_o : std_logic_vector (3 downto 0);
  signal n11632_o : std_logic_vector (3 downto 0);
  signal n11633_o : std_logic_vector (3 downto 0);
  signal n11634_o : std_logic_vector (3 downto 0);
  signal n11635_o : std_logic_vector (3 downto 0);
  signal n11636_o : std_logic_vector (2 downto 0);
  signal n11637_o : std_logic_vector (15 downto 0);
  signal n11638_o : std_logic_vector (15 downto 0);
  signal n11639_o : std_logic_vector (10 downto 0);
  signal n11640_o : std_logic_vector (42 downto 0);
  signal n11641_o : std_logic_vector (41 downto 0);
  signal n11642_o : std_logic_vector (42 downto 0);
  signal n11643_o : std_logic_vector (42 downto 0);
  signal n11659_o : std_logic_vector (40 downto 0);
  signal n11660_o : std_logic;
  signal n11665_o : std_logic;
  signal n11666_o : std_logic;
  signal n11669_o : std_logic;
  signal n11670_o : std_logic;
  signal n11673_o : std_logic;
  signal n11674_o : std_logic;
  signal n11681_o : std_logic;
  signal n11685_o : std_logic;
  signal n11687_o : std_logic;
  signal n11688_o : std_logic;
  signal n11690_o : std_logic;
  signal n11696_o : std_logic;
  signal n11699_o : std_logic;
  signal n11701_o : std_logic;
  signal n11702_o : std_logic;
  signal n11703_o : std_logic;
  signal n11704_o : std_logic;
  signal n11705_o : std_logic;
  signal n11706_o : std_logic;
  signal n11707_o : std_logic;
  signal n11708_o : std_logic;
  signal n11709_o : std_logic;
  signal n11710_o : std_logic;
  signal n11711_o : std_logic;
  signal n11712_o : std_logic;
  signal n11713_o : std_logic;
  signal n11714_o : std_logic;
  signal n11715_o : std_logic;
  signal n11716_o : std_logic;
  signal n11717_o : std_logic;
  signal n11718_o : std_logic;
  signal n11719_o : std_logic;
  signal n11720_o : std_logic;
  signal n11721_o : std_logic;
  signal n11722_o : std_logic;
  signal n11723_o : std_logic;
  signal n11724_o : std_logic;
  signal n11725_o : std_logic;
  signal n11726_o : std_logic_vector (3 downto 0);
  signal n11727_o : std_logic_vector (3 downto 0);
  signal n11728_o : std_logic_vector (3 downto 0);
  signal n11729_o : std_logic_vector (3 downto 0);
  signal n11730_o : std_logic_vector (3 downto 0);
  signal n11731_o : std_logic_vector (3 downto 0);
  signal n11732_o : std_logic_vector (15 downto 0);
  signal n11733_o : std_logic_vector (8 downto 0);
  signal n11734_o : std_logic_vector (24 downto 0);
  signal n11735_o : std_logic_vector (23 downto 0);
  signal n11736_o : std_logic_vector (24 downto 0);
  signal n11737_o : std_logic_vector (24 downto 0);
  signal n11738_o : std_logic_vector (24 downto 0);
  signal n11741_o : std_logic;
  signal n11756_o : std_logic_vector (42 downto 0);
  signal n11759_o : std_logic_vector (42 downto 0);
  signal n11771_o : std_logic_vector (42 downto 0);
  signal n11774_o : std_logic_vector (42 downto 0);
  signal n11791_o : std_logic_vector (43 downto 0);
  signal n11797_o : std_logic;
  signal n11798_o : std_logic;
  signal n11801_o : std_logic;
  signal n11802_o : std_logic;
  signal n11815_o : std_logic_vector (43 downto 0);
  signal n11821_o : std_logic;
  signal n11822_o : std_logic;
  signal n11825_o : std_logic;
  signal n11826_o : std_logic;
  signal n11839_o : std_logic_vector (43 downto 0);
  signal n11850_o : std_logic_vector (42 downto 0);
  signal n11851_o : std_logic;
  signal n11856_o : std_logic;
  signal n11857_o : std_logic;
  signal n11860_o : std_logic;
  signal n11861_o : std_logic;
  signal n11864_o : std_logic;
  signal n11865_o : std_logic;
  signal n11872_o : std_logic;
  signal n11878_o : std_logic;
  signal n11879_o : std_logic;
  signal n11880_o : std_logic;
  signal n11881_o : std_logic;
  signal n11882_o : std_logic;
  signal n11883_o : std_logic;
  signal n11884_o : std_logic;
  signal n11885_o : std_logic;
  signal n11886_o : std_logic;
  signal n11887_o : std_logic;
  signal n11888_o : std_logic;
  signal n11889_o : std_logic;
  signal n11890_o : std_logic;
  signal n11891_o : std_logic;
  signal n11892_o : std_logic;
  signal n11893_o : std_logic;
  signal n11894_o : std_logic;
  signal n11895_o : std_logic;
  signal n11896_o : std_logic;
  signal n11897_o : std_logic;
  signal n11898_o : std_logic;
  signal n11899_o : std_logic;
  signal n11900_o : std_logic;
  signal n11901_o : std_logic;
  signal n11902_o : std_logic;
  signal n11903_o : std_logic;
  signal n11904_o : std_logic;
  signal n11905_o : std_logic;
  signal n11906_o : std_logic;
  signal n11907_o : std_logic;
  signal n11908_o : std_logic;
  signal n11909_o : std_logic;
  signal n11910_o : std_logic;
  signal n11911_o : std_logic;
  signal n11912_o : std_logic;
  signal n11913_o : std_logic;
  signal n11914_o : std_logic;
  signal n11915_o : std_logic;
  signal n11916_o : std_logic;
  signal n11917_o : std_logic;
  signal n11918_o : std_logic;
  signal n11919_o : std_logic;
  signal n11920_o : std_logic;
  signal n11921_o : std_logic_vector (3 downto 0);
  signal n11922_o : std_logic_vector (3 downto 0);
  signal n11923_o : std_logic_vector (3 downto 0);
  signal n11924_o : std_logic_vector (3 downto 0);
  signal n11925_o : std_logic_vector (3 downto 0);
  signal n11926_o : std_logic_vector (3 downto 0);
  signal n11927_o : std_logic_vector (3 downto 0);
  signal n11928_o : std_logic_vector (3 downto 0);
  signal n11929_o : std_logic_vector (3 downto 0);
  signal n11930_o : std_logic_vector (3 downto 0);
  signal n11931_o : std_logic_vector (2 downto 0);
  signal n11932_o : std_logic_vector (15 downto 0);
  signal n11933_o : std_logic_vector (15 downto 0);
  signal n11934_o : std_logic_vector (10 downto 0);
  signal n11935_o : std_logic_vector (42 downto 0);
  signal n11936_o : std_logic_vector (41 downto 0);
  signal n11937_o : std_logic_vector (42 downto 0);
  signal n11938_o : std_logic_vector (42 downto 0);
  signal n11956_o : std_logic_vector (43 downto 0);
  signal n11962_o : std_logic;
  signal n11963_o : std_logic;
  signal n11966_o : std_logic;
  signal n11967_o : std_logic;
  signal n11980_o : std_logic_vector (27 downto 0);
  signal n11986_o : std_logic;
  signal n11987_o : std_logic;
  signal n11990_o : std_logic;
  signal n11991_o : std_logic;
  constant n11993_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n11994_o : std_logic_vector (15 downto 0);
  signal n11995_o : std_logic_vector (43 downto 0);
  signal n12006_o : std_logic_vector (43 downto 0);
  signal n12017_o : std_logic_vector (42 downto 0);
  signal n12018_o : std_logic;
  signal n12023_o : std_logic;
  signal n12024_o : std_logic;
  signal n12027_o : std_logic;
  signal n12028_o : std_logic;
  signal n12031_o : std_logic;
  signal n12032_o : std_logic;
  signal n12039_o : std_logic;
  signal n12045_o : std_logic;
  signal n12046_o : std_logic;
  signal n12047_o : std_logic;
  signal n12048_o : std_logic;
  signal n12049_o : std_logic;
  signal n12050_o : std_logic;
  signal n12051_o : std_logic;
  signal n12052_o : std_logic;
  signal n12053_o : std_logic;
  signal n12054_o : std_logic;
  signal n12055_o : std_logic;
  signal n12056_o : std_logic;
  signal n12057_o : std_logic;
  signal n12058_o : std_logic;
  signal n12059_o : std_logic;
  signal n12060_o : std_logic;
  signal n12061_o : std_logic;
  signal n12062_o : std_logic;
  signal n12063_o : std_logic;
  signal n12064_o : std_logic;
  signal n12065_o : std_logic;
  signal n12066_o : std_logic;
  signal n12067_o : std_logic;
  signal n12068_o : std_logic;
  signal n12069_o : std_logic;
  signal n12070_o : std_logic;
  signal n12071_o : std_logic;
  signal n12072_o : std_logic;
  signal n12073_o : std_logic;
  signal n12074_o : std_logic;
  signal n12075_o : std_logic;
  signal n12076_o : std_logic;
  signal n12077_o : std_logic;
  signal n12078_o : std_logic;
  signal n12079_o : std_logic;
  signal n12080_o : std_logic;
  signal n12081_o : std_logic;
  signal n12082_o : std_logic;
  signal n12083_o : std_logic;
  signal n12084_o : std_logic;
  signal n12085_o : std_logic;
  signal n12086_o : std_logic;
  signal n12087_o : std_logic;
  signal n12088_o : std_logic_vector (3 downto 0);
  signal n12089_o : std_logic_vector (3 downto 0);
  signal n12090_o : std_logic_vector (3 downto 0);
  signal n12091_o : std_logic_vector (3 downto 0);
  signal n12092_o : std_logic_vector (3 downto 0);
  signal n12093_o : std_logic_vector (3 downto 0);
  signal n12094_o : std_logic_vector (3 downto 0);
  signal n12095_o : std_logic_vector (3 downto 0);
  signal n12096_o : std_logic_vector (3 downto 0);
  signal n12097_o : std_logic_vector (3 downto 0);
  signal n12098_o : std_logic_vector (2 downto 0);
  signal n12099_o : std_logic_vector (15 downto 0);
  signal n12100_o : std_logic_vector (15 downto 0);
  signal n12101_o : std_logic_vector (10 downto 0);
  signal n12102_o : std_logic_vector (42 downto 0);
  signal n12103_o : std_logic_vector (41 downto 0);
  signal n12104_o : std_logic_vector (42 downto 0);
  signal n12105_o : std_logic_vector (42 downto 0);
  signal n12121_o : std_logic_vector (40 downto 0);
  signal n12122_o : std_logic;
  signal n12127_o : std_logic;
  signal n12128_o : std_logic;
  signal n12131_o : std_logic;
  signal n12132_o : std_logic;
  signal n12135_o : std_logic;
  signal n12136_o : std_logic;
  signal n12143_o : std_logic;
  signal n12147_o : std_logic;
  signal n12149_o : std_logic;
  signal n12150_o : std_logic;
  signal n12152_o : std_logic;
  signal n12158_o : std_logic;
  signal n12161_o : std_logic;
  signal n12163_o : std_logic;
  signal n12164_o : std_logic;
  signal n12165_o : std_logic;
  signal n12166_o : std_logic;
  signal n12167_o : std_logic;
  signal n12168_o : std_logic;
  signal n12169_o : std_logic;
  signal n12170_o : std_logic;
  signal n12171_o : std_logic;
  signal n12172_o : std_logic;
  signal n12173_o : std_logic;
  signal n12174_o : std_logic;
  signal n12175_o : std_logic;
  signal n12176_o : std_logic;
  signal n12177_o : std_logic;
  signal n12178_o : std_logic;
  signal n12179_o : std_logic;
  signal n12180_o : std_logic;
  signal n12181_o : std_logic;
  signal n12182_o : std_logic;
  signal n12183_o : std_logic;
  signal n12184_o : std_logic;
  signal n12185_o : std_logic;
  signal n12186_o : std_logic;
  signal n12187_o : std_logic;
  signal n12188_o : std_logic_vector (3 downto 0);
  signal n12189_o : std_logic_vector (3 downto 0);
  signal n12190_o : std_logic_vector (3 downto 0);
  signal n12191_o : std_logic_vector (3 downto 0);
  signal n12192_o : std_logic_vector (3 downto 0);
  signal n12193_o : std_logic_vector (3 downto 0);
  signal n12194_o : std_logic_vector (15 downto 0);
  signal n12195_o : std_logic_vector (8 downto 0);
  signal n12196_o : std_logic_vector (24 downto 0);
  signal n12197_o : std_logic_vector (23 downto 0);
  signal n12198_o : std_logic_vector (24 downto 0);
  signal n12199_o : std_logic_vector (24 downto 0);
  signal n12200_o : std_logic_vector (24 downto 0);
  signal n12215_o : std_logic_vector (42 downto 0);
  signal n12218_o : std_logic_vector (42 downto 0);
  signal n12230_o : std_logic_vector (42 downto 0);
  signal n12233_o : std_logic_vector (42 downto 0);
  signal n12250_o : std_logic_vector (43 downto 0);
  signal n12256_o : std_logic;
  signal n12257_o : std_logic;
  signal n12260_o : std_logic;
  signal n12261_o : std_logic;
  signal n12274_o : std_logic_vector (43 downto 0);
  signal n12280_o : std_logic;
  signal n12281_o : std_logic;
  signal n12284_o : std_logic;
  signal n12285_o : std_logic;
  signal n12298_o : std_logic_vector (43 downto 0);
  signal n12309_o : std_logic_vector (42 downto 0);
  signal n12310_o : std_logic;
  signal n12315_o : std_logic;
  signal n12316_o : std_logic;
  signal n12319_o : std_logic;
  signal n12320_o : std_logic;
  signal n12323_o : std_logic;
  signal n12324_o : std_logic;
  signal n12331_o : std_logic;
  signal n12337_o : std_logic;
  signal n12338_o : std_logic;
  signal n12339_o : std_logic;
  signal n12340_o : std_logic;
  signal n12341_o : std_logic;
  signal n12342_o : std_logic;
  signal n12343_o : std_logic;
  signal n12344_o : std_logic;
  signal n12345_o : std_logic;
  signal n12346_o : std_logic;
  signal n12347_o : std_logic;
  signal n12348_o : std_logic;
  signal n12349_o : std_logic;
  signal n12350_o : std_logic;
  signal n12351_o : std_logic;
  signal n12352_o : std_logic;
  signal n12353_o : std_logic;
  signal n12354_o : std_logic;
  signal n12355_o : std_logic;
  signal n12356_o : std_logic;
  signal n12357_o : std_logic;
  signal n12358_o : std_logic;
  signal n12359_o : std_logic;
  signal n12360_o : std_logic;
  signal n12361_o : std_logic;
  signal n12362_o : std_logic;
  signal n12363_o : std_logic;
  signal n12364_o : std_logic;
  signal n12365_o : std_logic;
  signal n12366_o : std_logic;
  signal n12367_o : std_logic;
  signal n12368_o : std_logic;
  signal n12369_o : std_logic;
  signal n12370_o : std_logic;
  signal n12371_o : std_logic;
  signal n12372_o : std_logic;
  signal n12373_o : std_logic;
  signal n12374_o : std_logic;
  signal n12375_o : std_logic;
  signal n12376_o : std_logic;
  signal n12377_o : std_logic;
  signal n12378_o : std_logic;
  signal n12379_o : std_logic;
  signal n12380_o : std_logic_vector (3 downto 0);
  signal n12381_o : std_logic_vector (3 downto 0);
  signal n12382_o : std_logic_vector (3 downto 0);
  signal n12383_o : std_logic_vector (3 downto 0);
  signal n12384_o : std_logic_vector (3 downto 0);
  signal n12385_o : std_logic_vector (3 downto 0);
  signal n12386_o : std_logic_vector (3 downto 0);
  signal n12387_o : std_logic_vector (3 downto 0);
  signal n12388_o : std_logic_vector (3 downto 0);
  signal n12389_o : std_logic_vector (3 downto 0);
  signal n12390_o : std_logic_vector (2 downto 0);
  signal n12391_o : std_logic_vector (15 downto 0);
  signal n12392_o : std_logic_vector (15 downto 0);
  signal n12393_o : std_logic_vector (10 downto 0);
  signal n12394_o : std_logic_vector (42 downto 0);
  signal n12395_o : std_logic_vector (41 downto 0);
  signal n12396_o : std_logic_vector (42 downto 0);
  signal n12397_o : std_logic_vector (42 downto 0);
  signal n12413_o : std_logic_vector (40 downto 0);
  signal n12414_o : std_logic;
  signal n12419_o : std_logic;
  signal n12420_o : std_logic;
  signal n12423_o : std_logic;
  signal n12424_o : std_logic;
  signal n12427_o : std_logic;
  signal n12428_o : std_logic;
  signal n12435_o : std_logic;
  signal n12439_o : std_logic;
  signal n12441_o : std_logic;
  signal n12442_o : std_logic;
  signal n12444_o : std_logic;
  signal n12450_o : std_logic;
  signal n12453_o : std_logic;
  signal n12455_o : std_logic;
  signal n12456_o : std_logic;
  signal n12457_o : std_logic;
  signal n12458_o : std_logic;
  signal n12459_o : std_logic;
  signal n12460_o : std_logic;
  signal n12461_o : std_logic;
  signal n12462_o : std_logic;
  signal n12463_o : std_logic;
  signal n12464_o : std_logic;
  signal n12465_o : std_logic;
  signal n12466_o : std_logic;
  signal n12467_o : std_logic;
  signal n12468_o : std_logic;
  signal n12469_o : std_logic;
  signal n12470_o : std_logic;
  signal n12471_o : std_logic;
  signal n12472_o : std_logic;
  signal n12473_o : std_logic;
  signal n12474_o : std_logic;
  signal n12475_o : std_logic;
  signal n12476_o : std_logic;
  signal n12477_o : std_logic;
  signal n12478_o : std_logic;
  signal n12479_o : std_logic;
  signal n12480_o : std_logic_vector (3 downto 0);
  signal n12481_o : std_logic_vector (3 downto 0);
  signal n12482_o : std_logic_vector (3 downto 0);
  signal n12483_o : std_logic_vector (3 downto 0);
  signal n12484_o : std_logic_vector (3 downto 0);
  signal n12485_o : std_logic_vector (3 downto 0);
  signal n12486_o : std_logic_vector (15 downto 0);
  signal n12487_o : std_logic_vector (8 downto 0);
  signal n12488_o : std_logic_vector (24 downto 0);
  signal n12489_o : std_logic_vector (23 downto 0);
  signal n12490_o : std_logic_vector (24 downto 0);
  signal n12491_o : std_logic_vector (24 downto 0);
  signal n12492_o : std_logic_vector (24 downto 0);
  signal n12495_o : std_logic;
  signal n12496_o : std_logic_vector (2 downto 0);
  signal n12497_o : std_logic_vector (24 downto 0);
  signal n12498_o : std_logic_vector (24 downto 0);
  signal n12499_o : std_logic_vector (24 downto 0);
  signal n12500_o : std_logic_vector (24 downto 0);
  signal n12528_o : std_logic;
  signal n12529_o : std_logic_vector (24 downto 0);
  signal n12530_q : std_logic_vector (24 downto 0);
  signal n12531_o : std_logic;
  signal n12532_o : std_logic_vector (24 downto 0);
  signal n12533_q : std_logic_vector (24 downto 0);
  signal n12534_q : std_logic_vector (24 downto 0);
  signal n12535_q : std_logic_vector (24 downto 0);
  signal n12551_o : std_logic_vector (22 downto 0);
  signal n12552_o : std_logic;
  signal n12557_o : std_logic;
  signal n12558_o : std_logic;
  signal n12561_o : std_logic;
  signal n12562_o : std_logic;
  signal n12565_o : std_logic;
  signal n12566_o : std_logic;
  signal n12573_o : std_logic;
  signal n12577_o : std_logic;
  signal n12579_o : std_logic;
  signal n12580_o : std_logic;
  signal n12582_o : std_logic;
  signal n12588_o : std_logic;
  signal n12591_o : std_logic;
  signal n12593_o : std_logic;
  signal n12594_o : std_logic;
  signal n12595_o : std_logic;
  signal n12596_o : std_logic;
  signal n12597_o : std_logic;
  signal n12598_o : std_logic;
  signal n12599_o : std_logic;
  signal n12600_o : std_logic;
  signal n12601_o : std_logic;
  signal n12602_o : std_logic;
  signal n12603_o : std_logic;
  signal n12604_o : std_logic;
  signal n12605_o : std_logic;
  signal n12606_o : std_logic;
  signal n12607_o : std_logic;
  signal n12608_o : std_logic;
  signal n12609_o : std_logic;
  signal n12610_o : std_logic;
  signal n12611_o : std_logic_vector (3 downto 0);
  signal n12612_o : std_logic_vector (3 downto 0);
  signal n12613_o : std_logic_vector (3 downto 0);
  signal n12614_o : std_logic_vector (3 downto 0);
  signal n12615_o : std_logic_vector (1 downto 0);
  signal n12616_o : std_logic_vector (15 downto 0);
  signal n12617_o : std_logic_vector (17 downto 0);
  signal n12618_o : std_logic_vector (16 downto 0);
  signal n12619_o : std_logic_vector (17 downto 0);
  signal n12620_o : std_logic_vector (17 downto 0);
  signal n12621_o : std_logic_vector (17 downto 0);
begin
  ready_o <= n11418_o;
  valid_o <= n11423_o;
  data_o <= n12621_o;
  -- ../BiquadFilter/BiquadFilter.vhd:26:12
  state_reg <= n11414_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:12
  x_reg <= n12530_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:19
  y_reg <= n12533_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:26
  w_reg <= n12534_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:33
  v_reg <= n12535_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:33:15
  -- n11392_o <= '1' when rising_edge (clk_i) else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:36:21
  n11394_o <= state_reg when valid_i = '0' else "01";
  -- ../BiquadFilter/BiquadFilter.vhd:35:17
  n11396_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:39:17
  n11398_o <= '1' when state_reg = "01" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:41:17
  n11400_o <= '1' when state_reg = "10" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:44:21
  n11402_o <= state_reg when ready_i = '0' else "00";
  -- ../BiquadFilter/BiquadFilter.vhd:43:17
  n11404_o <= '1' when state_reg = "11" else '0';
  -- ../fixed_pkg.vhd:183:17
  n11405_o <= n11404_o & n11400_o & n11398_o & n11396_o;
  -- ../BiquadFilter/BiquadFilter.vhd:34:13
  with n11405_o select n11409_o <=
    n11402_o when "1000",
    "11" when "0100",
    "10" when "0010",
    n11394_o when "0001",
    "XX" when others;
  -- ../BiquadFilter/BiquadFilter.vhd:33:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n11414_q <= "00";
    elsif rising_edge (clk_i) then
      n11414_q <= n11409_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:51:35
  n11417_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:51:20
  n11418_o <= '0' when n11417_o = '0' else '1';
  -- ../BiquadFilter/BiquadFilter.vhd:52:35
  n11422_o <= '1' when state_reg = "11" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:52:20
  n11423_o <= '0' when n11422_o = '0' else '1';
  -- ../BiquadFilter/BiquadFilter.vhd:59:15
  -- n11426_o <= '1' when rising_edge (clk_i) else '0';
  -- ../fixed_pkg.vhd:168:39
  n11442_o <= std_logic_vector (resize (signed (data_i), 20));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n11448_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n11449_o <= n11448_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n11450: postponed assert n11449_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n11452_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n11453_o <= n11452_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n11454: postponed assert n11453_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:170:18
  n11456_o <= n11455_o (4 downto 0);
  n11457_o <= n11442_o & n11456_o;
  -- ../BiquadFilter/BiquadFilter.vhd:62:21
  n11458_o <= x_reg when valid_i = '0' else n11457_o;
  -- ../BiquadFilter/BiquadFilter.vhd:61:17
  n11460_o <= '1' when state_reg = "00" else '0';
  -- ../fixed_pkg.vhd:266:100
  n11474_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n11477_o <= std_logic_vector (resize (signed (n11474_o) * signed'("0000000000000000000000000000000011000000101"), 43));
  -- ../fixed_pkg.vhd:168:39
  n11494_o <= std_logic_vector (resize (signed (n11477_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n11500_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n11501_o <= n11500_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n11502: postponed assert n11501_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n11504_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n11505_o <= n11504_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n11506: postponed assert n11505_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n11518_o <= std_logic_vector (resize (signed (w_reg), 28));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n11524_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n11525_o <= n11524_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n11526: postponed assert n11525_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n11528_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n11529_o <= n11528_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n11530: postponed assert n11529_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:24:14
  n11532_o <= n11531_o (15 downto 0);
  -- ../fixed_pkg.vhd:24:14
  n11533_o <= n11518_o & n11532_o;
  -- ../fixed_pkg.vhd:255:67
  n11544_o <= std_logic_vector (unsigned (n11494_o) + unsigned (n11533_o));
  -- ../fixed_pkg.vhd:168:39
  n11555_o <= n11544_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n11556_o <= n11544_o (43);
  -- ../fixed_pkg.vhd:173:9
  n11561_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n11562_o <= n11561_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n11563: postponed assert n11562_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n11565_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n11566_o <= n11565_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n11567: postponed assert n11566_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n11569_o <= n11544_o (42);
  -- ../fixed_pkg.vhd:183:27
  n11570_o <= '1' when n11569_o /= n11556_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n11577_o <= '0' when n11570_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n11583_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11584_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11585_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11586_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11587_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11588_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11589_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11590_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11591_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11592_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11593_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11594_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11595_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11596_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11597_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11598_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11599_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11600_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11601_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11602_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11603_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11604_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11605_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11606_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11607_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11608_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11609_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11610_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11611_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11612_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11613_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11614_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11615_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11616_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11617_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11618_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11619_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11620_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11621_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11622_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11623_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11624_o <= not n11556_o;
  -- ../fixed_pkg.vhd:194:31
  n11625_o <= not n11556_o;
  n11626_o <= n11583_o & n11584_o & n11585_o & n11586_o;
  -- ../fixed_pkg.vhd:169:40
  n11627_o <= n11587_o & n11588_o & n11589_o & n11590_o;
  -- ../fixed_pkg.vhd:9:14
  n11628_o <= n11591_o & n11592_o & n11593_o & n11594_o;
  -- ../fixed_pkg.vhd:9:14
  n11629_o <= n11595_o & n11596_o & n11597_o & n11598_o;
  n11630_o <= n11599_o & n11600_o & n11601_o & n11602_o;
  -- ../fixed_pkg.vhd:9:14
  n11631_o <= n11603_o & n11604_o & n11605_o & n11606_o;
  -- ../fixed_pkg.vhd:24:14
  n11632_o <= n11607_o & n11608_o & n11609_o & n11610_o;
  -- ../fixed_pkg.vhd:24:14
  n11633_o <= n11611_o & n11612_o & n11613_o & n11614_o;
  n11634_o <= n11615_o & n11616_o & n11617_o & n11618_o;
  -- ../fixed_pkg.vhd:24:14
  n11635_o <= n11619_o & n11620_o & n11621_o & n11622_o;
  n11636_o <= n11623_o & n11624_o & n11625_o;
  -- ../fixed_pkg.vhd:171:18
  n11637_o <= n11626_o & n11627_o & n11628_o & n11629_o;
  n11638_o <= n11630_o & n11631_o & n11632_o & n11633_o;
  -- ../fixed_pkg.vhd:170:18
  n11639_o <= n11634_o & n11635_o & n11636_o;
  n11640_o <= n11637_o & n11638_o & n11639_o;
  -- ../fixed_pkg.vhd:169:40
  n11641_o <= n11640_o (41 downto 0);
  -- ../fixed_pkg.vhd:9:14
  n11642_o <= n11556_o & n11641_o;
  -- ../fixed_pkg.vhd:193:9
  n11643_o <= n11555_o when n11577_o = '0' else n11642_o;
  -- ../fixed_pkg.vhd:168:39
  n11659_o <= n11643_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n11660_o <= n11643_o (42);
  -- ../fixed_pkg.vhd:173:9
  n11665_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n11666_o <= n11665_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n11667: postponed assert n11666_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n11669_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n11670_o <= n11669_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n11671: postponed assert n11670_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n11673_o <= n11643_o (41);
  -- ../fixed_pkg.vhd:183:27
  n11674_o <= '1' when n11673_o /= n11660_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n11681_o <= '0' when n11674_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n11685_o <= '1' when n11674_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n11687_o <= n11643_o (40);
  -- ../fixed_pkg.vhd:183:27
  n11688_o <= '1' when n11687_o /= n11660_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n11690_o <= n11681_o when n11699_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n11696_o <= n11688_o and n11685_o;
  -- ../fixed_pkg.vhd:183:17
  n11699_o <= n11685_o and n11696_o;
  -- ../fixed_pkg.vhd:194:31
  n11701_o <= not n11660_o;
  -- ../fixed_pkg.vhd:194:31
  n11702_o <= not n11660_o;
  -- ../fixed_pkg.vhd:194:31
  n11703_o <= not n11660_o;
  -- ../fixed_pkg.vhd:194:31
  n11704_o <= not n11660_o;
  -- ../fixed_pkg.vhd:194:31
  n11705_o <= not n11660_o;
  -- ../fixed_pkg.vhd:194:31
  n11706_o <= not n11660_o;
  -- ../fixed_pkg.vhd:194:31
  n11707_o <= not n11660_o;
  -- ../fixed_pkg.vhd:194:31
  n11708_o <= not n11660_o;
  -- ../fixed_pkg.vhd:194:31
  n11709_o <= not n11660_o;
  -- ../fixed_pkg.vhd:194:31
  n11710_o <= not n11660_o;
  -- ../fixed_pkg.vhd:194:31
  n11711_o <= not n11660_o;
  -- ../fixed_pkg.vhd:194:31
  n11712_o <= not n11660_o;
  -- ../fixed_pkg.vhd:194:31
  n11713_o <= not n11660_o;
  -- ../fixed_pkg.vhd:194:31
  n11714_o <= not n11660_o;
  -- ../fixed_pkg.vhd:194:31
  n11715_o <= not n11660_o;
  -- ../fixed_pkg.vhd:194:31
  n11716_o <= not n11660_o;
  -- ../fixed_pkg.vhd:194:31
  n11717_o <= not n11660_o;
  -- ../fixed_pkg.vhd:194:31
  n11718_o <= not n11660_o;
  -- ../fixed_pkg.vhd:194:31
  n11719_o <= not n11660_o;
  -- ../fixed_pkg.vhd:194:31
  n11720_o <= not n11660_o;
  -- ../fixed_pkg.vhd:194:31
  n11721_o <= not n11660_o;
  -- ../fixed_pkg.vhd:194:31
  n11722_o <= not n11660_o;
  -- ../fixed_pkg.vhd:194:31
  n11723_o <= not n11660_o;
  -- ../fixed_pkg.vhd:194:31
  n11724_o <= not n11660_o;
  -- ../fixed_pkg.vhd:194:31
  n11725_o <= not n11660_o;
  -- ../fixed_pkg.vhd:171:18
  n11726_o <= n11701_o & n11702_o & n11703_o & n11704_o;
  -- ../fixed_pkg.vhd:9:14
  n11727_o <= n11705_o & n11706_o & n11707_o & n11708_o;
  -- ../fixed_pkg.vhd:9:14
  n11728_o <= n11709_o & n11710_o & n11711_o & n11712_o;
  -- ../fixed_pkg.vhd:183:17
  n11729_o <= n11713_o & n11714_o & n11715_o & n11716_o;
  -- ../fixed_pkg.vhd:9:14
  n11730_o <= n11717_o & n11718_o & n11719_o & n11720_o;
  -- ../fixed_pkg.vhd:40:14
  n11731_o <= n11721_o & n11722_o & n11723_o & n11724_o;
  -- ../fixed_pkg.vhd:40:14
  n11732_o <= n11726_o & n11727_o & n11728_o & n11729_o;
  -- ../fixed_pkg.vhd:9:14
  n11733_o <= n11730_o & n11731_o & n11725_o;
  -- ../fixed_pkg.vhd:40:14
  n11734_o <= n11732_o & n11733_o;
  -- ../fixed_pkg.vhd:183:17
  n11735_o <= n11734_o (23 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n11736_o <= n11659_o (40 downto 16);
  -- ../fixed_pkg.vhd:183:17
  n11737_o <= n11660_o & n11735_o;
  -- ../fixed_pkg.vhd:193:9
  n11738_o <= n11736_o when n11690_o = '0' else n11737_o;
  -- ../BiquadFilter/BiquadFilter.vhd:65:17
  n11741_o <= '1' when state_reg = "01" else '0';
  -- ../fixed_pkg.vhd:266:100
  n11756_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n11759_o <= std_logic_vector (resize (signed (n11756_o) * signed'("0000000000000000000000000000000000000000000"), 43));
  -- ../fixed_pkg.vhd:266:100
  n11771_o <= std_logic_vector (resize (signed (y_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n11774_o <= std_logic_vector (resize (signed (n11771_o) * signed'("0000000000011111111111111100100100111100010"), 43));
  -- ../fixed_pkg.vhd:168:39
  n11791_o <= std_logic_vector (resize (signed (n11759_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n11797_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n11798_o <= n11797_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n11799: postponed assert n11798_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n11801_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n11802_o <= n11801_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n11803: postponed assert n11802_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n11815_o <= std_logic_vector (resize (signed (n11774_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n11821_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n11822_o <= n11821_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n11823: postponed assert n11822_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n11825_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n11826_o <= n11825_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n11827: postponed assert n11826_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:240:67
  n11839_o <= std_logic_vector (unsigned (n11791_o) - unsigned (n11815_o));
  -- ../fixed_pkg.vhd:168:39
  n11850_o <= n11839_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n11851_o <= n11839_o (43);
  -- ../fixed_pkg.vhd:173:9
  n11856_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n11857_o <= n11856_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n11858: postponed assert n11857_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n11860_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n11861_o <= n11860_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n11862: postponed assert n11861_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n11864_o <= n11839_o (42);
  -- ../fixed_pkg.vhd:183:27
  n11865_o <= '1' when n11864_o /= n11851_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n11872_o <= '0' when n11865_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n11878_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11879_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11880_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11881_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11882_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11883_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11884_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11885_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11886_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11887_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11888_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11889_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11890_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11891_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11892_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11893_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11894_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11895_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11896_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11897_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11898_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11899_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11900_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11901_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11902_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11903_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11904_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11905_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11906_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11907_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11908_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11909_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11910_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11911_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11912_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11913_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11914_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11915_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11916_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11917_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11918_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11919_o <= not n11851_o;
  -- ../fixed_pkg.vhd:194:31
  n11920_o <= not n11851_o;
  n11921_o <= n11878_o & n11879_o & n11880_o & n11881_o;
  n11922_o <= n11882_o & n11883_o & n11884_o & n11885_o;
  n11923_o <= n11886_o & n11887_o & n11888_o & n11889_o;
  n11924_o <= n11890_o & n11891_o & n11892_o & n11893_o;
  n11925_o <= n11894_o & n11895_o & n11896_o & n11897_o;
  n11926_o <= n11898_o & n11899_o & n11900_o & n11901_o;
  n11927_o <= n11902_o & n11903_o & n11904_o & n11905_o;
  n11928_o <= n11906_o & n11907_o & n11908_o & n11909_o;
  n11929_o <= n11910_o & n11911_o & n11912_o & n11913_o;
  n11930_o <= n11914_o & n11915_o & n11916_o & n11917_o;
  n11931_o <= n11918_o & n11919_o & n11920_o;
  n11932_o <= n11921_o & n11922_o & n11923_o & n11924_o;
  n11933_o <= n11925_o & n11926_o & n11927_o & n11928_o;
  n11934_o <= n11929_o & n11930_o & n11931_o;
  n11935_o <= n11932_o & n11933_o & n11934_o;
  n11936_o <= n11935_o (41 downto 0);
  n11937_o <= n11851_o & n11936_o;
  -- ../fixed_pkg.vhd:193:9
  n11938_o <= n11850_o when n11872_o = '0' else n11937_o;
  -- ../fixed_pkg.vhd:168:39
  n11956_o <= std_logic_vector (resize (signed (n11938_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n11962_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n11963_o <= n11962_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n11964: postponed assert n11963_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n11966_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n11967_o <= n11966_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n11968: postponed assert n11967_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n11980_o <= std_logic_vector (resize (signed (v_reg), 28));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n11986_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n11987_o <= n11986_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n11988: postponed assert n11987_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n11990_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n11991_o <= n11990_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n11992: postponed assert n11991_o = '1' severity error; --  assert
  n11994_o <= n11993_o (15 downto 0);
  n11995_o <= n11980_o & n11994_o;
  -- ../fixed_pkg.vhd:255:67
  n12006_o <= std_logic_vector (unsigned (n11956_o) + unsigned (n11995_o));
  -- ../fixed_pkg.vhd:168:39
  n12017_o <= n12006_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n12018_o <= n12006_o (43);
  -- ../fixed_pkg.vhd:173:9
  n12023_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n12024_o <= n12023_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n12025: postponed assert n12024_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n12027_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n12028_o <= n12027_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n12029: postponed assert n12028_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n12031_o <= n12006_o (42);
  -- ../fixed_pkg.vhd:183:27
  n12032_o <= '1' when n12031_o /= n12018_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n12039_o <= '0' when n12032_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n12045_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12046_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12047_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12048_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12049_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12050_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12051_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12052_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12053_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12054_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12055_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12056_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12057_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12058_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12059_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12060_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12061_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12062_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12063_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12064_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12065_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12066_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12067_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12068_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12069_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12070_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12071_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12072_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12073_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12074_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12075_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12076_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12077_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12078_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12079_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12080_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12081_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12082_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12083_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12084_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12085_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12086_o <= not n12018_o;
  -- ../fixed_pkg.vhd:194:31
  n12087_o <= not n12018_o;
  n12088_o <= n12045_o & n12046_o & n12047_o & n12048_o;
  n12089_o <= n12049_o & n12050_o & n12051_o & n12052_o;
  n12090_o <= n12053_o & n12054_o & n12055_o & n12056_o;
  n12091_o <= n12057_o & n12058_o & n12059_o & n12060_o;
  n12092_o <= n12061_o & n12062_o & n12063_o & n12064_o;
  n12093_o <= n12065_o & n12066_o & n12067_o & n12068_o;
  n12094_o <= n12069_o & n12070_o & n12071_o & n12072_o;
  n12095_o <= n12073_o & n12074_o & n12075_o & n12076_o;
  n12096_o <= n12077_o & n12078_o & n12079_o & n12080_o;
  n12097_o <= n12081_o & n12082_o & n12083_o & n12084_o;
  n12098_o <= n12085_o & n12086_o & n12087_o;
  n12099_o <= n12088_o & n12089_o & n12090_o & n12091_o;
  n12100_o <= n12092_o & n12093_o & n12094_o & n12095_o;
  n12101_o <= n12096_o & n12097_o & n12098_o;
  n12102_o <= n12099_o & n12100_o & n12101_o;
  n12103_o <= n12102_o (41 downto 0);
  n12104_o <= n12018_o & n12103_o;
  -- ../fixed_pkg.vhd:193:9
  n12105_o <= n12017_o when n12039_o = '0' else n12104_o;
  -- ../fixed_pkg.vhd:168:39
  n12121_o <= n12105_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n12122_o <= n12105_o (42);
  -- ../fixed_pkg.vhd:173:9
  n12127_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n12128_o <= n12127_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n12129: postponed assert n12128_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n12131_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n12132_o <= n12131_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n12133: postponed assert n12132_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n12135_o <= n12105_o (41);
  -- ../fixed_pkg.vhd:183:27
  n12136_o <= '1' when n12135_o /= n12122_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n12143_o <= '0' when n12136_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n12147_o <= '1' when n12136_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n12149_o <= n12105_o (40);
  -- ../fixed_pkg.vhd:183:27
  n12150_o <= '1' when n12149_o /= n12122_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n12152_o <= n12143_o when n12161_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n12158_o <= n12150_o and n12147_o;
  -- ../fixed_pkg.vhd:183:17
  n12161_o <= n12147_o and n12158_o;
  -- ../fixed_pkg.vhd:194:31
  n12163_o <= not n12122_o;
  -- ../fixed_pkg.vhd:194:31
  n12164_o <= not n12122_o;
  -- ../fixed_pkg.vhd:194:31
  n12165_o <= not n12122_o;
  -- ../fixed_pkg.vhd:194:31
  n12166_o <= not n12122_o;
  -- ../fixed_pkg.vhd:194:31
  n12167_o <= not n12122_o;
  -- ../fixed_pkg.vhd:194:31
  n12168_o <= not n12122_o;
  -- ../fixed_pkg.vhd:194:31
  n12169_o <= not n12122_o;
  -- ../fixed_pkg.vhd:194:31
  n12170_o <= not n12122_o;
  -- ../fixed_pkg.vhd:194:31
  n12171_o <= not n12122_o;
  -- ../fixed_pkg.vhd:194:31
  n12172_o <= not n12122_o;
  -- ../fixed_pkg.vhd:194:31
  n12173_o <= not n12122_o;
  -- ../fixed_pkg.vhd:194:31
  n12174_o <= not n12122_o;
  -- ../fixed_pkg.vhd:194:31
  n12175_o <= not n12122_o;
  -- ../fixed_pkg.vhd:194:31
  n12176_o <= not n12122_o;
  -- ../fixed_pkg.vhd:194:31
  n12177_o <= not n12122_o;
  -- ../fixed_pkg.vhd:194:31
  n12178_o <= not n12122_o;
  -- ../fixed_pkg.vhd:194:31
  n12179_o <= not n12122_o;
  -- ../fixed_pkg.vhd:194:31
  n12180_o <= not n12122_o;
  -- ../fixed_pkg.vhd:194:31
  n12181_o <= not n12122_o;
  -- ../fixed_pkg.vhd:194:31
  n12182_o <= not n12122_o;
  -- ../fixed_pkg.vhd:194:31
  n12183_o <= not n12122_o;
  -- ../fixed_pkg.vhd:194:31
  n12184_o <= not n12122_o;
  -- ../fixed_pkg.vhd:194:31
  n12185_o <= not n12122_o;
  -- ../fixed_pkg.vhd:194:31
  n12186_o <= not n12122_o;
  -- ../fixed_pkg.vhd:194:31
  n12187_o <= not n12122_o;
  n12188_o <= n12163_o & n12164_o & n12165_o & n12166_o;
  n12189_o <= n12167_o & n12168_o & n12169_o & n12170_o;
  n12190_o <= n12171_o & n12172_o & n12173_o & n12174_o;
  n12191_o <= n12175_o & n12176_o & n12177_o & n12178_o;
  n12192_o <= n12179_o & n12180_o & n12181_o & n12182_o;
  n12193_o <= n12183_o & n12184_o & n12185_o & n12186_o;
  n12194_o <= n12188_o & n12189_o & n12190_o & n12191_o;
  n12195_o <= n12192_o & n12193_o & n12187_o;
  n12196_o <= n12194_o & n12195_o;
  n12197_o <= n12196_o (23 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n12198_o <= n12121_o (40 downto 16);
  n12199_o <= n12122_o & n12197_o;
  -- ../fixed_pkg.vhd:193:9
  n12200_o <= n12198_o when n12152_o = '0' else n12199_o;
  -- ../fixed_pkg.vhd:266:100
  n12215_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n12218_o <= std_logic_vector (resize (signed (n12215_o) * signed'("0000000000011111111111111111111100111111011"), 43));
  -- ../fixed_pkg.vhd:266:100
  n12230_o <= std_logic_vector (resize (signed (y_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n12233_o <= std_logic_vector (resize (signed (n12230_o) * signed'("0000000000000000000000000001111001111110101"), 43));
  -- ../fixed_pkg.vhd:168:39
  n12250_o <= std_logic_vector (resize (signed (n12218_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n12256_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n12257_o <= n12256_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n12258: postponed assert n12257_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n12260_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n12261_o <= n12260_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n12262: postponed assert n12261_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n12274_o <= std_logic_vector (resize (signed (n12233_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n12280_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n12281_o <= n12280_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n12282: postponed assert n12281_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n12284_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n12285_o <= n12284_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n12286: postponed assert n12285_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:240:67
  n12298_o <= std_logic_vector (unsigned (n12250_o) - unsigned (n12274_o));
  -- ../fixed_pkg.vhd:168:39
  n12309_o <= n12298_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n12310_o <= n12298_o (43);
  -- ../fixed_pkg.vhd:173:9
  n12315_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n12316_o <= n12315_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n12317: postponed assert n12316_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n12319_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n12320_o <= n12319_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n12321: postponed assert n12320_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n12323_o <= n12298_o (42);
  -- ../fixed_pkg.vhd:183:27
  n12324_o <= '1' when n12323_o /= n12310_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n12331_o <= '0' when n12324_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n12337_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12338_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12339_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12340_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12341_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12342_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12343_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12344_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12345_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12346_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12347_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12348_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12349_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12350_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12351_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12352_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12353_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12354_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12355_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12356_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12357_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12358_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12359_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12360_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12361_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12362_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12363_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12364_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12365_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12366_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12367_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12368_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12369_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12370_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12371_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12372_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12373_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12374_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12375_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12376_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12377_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12378_o <= not n12310_o;
  -- ../fixed_pkg.vhd:194:31
  n12379_o <= not n12310_o;
  n12380_o <= n12337_o & n12338_o & n12339_o & n12340_o;
  n12381_o <= n12341_o & n12342_o & n12343_o & n12344_o;
  n12382_o <= n12345_o & n12346_o & n12347_o & n12348_o;
  n12383_o <= n12349_o & n12350_o & n12351_o & n12352_o;
  n12384_o <= n12353_o & n12354_o & n12355_o & n12356_o;
  n12385_o <= n12357_o & n12358_o & n12359_o & n12360_o;
  n12386_o <= n12361_o & n12362_o & n12363_o & n12364_o;
  n12387_o <= n12365_o & n12366_o & n12367_o & n12368_o;
  n12388_o <= n12369_o & n12370_o & n12371_o & n12372_o;
  n12389_o <= n12373_o & n12374_o & n12375_o & n12376_o;
  n12390_o <= n12377_o & n12378_o & n12379_o;
  n12391_o <= n12380_o & n12381_o & n12382_o & n12383_o;
  n12392_o <= n12384_o & n12385_o & n12386_o & n12387_o;
  n12393_o <= n12388_o & n12389_o & n12390_o;
  n12394_o <= n12391_o & n12392_o & n12393_o;
  n12395_o <= n12394_o (41 downto 0);
  n12396_o <= n12310_o & n12395_o;
  -- ../fixed_pkg.vhd:193:9
  n12397_o <= n12309_o when n12331_o = '0' else n12396_o;
  -- ../fixed_pkg.vhd:168:39
  n12413_o <= n12397_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n12414_o <= n12397_o (42);
  -- ../fixed_pkg.vhd:173:9
  n12419_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n12420_o <= n12419_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n12421: postponed assert n12420_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n12423_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n12424_o <= n12423_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n12425: postponed assert n12424_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n12427_o <= n12397_o (41);
  -- ../fixed_pkg.vhd:183:27
  n12428_o <= '1' when n12427_o /= n12414_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n12435_o <= '0' when n12428_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n12439_o <= '1' when n12428_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n12441_o <= n12397_o (40);
  -- ../fixed_pkg.vhd:183:27
  n12442_o <= '1' when n12441_o /= n12414_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n12444_o <= n12435_o when n12453_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n12450_o <= n12442_o and n12439_o;
  -- ../fixed_pkg.vhd:183:17
  n12453_o <= n12439_o and n12450_o;
  -- ../fixed_pkg.vhd:194:31
  n12455_o <= not n12414_o;
  -- ../fixed_pkg.vhd:194:31
  n12456_o <= not n12414_o;
  -- ../fixed_pkg.vhd:194:31
  n12457_o <= not n12414_o;
  -- ../fixed_pkg.vhd:194:31
  n12458_o <= not n12414_o;
  -- ../fixed_pkg.vhd:194:31
  n12459_o <= not n12414_o;
  -- ../fixed_pkg.vhd:194:31
  n12460_o <= not n12414_o;
  -- ../fixed_pkg.vhd:194:31
  n12461_o <= not n12414_o;
  -- ../fixed_pkg.vhd:194:31
  n12462_o <= not n12414_o;
  -- ../fixed_pkg.vhd:194:31
  n12463_o <= not n12414_o;
  -- ../fixed_pkg.vhd:194:31
  n12464_o <= not n12414_o;
  -- ../fixed_pkg.vhd:194:31
  n12465_o <= not n12414_o;
  -- ../fixed_pkg.vhd:194:31
  n12466_o <= not n12414_o;
  -- ../fixed_pkg.vhd:194:31
  n12467_o <= not n12414_o;
  -- ../fixed_pkg.vhd:194:31
  n12468_o <= not n12414_o;
  -- ../fixed_pkg.vhd:194:31
  n12469_o <= not n12414_o;
  -- ../fixed_pkg.vhd:194:31
  n12470_o <= not n12414_o;
  -- ../fixed_pkg.vhd:194:31
  n12471_o <= not n12414_o;
  -- ../fixed_pkg.vhd:194:31
  n12472_o <= not n12414_o;
  -- ../fixed_pkg.vhd:194:31
  n12473_o <= not n12414_o;
  -- ../fixed_pkg.vhd:194:31
  n12474_o <= not n12414_o;
  -- ../fixed_pkg.vhd:194:31
  n12475_o <= not n12414_o;
  -- ../fixed_pkg.vhd:194:31
  n12476_o <= not n12414_o;
  -- ../fixed_pkg.vhd:194:31
  n12477_o <= not n12414_o;
  -- ../fixed_pkg.vhd:194:31
  n12478_o <= not n12414_o;
  -- ../fixed_pkg.vhd:194:31
  n12479_o <= not n12414_o;
  n12480_o <= n12455_o & n12456_o & n12457_o & n12458_o;
  n12481_o <= n12459_o & n12460_o & n12461_o & n12462_o;
  n12482_o <= n12463_o & n12464_o & n12465_o & n12466_o;
  n12483_o <= n12467_o & n12468_o & n12469_o & n12470_o;
  n12484_o <= n12471_o & n12472_o & n12473_o & n12474_o;
  n12485_o <= n12475_o & n12476_o & n12477_o & n12478_o;
  n12486_o <= n12480_o & n12481_o & n12482_o & n12483_o;
  n12487_o <= n12484_o & n12485_o & n12479_o;
  n12488_o <= n12486_o & n12487_o;
  n12489_o <= n12488_o (23 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n12490_o <= n12413_o (40 downto 16);
  n12491_o <= n12414_o & n12489_o;
  -- ../fixed_pkg.vhd:193:9
  n12492_o <= n12490_o when n12444_o = '0' else n12491_o;
  -- ../BiquadFilter/BiquadFilter.vhd:67:17
  n12495_o <= '1' when state_reg = "10" else '0';
  n12496_o <= n12495_o & n11741_o & n11460_o;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n12496_o select n12497_o <=
    x_reg when "100",
    x_reg when "010",
    n11458_o when "001",
    x_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n12496_o select n12498_o <=
    y_reg when "100",
    n11738_o when "010",
    y_reg when "001",
    y_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n12496_o select n12499_o <=
    n12200_o when "100",
    w_reg when "010",
    w_reg when "001",
    w_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n12496_o select n12500_o <=
    n12492_o when "100",
    v_reg when "010",
    v_reg when "001",
    v_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n12528_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n12529_o <= x_reg when n12528_o = '0' else n12497_o;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n12530_q <= n12529_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n12531_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n12532_o <= y_reg when n12531_o = '0' else n12498_o;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n12533_q <= n12532_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n12534_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n12534_q <= n12499_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n12535_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n12535_q <= n12500_o;
    end if;
  end process;
  -- ../fixed_pkg.vhd:168:39
  n12551_o <= y_reg (22 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n12552_o <= y_reg (24);
  -- ../fixed_pkg.vhd:173:9
  n12557_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n12558_o <= n12557_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n12559: postponed assert n12558_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n12561_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n12562_o <= n12561_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n12563: postponed assert n12562_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n12565_o <= y_reg (23);
  -- ../fixed_pkg.vhd:183:27
  n12566_o <= '1' when n12565_o /= n12552_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n12573_o <= '0' when n12566_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n12577_o <= '1' when n12566_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n12579_o <= y_reg (22);
  -- ../fixed_pkg.vhd:183:27
  n12580_o <= '1' when n12579_o /= n12552_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n12582_o <= n12573_o when n12591_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n12588_o <= n12580_o and n12577_o;
  -- ../fixed_pkg.vhd:183:17
  n12591_o <= n12577_o and n12588_o;
  -- ../fixed_pkg.vhd:194:31
  n12593_o <= not n12552_o;
  -- ../fixed_pkg.vhd:194:31
  n12594_o <= not n12552_o;
  -- ../fixed_pkg.vhd:194:31
  n12595_o <= not n12552_o;
  -- ../fixed_pkg.vhd:194:31
  n12596_o <= not n12552_o;
  -- ../fixed_pkg.vhd:194:31
  n12597_o <= not n12552_o;
  -- ../fixed_pkg.vhd:194:31
  n12598_o <= not n12552_o;
  -- ../fixed_pkg.vhd:194:31
  n12599_o <= not n12552_o;
  -- ../fixed_pkg.vhd:194:31
  n12600_o <= not n12552_o;
  -- ../fixed_pkg.vhd:194:31
  n12601_o <= not n12552_o;
  -- ../fixed_pkg.vhd:194:31
  n12602_o <= not n12552_o;
  -- ../fixed_pkg.vhd:194:31
  n12603_o <= not n12552_o;
  -- ../fixed_pkg.vhd:194:31
  n12604_o <= not n12552_o;
  -- ../fixed_pkg.vhd:194:31
  n12605_o <= not n12552_o;
  -- ../fixed_pkg.vhd:194:31
  n12606_o <= not n12552_o;
  -- ../fixed_pkg.vhd:194:31
  n12607_o <= not n12552_o;
  -- ../fixed_pkg.vhd:194:31
  n12608_o <= not n12552_o;
  -- ../fixed_pkg.vhd:194:31
  n12609_o <= not n12552_o;
  -- ../fixed_pkg.vhd:194:31
  n12610_o <= not n12552_o;
  n12611_o <= n12593_o & n12594_o & n12595_o & n12596_o;
  n12612_o <= n12597_o & n12598_o & n12599_o & n12600_o;
  n12613_o <= n12601_o & n12602_o & n12603_o & n12604_o;
  n12614_o <= n12605_o & n12606_o & n12607_o & n12608_o;
  n12615_o <= n12609_o & n12610_o;
  n12616_o <= n12611_o & n12612_o & n12613_o & n12614_o;
  n12617_o <= n12616_o & n12615_o;
  n12618_o <= n12617_o (16 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n12619_o <= n12551_o (22 downto 5);
  n12620_o <= n12552_o & n12618_o;
  -- ../fixed_pkg.vhd:193:9
  n12621_o <= n12619_o when n12582_o = '0' else n12620_o;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity biquadfilter_a12ffe86a0a36f7b398f45b49289aca300d75514 is
  port (
    clk_i : in std_logic;
    reset_i : in std_logic;
    valid_i : in std_logic;
    data_i : in std_logic_vector (17 downto 0);
    ready_i : in std_logic;
    ready_o : out std_logic;
    valid_o : out std_logic;
    data_o : out std_logic_vector (17 downto 0));
end entity biquadfilter_a12ffe86a0a36f7b398f45b49289aca300d75514;

architecture rtl of biquadfilter_a12ffe86a0a36f7b398f45b49289aca300d75514 is
  signal state_reg : std_logic_vector (1 downto 0);
  signal x_reg : std_logic_vector (24 downto 0);
  signal y_reg : std_logic_vector (24 downto 0);
  signal w_reg : std_logic_vector (24 downto 0);
  signal v_reg : std_logic_vector (24 downto 0);
  signal n10156_o : std_logic;
  signal n10158_o : std_logic_vector (1 downto 0);
  signal n10160_o : std_logic;
  signal n10162_o : std_logic;
  signal n10164_o : std_logic;
  signal n10166_o : std_logic_vector (1 downto 0);
  signal n10168_o : std_logic;
  signal n10169_o : std_logic_vector (3 downto 0);
  signal n10173_o : std_logic_vector (1 downto 0);
  signal n10178_q : std_logic_vector (1 downto 0);
  signal n10181_o : std_logic;
  signal n10182_o : std_logic;
  signal n10186_o : std_logic;
  signal n10187_o : std_logic;
  signal n10190_o : std_logic;
  signal n10206_o : std_logic_vector (19 downto 0);
  signal n10212_o : std_logic;
  signal n10213_o : std_logic;
  signal n10216_o : std_logic;
  signal n10217_o : std_logic;
  constant n10219_o : std_logic_vector (24 downto 0) := "0000000000000000000000000";
  signal n10220_o : std_logic_vector (4 downto 0);
  signal n10221_o : std_logic_vector (24 downto 0);
  signal n10222_o : std_logic_vector (24 downto 0);
  signal n10224_o : std_logic;
  signal n10238_o : std_logic_vector (42 downto 0);
  signal n10241_o : std_logic_vector (42 downto 0);
  signal n10258_o : std_logic_vector (43 downto 0);
  signal n10264_o : std_logic;
  signal n10265_o : std_logic;
  signal n10268_o : std_logic;
  signal n10269_o : std_logic;
  signal n10282_o : std_logic_vector (27 downto 0);
  signal n10288_o : std_logic;
  signal n10289_o : std_logic;
  signal n10292_o : std_logic;
  signal n10293_o : std_logic;
  constant n10295_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n10296_o : std_logic_vector (15 downto 0);
  signal n10297_o : std_logic_vector (43 downto 0);
  signal n10308_o : std_logic_vector (43 downto 0);
  signal n10319_o : std_logic_vector (42 downto 0);
  signal n10320_o : std_logic;
  signal n10325_o : std_logic;
  signal n10326_o : std_logic;
  signal n10329_o : std_logic;
  signal n10330_o : std_logic;
  signal n10333_o : std_logic;
  signal n10334_o : std_logic;
  signal n10341_o : std_logic;
  signal n10347_o : std_logic;
  signal n10348_o : std_logic;
  signal n10349_o : std_logic;
  signal n10350_o : std_logic;
  signal n10351_o : std_logic;
  signal n10352_o : std_logic;
  signal n10353_o : std_logic;
  signal n10354_o : std_logic;
  signal n10355_o : std_logic;
  signal n10356_o : std_logic;
  signal n10357_o : std_logic;
  signal n10358_o : std_logic;
  signal n10359_o : std_logic;
  signal n10360_o : std_logic;
  signal n10361_o : std_logic;
  signal n10362_o : std_logic;
  signal n10363_o : std_logic;
  signal n10364_o : std_logic;
  signal n10365_o : std_logic;
  signal n10366_o : std_logic;
  signal n10367_o : std_logic;
  signal n10368_o : std_logic;
  signal n10369_o : std_logic;
  signal n10370_o : std_logic;
  signal n10371_o : std_logic;
  signal n10372_o : std_logic;
  signal n10373_o : std_logic;
  signal n10374_o : std_logic;
  signal n10375_o : std_logic;
  signal n10376_o : std_logic;
  signal n10377_o : std_logic;
  signal n10378_o : std_logic;
  signal n10379_o : std_logic;
  signal n10380_o : std_logic;
  signal n10381_o : std_logic;
  signal n10382_o : std_logic;
  signal n10383_o : std_logic;
  signal n10384_o : std_logic;
  signal n10385_o : std_logic;
  signal n10386_o : std_logic;
  signal n10387_o : std_logic;
  signal n10388_o : std_logic;
  signal n10389_o : std_logic;
  signal n10390_o : std_logic_vector (3 downto 0);
  signal n10391_o : std_logic_vector (3 downto 0);
  signal n10392_o : std_logic_vector (3 downto 0);
  signal n10393_o : std_logic_vector (3 downto 0);
  signal n10394_o : std_logic_vector (3 downto 0);
  signal n10395_o : std_logic_vector (3 downto 0);
  signal n10396_o : std_logic_vector (3 downto 0);
  signal n10397_o : std_logic_vector (3 downto 0);
  signal n10398_o : std_logic_vector (3 downto 0);
  signal n10399_o : std_logic_vector (3 downto 0);
  signal n10400_o : std_logic_vector (2 downto 0);
  signal n10401_o : std_logic_vector (15 downto 0);
  signal n10402_o : std_logic_vector (15 downto 0);
  signal n10403_o : std_logic_vector (10 downto 0);
  signal n10404_o : std_logic_vector (42 downto 0);
  signal n10405_o : std_logic_vector (41 downto 0);
  signal n10406_o : std_logic_vector (42 downto 0);
  signal n10407_o : std_logic_vector (42 downto 0);
  signal n10423_o : std_logic_vector (40 downto 0);
  signal n10424_o : std_logic;
  signal n10429_o : std_logic;
  signal n10430_o : std_logic;
  signal n10433_o : std_logic;
  signal n10434_o : std_logic;
  signal n10437_o : std_logic;
  signal n10438_o : std_logic;
  signal n10445_o : std_logic;
  signal n10449_o : std_logic;
  signal n10451_o : std_logic;
  signal n10452_o : std_logic;
  signal n10454_o : std_logic;
  signal n10460_o : std_logic;
  signal n10463_o : std_logic;
  signal n10465_o : std_logic;
  signal n10466_o : std_logic;
  signal n10467_o : std_logic;
  signal n10468_o : std_logic;
  signal n10469_o : std_logic;
  signal n10470_o : std_logic;
  signal n10471_o : std_logic;
  signal n10472_o : std_logic;
  signal n10473_o : std_logic;
  signal n10474_o : std_logic;
  signal n10475_o : std_logic;
  signal n10476_o : std_logic;
  signal n10477_o : std_logic;
  signal n10478_o : std_logic;
  signal n10479_o : std_logic;
  signal n10480_o : std_logic;
  signal n10481_o : std_logic;
  signal n10482_o : std_logic;
  signal n10483_o : std_logic;
  signal n10484_o : std_logic;
  signal n10485_o : std_logic;
  signal n10486_o : std_logic;
  signal n10487_o : std_logic;
  signal n10488_o : std_logic;
  signal n10489_o : std_logic;
  signal n10490_o : std_logic_vector (3 downto 0);
  signal n10491_o : std_logic_vector (3 downto 0);
  signal n10492_o : std_logic_vector (3 downto 0);
  signal n10493_o : std_logic_vector (3 downto 0);
  signal n10494_o : std_logic_vector (3 downto 0);
  signal n10495_o : std_logic_vector (3 downto 0);
  signal n10496_o : std_logic_vector (15 downto 0);
  signal n10497_o : std_logic_vector (8 downto 0);
  signal n10498_o : std_logic_vector (24 downto 0);
  signal n10499_o : std_logic_vector (23 downto 0);
  signal n10500_o : std_logic_vector (24 downto 0);
  signal n10501_o : std_logic_vector (24 downto 0);
  signal n10502_o : std_logic_vector (24 downto 0);
  signal n10505_o : std_logic;
  signal n10520_o : std_logic_vector (42 downto 0);
  signal n10523_o : std_logic_vector (42 downto 0);
  signal n10535_o : std_logic_vector (42 downto 0);
  signal n10538_o : std_logic_vector (42 downto 0);
  signal n10555_o : std_logic_vector (43 downto 0);
  signal n10561_o : std_logic;
  signal n10562_o : std_logic;
  signal n10565_o : std_logic;
  signal n10566_o : std_logic;
  signal n10579_o : std_logic_vector (43 downto 0);
  signal n10585_o : std_logic;
  signal n10586_o : std_logic;
  signal n10589_o : std_logic;
  signal n10590_o : std_logic;
  signal n10603_o : std_logic_vector (43 downto 0);
  signal n10614_o : std_logic_vector (42 downto 0);
  signal n10615_o : std_logic;
  signal n10620_o : std_logic;
  signal n10621_o : std_logic;
  signal n10624_o : std_logic;
  signal n10625_o : std_logic;
  signal n10628_o : std_logic;
  signal n10629_o : std_logic;
  signal n10636_o : std_logic;
  signal n10642_o : std_logic;
  signal n10643_o : std_logic;
  signal n10644_o : std_logic;
  signal n10645_o : std_logic;
  signal n10646_o : std_logic;
  signal n10647_o : std_logic;
  signal n10648_o : std_logic;
  signal n10649_o : std_logic;
  signal n10650_o : std_logic;
  signal n10651_o : std_logic;
  signal n10652_o : std_logic;
  signal n10653_o : std_logic;
  signal n10654_o : std_logic;
  signal n10655_o : std_logic;
  signal n10656_o : std_logic;
  signal n10657_o : std_logic;
  signal n10658_o : std_logic;
  signal n10659_o : std_logic;
  signal n10660_o : std_logic;
  signal n10661_o : std_logic;
  signal n10662_o : std_logic;
  signal n10663_o : std_logic;
  signal n10664_o : std_logic;
  signal n10665_o : std_logic;
  signal n10666_o : std_logic;
  signal n10667_o : std_logic;
  signal n10668_o : std_logic;
  signal n10669_o : std_logic;
  signal n10670_o : std_logic;
  signal n10671_o : std_logic;
  signal n10672_o : std_logic;
  signal n10673_o : std_logic;
  signal n10674_o : std_logic;
  signal n10675_o : std_logic;
  signal n10676_o : std_logic;
  signal n10677_o : std_logic;
  signal n10678_o : std_logic;
  signal n10679_o : std_logic;
  signal n10680_o : std_logic;
  signal n10681_o : std_logic;
  signal n10682_o : std_logic;
  signal n10683_o : std_logic;
  signal n10684_o : std_logic;
  signal n10685_o : std_logic_vector (3 downto 0);
  signal n10686_o : std_logic_vector (3 downto 0);
  signal n10687_o : std_logic_vector (3 downto 0);
  signal n10688_o : std_logic_vector (3 downto 0);
  signal n10689_o : std_logic_vector (3 downto 0);
  signal n10690_o : std_logic_vector (3 downto 0);
  signal n10691_o : std_logic_vector (3 downto 0);
  signal n10692_o : std_logic_vector (3 downto 0);
  signal n10693_o : std_logic_vector (3 downto 0);
  signal n10694_o : std_logic_vector (3 downto 0);
  signal n10695_o : std_logic_vector (2 downto 0);
  signal n10696_o : std_logic_vector (15 downto 0);
  signal n10697_o : std_logic_vector (15 downto 0);
  signal n10698_o : std_logic_vector (10 downto 0);
  signal n10699_o : std_logic_vector (42 downto 0);
  signal n10700_o : std_logic_vector (41 downto 0);
  signal n10701_o : std_logic_vector (42 downto 0);
  signal n10702_o : std_logic_vector (42 downto 0);
  signal n10720_o : std_logic_vector (43 downto 0);
  signal n10726_o : std_logic;
  signal n10727_o : std_logic;
  signal n10730_o : std_logic;
  signal n10731_o : std_logic;
  signal n10744_o : std_logic_vector (27 downto 0);
  signal n10750_o : std_logic;
  signal n10751_o : std_logic;
  signal n10754_o : std_logic;
  signal n10755_o : std_logic;
  constant n10757_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n10758_o : std_logic_vector (15 downto 0);
  signal n10759_o : std_logic_vector (43 downto 0);
  signal n10770_o : std_logic_vector (43 downto 0);
  signal n10781_o : std_logic_vector (42 downto 0);
  signal n10782_o : std_logic;
  signal n10787_o : std_logic;
  signal n10788_o : std_logic;
  signal n10791_o : std_logic;
  signal n10792_o : std_logic;
  signal n10795_o : std_logic;
  signal n10796_o : std_logic;
  signal n10803_o : std_logic;
  signal n10809_o : std_logic;
  signal n10810_o : std_logic;
  signal n10811_o : std_logic;
  signal n10812_o : std_logic;
  signal n10813_o : std_logic;
  signal n10814_o : std_logic;
  signal n10815_o : std_logic;
  signal n10816_o : std_logic;
  signal n10817_o : std_logic;
  signal n10818_o : std_logic;
  signal n10819_o : std_logic;
  signal n10820_o : std_logic;
  signal n10821_o : std_logic;
  signal n10822_o : std_logic;
  signal n10823_o : std_logic;
  signal n10824_o : std_logic;
  signal n10825_o : std_logic;
  signal n10826_o : std_logic;
  signal n10827_o : std_logic;
  signal n10828_o : std_logic;
  signal n10829_o : std_logic;
  signal n10830_o : std_logic;
  signal n10831_o : std_logic;
  signal n10832_o : std_logic;
  signal n10833_o : std_logic;
  signal n10834_o : std_logic;
  signal n10835_o : std_logic;
  signal n10836_o : std_logic;
  signal n10837_o : std_logic;
  signal n10838_o : std_logic;
  signal n10839_o : std_logic;
  signal n10840_o : std_logic;
  signal n10841_o : std_logic;
  signal n10842_o : std_logic;
  signal n10843_o : std_logic;
  signal n10844_o : std_logic;
  signal n10845_o : std_logic;
  signal n10846_o : std_logic;
  signal n10847_o : std_logic;
  signal n10848_o : std_logic;
  signal n10849_o : std_logic;
  signal n10850_o : std_logic;
  signal n10851_o : std_logic;
  signal n10852_o : std_logic_vector (3 downto 0);
  signal n10853_o : std_logic_vector (3 downto 0);
  signal n10854_o : std_logic_vector (3 downto 0);
  signal n10855_o : std_logic_vector (3 downto 0);
  signal n10856_o : std_logic_vector (3 downto 0);
  signal n10857_o : std_logic_vector (3 downto 0);
  signal n10858_o : std_logic_vector (3 downto 0);
  signal n10859_o : std_logic_vector (3 downto 0);
  signal n10860_o : std_logic_vector (3 downto 0);
  signal n10861_o : std_logic_vector (3 downto 0);
  signal n10862_o : std_logic_vector (2 downto 0);
  signal n10863_o : std_logic_vector (15 downto 0);
  signal n10864_o : std_logic_vector (15 downto 0);
  signal n10865_o : std_logic_vector (10 downto 0);
  signal n10866_o : std_logic_vector (42 downto 0);
  signal n10867_o : std_logic_vector (41 downto 0);
  signal n10868_o : std_logic_vector (42 downto 0);
  signal n10869_o : std_logic_vector (42 downto 0);
  signal n10885_o : std_logic_vector (40 downto 0);
  signal n10886_o : std_logic;
  signal n10891_o : std_logic;
  signal n10892_o : std_logic;
  signal n10895_o : std_logic;
  signal n10896_o : std_logic;
  signal n10899_o : std_logic;
  signal n10900_o : std_logic;
  signal n10907_o : std_logic;
  signal n10911_o : std_logic;
  signal n10913_o : std_logic;
  signal n10914_o : std_logic;
  signal n10916_o : std_logic;
  signal n10922_o : std_logic;
  signal n10925_o : std_logic;
  signal n10927_o : std_logic;
  signal n10928_o : std_logic;
  signal n10929_o : std_logic;
  signal n10930_o : std_logic;
  signal n10931_o : std_logic;
  signal n10932_o : std_logic;
  signal n10933_o : std_logic;
  signal n10934_o : std_logic;
  signal n10935_o : std_logic;
  signal n10936_o : std_logic;
  signal n10937_o : std_logic;
  signal n10938_o : std_logic;
  signal n10939_o : std_logic;
  signal n10940_o : std_logic;
  signal n10941_o : std_logic;
  signal n10942_o : std_logic;
  signal n10943_o : std_logic;
  signal n10944_o : std_logic;
  signal n10945_o : std_logic;
  signal n10946_o : std_logic;
  signal n10947_o : std_logic;
  signal n10948_o : std_logic;
  signal n10949_o : std_logic;
  signal n10950_o : std_logic;
  signal n10951_o : std_logic;
  signal n10952_o : std_logic_vector (3 downto 0);
  signal n10953_o : std_logic_vector (3 downto 0);
  signal n10954_o : std_logic_vector (3 downto 0);
  signal n10955_o : std_logic_vector (3 downto 0);
  signal n10956_o : std_logic_vector (3 downto 0);
  signal n10957_o : std_logic_vector (3 downto 0);
  signal n10958_o : std_logic_vector (15 downto 0);
  signal n10959_o : std_logic_vector (8 downto 0);
  signal n10960_o : std_logic_vector (24 downto 0);
  signal n10961_o : std_logic_vector (23 downto 0);
  signal n10962_o : std_logic_vector (24 downto 0);
  signal n10963_o : std_logic_vector (24 downto 0);
  signal n10964_o : std_logic_vector (24 downto 0);
  signal n10979_o : std_logic_vector (42 downto 0);
  signal n10982_o : std_logic_vector (42 downto 0);
  signal n10994_o : std_logic_vector (42 downto 0);
  signal n10997_o : std_logic_vector (42 downto 0);
  signal n11014_o : std_logic_vector (43 downto 0);
  signal n11020_o : std_logic;
  signal n11021_o : std_logic;
  signal n11024_o : std_logic;
  signal n11025_o : std_logic;
  signal n11038_o : std_logic_vector (43 downto 0);
  signal n11044_o : std_logic;
  signal n11045_o : std_logic;
  signal n11048_o : std_logic;
  signal n11049_o : std_logic;
  signal n11062_o : std_logic_vector (43 downto 0);
  signal n11073_o : std_logic_vector (42 downto 0);
  signal n11074_o : std_logic;
  signal n11079_o : std_logic;
  signal n11080_o : std_logic;
  signal n11083_o : std_logic;
  signal n11084_o : std_logic;
  signal n11087_o : std_logic;
  signal n11088_o : std_logic;
  signal n11095_o : std_logic;
  signal n11101_o : std_logic;
  signal n11102_o : std_logic;
  signal n11103_o : std_logic;
  signal n11104_o : std_logic;
  signal n11105_o : std_logic;
  signal n11106_o : std_logic;
  signal n11107_o : std_logic;
  signal n11108_o : std_logic;
  signal n11109_o : std_logic;
  signal n11110_o : std_logic;
  signal n11111_o : std_logic;
  signal n11112_o : std_logic;
  signal n11113_o : std_logic;
  signal n11114_o : std_logic;
  signal n11115_o : std_logic;
  signal n11116_o : std_logic;
  signal n11117_o : std_logic;
  signal n11118_o : std_logic;
  signal n11119_o : std_logic;
  signal n11120_o : std_logic;
  signal n11121_o : std_logic;
  signal n11122_o : std_logic;
  signal n11123_o : std_logic;
  signal n11124_o : std_logic;
  signal n11125_o : std_logic;
  signal n11126_o : std_logic;
  signal n11127_o : std_logic;
  signal n11128_o : std_logic;
  signal n11129_o : std_logic;
  signal n11130_o : std_logic;
  signal n11131_o : std_logic;
  signal n11132_o : std_logic;
  signal n11133_o : std_logic;
  signal n11134_o : std_logic;
  signal n11135_o : std_logic;
  signal n11136_o : std_logic;
  signal n11137_o : std_logic;
  signal n11138_o : std_logic;
  signal n11139_o : std_logic;
  signal n11140_o : std_logic;
  signal n11141_o : std_logic;
  signal n11142_o : std_logic;
  signal n11143_o : std_logic;
  signal n11144_o : std_logic_vector (3 downto 0);
  signal n11145_o : std_logic_vector (3 downto 0);
  signal n11146_o : std_logic_vector (3 downto 0);
  signal n11147_o : std_logic_vector (3 downto 0);
  signal n11148_o : std_logic_vector (3 downto 0);
  signal n11149_o : std_logic_vector (3 downto 0);
  signal n11150_o : std_logic_vector (3 downto 0);
  signal n11151_o : std_logic_vector (3 downto 0);
  signal n11152_o : std_logic_vector (3 downto 0);
  signal n11153_o : std_logic_vector (3 downto 0);
  signal n11154_o : std_logic_vector (2 downto 0);
  signal n11155_o : std_logic_vector (15 downto 0);
  signal n11156_o : std_logic_vector (15 downto 0);
  signal n11157_o : std_logic_vector (10 downto 0);
  signal n11158_o : std_logic_vector (42 downto 0);
  signal n11159_o : std_logic_vector (41 downto 0);
  signal n11160_o : std_logic_vector (42 downto 0);
  signal n11161_o : std_logic_vector (42 downto 0);
  signal n11177_o : std_logic_vector (40 downto 0);
  signal n11178_o : std_logic;
  signal n11183_o : std_logic;
  signal n11184_o : std_logic;
  signal n11187_o : std_logic;
  signal n11188_o : std_logic;
  signal n11191_o : std_logic;
  signal n11192_o : std_logic;
  signal n11199_o : std_logic;
  signal n11203_o : std_logic;
  signal n11205_o : std_logic;
  signal n11206_o : std_logic;
  signal n11208_o : std_logic;
  signal n11214_o : std_logic;
  signal n11217_o : std_logic;
  signal n11219_o : std_logic;
  signal n11220_o : std_logic;
  signal n11221_o : std_logic;
  signal n11222_o : std_logic;
  signal n11223_o : std_logic;
  signal n11224_o : std_logic;
  signal n11225_o : std_logic;
  signal n11226_o : std_logic;
  signal n11227_o : std_logic;
  signal n11228_o : std_logic;
  signal n11229_o : std_logic;
  signal n11230_o : std_logic;
  signal n11231_o : std_logic;
  signal n11232_o : std_logic;
  signal n11233_o : std_logic;
  signal n11234_o : std_logic;
  signal n11235_o : std_logic;
  signal n11236_o : std_logic;
  signal n11237_o : std_logic;
  signal n11238_o : std_logic;
  signal n11239_o : std_logic;
  signal n11240_o : std_logic;
  signal n11241_o : std_logic;
  signal n11242_o : std_logic;
  signal n11243_o : std_logic;
  signal n11244_o : std_logic_vector (3 downto 0);
  signal n11245_o : std_logic_vector (3 downto 0);
  signal n11246_o : std_logic_vector (3 downto 0);
  signal n11247_o : std_logic_vector (3 downto 0);
  signal n11248_o : std_logic_vector (3 downto 0);
  signal n11249_o : std_logic_vector (3 downto 0);
  signal n11250_o : std_logic_vector (15 downto 0);
  signal n11251_o : std_logic_vector (8 downto 0);
  signal n11252_o : std_logic_vector (24 downto 0);
  signal n11253_o : std_logic_vector (23 downto 0);
  signal n11254_o : std_logic_vector (24 downto 0);
  signal n11255_o : std_logic_vector (24 downto 0);
  signal n11256_o : std_logic_vector (24 downto 0);
  signal n11259_o : std_logic;
  signal n11260_o : std_logic_vector (2 downto 0);
  signal n11261_o : std_logic_vector (24 downto 0);
  signal n11262_o : std_logic_vector (24 downto 0);
  signal n11263_o : std_logic_vector (24 downto 0);
  signal n11264_o : std_logic_vector (24 downto 0);
  signal n11292_o : std_logic;
  signal n11293_o : std_logic_vector (24 downto 0);
  signal n11294_q : std_logic_vector (24 downto 0);
  signal n11295_o : std_logic;
  signal n11296_o : std_logic_vector (24 downto 0);
  signal n11297_q : std_logic_vector (24 downto 0);
  signal n11298_q : std_logic_vector (24 downto 0);
  signal n11299_q : std_logic_vector (24 downto 0);
  signal n11315_o : std_logic_vector (22 downto 0);
  signal n11316_o : std_logic;
  signal n11321_o : std_logic;
  signal n11322_o : std_logic;
  signal n11325_o : std_logic;
  signal n11326_o : std_logic;
  signal n11329_o : std_logic;
  signal n11330_o : std_logic;
  signal n11337_o : std_logic;
  signal n11341_o : std_logic;
  signal n11343_o : std_logic;
  signal n11344_o : std_logic;
  signal n11346_o : std_logic;
  signal n11352_o : std_logic;
  signal n11355_o : std_logic;
  signal n11357_o : std_logic;
  signal n11358_o : std_logic;
  signal n11359_o : std_logic;
  signal n11360_o : std_logic;
  signal n11361_o : std_logic;
  signal n11362_o : std_logic;
  signal n11363_o : std_logic;
  signal n11364_o : std_logic;
  signal n11365_o : std_logic;
  signal n11366_o : std_logic;
  signal n11367_o : std_logic;
  signal n11368_o : std_logic;
  signal n11369_o : std_logic;
  signal n11370_o : std_logic;
  signal n11371_o : std_logic;
  signal n11372_o : std_logic;
  signal n11373_o : std_logic;
  signal n11374_o : std_logic;
  signal n11375_o : std_logic_vector (3 downto 0);
  signal n11376_o : std_logic_vector (3 downto 0);
  signal n11377_o : std_logic_vector (3 downto 0);
  signal n11378_o : std_logic_vector (3 downto 0);
  signal n11379_o : std_logic_vector (1 downto 0);
  signal n11380_o : std_logic_vector (15 downto 0);
  signal n11381_o : std_logic_vector (17 downto 0);
  signal n11382_o : std_logic_vector (16 downto 0);
  signal n11383_o : std_logic_vector (17 downto 0);
  signal n11384_o : std_logic_vector (17 downto 0);
  signal n11385_o : std_logic_vector (17 downto 0);
begin
  ready_o <= n10182_o;
  valid_o <= n10187_o;
  data_o <= n11385_o;
  -- ../BiquadFilter/BiquadFilter.vhd:26:12
  state_reg <= n10178_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:12
  x_reg <= n11294_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:19
  y_reg <= n11297_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:26
  w_reg <= n11298_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:33
  v_reg <= n11299_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:33:15
  -- n10156_o <= '1' when rising_edge (clk_i) else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:36:21
  n10158_o <= state_reg when valid_i = '0' else "01";
  -- ../BiquadFilter/BiquadFilter.vhd:35:17
  n10160_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:39:17
  n10162_o <= '1' when state_reg = "01" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:41:17
  n10164_o <= '1' when state_reg = "10" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:44:21
  n10166_o <= state_reg when ready_i = '0' else "00";
  -- ../BiquadFilter/BiquadFilter.vhd:43:17
  n10168_o <= '1' when state_reg = "11" else '0';
  -- ../fixed_pkg.vhd:183:17
  n10169_o <= n10168_o & n10164_o & n10162_o & n10160_o;
  -- ../BiquadFilter/BiquadFilter.vhd:34:13
  with n10169_o select n10173_o <=
    n10166_o when "1000",
    "11" when "0100",
    "10" when "0010",
    n10158_o when "0001",
    "XX" when others;
  -- ../BiquadFilter/BiquadFilter.vhd:33:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n10178_q <= "00";
    elsif rising_edge (clk_i) then
      n10178_q <= n10173_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:51:35
  n10181_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:51:20
  n10182_o <= '0' when n10181_o = '0' else '1';
  -- ../BiquadFilter/BiquadFilter.vhd:52:35
  n10186_o <= '1' when state_reg = "11" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:52:20
  n10187_o <= '0' when n10186_o = '0' else '1';
  -- ../BiquadFilter/BiquadFilter.vhd:59:15
  -- n10190_o <= '1' when rising_edge (clk_i) else '0';
  -- ../fixed_pkg.vhd:168:39
  n10206_o <= std_logic_vector (resize (signed (data_i), 20));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n10212_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n10213_o <= n10212_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n10214: postponed assert n10213_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n10216_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n10217_o <= n10216_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n10218: postponed assert n10217_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:170:18
  n10220_o <= n10219_o (4 downto 0);
  n10221_o <= n10206_o & n10220_o;
  -- ../BiquadFilter/BiquadFilter.vhd:62:21
  n10222_o <= x_reg when valid_i = '0' else n10221_o;
  -- ../BiquadFilter/BiquadFilter.vhd:61:17
  n10224_o <= '1' when state_reg = "00" else '0';
  -- ../fixed_pkg.vhd:266:100
  n10238_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n10241_o <= std_logic_vector (resize (signed (n10238_o) * signed'("0000000000000000000000000000000010101010110"), 43));
  -- ../fixed_pkg.vhd:168:39
  n10258_o <= std_logic_vector (resize (signed (n10241_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n10264_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n10265_o <= n10264_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n10266: postponed assert n10265_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n10268_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n10269_o <= n10268_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n10270: postponed assert n10269_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n10282_o <= std_logic_vector (resize (signed (w_reg), 28));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n10288_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n10289_o <= n10288_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n10290: postponed assert n10289_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n10292_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n10293_o <= n10292_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n10294: postponed assert n10293_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:24:14
  n10296_o <= n10295_o (15 downto 0);
  -- ../fixed_pkg.vhd:24:14
  n10297_o <= n10282_o & n10296_o;
  -- ../fixed_pkg.vhd:255:67
  n10308_o <= std_logic_vector (unsigned (n10258_o) + unsigned (n10297_o));
  -- ../fixed_pkg.vhd:168:39
  n10319_o <= n10308_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n10320_o <= n10308_o (43);
  -- ../fixed_pkg.vhd:173:9
  n10325_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n10326_o <= n10325_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n10327: postponed assert n10326_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n10329_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n10330_o <= n10329_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n10331: postponed assert n10330_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n10333_o <= n10308_o (42);
  -- ../fixed_pkg.vhd:183:27
  n10334_o <= '1' when n10333_o /= n10320_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n10341_o <= '0' when n10334_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n10347_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10348_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10349_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10350_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10351_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10352_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10353_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10354_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10355_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10356_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10357_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10358_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10359_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10360_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10361_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10362_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10363_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10364_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10365_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10366_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10367_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10368_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10369_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10370_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10371_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10372_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10373_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10374_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10375_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10376_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10377_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10378_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10379_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10380_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10381_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10382_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10383_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10384_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10385_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10386_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10387_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10388_o <= not n10320_o;
  -- ../fixed_pkg.vhd:194:31
  n10389_o <= not n10320_o;
  n10390_o <= n10347_o & n10348_o & n10349_o & n10350_o;
  -- ../fixed_pkg.vhd:169:40
  n10391_o <= n10351_o & n10352_o & n10353_o & n10354_o;
  -- ../fixed_pkg.vhd:9:14
  n10392_o <= n10355_o & n10356_o & n10357_o & n10358_o;
  -- ../fixed_pkg.vhd:9:14
  n10393_o <= n10359_o & n10360_o & n10361_o & n10362_o;
  n10394_o <= n10363_o & n10364_o & n10365_o & n10366_o;
  -- ../fixed_pkg.vhd:9:14
  n10395_o <= n10367_o & n10368_o & n10369_o & n10370_o;
  -- ../fixed_pkg.vhd:24:14
  n10396_o <= n10371_o & n10372_o & n10373_o & n10374_o;
  -- ../fixed_pkg.vhd:24:14
  n10397_o <= n10375_o & n10376_o & n10377_o & n10378_o;
  n10398_o <= n10379_o & n10380_o & n10381_o & n10382_o;
  -- ../fixed_pkg.vhd:24:14
  n10399_o <= n10383_o & n10384_o & n10385_o & n10386_o;
  n10400_o <= n10387_o & n10388_o & n10389_o;
  -- ../fixed_pkg.vhd:171:18
  n10401_o <= n10390_o & n10391_o & n10392_o & n10393_o;
  n10402_o <= n10394_o & n10395_o & n10396_o & n10397_o;
  -- ../fixed_pkg.vhd:170:18
  n10403_o <= n10398_o & n10399_o & n10400_o;
  n10404_o <= n10401_o & n10402_o & n10403_o;
  -- ../fixed_pkg.vhd:169:40
  n10405_o <= n10404_o (41 downto 0);
  -- ../fixed_pkg.vhd:9:14
  n10406_o <= n10320_o & n10405_o;
  -- ../fixed_pkg.vhd:193:9
  n10407_o <= n10319_o when n10341_o = '0' else n10406_o;
  -- ../fixed_pkg.vhd:168:39
  n10423_o <= n10407_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n10424_o <= n10407_o (42);
  -- ../fixed_pkg.vhd:173:9
  n10429_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n10430_o <= n10429_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n10431: postponed assert n10430_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n10433_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n10434_o <= n10433_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n10435: postponed assert n10434_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n10437_o <= n10407_o (41);
  -- ../fixed_pkg.vhd:183:27
  n10438_o <= '1' when n10437_o /= n10424_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n10445_o <= '0' when n10438_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n10449_o <= '1' when n10438_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n10451_o <= n10407_o (40);
  -- ../fixed_pkg.vhd:183:27
  n10452_o <= '1' when n10451_o /= n10424_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n10454_o <= n10445_o when n10463_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n10460_o <= n10452_o and n10449_o;
  -- ../fixed_pkg.vhd:183:17
  n10463_o <= n10449_o and n10460_o;
  -- ../fixed_pkg.vhd:194:31
  n10465_o <= not n10424_o;
  -- ../fixed_pkg.vhd:194:31
  n10466_o <= not n10424_o;
  -- ../fixed_pkg.vhd:194:31
  n10467_o <= not n10424_o;
  -- ../fixed_pkg.vhd:194:31
  n10468_o <= not n10424_o;
  -- ../fixed_pkg.vhd:194:31
  n10469_o <= not n10424_o;
  -- ../fixed_pkg.vhd:194:31
  n10470_o <= not n10424_o;
  -- ../fixed_pkg.vhd:194:31
  n10471_o <= not n10424_o;
  -- ../fixed_pkg.vhd:194:31
  n10472_o <= not n10424_o;
  -- ../fixed_pkg.vhd:194:31
  n10473_o <= not n10424_o;
  -- ../fixed_pkg.vhd:194:31
  n10474_o <= not n10424_o;
  -- ../fixed_pkg.vhd:194:31
  n10475_o <= not n10424_o;
  -- ../fixed_pkg.vhd:194:31
  n10476_o <= not n10424_o;
  -- ../fixed_pkg.vhd:194:31
  n10477_o <= not n10424_o;
  -- ../fixed_pkg.vhd:194:31
  n10478_o <= not n10424_o;
  -- ../fixed_pkg.vhd:194:31
  n10479_o <= not n10424_o;
  -- ../fixed_pkg.vhd:194:31
  n10480_o <= not n10424_o;
  -- ../fixed_pkg.vhd:194:31
  n10481_o <= not n10424_o;
  -- ../fixed_pkg.vhd:194:31
  n10482_o <= not n10424_o;
  -- ../fixed_pkg.vhd:194:31
  n10483_o <= not n10424_o;
  -- ../fixed_pkg.vhd:194:31
  n10484_o <= not n10424_o;
  -- ../fixed_pkg.vhd:194:31
  n10485_o <= not n10424_o;
  -- ../fixed_pkg.vhd:194:31
  n10486_o <= not n10424_o;
  -- ../fixed_pkg.vhd:194:31
  n10487_o <= not n10424_o;
  -- ../fixed_pkg.vhd:194:31
  n10488_o <= not n10424_o;
  -- ../fixed_pkg.vhd:194:31
  n10489_o <= not n10424_o;
  -- ../fixed_pkg.vhd:171:18
  n10490_o <= n10465_o & n10466_o & n10467_o & n10468_o;
  -- ../fixed_pkg.vhd:9:14
  n10491_o <= n10469_o & n10470_o & n10471_o & n10472_o;
  -- ../fixed_pkg.vhd:9:14
  n10492_o <= n10473_o & n10474_o & n10475_o & n10476_o;
  -- ../fixed_pkg.vhd:183:17
  n10493_o <= n10477_o & n10478_o & n10479_o & n10480_o;
  -- ../fixed_pkg.vhd:9:14
  n10494_o <= n10481_o & n10482_o & n10483_o & n10484_o;
  -- ../fixed_pkg.vhd:40:14
  n10495_o <= n10485_o & n10486_o & n10487_o & n10488_o;
  -- ../fixed_pkg.vhd:40:14
  n10496_o <= n10490_o & n10491_o & n10492_o & n10493_o;
  -- ../fixed_pkg.vhd:9:14
  n10497_o <= n10494_o & n10495_o & n10489_o;
  -- ../fixed_pkg.vhd:40:14
  n10498_o <= n10496_o & n10497_o;
  -- ../fixed_pkg.vhd:183:17
  n10499_o <= n10498_o (23 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n10500_o <= n10423_o (40 downto 16);
  -- ../fixed_pkg.vhd:183:17
  n10501_o <= n10424_o & n10499_o;
  -- ../fixed_pkg.vhd:193:9
  n10502_o <= n10500_o when n10454_o = '0' else n10501_o;
  -- ../BiquadFilter/BiquadFilter.vhd:65:17
  n10505_o <= '1' when state_reg = "01" else '0';
  -- ../fixed_pkg.vhd:266:100
  n10520_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n10523_o <= std_logic_vector (resize (signed (n10520_o) * signed'("0000000000000000000000000000000000000000000"), 43));
  -- ../fixed_pkg.vhd:266:100
  n10535_o <= std_logic_vector (resize (signed (y_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n10538_o <= std_logic_vector (resize (signed (n10535_o) * signed'("0000000000011111111111111100011101001100011"), 43));
  -- ../fixed_pkg.vhd:168:39
  n10555_o <= std_logic_vector (resize (signed (n10523_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n10561_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n10562_o <= n10561_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n10563: postponed assert n10562_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n10565_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n10566_o <= n10565_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n10567: postponed assert n10566_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n10579_o <= std_logic_vector (resize (signed (n10538_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n10585_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n10586_o <= n10585_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n10587: postponed assert n10586_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n10589_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n10590_o <= n10589_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n10591: postponed assert n10590_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:240:67
  n10603_o <= std_logic_vector (unsigned (n10555_o) - unsigned (n10579_o));
  -- ../fixed_pkg.vhd:168:39
  n10614_o <= n10603_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n10615_o <= n10603_o (43);
  -- ../fixed_pkg.vhd:173:9
  n10620_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n10621_o <= n10620_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n10622: postponed assert n10621_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n10624_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n10625_o <= n10624_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n10626: postponed assert n10625_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n10628_o <= n10603_o (42);
  -- ../fixed_pkg.vhd:183:27
  n10629_o <= '1' when n10628_o /= n10615_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n10636_o <= '0' when n10629_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n10642_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10643_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10644_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10645_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10646_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10647_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10648_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10649_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10650_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10651_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10652_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10653_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10654_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10655_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10656_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10657_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10658_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10659_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10660_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10661_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10662_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10663_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10664_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10665_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10666_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10667_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10668_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10669_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10670_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10671_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10672_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10673_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10674_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10675_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10676_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10677_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10678_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10679_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10680_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10681_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10682_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10683_o <= not n10615_o;
  -- ../fixed_pkg.vhd:194:31
  n10684_o <= not n10615_o;
  n10685_o <= n10642_o & n10643_o & n10644_o & n10645_o;
  n10686_o <= n10646_o & n10647_o & n10648_o & n10649_o;
  n10687_o <= n10650_o & n10651_o & n10652_o & n10653_o;
  n10688_o <= n10654_o & n10655_o & n10656_o & n10657_o;
  n10689_o <= n10658_o & n10659_o & n10660_o & n10661_o;
  n10690_o <= n10662_o & n10663_o & n10664_o & n10665_o;
  n10691_o <= n10666_o & n10667_o & n10668_o & n10669_o;
  n10692_o <= n10670_o & n10671_o & n10672_o & n10673_o;
  n10693_o <= n10674_o & n10675_o & n10676_o & n10677_o;
  n10694_o <= n10678_o & n10679_o & n10680_o & n10681_o;
  n10695_o <= n10682_o & n10683_o & n10684_o;
  n10696_o <= n10685_o & n10686_o & n10687_o & n10688_o;
  n10697_o <= n10689_o & n10690_o & n10691_o & n10692_o;
  n10698_o <= n10693_o & n10694_o & n10695_o;
  n10699_o <= n10696_o & n10697_o & n10698_o;
  n10700_o <= n10699_o (41 downto 0);
  n10701_o <= n10615_o & n10700_o;
  -- ../fixed_pkg.vhd:193:9
  n10702_o <= n10614_o when n10636_o = '0' else n10701_o;
  -- ../fixed_pkg.vhd:168:39
  n10720_o <= std_logic_vector (resize (signed (n10702_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n10726_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n10727_o <= n10726_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n10728: postponed assert n10727_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n10730_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n10731_o <= n10730_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n10732: postponed assert n10731_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n10744_o <= std_logic_vector (resize (signed (v_reg), 28));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n10750_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n10751_o <= n10750_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n10752: postponed assert n10751_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n10754_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n10755_o <= n10754_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n10756: postponed assert n10755_o = '1' severity error; --  assert
  n10758_o <= n10757_o (15 downto 0);
  n10759_o <= n10744_o & n10758_o;
  -- ../fixed_pkg.vhd:255:67
  n10770_o <= std_logic_vector (unsigned (n10720_o) + unsigned (n10759_o));
  -- ../fixed_pkg.vhd:168:39
  n10781_o <= n10770_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n10782_o <= n10770_o (43);
  -- ../fixed_pkg.vhd:173:9
  n10787_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n10788_o <= n10787_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n10789: postponed assert n10788_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n10791_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n10792_o <= n10791_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n10793: postponed assert n10792_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n10795_o <= n10770_o (42);
  -- ../fixed_pkg.vhd:183:27
  n10796_o <= '1' when n10795_o /= n10782_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n10803_o <= '0' when n10796_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n10809_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10810_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10811_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10812_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10813_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10814_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10815_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10816_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10817_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10818_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10819_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10820_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10821_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10822_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10823_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10824_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10825_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10826_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10827_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10828_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10829_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10830_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10831_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10832_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10833_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10834_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10835_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10836_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10837_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10838_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10839_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10840_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10841_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10842_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10843_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10844_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10845_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10846_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10847_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10848_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10849_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10850_o <= not n10782_o;
  -- ../fixed_pkg.vhd:194:31
  n10851_o <= not n10782_o;
  n10852_o <= n10809_o & n10810_o & n10811_o & n10812_o;
  n10853_o <= n10813_o & n10814_o & n10815_o & n10816_o;
  n10854_o <= n10817_o & n10818_o & n10819_o & n10820_o;
  n10855_o <= n10821_o & n10822_o & n10823_o & n10824_o;
  n10856_o <= n10825_o & n10826_o & n10827_o & n10828_o;
  n10857_o <= n10829_o & n10830_o & n10831_o & n10832_o;
  n10858_o <= n10833_o & n10834_o & n10835_o & n10836_o;
  n10859_o <= n10837_o & n10838_o & n10839_o & n10840_o;
  n10860_o <= n10841_o & n10842_o & n10843_o & n10844_o;
  n10861_o <= n10845_o & n10846_o & n10847_o & n10848_o;
  n10862_o <= n10849_o & n10850_o & n10851_o;
  n10863_o <= n10852_o & n10853_o & n10854_o & n10855_o;
  n10864_o <= n10856_o & n10857_o & n10858_o & n10859_o;
  n10865_o <= n10860_o & n10861_o & n10862_o;
  n10866_o <= n10863_o & n10864_o & n10865_o;
  n10867_o <= n10866_o (41 downto 0);
  n10868_o <= n10782_o & n10867_o;
  -- ../fixed_pkg.vhd:193:9
  n10869_o <= n10781_o when n10803_o = '0' else n10868_o;
  -- ../fixed_pkg.vhd:168:39
  n10885_o <= n10869_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n10886_o <= n10869_o (42);
  -- ../fixed_pkg.vhd:173:9
  n10891_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n10892_o <= n10891_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n10893: postponed assert n10892_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n10895_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n10896_o <= n10895_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n10897: postponed assert n10896_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n10899_o <= n10869_o (41);
  -- ../fixed_pkg.vhd:183:27
  n10900_o <= '1' when n10899_o /= n10886_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n10907_o <= '0' when n10900_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n10911_o <= '1' when n10900_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n10913_o <= n10869_o (40);
  -- ../fixed_pkg.vhd:183:27
  n10914_o <= '1' when n10913_o /= n10886_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n10916_o <= n10907_o when n10925_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n10922_o <= n10914_o and n10911_o;
  -- ../fixed_pkg.vhd:183:17
  n10925_o <= n10911_o and n10922_o;
  -- ../fixed_pkg.vhd:194:31
  n10927_o <= not n10886_o;
  -- ../fixed_pkg.vhd:194:31
  n10928_o <= not n10886_o;
  -- ../fixed_pkg.vhd:194:31
  n10929_o <= not n10886_o;
  -- ../fixed_pkg.vhd:194:31
  n10930_o <= not n10886_o;
  -- ../fixed_pkg.vhd:194:31
  n10931_o <= not n10886_o;
  -- ../fixed_pkg.vhd:194:31
  n10932_o <= not n10886_o;
  -- ../fixed_pkg.vhd:194:31
  n10933_o <= not n10886_o;
  -- ../fixed_pkg.vhd:194:31
  n10934_o <= not n10886_o;
  -- ../fixed_pkg.vhd:194:31
  n10935_o <= not n10886_o;
  -- ../fixed_pkg.vhd:194:31
  n10936_o <= not n10886_o;
  -- ../fixed_pkg.vhd:194:31
  n10937_o <= not n10886_o;
  -- ../fixed_pkg.vhd:194:31
  n10938_o <= not n10886_o;
  -- ../fixed_pkg.vhd:194:31
  n10939_o <= not n10886_o;
  -- ../fixed_pkg.vhd:194:31
  n10940_o <= not n10886_o;
  -- ../fixed_pkg.vhd:194:31
  n10941_o <= not n10886_o;
  -- ../fixed_pkg.vhd:194:31
  n10942_o <= not n10886_o;
  -- ../fixed_pkg.vhd:194:31
  n10943_o <= not n10886_o;
  -- ../fixed_pkg.vhd:194:31
  n10944_o <= not n10886_o;
  -- ../fixed_pkg.vhd:194:31
  n10945_o <= not n10886_o;
  -- ../fixed_pkg.vhd:194:31
  n10946_o <= not n10886_o;
  -- ../fixed_pkg.vhd:194:31
  n10947_o <= not n10886_o;
  -- ../fixed_pkg.vhd:194:31
  n10948_o <= not n10886_o;
  -- ../fixed_pkg.vhd:194:31
  n10949_o <= not n10886_o;
  -- ../fixed_pkg.vhd:194:31
  n10950_o <= not n10886_o;
  -- ../fixed_pkg.vhd:194:31
  n10951_o <= not n10886_o;
  n10952_o <= n10927_o & n10928_o & n10929_o & n10930_o;
  n10953_o <= n10931_o & n10932_o & n10933_o & n10934_o;
  n10954_o <= n10935_o & n10936_o & n10937_o & n10938_o;
  n10955_o <= n10939_o & n10940_o & n10941_o & n10942_o;
  n10956_o <= n10943_o & n10944_o & n10945_o & n10946_o;
  n10957_o <= n10947_o & n10948_o & n10949_o & n10950_o;
  n10958_o <= n10952_o & n10953_o & n10954_o & n10955_o;
  n10959_o <= n10956_o & n10957_o & n10951_o;
  n10960_o <= n10958_o & n10959_o;
  n10961_o <= n10960_o (23 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n10962_o <= n10885_o (40 downto 16);
  n10963_o <= n10886_o & n10961_o;
  -- ../fixed_pkg.vhd:193:9
  n10964_o <= n10962_o when n10916_o = '0' else n10963_o;
  -- ../fixed_pkg.vhd:266:100
  n10979_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n10982_o <= std_logic_vector (resize (signed (n10979_o) * signed'("0000000000011111111111111111111101010101010"), 43));
  -- ../fixed_pkg.vhd:266:100
  n10994_o <= std_logic_vector (resize (signed (y_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n10997_o <= std_logic_vector (resize (signed (n10994_o) * signed'("0000000000000000000000000001111010101010100"), 43));
  -- ../fixed_pkg.vhd:168:39
  n11014_o <= std_logic_vector (resize (signed (n10982_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n11020_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n11021_o <= n11020_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n11022: postponed assert n11021_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n11024_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n11025_o <= n11024_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n11026: postponed assert n11025_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n11038_o <= std_logic_vector (resize (signed (n10997_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n11044_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n11045_o <= n11044_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n11046: postponed assert n11045_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n11048_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n11049_o <= n11048_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n11050: postponed assert n11049_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:240:67
  n11062_o <= std_logic_vector (unsigned (n11014_o) - unsigned (n11038_o));
  -- ../fixed_pkg.vhd:168:39
  n11073_o <= n11062_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n11074_o <= n11062_o (43);
  -- ../fixed_pkg.vhd:173:9
  n11079_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n11080_o <= n11079_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n11081: postponed assert n11080_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n11083_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n11084_o <= n11083_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n11085: postponed assert n11084_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n11087_o <= n11062_o (42);
  -- ../fixed_pkg.vhd:183:27
  n11088_o <= '1' when n11087_o /= n11074_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n11095_o <= '0' when n11088_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n11101_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11102_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11103_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11104_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11105_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11106_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11107_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11108_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11109_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11110_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11111_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11112_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11113_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11114_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11115_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11116_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11117_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11118_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11119_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11120_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11121_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11122_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11123_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11124_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11125_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11126_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11127_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11128_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11129_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11130_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11131_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11132_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11133_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11134_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11135_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11136_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11137_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11138_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11139_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11140_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11141_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11142_o <= not n11074_o;
  -- ../fixed_pkg.vhd:194:31
  n11143_o <= not n11074_o;
  n11144_o <= n11101_o & n11102_o & n11103_o & n11104_o;
  n11145_o <= n11105_o & n11106_o & n11107_o & n11108_o;
  n11146_o <= n11109_o & n11110_o & n11111_o & n11112_o;
  n11147_o <= n11113_o & n11114_o & n11115_o & n11116_o;
  n11148_o <= n11117_o & n11118_o & n11119_o & n11120_o;
  n11149_o <= n11121_o & n11122_o & n11123_o & n11124_o;
  n11150_o <= n11125_o & n11126_o & n11127_o & n11128_o;
  n11151_o <= n11129_o & n11130_o & n11131_o & n11132_o;
  n11152_o <= n11133_o & n11134_o & n11135_o & n11136_o;
  n11153_o <= n11137_o & n11138_o & n11139_o & n11140_o;
  n11154_o <= n11141_o & n11142_o & n11143_o;
  n11155_o <= n11144_o & n11145_o & n11146_o & n11147_o;
  n11156_o <= n11148_o & n11149_o & n11150_o & n11151_o;
  n11157_o <= n11152_o & n11153_o & n11154_o;
  n11158_o <= n11155_o & n11156_o & n11157_o;
  n11159_o <= n11158_o (41 downto 0);
  n11160_o <= n11074_o & n11159_o;
  -- ../fixed_pkg.vhd:193:9
  n11161_o <= n11073_o when n11095_o = '0' else n11160_o;
  -- ../fixed_pkg.vhd:168:39
  n11177_o <= n11161_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n11178_o <= n11161_o (42);
  -- ../fixed_pkg.vhd:173:9
  n11183_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n11184_o <= n11183_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n11185: postponed assert n11184_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n11187_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n11188_o <= n11187_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n11189: postponed assert n11188_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n11191_o <= n11161_o (41);
  -- ../fixed_pkg.vhd:183:27
  n11192_o <= '1' when n11191_o /= n11178_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n11199_o <= '0' when n11192_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n11203_o <= '1' when n11192_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n11205_o <= n11161_o (40);
  -- ../fixed_pkg.vhd:183:27
  n11206_o <= '1' when n11205_o /= n11178_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n11208_o <= n11199_o when n11217_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n11214_o <= n11206_o and n11203_o;
  -- ../fixed_pkg.vhd:183:17
  n11217_o <= n11203_o and n11214_o;
  -- ../fixed_pkg.vhd:194:31
  n11219_o <= not n11178_o;
  -- ../fixed_pkg.vhd:194:31
  n11220_o <= not n11178_o;
  -- ../fixed_pkg.vhd:194:31
  n11221_o <= not n11178_o;
  -- ../fixed_pkg.vhd:194:31
  n11222_o <= not n11178_o;
  -- ../fixed_pkg.vhd:194:31
  n11223_o <= not n11178_o;
  -- ../fixed_pkg.vhd:194:31
  n11224_o <= not n11178_o;
  -- ../fixed_pkg.vhd:194:31
  n11225_o <= not n11178_o;
  -- ../fixed_pkg.vhd:194:31
  n11226_o <= not n11178_o;
  -- ../fixed_pkg.vhd:194:31
  n11227_o <= not n11178_o;
  -- ../fixed_pkg.vhd:194:31
  n11228_o <= not n11178_o;
  -- ../fixed_pkg.vhd:194:31
  n11229_o <= not n11178_o;
  -- ../fixed_pkg.vhd:194:31
  n11230_o <= not n11178_o;
  -- ../fixed_pkg.vhd:194:31
  n11231_o <= not n11178_o;
  -- ../fixed_pkg.vhd:194:31
  n11232_o <= not n11178_o;
  -- ../fixed_pkg.vhd:194:31
  n11233_o <= not n11178_o;
  -- ../fixed_pkg.vhd:194:31
  n11234_o <= not n11178_o;
  -- ../fixed_pkg.vhd:194:31
  n11235_o <= not n11178_o;
  -- ../fixed_pkg.vhd:194:31
  n11236_o <= not n11178_o;
  -- ../fixed_pkg.vhd:194:31
  n11237_o <= not n11178_o;
  -- ../fixed_pkg.vhd:194:31
  n11238_o <= not n11178_o;
  -- ../fixed_pkg.vhd:194:31
  n11239_o <= not n11178_o;
  -- ../fixed_pkg.vhd:194:31
  n11240_o <= not n11178_o;
  -- ../fixed_pkg.vhd:194:31
  n11241_o <= not n11178_o;
  -- ../fixed_pkg.vhd:194:31
  n11242_o <= not n11178_o;
  -- ../fixed_pkg.vhd:194:31
  n11243_o <= not n11178_o;
  n11244_o <= n11219_o & n11220_o & n11221_o & n11222_o;
  n11245_o <= n11223_o & n11224_o & n11225_o & n11226_o;
  n11246_o <= n11227_o & n11228_o & n11229_o & n11230_o;
  n11247_o <= n11231_o & n11232_o & n11233_o & n11234_o;
  n11248_o <= n11235_o & n11236_o & n11237_o & n11238_o;
  n11249_o <= n11239_o & n11240_o & n11241_o & n11242_o;
  n11250_o <= n11244_o & n11245_o & n11246_o & n11247_o;
  n11251_o <= n11248_o & n11249_o & n11243_o;
  n11252_o <= n11250_o & n11251_o;
  n11253_o <= n11252_o (23 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n11254_o <= n11177_o (40 downto 16);
  n11255_o <= n11178_o & n11253_o;
  -- ../fixed_pkg.vhd:193:9
  n11256_o <= n11254_o when n11208_o = '0' else n11255_o;
  -- ../BiquadFilter/BiquadFilter.vhd:67:17
  n11259_o <= '1' when state_reg = "10" else '0';
  n11260_o <= n11259_o & n10505_o & n10224_o;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n11260_o select n11261_o <=
    x_reg when "100",
    x_reg when "010",
    n10222_o when "001",
    x_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n11260_o select n11262_o <=
    y_reg when "100",
    n10502_o when "010",
    y_reg when "001",
    y_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n11260_o select n11263_o <=
    n10964_o when "100",
    w_reg when "010",
    w_reg when "001",
    w_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n11260_o select n11264_o <=
    n11256_o when "100",
    v_reg when "010",
    v_reg when "001",
    v_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n11292_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n11293_o <= x_reg when n11292_o = '0' else n11261_o;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n11294_q <= n11293_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n11295_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n11296_o <= y_reg when n11295_o = '0' else n11262_o;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n11297_q <= n11296_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n11298_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n11298_q <= n11263_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n11299_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n11299_q <= n11264_o;
    end if;
  end process;
  -- ../fixed_pkg.vhd:168:39
  n11315_o <= y_reg (22 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n11316_o <= y_reg (24);
  -- ../fixed_pkg.vhd:173:9
  n11321_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n11322_o <= n11321_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n11323: postponed assert n11322_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n11325_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n11326_o <= n11325_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n11327: postponed assert n11326_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n11329_o <= y_reg (23);
  -- ../fixed_pkg.vhd:183:27
  n11330_o <= '1' when n11329_o /= n11316_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n11337_o <= '0' when n11330_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n11341_o <= '1' when n11330_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n11343_o <= y_reg (22);
  -- ../fixed_pkg.vhd:183:27
  n11344_o <= '1' when n11343_o /= n11316_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n11346_o <= n11337_o when n11355_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n11352_o <= n11344_o and n11341_o;
  -- ../fixed_pkg.vhd:183:17
  n11355_o <= n11341_o and n11352_o;
  -- ../fixed_pkg.vhd:194:31
  n11357_o <= not n11316_o;
  -- ../fixed_pkg.vhd:194:31
  n11358_o <= not n11316_o;
  -- ../fixed_pkg.vhd:194:31
  n11359_o <= not n11316_o;
  -- ../fixed_pkg.vhd:194:31
  n11360_o <= not n11316_o;
  -- ../fixed_pkg.vhd:194:31
  n11361_o <= not n11316_o;
  -- ../fixed_pkg.vhd:194:31
  n11362_o <= not n11316_o;
  -- ../fixed_pkg.vhd:194:31
  n11363_o <= not n11316_o;
  -- ../fixed_pkg.vhd:194:31
  n11364_o <= not n11316_o;
  -- ../fixed_pkg.vhd:194:31
  n11365_o <= not n11316_o;
  -- ../fixed_pkg.vhd:194:31
  n11366_o <= not n11316_o;
  -- ../fixed_pkg.vhd:194:31
  n11367_o <= not n11316_o;
  -- ../fixed_pkg.vhd:194:31
  n11368_o <= not n11316_o;
  -- ../fixed_pkg.vhd:194:31
  n11369_o <= not n11316_o;
  -- ../fixed_pkg.vhd:194:31
  n11370_o <= not n11316_o;
  -- ../fixed_pkg.vhd:194:31
  n11371_o <= not n11316_o;
  -- ../fixed_pkg.vhd:194:31
  n11372_o <= not n11316_o;
  -- ../fixed_pkg.vhd:194:31
  n11373_o <= not n11316_o;
  -- ../fixed_pkg.vhd:194:31
  n11374_o <= not n11316_o;
  n11375_o <= n11357_o & n11358_o & n11359_o & n11360_o;
  n11376_o <= n11361_o & n11362_o & n11363_o & n11364_o;
  n11377_o <= n11365_o & n11366_o & n11367_o & n11368_o;
  n11378_o <= n11369_o & n11370_o & n11371_o & n11372_o;
  n11379_o <= n11373_o & n11374_o;
  n11380_o <= n11375_o & n11376_o & n11377_o & n11378_o;
  n11381_o <= n11380_o & n11379_o;
  n11382_o <= n11381_o (16 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n11383_o <= n11315_o (22 downto 5);
  n11384_o <= n11316_o & n11382_o;
  -- ../fixed_pkg.vhd:193:9
  n11385_o <= n11383_o when n11346_o = '0' else n11384_o;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity biquadfilter_7b2580a4b712e4b7d247f86df16ab6a0b5823514 is
  port (
    clk_i : in std_logic;
    reset_i : in std_logic;
    valid_i : in std_logic;
    data_i : in std_logic_vector (17 downto 0);
    ready_i : in std_logic;
    ready_o : out std_logic;
    valid_o : out std_logic;
    data_o : out std_logic_vector (17 downto 0));
end entity biquadfilter_7b2580a4b712e4b7d247f86df16ab6a0b5823514;

architecture rtl of biquadfilter_7b2580a4b712e4b7d247f86df16ab6a0b5823514 is
  signal state_reg : std_logic_vector (1 downto 0);
  signal x_reg : std_logic_vector (24 downto 0);
  signal y_reg : std_logic_vector (24 downto 0);
  signal w_reg : std_logic_vector (24 downto 0);
  signal v_reg : std_logic_vector (24 downto 0);
  signal n8920_o : std_logic;
  signal n8922_o : std_logic_vector (1 downto 0);
  signal n8924_o : std_logic;
  signal n8926_o : std_logic;
  signal n8928_o : std_logic;
  signal n8930_o : std_logic_vector (1 downto 0);
  signal n8932_o : std_logic;
  signal n8933_o : std_logic_vector (3 downto 0);
  signal n8937_o : std_logic_vector (1 downto 0);
  signal n8942_q : std_logic_vector (1 downto 0);
  signal n8945_o : std_logic;
  signal n8946_o : std_logic;
  signal n8950_o : std_logic;
  signal n8951_o : std_logic;
  signal n8954_o : std_logic;
  signal n8970_o : std_logic_vector (19 downto 0);
  signal n8976_o : std_logic;
  signal n8977_o : std_logic;
  signal n8980_o : std_logic;
  signal n8981_o : std_logic;
  constant n8983_o : std_logic_vector (24 downto 0) := "0000000000000000000000000";
  signal n8984_o : std_logic_vector (4 downto 0);
  signal n8985_o : std_logic_vector (24 downto 0);
  signal n8986_o : std_logic_vector (24 downto 0);
  signal n8988_o : std_logic;
  signal n9002_o : std_logic_vector (42 downto 0);
  signal n9005_o : std_logic_vector (42 downto 0);
  signal n9022_o : std_logic_vector (43 downto 0);
  signal n9028_o : std_logic;
  signal n9029_o : std_logic;
  signal n9032_o : std_logic;
  signal n9033_o : std_logic;
  signal n9046_o : std_logic_vector (27 downto 0);
  signal n9052_o : std_logic;
  signal n9053_o : std_logic;
  signal n9056_o : std_logic;
  signal n9057_o : std_logic;
  constant n9059_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n9060_o : std_logic_vector (15 downto 0);
  signal n9061_o : std_logic_vector (43 downto 0);
  signal n9072_o : std_logic_vector (43 downto 0);
  signal n9083_o : std_logic_vector (42 downto 0);
  signal n9084_o : std_logic;
  signal n9089_o : std_logic;
  signal n9090_o : std_logic;
  signal n9093_o : std_logic;
  signal n9094_o : std_logic;
  signal n9097_o : std_logic;
  signal n9098_o : std_logic;
  signal n9105_o : std_logic;
  signal n9111_o : std_logic;
  signal n9112_o : std_logic;
  signal n9113_o : std_logic;
  signal n9114_o : std_logic;
  signal n9115_o : std_logic;
  signal n9116_o : std_logic;
  signal n9117_o : std_logic;
  signal n9118_o : std_logic;
  signal n9119_o : std_logic;
  signal n9120_o : std_logic;
  signal n9121_o : std_logic;
  signal n9122_o : std_logic;
  signal n9123_o : std_logic;
  signal n9124_o : std_logic;
  signal n9125_o : std_logic;
  signal n9126_o : std_logic;
  signal n9127_o : std_logic;
  signal n9128_o : std_logic;
  signal n9129_o : std_logic;
  signal n9130_o : std_logic;
  signal n9131_o : std_logic;
  signal n9132_o : std_logic;
  signal n9133_o : std_logic;
  signal n9134_o : std_logic;
  signal n9135_o : std_logic;
  signal n9136_o : std_logic;
  signal n9137_o : std_logic;
  signal n9138_o : std_logic;
  signal n9139_o : std_logic;
  signal n9140_o : std_logic;
  signal n9141_o : std_logic;
  signal n9142_o : std_logic;
  signal n9143_o : std_logic;
  signal n9144_o : std_logic;
  signal n9145_o : std_logic;
  signal n9146_o : std_logic;
  signal n9147_o : std_logic;
  signal n9148_o : std_logic;
  signal n9149_o : std_logic;
  signal n9150_o : std_logic;
  signal n9151_o : std_logic;
  signal n9152_o : std_logic;
  signal n9153_o : std_logic;
  signal n9154_o : std_logic_vector (3 downto 0);
  signal n9155_o : std_logic_vector (3 downto 0);
  signal n9156_o : std_logic_vector (3 downto 0);
  signal n9157_o : std_logic_vector (3 downto 0);
  signal n9158_o : std_logic_vector (3 downto 0);
  signal n9159_o : std_logic_vector (3 downto 0);
  signal n9160_o : std_logic_vector (3 downto 0);
  signal n9161_o : std_logic_vector (3 downto 0);
  signal n9162_o : std_logic_vector (3 downto 0);
  signal n9163_o : std_logic_vector (3 downto 0);
  signal n9164_o : std_logic_vector (2 downto 0);
  signal n9165_o : std_logic_vector (15 downto 0);
  signal n9166_o : std_logic_vector (15 downto 0);
  signal n9167_o : std_logic_vector (10 downto 0);
  signal n9168_o : std_logic_vector (42 downto 0);
  signal n9169_o : std_logic_vector (41 downto 0);
  signal n9170_o : std_logic_vector (42 downto 0);
  signal n9171_o : std_logic_vector (42 downto 0);
  signal n9187_o : std_logic_vector (40 downto 0);
  signal n9188_o : std_logic;
  signal n9193_o : std_logic;
  signal n9194_o : std_logic;
  signal n9197_o : std_logic;
  signal n9198_o : std_logic;
  signal n9201_o : std_logic;
  signal n9202_o : std_logic;
  signal n9209_o : std_logic;
  signal n9213_o : std_logic;
  signal n9215_o : std_logic;
  signal n9216_o : std_logic;
  signal n9218_o : std_logic;
  signal n9224_o : std_logic;
  signal n9227_o : std_logic;
  signal n9229_o : std_logic;
  signal n9230_o : std_logic;
  signal n9231_o : std_logic;
  signal n9232_o : std_logic;
  signal n9233_o : std_logic;
  signal n9234_o : std_logic;
  signal n9235_o : std_logic;
  signal n9236_o : std_logic;
  signal n9237_o : std_logic;
  signal n9238_o : std_logic;
  signal n9239_o : std_logic;
  signal n9240_o : std_logic;
  signal n9241_o : std_logic;
  signal n9242_o : std_logic;
  signal n9243_o : std_logic;
  signal n9244_o : std_logic;
  signal n9245_o : std_logic;
  signal n9246_o : std_logic;
  signal n9247_o : std_logic;
  signal n9248_o : std_logic;
  signal n9249_o : std_logic;
  signal n9250_o : std_logic;
  signal n9251_o : std_logic;
  signal n9252_o : std_logic;
  signal n9253_o : std_logic;
  signal n9254_o : std_logic_vector (3 downto 0);
  signal n9255_o : std_logic_vector (3 downto 0);
  signal n9256_o : std_logic_vector (3 downto 0);
  signal n9257_o : std_logic_vector (3 downto 0);
  signal n9258_o : std_logic_vector (3 downto 0);
  signal n9259_o : std_logic_vector (3 downto 0);
  signal n9260_o : std_logic_vector (15 downto 0);
  signal n9261_o : std_logic_vector (8 downto 0);
  signal n9262_o : std_logic_vector (24 downto 0);
  signal n9263_o : std_logic_vector (23 downto 0);
  signal n9264_o : std_logic_vector (24 downto 0);
  signal n9265_o : std_logic_vector (24 downto 0);
  signal n9266_o : std_logic_vector (24 downto 0);
  signal n9269_o : std_logic;
  signal n9284_o : std_logic_vector (42 downto 0);
  signal n9287_o : std_logic_vector (42 downto 0);
  signal n9299_o : std_logic_vector (42 downto 0);
  signal n9302_o : std_logic_vector (42 downto 0);
  signal n9319_o : std_logic_vector (43 downto 0);
  signal n9325_o : std_logic;
  signal n9326_o : std_logic;
  signal n9329_o : std_logic;
  signal n9330_o : std_logic;
  signal n9343_o : std_logic_vector (43 downto 0);
  signal n9349_o : std_logic;
  signal n9350_o : std_logic;
  signal n9353_o : std_logic;
  signal n9354_o : std_logic;
  signal n9367_o : std_logic_vector (43 downto 0);
  signal n9378_o : std_logic_vector (42 downto 0);
  signal n9379_o : std_logic;
  signal n9384_o : std_logic;
  signal n9385_o : std_logic;
  signal n9388_o : std_logic;
  signal n9389_o : std_logic;
  signal n9392_o : std_logic;
  signal n9393_o : std_logic;
  signal n9400_o : std_logic;
  signal n9406_o : std_logic;
  signal n9407_o : std_logic;
  signal n9408_o : std_logic;
  signal n9409_o : std_logic;
  signal n9410_o : std_logic;
  signal n9411_o : std_logic;
  signal n9412_o : std_logic;
  signal n9413_o : std_logic;
  signal n9414_o : std_logic;
  signal n9415_o : std_logic;
  signal n9416_o : std_logic;
  signal n9417_o : std_logic;
  signal n9418_o : std_logic;
  signal n9419_o : std_logic;
  signal n9420_o : std_logic;
  signal n9421_o : std_logic;
  signal n9422_o : std_logic;
  signal n9423_o : std_logic;
  signal n9424_o : std_logic;
  signal n9425_o : std_logic;
  signal n9426_o : std_logic;
  signal n9427_o : std_logic;
  signal n9428_o : std_logic;
  signal n9429_o : std_logic;
  signal n9430_o : std_logic;
  signal n9431_o : std_logic;
  signal n9432_o : std_logic;
  signal n9433_o : std_logic;
  signal n9434_o : std_logic;
  signal n9435_o : std_logic;
  signal n9436_o : std_logic;
  signal n9437_o : std_logic;
  signal n9438_o : std_logic;
  signal n9439_o : std_logic;
  signal n9440_o : std_logic;
  signal n9441_o : std_logic;
  signal n9442_o : std_logic;
  signal n9443_o : std_logic;
  signal n9444_o : std_logic;
  signal n9445_o : std_logic;
  signal n9446_o : std_logic;
  signal n9447_o : std_logic;
  signal n9448_o : std_logic;
  signal n9449_o : std_logic_vector (3 downto 0);
  signal n9450_o : std_logic_vector (3 downto 0);
  signal n9451_o : std_logic_vector (3 downto 0);
  signal n9452_o : std_logic_vector (3 downto 0);
  signal n9453_o : std_logic_vector (3 downto 0);
  signal n9454_o : std_logic_vector (3 downto 0);
  signal n9455_o : std_logic_vector (3 downto 0);
  signal n9456_o : std_logic_vector (3 downto 0);
  signal n9457_o : std_logic_vector (3 downto 0);
  signal n9458_o : std_logic_vector (3 downto 0);
  signal n9459_o : std_logic_vector (2 downto 0);
  signal n9460_o : std_logic_vector (15 downto 0);
  signal n9461_o : std_logic_vector (15 downto 0);
  signal n9462_o : std_logic_vector (10 downto 0);
  signal n9463_o : std_logic_vector (42 downto 0);
  signal n9464_o : std_logic_vector (41 downto 0);
  signal n9465_o : std_logic_vector (42 downto 0);
  signal n9466_o : std_logic_vector (42 downto 0);
  signal n9484_o : std_logic_vector (43 downto 0);
  signal n9490_o : std_logic;
  signal n9491_o : std_logic;
  signal n9494_o : std_logic;
  signal n9495_o : std_logic;
  signal n9508_o : std_logic_vector (27 downto 0);
  signal n9514_o : std_logic;
  signal n9515_o : std_logic;
  signal n9518_o : std_logic;
  signal n9519_o : std_logic;
  constant n9521_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n9522_o : std_logic_vector (15 downto 0);
  signal n9523_o : std_logic_vector (43 downto 0);
  signal n9534_o : std_logic_vector (43 downto 0);
  signal n9545_o : std_logic_vector (42 downto 0);
  signal n9546_o : std_logic;
  signal n9551_o : std_logic;
  signal n9552_o : std_logic;
  signal n9555_o : std_logic;
  signal n9556_o : std_logic;
  signal n9559_o : std_logic;
  signal n9560_o : std_logic;
  signal n9567_o : std_logic;
  signal n9573_o : std_logic;
  signal n9574_o : std_logic;
  signal n9575_o : std_logic;
  signal n9576_o : std_logic;
  signal n9577_o : std_logic;
  signal n9578_o : std_logic;
  signal n9579_o : std_logic;
  signal n9580_o : std_logic;
  signal n9581_o : std_logic;
  signal n9582_o : std_logic;
  signal n9583_o : std_logic;
  signal n9584_o : std_logic;
  signal n9585_o : std_logic;
  signal n9586_o : std_logic;
  signal n9587_o : std_logic;
  signal n9588_o : std_logic;
  signal n9589_o : std_logic;
  signal n9590_o : std_logic;
  signal n9591_o : std_logic;
  signal n9592_o : std_logic;
  signal n9593_o : std_logic;
  signal n9594_o : std_logic;
  signal n9595_o : std_logic;
  signal n9596_o : std_logic;
  signal n9597_o : std_logic;
  signal n9598_o : std_logic;
  signal n9599_o : std_logic;
  signal n9600_o : std_logic;
  signal n9601_o : std_logic;
  signal n9602_o : std_logic;
  signal n9603_o : std_logic;
  signal n9604_o : std_logic;
  signal n9605_o : std_logic;
  signal n9606_o : std_logic;
  signal n9607_o : std_logic;
  signal n9608_o : std_logic;
  signal n9609_o : std_logic;
  signal n9610_o : std_logic;
  signal n9611_o : std_logic;
  signal n9612_o : std_logic;
  signal n9613_o : std_logic;
  signal n9614_o : std_logic;
  signal n9615_o : std_logic;
  signal n9616_o : std_logic_vector (3 downto 0);
  signal n9617_o : std_logic_vector (3 downto 0);
  signal n9618_o : std_logic_vector (3 downto 0);
  signal n9619_o : std_logic_vector (3 downto 0);
  signal n9620_o : std_logic_vector (3 downto 0);
  signal n9621_o : std_logic_vector (3 downto 0);
  signal n9622_o : std_logic_vector (3 downto 0);
  signal n9623_o : std_logic_vector (3 downto 0);
  signal n9624_o : std_logic_vector (3 downto 0);
  signal n9625_o : std_logic_vector (3 downto 0);
  signal n9626_o : std_logic_vector (2 downto 0);
  signal n9627_o : std_logic_vector (15 downto 0);
  signal n9628_o : std_logic_vector (15 downto 0);
  signal n9629_o : std_logic_vector (10 downto 0);
  signal n9630_o : std_logic_vector (42 downto 0);
  signal n9631_o : std_logic_vector (41 downto 0);
  signal n9632_o : std_logic_vector (42 downto 0);
  signal n9633_o : std_logic_vector (42 downto 0);
  signal n9649_o : std_logic_vector (40 downto 0);
  signal n9650_o : std_logic;
  signal n9655_o : std_logic;
  signal n9656_o : std_logic;
  signal n9659_o : std_logic;
  signal n9660_o : std_logic;
  signal n9663_o : std_logic;
  signal n9664_o : std_logic;
  signal n9671_o : std_logic;
  signal n9675_o : std_logic;
  signal n9677_o : std_logic;
  signal n9678_o : std_logic;
  signal n9680_o : std_logic;
  signal n9686_o : std_logic;
  signal n9689_o : std_logic;
  signal n9691_o : std_logic;
  signal n9692_o : std_logic;
  signal n9693_o : std_logic;
  signal n9694_o : std_logic;
  signal n9695_o : std_logic;
  signal n9696_o : std_logic;
  signal n9697_o : std_logic;
  signal n9698_o : std_logic;
  signal n9699_o : std_logic;
  signal n9700_o : std_logic;
  signal n9701_o : std_logic;
  signal n9702_o : std_logic;
  signal n9703_o : std_logic;
  signal n9704_o : std_logic;
  signal n9705_o : std_logic;
  signal n9706_o : std_logic;
  signal n9707_o : std_logic;
  signal n9708_o : std_logic;
  signal n9709_o : std_logic;
  signal n9710_o : std_logic;
  signal n9711_o : std_logic;
  signal n9712_o : std_logic;
  signal n9713_o : std_logic;
  signal n9714_o : std_logic;
  signal n9715_o : std_logic;
  signal n9716_o : std_logic_vector (3 downto 0);
  signal n9717_o : std_logic_vector (3 downto 0);
  signal n9718_o : std_logic_vector (3 downto 0);
  signal n9719_o : std_logic_vector (3 downto 0);
  signal n9720_o : std_logic_vector (3 downto 0);
  signal n9721_o : std_logic_vector (3 downto 0);
  signal n9722_o : std_logic_vector (15 downto 0);
  signal n9723_o : std_logic_vector (8 downto 0);
  signal n9724_o : std_logic_vector (24 downto 0);
  signal n9725_o : std_logic_vector (23 downto 0);
  signal n9726_o : std_logic_vector (24 downto 0);
  signal n9727_o : std_logic_vector (24 downto 0);
  signal n9728_o : std_logic_vector (24 downto 0);
  signal n9743_o : std_logic_vector (42 downto 0);
  signal n9746_o : std_logic_vector (42 downto 0);
  signal n9758_o : std_logic_vector (42 downto 0);
  signal n9761_o : std_logic_vector (42 downto 0);
  signal n9778_o : std_logic_vector (43 downto 0);
  signal n9784_o : std_logic;
  signal n9785_o : std_logic;
  signal n9788_o : std_logic;
  signal n9789_o : std_logic;
  signal n9802_o : std_logic_vector (43 downto 0);
  signal n9808_o : std_logic;
  signal n9809_o : std_logic;
  signal n9812_o : std_logic;
  signal n9813_o : std_logic;
  signal n9826_o : std_logic_vector (43 downto 0);
  signal n9837_o : std_logic_vector (42 downto 0);
  signal n9838_o : std_logic;
  signal n9843_o : std_logic;
  signal n9844_o : std_logic;
  signal n9847_o : std_logic;
  signal n9848_o : std_logic;
  signal n9851_o : std_logic;
  signal n9852_o : std_logic;
  signal n9859_o : std_logic;
  signal n9865_o : std_logic;
  signal n9866_o : std_logic;
  signal n9867_o : std_logic;
  signal n9868_o : std_logic;
  signal n9869_o : std_logic;
  signal n9870_o : std_logic;
  signal n9871_o : std_logic;
  signal n9872_o : std_logic;
  signal n9873_o : std_logic;
  signal n9874_o : std_logic;
  signal n9875_o : std_logic;
  signal n9876_o : std_logic;
  signal n9877_o : std_logic;
  signal n9878_o : std_logic;
  signal n9879_o : std_logic;
  signal n9880_o : std_logic;
  signal n9881_o : std_logic;
  signal n9882_o : std_logic;
  signal n9883_o : std_logic;
  signal n9884_o : std_logic;
  signal n9885_o : std_logic;
  signal n9886_o : std_logic;
  signal n9887_o : std_logic;
  signal n9888_o : std_logic;
  signal n9889_o : std_logic;
  signal n9890_o : std_logic;
  signal n9891_o : std_logic;
  signal n9892_o : std_logic;
  signal n9893_o : std_logic;
  signal n9894_o : std_logic;
  signal n9895_o : std_logic;
  signal n9896_o : std_logic;
  signal n9897_o : std_logic;
  signal n9898_o : std_logic;
  signal n9899_o : std_logic;
  signal n9900_o : std_logic;
  signal n9901_o : std_logic;
  signal n9902_o : std_logic;
  signal n9903_o : std_logic;
  signal n9904_o : std_logic;
  signal n9905_o : std_logic;
  signal n9906_o : std_logic;
  signal n9907_o : std_logic;
  signal n9908_o : std_logic_vector (3 downto 0);
  signal n9909_o : std_logic_vector (3 downto 0);
  signal n9910_o : std_logic_vector (3 downto 0);
  signal n9911_o : std_logic_vector (3 downto 0);
  signal n9912_o : std_logic_vector (3 downto 0);
  signal n9913_o : std_logic_vector (3 downto 0);
  signal n9914_o : std_logic_vector (3 downto 0);
  signal n9915_o : std_logic_vector (3 downto 0);
  signal n9916_o : std_logic_vector (3 downto 0);
  signal n9917_o : std_logic_vector (3 downto 0);
  signal n9918_o : std_logic_vector (2 downto 0);
  signal n9919_o : std_logic_vector (15 downto 0);
  signal n9920_o : std_logic_vector (15 downto 0);
  signal n9921_o : std_logic_vector (10 downto 0);
  signal n9922_o : std_logic_vector (42 downto 0);
  signal n9923_o : std_logic_vector (41 downto 0);
  signal n9924_o : std_logic_vector (42 downto 0);
  signal n9925_o : std_logic_vector (42 downto 0);
  signal n9941_o : std_logic_vector (40 downto 0);
  signal n9942_o : std_logic;
  signal n9947_o : std_logic;
  signal n9948_o : std_logic;
  signal n9951_o : std_logic;
  signal n9952_o : std_logic;
  signal n9955_o : std_logic;
  signal n9956_o : std_logic;
  signal n9963_o : std_logic;
  signal n9967_o : std_logic;
  signal n9969_o : std_logic;
  signal n9970_o : std_logic;
  signal n9972_o : std_logic;
  signal n9978_o : std_logic;
  signal n9981_o : std_logic;
  signal n9983_o : std_logic;
  signal n9984_o : std_logic;
  signal n9985_o : std_logic;
  signal n9986_o : std_logic;
  signal n9987_o : std_logic;
  signal n9988_o : std_logic;
  signal n9989_o : std_logic;
  signal n9990_o : std_logic;
  signal n9991_o : std_logic;
  signal n9992_o : std_logic;
  signal n9993_o : std_logic;
  signal n9994_o : std_logic;
  signal n9995_o : std_logic;
  signal n9996_o : std_logic;
  signal n9997_o : std_logic;
  signal n9998_o : std_logic;
  signal n9999_o : std_logic;
  signal n10000_o : std_logic;
  signal n10001_o : std_logic;
  signal n10002_o : std_logic;
  signal n10003_o : std_logic;
  signal n10004_o : std_logic;
  signal n10005_o : std_logic;
  signal n10006_o : std_logic;
  signal n10007_o : std_logic;
  signal n10008_o : std_logic_vector (3 downto 0);
  signal n10009_o : std_logic_vector (3 downto 0);
  signal n10010_o : std_logic_vector (3 downto 0);
  signal n10011_o : std_logic_vector (3 downto 0);
  signal n10012_o : std_logic_vector (3 downto 0);
  signal n10013_o : std_logic_vector (3 downto 0);
  signal n10014_o : std_logic_vector (15 downto 0);
  signal n10015_o : std_logic_vector (8 downto 0);
  signal n10016_o : std_logic_vector (24 downto 0);
  signal n10017_o : std_logic_vector (23 downto 0);
  signal n10018_o : std_logic_vector (24 downto 0);
  signal n10019_o : std_logic_vector (24 downto 0);
  signal n10020_o : std_logic_vector (24 downto 0);
  signal n10023_o : std_logic;
  signal n10024_o : std_logic_vector (2 downto 0);
  signal n10025_o : std_logic_vector (24 downto 0);
  signal n10026_o : std_logic_vector (24 downto 0);
  signal n10027_o : std_logic_vector (24 downto 0);
  signal n10028_o : std_logic_vector (24 downto 0);
  signal n10056_o : std_logic;
  signal n10057_o : std_logic_vector (24 downto 0);
  signal n10058_q : std_logic_vector (24 downto 0);
  signal n10059_o : std_logic;
  signal n10060_o : std_logic_vector (24 downto 0);
  signal n10061_q : std_logic_vector (24 downto 0);
  signal n10062_q : std_logic_vector (24 downto 0);
  signal n10063_q : std_logic_vector (24 downto 0);
  signal n10079_o : std_logic_vector (22 downto 0);
  signal n10080_o : std_logic;
  signal n10085_o : std_logic;
  signal n10086_o : std_logic;
  signal n10089_o : std_logic;
  signal n10090_o : std_logic;
  signal n10093_o : std_logic;
  signal n10094_o : std_logic;
  signal n10101_o : std_logic;
  signal n10105_o : std_logic;
  signal n10107_o : std_logic;
  signal n10108_o : std_logic;
  signal n10110_o : std_logic;
  signal n10116_o : std_logic;
  signal n10119_o : std_logic;
  signal n10121_o : std_logic;
  signal n10122_o : std_logic;
  signal n10123_o : std_logic;
  signal n10124_o : std_logic;
  signal n10125_o : std_logic;
  signal n10126_o : std_logic;
  signal n10127_o : std_logic;
  signal n10128_o : std_logic;
  signal n10129_o : std_logic;
  signal n10130_o : std_logic;
  signal n10131_o : std_logic;
  signal n10132_o : std_logic;
  signal n10133_o : std_logic;
  signal n10134_o : std_logic;
  signal n10135_o : std_logic;
  signal n10136_o : std_logic;
  signal n10137_o : std_logic;
  signal n10138_o : std_logic;
  signal n10139_o : std_logic_vector (3 downto 0);
  signal n10140_o : std_logic_vector (3 downto 0);
  signal n10141_o : std_logic_vector (3 downto 0);
  signal n10142_o : std_logic_vector (3 downto 0);
  signal n10143_o : std_logic_vector (1 downto 0);
  signal n10144_o : std_logic_vector (15 downto 0);
  signal n10145_o : std_logic_vector (17 downto 0);
  signal n10146_o : std_logic_vector (16 downto 0);
  signal n10147_o : std_logic_vector (17 downto 0);
  signal n10148_o : std_logic_vector (17 downto 0);
  signal n10149_o : std_logic_vector (17 downto 0);
begin
  ready_o <= n8946_o;
  valid_o <= n8951_o;
  data_o <= n10149_o;
  -- ../BiquadFilter/BiquadFilter.vhd:26:12
  state_reg <= n8942_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:12
  x_reg <= n10058_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:19
  y_reg <= n10061_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:26
  w_reg <= n10062_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:33
  v_reg <= n10063_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:33:15
  -- n8920_o <= '1' when rising_edge (clk_i) else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:36:21
  n8922_o <= state_reg when valid_i = '0' else "01";
  -- ../BiquadFilter/BiquadFilter.vhd:35:17
  n8924_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:39:17
  n8926_o <= '1' when state_reg = "01" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:41:17
  n8928_o <= '1' when state_reg = "10" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:44:21
  n8930_o <= state_reg when ready_i = '0' else "00";
  -- ../BiquadFilter/BiquadFilter.vhd:43:17
  n8932_o <= '1' when state_reg = "11" else '0';
  -- ../fixed_pkg.vhd:183:17
  n8933_o <= n8932_o & n8928_o & n8926_o & n8924_o;
  -- ../BiquadFilter/BiquadFilter.vhd:34:13
  with n8933_o select n8937_o <=
    n8930_o when "1000",
    "11" when "0100",
    "10" when "0010",
    n8922_o when "0001",
    "XX" when others;
  -- ../BiquadFilter/BiquadFilter.vhd:33:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n8942_q <= "00";
    elsif rising_edge (clk_i) then
      n8942_q <= n8937_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:51:35
  n8945_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:51:20
  n8946_o <= '0' when n8945_o = '0' else '1';
  -- ../BiquadFilter/BiquadFilter.vhd:52:35
  n8950_o <= '1' when state_reg = "11" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:52:20
  n8951_o <= '0' when n8950_o = '0' else '1';
  -- ../BiquadFilter/BiquadFilter.vhd:59:15
  -- n8954_o <= '1' when rising_edge (clk_i) else '0';
  -- ../fixed_pkg.vhd:168:39
  n8970_o <= std_logic_vector (resize (signed (data_i), 20));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n8976_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n8977_o <= n8976_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n8978: postponed assert n8977_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n8980_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n8981_o <= n8980_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n8982: postponed assert n8981_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:170:18
  n8984_o <= n8983_o (4 downto 0);
  n8985_o <= n8970_o & n8984_o;
  -- ../BiquadFilter/BiquadFilter.vhd:62:21
  n8986_o <= x_reg when valid_i = '0' else n8985_o;
  -- ../BiquadFilter/BiquadFilter.vhd:61:17
  n8988_o <= '1' when state_reg = "00" else '0';
  -- ../fixed_pkg.vhd:266:100
  n9002_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n9005_o <= std_logic_vector (resize (signed (n9002_o) * signed'("0000000000000000000000000000000010010100000"), 43));
  -- ../fixed_pkg.vhd:168:39
  n9022_o <= std_logic_vector (resize (signed (n9005_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n9028_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n9029_o <= n9028_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n9030: postponed assert n9029_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n9032_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n9033_o <= n9032_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n9034: postponed assert n9033_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n9046_o <= std_logic_vector (resize (signed (w_reg), 28));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n9052_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n9053_o <= n9052_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n9054: postponed assert n9053_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n9056_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n9057_o <= n9056_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n9058: postponed assert n9057_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:24:14
  n9060_o <= n9059_o (15 downto 0);
  -- ../fixed_pkg.vhd:24:14
  n9061_o <= n9046_o & n9060_o;
  -- ../fixed_pkg.vhd:255:67
  n9072_o <= std_logic_vector (unsigned (n9022_o) + unsigned (n9061_o));
  -- ../fixed_pkg.vhd:168:39
  n9083_o <= n9072_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n9084_o <= n9072_o (43);
  -- ../fixed_pkg.vhd:173:9
  n9089_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n9090_o <= n9089_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n9091: postponed assert n9090_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n9093_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n9094_o <= n9093_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n9095: postponed assert n9094_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n9097_o <= n9072_o (42);
  -- ../fixed_pkg.vhd:183:27
  n9098_o <= '1' when n9097_o /= n9084_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n9105_o <= '0' when n9098_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n9111_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9112_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9113_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9114_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9115_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9116_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9117_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9118_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9119_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9120_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9121_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9122_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9123_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9124_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9125_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9126_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9127_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9128_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9129_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9130_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9131_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9132_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9133_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9134_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9135_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9136_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9137_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9138_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9139_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9140_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9141_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9142_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9143_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9144_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9145_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9146_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9147_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9148_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9149_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9150_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9151_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9152_o <= not n9084_o;
  -- ../fixed_pkg.vhd:194:31
  n9153_o <= not n9084_o;
  n9154_o <= n9111_o & n9112_o & n9113_o & n9114_o;
  -- ../fixed_pkg.vhd:169:40
  n9155_o <= n9115_o & n9116_o & n9117_o & n9118_o;
  -- ../fixed_pkg.vhd:9:14
  n9156_o <= n9119_o & n9120_o & n9121_o & n9122_o;
  -- ../fixed_pkg.vhd:9:14
  n9157_o <= n9123_o & n9124_o & n9125_o & n9126_o;
  n9158_o <= n9127_o & n9128_o & n9129_o & n9130_o;
  -- ../fixed_pkg.vhd:9:14
  n9159_o <= n9131_o & n9132_o & n9133_o & n9134_o;
  -- ../fixed_pkg.vhd:24:14
  n9160_o <= n9135_o & n9136_o & n9137_o & n9138_o;
  -- ../fixed_pkg.vhd:24:14
  n9161_o <= n9139_o & n9140_o & n9141_o & n9142_o;
  n9162_o <= n9143_o & n9144_o & n9145_o & n9146_o;
  -- ../fixed_pkg.vhd:24:14
  n9163_o <= n9147_o & n9148_o & n9149_o & n9150_o;
  n9164_o <= n9151_o & n9152_o & n9153_o;
  -- ../fixed_pkg.vhd:171:18
  n9165_o <= n9154_o & n9155_o & n9156_o & n9157_o;
  n9166_o <= n9158_o & n9159_o & n9160_o & n9161_o;
  -- ../fixed_pkg.vhd:170:18
  n9167_o <= n9162_o & n9163_o & n9164_o;
  n9168_o <= n9165_o & n9166_o & n9167_o;
  -- ../fixed_pkg.vhd:169:40
  n9169_o <= n9168_o (41 downto 0);
  -- ../fixed_pkg.vhd:9:14
  n9170_o <= n9084_o & n9169_o;
  -- ../fixed_pkg.vhd:193:9
  n9171_o <= n9083_o when n9105_o = '0' else n9170_o;
  -- ../fixed_pkg.vhd:168:39
  n9187_o <= n9171_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n9188_o <= n9171_o (42);
  -- ../fixed_pkg.vhd:173:9
  n9193_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n9194_o <= n9193_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n9195: postponed assert n9194_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n9197_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n9198_o <= n9197_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n9199: postponed assert n9198_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n9201_o <= n9171_o (41);
  -- ../fixed_pkg.vhd:183:27
  n9202_o <= '1' when n9201_o /= n9188_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n9209_o <= '0' when n9202_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n9213_o <= '1' when n9202_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n9215_o <= n9171_o (40);
  -- ../fixed_pkg.vhd:183:27
  n9216_o <= '1' when n9215_o /= n9188_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n9218_o <= n9209_o when n9227_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n9224_o <= n9216_o and n9213_o;
  -- ../fixed_pkg.vhd:183:17
  n9227_o <= n9213_o and n9224_o;
  -- ../fixed_pkg.vhd:194:31
  n9229_o <= not n9188_o;
  -- ../fixed_pkg.vhd:194:31
  n9230_o <= not n9188_o;
  -- ../fixed_pkg.vhd:194:31
  n9231_o <= not n9188_o;
  -- ../fixed_pkg.vhd:194:31
  n9232_o <= not n9188_o;
  -- ../fixed_pkg.vhd:194:31
  n9233_o <= not n9188_o;
  -- ../fixed_pkg.vhd:194:31
  n9234_o <= not n9188_o;
  -- ../fixed_pkg.vhd:194:31
  n9235_o <= not n9188_o;
  -- ../fixed_pkg.vhd:194:31
  n9236_o <= not n9188_o;
  -- ../fixed_pkg.vhd:194:31
  n9237_o <= not n9188_o;
  -- ../fixed_pkg.vhd:194:31
  n9238_o <= not n9188_o;
  -- ../fixed_pkg.vhd:194:31
  n9239_o <= not n9188_o;
  -- ../fixed_pkg.vhd:194:31
  n9240_o <= not n9188_o;
  -- ../fixed_pkg.vhd:194:31
  n9241_o <= not n9188_o;
  -- ../fixed_pkg.vhd:194:31
  n9242_o <= not n9188_o;
  -- ../fixed_pkg.vhd:194:31
  n9243_o <= not n9188_o;
  -- ../fixed_pkg.vhd:194:31
  n9244_o <= not n9188_o;
  -- ../fixed_pkg.vhd:194:31
  n9245_o <= not n9188_o;
  -- ../fixed_pkg.vhd:194:31
  n9246_o <= not n9188_o;
  -- ../fixed_pkg.vhd:194:31
  n9247_o <= not n9188_o;
  -- ../fixed_pkg.vhd:194:31
  n9248_o <= not n9188_o;
  -- ../fixed_pkg.vhd:194:31
  n9249_o <= not n9188_o;
  -- ../fixed_pkg.vhd:194:31
  n9250_o <= not n9188_o;
  -- ../fixed_pkg.vhd:194:31
  n9251_o <= not n9188_o;
  -- ../fixed_pkg.vhd:194:31
  n9252_o <= not n9188_o;
  -- ../fixed_pkg.vhd:194:31
  n9253_o <= not n9188_o;
  -- ../fixed_pkg.vhd:171:18
  n9254_o <= n9229_o & n9230_o & n9231_o & n9232_o;
  -- ../fixed_pkg.vhd:9:14
  n9255_o <= n9233_o & n9234_o & n9235_o & n9236_o;
  -- ../fixed_pkg.vhd:9:14
  n9256_o <= n9237_o & n9238_o & n9239_o & n9240_o;
  -- ../fixed_pkg.vhd:183:17
  n9257_o <= n9241_o & n9242_o & n9243_o & n9244_o;
  -- ../fixed_pkg.vhd:9:14
  n9258_o <= n9245_o & n9246_o & n9247_o & n9248_o;
  -- ../fixed_pkg.vhd:40:14
  n9259_o <= n9249_o & n9250_o & n9251_o & n9252_o;
  -- ../fixed_pkg.vhd:40:14
  n9260_o <= n9254_o & n9255_o & n9256_o & n9257_o;
  -- ../fixed_pkg.vhd:9:14
  n9261_o <= n9258_o & n9259_o & n9253_o;
  -- ../fixed_pkg.vhd:40:14
  n9262_o <= n9260_o & n9261_o;
  -- ../fixed_pkg.vhd:183:17
  n9263_o <= n9262_o (23 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n9264_o <= n9187_o (40 downto 16);
  -- ../fixed_pkg.vhd:183:17
  n9265_o <= n9188_o & n9263_o;
  -- ../fixed_pkg.vhd:193:9
  n9266_o <= n9264_o when n9218_o = '0' else n9265_o;
  -- ../BiquadFilter/BiquadFilter.vhd:65:17
  n9269_o <= '1' when state_reg = "01" else '0';
  -- ../fixed_pkg.vhd:266:100
  n9284_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n9287_o <= std_logic_vector (resize (signed (n9284_o) * signed'("0000000000000000000000000000000000000000000"), 43));
  -- ../fixed_pkg.vhd:266:100
  n9299_o <= std_logic_vector (resize (signed (y_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n9302_o <= std_logic_vector (resize (signed (n9299_o) * signed'("0000000000011111111111111100010110010001111"), 43));
  -- ../fixed_pkg.vhd:168:39
  n9319_o <= std_logic_vector (resize (signed (n9287_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n9325_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n9326_o <= n9325_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n9327: postponed assert n9326_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n9329_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n9330_o <= n9329_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n9331: postponed assert n9330_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n9343_o <= std_logic_vector (resize (signed (n9302_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n9349_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n9350_o <= n9349_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n9351: postponed assert n9350_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n9353_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n9354_o <= n9353_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n9355: postponed assert n9354_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:240:67
  n9367_o <= std_logic_vector (unsigned (n9319_o) - unsigned (n9343_o));
  -- ../fixed_pkg.vhd:168:39
  n9378_o <= n9367_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n9379_o <= n9367_o (43);
  -- ../fixed_pkg.vhd:173:9
  n9384_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n9385_o <= n9384_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n9386: postponed assert n9385_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n9388_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n9389_o <= n9388_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n9390: postponed assert n9389_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n9392_o <= n9367_o (42);
  -- ../fixed_pkg.vhd:183:27
  n9393_o <= '1' when n9392_o /= n9379_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n9400_o <= '0' when n9393_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n9406_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9407_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9408_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9409_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9410_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9411_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9412_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9413_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9414_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9415_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9416_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9417_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9418_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9419_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9420_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9421_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9422_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9423_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9424_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9425_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9426_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9427_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9428_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9429_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9430_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9431_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9432_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9433_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9434_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9435_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9436_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9437_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9438_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9439_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9440_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9441_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9442_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9443_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9444_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9445_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9446_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9447_o <= not n9379_o;
  -- ../fixed_pkg.vhd:194:31
  n9448_o <= not n9379_o;
  n9449_o <= n9406_o & n9407_o & n9408_o & n9409_o;
  n9450_o <= n9410_o & n9411_o & n9412_o & n9413_o;
  n9451_o <= n9414_o & n9415_o & n9416_o & n9417_o;
  n9452_o <= n9418_o & n9419_o & n9420_o & n9421_o;
  n9453_o <= n9422_o & n9423_o & n9424_o & n9425_o;
  n9454_o <= n9426_o & n9427_o & n9428_o & n9429_o;
  n9455_o <= n9430_o & n9431_o & n9432_o & n9433_o;
  n9456_o <= n9434_o & n9435_o & n9436_o & n9437_o;
  n9457_o <= n9438_o & n9439_o & n9440_o & n9441_o;
  n9458_o <= n9442_o & n9443_o & n9444_o & n9445_o;
  n9459_o <= n9446_o & n9447_o & n9448_o;
  n9460_o <= n9449_o & n9450_o & n9451_o & n9452_o;
  n9461_o <= n9453_o & n9454_o & n9455_o & n9456_o;
  n9462_o <= n9457_o & n9458_o & n9459_o;
  n9463_o <= n9460_o & n9461_o & n9462_o;
  n9464_o <= n9463_o (41 downto 0);
  n9465_o <= n9379_o & n9464_o;
  -- ../fixed_pkg.vhd:193:9
  n9466_o <= n9378_o when n9400_o = '0' else n9465_o;
  -- ../fixed_pkg.vhd:168:39
  n9484_o <= std_logic_vector (resize (signed (n9466_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n9490_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n9491_o <= n9490_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n9492: postponed assert n9491_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n9494_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n9495_o <= n9494_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n9496: postponed assert n9495_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n9508_o <= std_logic_vector (resize (signed (v_reg), 28));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n9514_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n9515_o <= n9514_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n9516: postponed assert n9515_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n9518_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n9519_o <= n9518_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n9520: postponed assert n9519_o = '1' severity error; --  assert
  n9522_o <= n9521_o (15 downto 0);
  n9523_o <= n9508_o & n9522_o;
  -- ../fixed_pkg.vhd:255:67
  n9534_o <= std_logic_vector (unsigned (n9484_o) + unsigned (n9523_o));
  -- ../fixed_pkg.vhd:168:39
  n9545_o <= n9534_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n9546_o <= n9534_o (43);
  -- ../fixed_pkg.vhd:173:9
  n9551_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n9552_o <= n9551_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n9553: postponed assert n9552_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n9555_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n9556_o <= n9555_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n9557: postponed assert n9556_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n9559_o <= n9534_o (42);
  -- ../fixed_pkg.vhd:183:27
  n9560_o <= '1' when n9559_o /= n9546_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n9567_o <= '0' when n9560_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n9573_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9574_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9575_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9576_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9577_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9578_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9579_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9580_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9581_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9582_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9583_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9584_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9585_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9586_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9587_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9588_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9589_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9590_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9591_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9592_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9593_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9594_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9595_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9596_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9597_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9598_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9599_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9600_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9601_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9602_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9603_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9604_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9605_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9606_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9607_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9608_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9609_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9610_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9611_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9612_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9613_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9614_o <= not n9546_o;
  -- ../fixed_pkg.vhd:194:31
  n9615_o <= not n9546_o;
  n9616_o <= n9573_o & n9574_o & n9575_o & n9576_o;
  n9617_o <= n9577_o & n9578_o & n9579_o & n9580_o;
  n9618_o <= n9581_o & n9582_o & n9583_o & n9584_o;
  n9619_o <= n9585_o & n9586_o & n9587_o & n9588_o;
  n9620_o <= n9589_o & n9590_o & n9591_o & n9592_o;
  n9621_o <= n9593_o & n9594_o & n9595_o & n9596_o;
  n9622_o <= n9597_o & n9598_o & n9599_o & n9600_o;
  n9623_o <= n9601_o & n9602_o & n9603_o & n9604_o;
  n9624_o <= n9605_o & n9606_o & n9607_o & n9608_o;
  n9625_o <= n9609_o & n9610_o & n9611_o & n9612_o;
  n9626_o <= n9613_o & n9614_o & n9615_o;
  n9627_o <= n9616_o & n9617_o & n9618_o & n9619_o;
  n9628_o <= n9620_o & n9621_o & n9622_o & n9623_o;
  n9629_o <= n9624_o & n9625_o & n9626_o;
  n9630_o <= n9627_o & n9628_o & n9629_o;
  n9631_o <= n9630_o (41 downto 0);
  n9632_o <= n9546_o & n9631_o;
  -- ../fixed_pkg.vhd:193:9
  n9633_o <= n9545_o when n9567_o = '0' else n9632_o;
  -- ../fixed_pkg.vhd:168:39
  n9649_o <= n9633_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n9650_o <= n9633_o (42);
  -- ../fixed_pkg.vhd:173:9
  n9655_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n9656_o <= n9655_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n9657: postponed assert n9656_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n9659_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n9660_o <= n9659_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n9661: postponed assert n9660_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n9663_o <= n9633_o (41);
  -- ../fixed_pkg.vhd:183:27
  n9664_o <= '1' when n9663_o /= n9650_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n9671_o <= '0' when n9664_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n9675_o <= '1' when n9664_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n9677_o <= n9633_o (40);
  -- ../fixed_pkg.vhd:183:27
  n9678_o <= '1' when n9677_o /= n9650_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n9680_o <= n9671_o when n9689_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n9686_o <= n9678_o and n9675_o;
  -- ../fixed_pkg.vhd:183:17
  n9689_o <= n9675_o and n9686_o;
  -- ../fixed_pkg.vhd:194:31
  n9691_o <= not n9650_o;
  -- ../fixed_pkg.vhd:194:31
  n9692_o <= not n9650_o;
  -- ../fixed_pkg.vhd:194:31
  n9693_o <= not n9650_o;
  -- ../fixed_pkg.vhd:194:31
  n9694_o <= not n9650_o;
  -- ../fixed_pkg.vhd:194:31
  n9695_o <= not n9650_o;
  -- ../fixed_pkg.vhd:194:31
  n9696_o <= not n9650_o;
  -- ../fixed_pkg.vhd:194:31
  n9697_o <= not n9650_o;
  -- ../fixed_pkg.vhd:194:31
  n9698_o <= not n9650_o;
  -- ../fixed_pkg.vhd:194:31
  n9699_o <= not n9650_o;
  -- ../fixed_pkg.vhd:194:31
  n9700_o <= not n9650_o;
  -- ../fixed_pkg.vhd:194:31
  n9701_o <= not n9650_o;
  -- ../fixed_pkg.vhd:194:31
  n9702_o <= not n9650_o;
  -- ../fixed_pkg.vhd:194:31
  n9703_o <= not n9650_o;
  -- ../fixed_pkg.vhd:194:31
  n9704_o <= not n9650_o;
  -- ../fixed_pkg.vhd:194:31
  n9705_o <= not n9650_o;
  -- ../fixed_pkg.vhd:194:31
  n9706_o <= not n9650_o;
  -- ../fixed_pkg.vhd:194:31
  n9707_o <= not n9650_o;
  -- ../fixed_pkg.vhd:194:31
  n9708_o <= not n9650_o;
  -- ../fixed_pkg.vhd:194:31
  n9709_o <= not n9650_o;
  -- ../fixed_pkg.vhd:194:31
  n9710_o <= not n9650_o;
  -- ../fixed_pkg.vhd:194:31
  n9711_o <= not n9650_o;
  -- ../fixed_pkg.vhd:194:31
  n9712_o <= not n9650_o;
  -- ../fixed_pkg.vhd:194:31
  n9713_o <= not n9650_o;
  -- ../fixed_pkg.vhd:194:31
  n9714_o <= not n9650_o;
  -- ../fixed_pkg.vhd:194:31
  n9715_o <= not n9650_o;
  n9716_o <= n9691_o & n9692_o & n9693_o & n9694_o;
  n9717_o <= n9695_o & n9696_o & n9697_o & n9698_o;
  n9718_o <= n9699_o & n9700_o & n9701_o & n9702_o;
  n9719_o <= n9703_o & n9704_o & n9705_o & n9706_o;
  n9720_o <= n9707_o & n9708_o & n9709_o & n9710_o;
  n9721_o <= n9711_o & n9712_o & n9713_o & n9714_o;
  n9722_o <= n9716_o & n9717_o & n9718_o & n9719_o;
  n9723_o <= n9720_o & n9721_o & n9715_o;
  n9724_o <= n9722_o & n9723_o;
  n9725_o <= n9724_o (23 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n9726_o <= n9649_o (40 downto 16);
  n9727_o <= n9650_o & n9725_o;
  -- ../fixed_pkg.vhd:193:9
  n9728_o <= n9726_o when n9680_o = '0' else n9727_o;
  -- ../fixed_pkg.vhd:266:100
  n9743_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n9746_o <= std_logic_vector (resize (signed (n9743_o) * signed'("0000000000011111111111111111111101101100000"), 43));
  -- ../fixed_pkg.vhd:266:100
  n9758_o <= std_logic_vector (resize (signed (y_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n9761_o <= std_logic_vector (resize (signed (n9758_o) * signed'("0000000000000000000000000001111011010111111"), 43));
  -- ../fixed_pkg.vhd:168:39
  n9778_o <= std_logic_vector (resize (signed (n9746_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n9784_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n9785_o <= n9784_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n9786: postponed assert n9785_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n9788_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n9789_o <= n9788_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n9790: postponed assert n9789_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n9802_o <= std_logic_vector (resize (signed (n9761_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n9808_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n9809_o <= n9808_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n9810: postponed assert n9809_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n9812_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n9813_o <= n9812_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n9814: postponed assert n9813_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:240:67
  n9826_o <= std_logic_vector (unsigned (n9778_o) - unsigned (n9802_o));
  -- ../fixed_pkg.vhd:168:39
  n9837_o <= n9826_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n9838_o <= n9826_o (43);
  -- ../fixed_pkg.vhd:173:9
  n9843_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n9844_o <= n9843_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n9845: postponed assert n9844_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n9847_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n9848_o <= n9847_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n9849: postponed assert n9848_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n9851_o <= n9826_o (42);
  -- ../fixed_pkg.vhd:183:27
  n9852_o <= '1' when n9851_o /= n9838_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n9859_o <= '0' when n9852_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n9865_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9866_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9867_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9868_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9869_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9870_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9871_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9872_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9873_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9874_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9875_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9876_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9877_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9878_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9879_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9880_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9881_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9882_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9883_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9884_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9885_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9886_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9887_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9888_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9889_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9890_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9891_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9892_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9893_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9894_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9895_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9896_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9897_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9898_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9899_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9900_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9901_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9902_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9903_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9904_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9905_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9906_o <= not n9838_o;
  -- ../fixed_pkg.vhd:194:31
  n9907_o <= not n9838_o;
  n9908_o <= n9865_o & n9866_o & n9867_o & n9868_o;
  n9909_o <= n9869_o & n9870_o & n9871_o & n9872_o;
  n9910_o <= n9873_o & n9874_o & n9875_o & n9876_o;
  n9911_o <= n9877_o & n9878_o & n9879_o & n9880_o;
  n9912_o <= n9881_o & n9882_o & n9883_o & n9884_o;
  n9913_o <= n9885_o & n9886_o & n9887_o & n9888_o;
  n9914_o <= n9889_o & n9890_o & n9891_o & n9892_o;
  n9915_o <= n9893_o & n9894_o & n9895_o & n9896_o;
  n9916_o <= n9897_o & n9898_o & n9899_o & n9900_o;
  n9917_o <= n9901_o & n9902_o & n9903_o & n9904_o;
  n9918_o <= n9905_o & n9906_o & n9907_o;
  n9919_o <= n9908_o & n9909_o & n9910_o & n9911_o;
  n9920_o <= n9912_o & n9913_o & n9914_o & n9915_o;
  n9921_o <= n9916_o & n9917_o & n9918_o;
  n9922_o <= n9919_o & n9920_o & n9921_o;
  n9923_o <= n9922_o (41 downto 0);
  n9924_o <= n9838_o & n9923_o;
  -- ../fixed_pkg.vhd:193:9
  n9925_o <= n9837_o when n9859_o = '0' else n9924_o;
  -- ../fixed_pkg.vhd:168:39
  n9941_o <= n9925_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n9942_o <= n9925_o (42);
  -- ../fixed_pkg.vhd:173:9
  n9947_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n9948_o <= n9947_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n9949: postponed assert n9948_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n9951_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n9952_o <= n9951_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n9953: postponed assert n9952_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n9955_o <= n9925_o (41);
  -- ../fixed_pkg.vhd:183:27
  n9956_o <= '1' when n9955_o /= n9942_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n9963_o <= '0' when n9956_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n9967_o <= '1' when n9956_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n9969_o <= n9925_o (40);
  -- ../fixed_pkg.vhd:183:27
  n9970_o <= '1' when n9969_o /= n9942_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n9972_o <= n9963_o when n9981_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n9978_o <= n9970_o and n9967_o;
  -- ../fixed_pkg.vhd:183:17
  n9981_o <= n9967_o and n9978_o;
  -- ../fixed_pkg.vhd:194:31
  n9983_o <= not n9942_o;
  -- ../fixed_pkg.vhd:194:31
  n9984_o <= not n9942_o;
  -- ../fixed_pkg.vhd:194:31
  n9985_o <= not n9942_o;
  -- ../fixed_pkg.vhd:194:31
  n9986_o <= not n9942_o;
  -- ../fixed_pkg.vhd:194:31
  n9987_o <= not n9942_o;
  -- ../fixed_pkg.vhd:194:31
  n9988_o <= not n9942_o;
  -- ../fixed_pkg.vhd:194:31
  n9989_o <= not n9942_o;
  -- ../fixed_pkg.vhd:194:31
  n9990_o <= not n9942_o;
  -- ../fixed_pkg.vhd:194:31
  n9991_o <= not n9942_o;
  -- ../fixed_pkg.vhd:194:31
  n9992_o <= not n9942_o;
  -- ../fixed_pkg.vhd:194:31
  n9993_o <= not n9942_o;
  -- ../fixed_pkg.vhd:194:31
  n9994_o <= not n9942_o;
  -- ../fixed_pkg.vhd:194:31
  n9995_o <= not n9942_o;
  -- ../fixed_pkg.vhd:194:31
  n9996_o <= not n9942_o;
  -- ../fixed_pkg.vhd:194:31
  n9997_o <= not n9942_o;
  -- ../fixed_pkg.vhd:194:31
  n9998_o <= not n9942_o;
  -- ../fixed_pkg.vhd:194:31
  n9999_o <= not n9942_o;
  -- ../fixed_pkg.vhd:194:31
  n10000_o <= not n9942_o;
  -- ../fixed_pkg.vhd:194:31
  n10001_o <= not n9942_o;
  -- ../fixed_pkg.vhd:194:31
  n10002_o <= not n9942_o;
  -- ../fixed_pkg.vhd:194:31
  n10003_o <= not n9942_o;
  -- ../fixed_pkg.vhd:194:31
  n10004_o <= not n9942_o;
  -- ../fixed_pkg.vhd:194:31
  n10005_o <= not n9942_o;
  -- ../fixed_pkg.vhd:194:31
  n10006_o <= not n9942_o;
  -- ../fixed_pkg.vhd:194:31
  n10007_o <= not n9942_o;
  n10008_o <= n9983_o & n9984_o & n9985_o & n9986_o;
  n10009_o <= n9987_o & n9988_o & n9989_o & n9990_o;
  n10010_o <= n9991_o & n9992_o & n9993_o & n9994_o;
  n10011_o <= n9995_o & n9996_o & n9997_o & n9998_o;
  n10012_o <= n9999_o & n10000_o & n10001_o & n10002_o;
  n10013_o <= n10003_o & n10004_o & n10005_o & n10006_o;
  n10014_o <= n10008_o & n10009_o & n10010_o & n10011_o;
  n10015_o <= n10012_o & n10013_o & n10007_o;
  n10016_o <= n10014_o & n10015_o;
  n10017_o <= n10016_o (23 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n10018_o <= n9941_o (40 downto 16);
  n10019_o <= n9942_o & n10017_o;
  -- ../fixed_pkg.vhd:193:9
  n10020_o <= n10018_o when n9972_o = '0' else n10019_o;
  -- ../BiquadFilter/BiquadFilter.vhd:67:17
  n10023_o <= '1' when state_reg = "10" else '0';
  n10024_o <= n10023_o & n9269_o & n8988_o;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n10024_o select n10025_o <=
    x_reg when "100",
    x_reg when "010",
    n8986_o when "001",
    x_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n10024_o select n10026_o <=
    y_reg when "100",
    n9266_o when "010",
    y_reg when "001",
    y_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n10024_o select n10027_o <=
    n9728_o when "100",
    w_reg when "010",
    w_reg when "001",
    w_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n10024_o select n10028_o <=
    n10020_o when "100",
    v_reg when "010",
    v_reg when "001",
    v_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n10056_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n10057_o <= x_reg when n10056_o = '0' else n10025_o;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n10058_q <= n10057_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n10059_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n10060_o <= y_reg when n10059_o = '0' else n10026_o;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n10061_q <= n10060_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n10062_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n10062_q <= n10027_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n10063_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n10063_q <= n10028_o;
    end if;
  end process;
  -- ../fixed_pkg.vhd:168:39
  n10079_o <= y_reg (22 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n10080_o <= y_reg (24);
  -- ../fixed_pkg.vhd:173:9
  n10085_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n10086_o <= n10085_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n10087: postponed assert n10086_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n10089_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n10090_o <= n10089_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n10091: postponed assert n10090_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n10093_o <= y_reg (23);
  -- ../fixed_pkg.vhd:183:27
  n10094_o <= '1' when n10093_o /= n10080_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n10101_o <= '0' when n10094_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n10105_o <= '1' when n10094_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n10107_o <= y_reg (22);
  -- ../fixed_pkg.vhd:183:27
  n10108_o <= '1' when n10107_o /= n10080_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n10110_o <= n10101_o when n10119_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n10116_o <= n10108_o and n10105_o;
  -- ../fixed_pkg.vhd:183:17
  n10119_o <= n10105_o and n10116_o;
  -- ../fixed_pkg.vhd:194:31
  n10121_o <= not n10080_o;
  -- ../fixed_pkg.vhd:194:31
  n10122_o <= not n10080_o;
  -- ../fixed_pkg.vhd:194:31
  n10123_o <= not n10080_o;
  -- ../fixed_pkg.vhd:194:31
  n10124_o <= not n10080_o;
  -- ../fixed_pkg.vhd:194:31
  n10125_o <= not n10080_o;
  -- ../fixed_pkg.vhd:194:31
  n10126_o <= not n10080_o;
  -- ../fixed_pkg.vhd:194:31
  n10127_o <= not n10080_o;
  -- ../fixed_pkg.vhd:194:31
  n10128_o <= not n10080_o;
  -- ../fixed_pkg.vhd:194:31
  n10129_o <= not n10080_o;
  -- ../fixed_pkg.vhd:194:31
  n10130_o <= not n10080_o;
  -- ../fixed_pkg.vhd:194:31
  n10131_o <= not n10080_o;
  -- ../fixed_pkg.vhd:194:31
  n10132_o <= not n10080_o;
  -- ../fixed_pkg.vhd:194:31
  n10133_o <= not n10080_o;
  -- ../fixed_pkg.vhd:194:31
  n10134_o <= not n10080_o;
  -- ../fixed_pkg.vhd:194:31
  n10135_o <= not n10080_o;
  -- ../fixed_pkg.vhd:194:31
  n10136_o <= not n10080_o;
  -- ../fixed_pkg.vhd:194:31
  n10137_o <= not n10080_o;
  -- ../fixed_pkg.vhd:194:31
  n10138_o <= not n10080_o;
  n10139_o <= n10121_o & n10122_o & n10123_o & n10124_o;
  n10140_o <= n10125_o & n10126_o & n10127_o & n10128_o;
  n10141_o <= n10129_o & n10130_o & n10131_o & n10132_o;
  n10142_o <= n10133_o & n10134_o & n10135_o & n10136_o;
  n10143_o <= n10137_o & n10138_o;
  n10144_o <= n10139_o & n10140_o & n10141_o & n10142_o;
  n10145_o <= n10144_o & n10143_o;
  n10146_o <= n10145_o (16 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n10147_o <= n10079_o (22 downto 5);
  n10148_o <= n10080_o & n10146_o;
  -- ../fixed_pkg.vhd:193:9
  n10149_o <= n10147_o when n10110_o = '0' else n10148_o;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity biquadfilter_fe6dfdc304e908e186d08440fe9f1574ff586857 is
  port (
    clk_i : in std_logic;
    reset_i : in std_logic;
    valid_i : in std_logic;
    data_i : in std_logic_vector (17 downto 0);
    ready_i : in std_logic;
    ready_o : out std_logic;
    valid_o : out std_logic;
    data_o : out std_logic_vector (17 downto 0));
end entity biquadfilter_fe6dfdc304e908e186d08440fe9f1574ff586857;

architecture rtl of biquadfilter_fe6dfdc304e908e186d08440fe9f1574ff586857 is
  signal state_reg : std_logic_vector (1 downto 0);
  signal x_reg : std_logic_vector (24 downto 0);
  signal y_reg : std_logic_vector (24 downto 0);
  signal w_reg : std_logic_vector (24 downto 0);
  signal v_reg : std_logic_vector (24 downto 0);
  signal n7684_o : std_logic;
  signal n7686_o : std_logic_vector (1 downto 0);
  signal n7688_o : std_logic;
  signal n7690_o : std_logic;
  signal n7692_o : std_logic;
  signal n7694_o : std_logic_vector (1 downto 0);
  signal n7696_o : std_logic;
  signal n7697_o : std_logic_vector (3 downto 0);
  signal n7701_o : std_logic_vector (1 downto 0);
  signal n7706_q : std_logic_vector (1 downto 0);
  signal n7709_o : std_logic;
  signal n7710_o : std_logic;
  signal n7714_o : std_logic;
  signal n7715_o : std_logic;
  signal n7718_o : std_logic;
  signal n7734_o : std_logic_vector (19 downto 0);
  signal n7740_o : std_logic;
  signal n7741_o : std_logic;
  signal n7744_o : std_logic;
  signal n7745_o : std_logic;
  constant n7747_o : std_logic_vector (24 downto 0) := "0000000000000000000000000";
  signal n7748_o : std_logic_vector (4 downto 0);
  signal n7749_o : std_logic_vector (24 downto 0);
  signal n7750_o : std_logic_vector (24 downto 0);
  signal n7752_o : std_logic;
  signal n7766_o : std_logic_vector (42 downto 0);
  signal n7769_o : std_logic_vector (42 downto 0);
  signal n7786_o : std_logic_vector (43 downto 0);
  signal n7792_o : std_logic;
  signal n7793_o : std_logic;
  signal n7796_o : std_logic;
  signal n7797_o : std_logic;
  signal n7810_o : std_logic_vector (27 downto 0);
  signal n7816_o : std_logic;
  signal n7817_o : std_logic;
  signal n7820_o : std_logic;
  signal n7821_o : std_logic;
  constant n7823_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n7824_o : std_logic_vector (15 downto 0);
  signal n7825_o : std_logic_vector (43 downto 0);
  signal n7836_o : std_logic_vector (43 downto 0);
  signal n7847_o : std_logic_vector (42 downto 0);
  signal n7848_o : std_logic;
  signal n7853_o : std_logic;
  signal n7854_o : std_logic;
  signal n7857_o : std_logic;
  signal n7858_o : std_logic;
  signal n7861_o : std_logic;
  signal n7862_o : std_logic;
  signal n7869_o : std_logic;
  signal n7875_o : std_logic;
  signal n7876_o : std_logic;
  signal n7877_o : std_logic;
  signal n7878_o : std_logic;
  signal n7879_o : std_logic;
  signal n7880_o : std_logic;
  signal n7881_o : std_logic;
  signal n7882_o : std_logic;
  signal n7883_o : std_logic;
  signal n7884_o : std_logic;
  signal n7885_o : std_logic;
  signal n7886_o : std_logic;
  signal n7887_o : std_logic;
  signal n7888_o : std_logic;
  signal n7889_o : std_logic;
  signal n7890_o : std_logic;
  signal n7891_o : std_logic;
  signal n7892_o : std_logic;
  signal n7893_o : std_logic;
  signal n7894_o : std_logic;
  signal n7895_o : std_logic;
  signal n7896_o : std_logic;
  signal n7897_o : std_logic;
  signal n7898_o : std_logic;
  signal n7899_o : std_logic;
  signal n7900_o : std_logic;
  signal n7901_o : std_logic;
  signal n7902_o : std_logic;
  signal n7903_o : std_logic;
  signal n7904_o : std_logic;
  signal n7905_o : std_logic;
  signal n7906_o : std_logic;
  signal n7907_o : std_logic;
  signal n7908_o : std_logic;
  signal n7909_o : std_logic;
  signal n7910_o : std_logic;
  signal n7911_o : std_logic;
  signal n7912_o : std_logic;
  signal n7913_o : std_logic;
  signal n7914_o : std_logic;
  signal n7915_o : std_logic;
  signal n7916_o : std_logic;
  signal n7917_o : std_logic;
  signal n7918_o : std_logic_vector (3 downto 0);
  signal n7919_o : std_logic_vector (3 downto 0);
  signal n7920_o : std_logic_vector (3 downto 0);
  signal n7921_o : std_logic_vector (3 downto 0);
  signal n7922_o : std_logic_vector (3 downto 0);
  signal n7923_o : std_logic_vector (3 downto 0);
  signal n7924_o : std_logic_vector (3 downto 0);
  signal n7925_o : std_logic_vector (3 downto 0);
  signal n7926_o : std_logic_vector (3 downto 0);
  signal n7927_o : std_logic_vector (3 downto 0);
  signal n7928_o : std_logic_vector (2 downto 0);
  signal n7929_o : std_logic_vector (15 downto 0);
  signal n7930_o : std_logic_vector (15 downto 0);
  signal n7931_o : std_logic_vector (10 downto 0);
  signal n7932_o : std_logic_vector (42 downto 0);
  signal n7933_o : std_logic_vector (41 downto 0);
  signal n7934_o : std_logic_vector (42 downto 0);
  signal n7935_o : std_logic_vector (42 downto 0);
  signal n7951_o : std_logic_vector (40 downto 0);
  signal n7952_o : std_logic;
  signal n7957_o : std_logic;
  signal n7958_o : std_logic;
  signal n7961_o : std_logic;
  signal n7962_o : std_logic;
  signal n7965_o : std_logic;
  signal n7966_o : std_logic;
  signal n7973_o : std_logic;
  signal n7977_o : std_logic;
  signal n7979_o : std_logic;
  signal n7980_o : std_logic;
  signal n7982_o : std_logic;
  signal n7988_o : std_logic;
  signal n7991_o : std_logic;
  signal n7993_o : std_logic;
  signal n7994_o : std_logic;
  signal n7995_o : std_logic;
  signal n7996_o : std_logic;
  signal n7997_o : std_logic;
  signal n7998_o : std_logic;
  signal n7999_o : std_logic;
  signal n8000_o : std_logic;
  signal n8001_o : std_logic;
  signal n8002_o : std_logic;
  signal n8003_o : std_logic;
  signal n8004_o : std_logic;
  signal n8005_o : std_logic;
  signal n8006_o : std_logic;
  signal n8007_o : std_logic;
  signal n8008_o : std_logic;
  signal n8009_o : std_logic;
  signal n8010_o : std_logic;
  signal n8011_o : std_logic;
  signal n8012_o : std_logic;
  signal n8013_o : std_logic;
  signal n8014_o : std_logic;
  signal n8015_o : std_logic;
  signal n8016_o : std_logic;
  signal n8017_o : std_logic;
  signal n8018_o : std_logic_vector (3 downto 0);
  signal n8019_o : std_logic_vector (3 downto 0);
  signal n8020_o : std_logic_vector (3 downto 0);
  signal n8021_o : std_logic_vector (3 downto 0);
  signal n8022_o : std_logic_vector (3 downto 0);
  signal n8023_o : std_logic_vector (3 downto 0);
  signal n8024_o : std_logic_vector (15 downto 0);
  signal n8025_o : std_logic_vector (8 downto 0);
  signal n8026_o : std_logic_vector (24 downto 0);
  signal n8027_o : std_logic_vector (23 downto 0);
  signal n8028_o : std_logic_vector (24 downto 0);
  signal n8029_o : std_logic_vector (24 downto 0);
  signal n8030_o : std_logic_vector (24 downto 0);
  signal n8033_o : std_logic;
  signal n8048_o : std_logic_vector (42 downto 0);
  signal n8051_o : std_logic_vector (42 downto 0);
  signal n8063_o : std_logic_vector (42 downto 0);
  signal n8066_o : std_logic_vector (42 downto 0);
  signal n8083_o : std_logic_vector (43 downto 0);
  signal n8089_o : std_logic;
  signal n8090_o : std_logic;
  signal n8093_o : std_logic;
  signal n8094_o : std_logic;
  signal n8107_o : std_logic_vector (43 downto 0);
  signal n8113_o : std_logic;
  signal n8114_o : std_logic;
  signal n8117_o : std_logic;
  signal n8118_o : std_logic;
  signal n8131_o : std_logic_vector (43 downto 0);
  signal n8142_o : std_logic_vector (42 downto 0);
  signal n8143_o : std_logic;
  signal n8148_o : std_logic;
  signal n8149_o : std_logic;
  signal n8152_o : std_logic;
  signal n8153_o : std_logic;
  signal n8156_o : std_logic;
  signal n8157_o : std_logic;
  signal n8164_o : std_logic;
  signal n8170_o : std_logic;
  signal n8171_o : std_logic;
  signal n8172_o : std_logic;
  signal n8173_o : std_logic;
  signal n8174_o : std_logic;
  signal n8175_o : std_logic;
  signal n8176_o : std_logic;
  signal n8177_o : std_logic;
  signal n8178_o : std_logic;
  signal n8179_o : std_logic;
  signal n8180_o : std_logic;
  signal n8181_o : std_logic;
  signal n8182_o : std_logic;
  signal n8183_o : std_logic;
  signal n8184_o : std_logic;
  signal n8185_o : std_logic;
  signal n8186_o : std_logic;
  signal n8187_o : std_logic;
  signal n8188_o : std_logic;
  signal n8189_o : std_logic;
  signal n8190_o : std_logic;
  signal n8191_o : std_logic;
  signal n8192_o : std_logic;
  signal n8193_o : std_logic;
  signal n8194_o : std_logic;
  signal n8195_o : std_logic;
  signal n8196_o : std_logic;
  signal n8197_o : std_logic;
  signal n8198_o : std_logic;
  signal n8199_o : std_logic;
  signal n8200_o : std_logic;
  signal n8201_o : std_logic;
  signal n8202_o : std_logic;
  signal n8203_o : std_logic;
  signal n8204_o : std_logic;
  signal n8205_o : std_logic;
  signal n8206_o : std_logic;
  signal n8207_o : std_logic;
  signal n8208_o : std_logic;
  signal n8209_o : std_logic;
  signal n8210_o : std_logic;
  signal n8211_o : std_logic;
  signal n8212_o : std_logic;
  signal n8213_o : std_logic_vector (3 downto 0);
  signal n8214_o : std_logic_vector (3 downto 0);
  signal n8215_o : std_logic_vector (3 downto 0);
  signal n8216_o : std_logic_vector (3 downto 0);
  signal n8217_o : std_logic_vector (3 downto 0);
  signal n8218_o : std_logic_vector (3 downto 0);
  signal n8219_o : std_logic_vector (3 downto 0);
  signal n8220_o : std_logic_vector (3 downto 0);
  signal n8221_o : std_logic_vector (3 downto 0);
  signal n8222_o : std_logic_vector (3 downto 0);
  signal n8223_o : std_logic_vector (2 downto 0);
  signal n8224_o : std_logic_vector (15 downto 0);
  signal n8225_o : std_logic_vector (15 downto 0);
  signal n8226_o : std_logic_vector (10 downto 0);
  signal n8227_o : std_logic_vector (42 downto 0);
  signal n8228_o : std_logic_vector (41 downto 0);
  signal n8229_o : std_logic_vector (42 downto 0);
  signal n8230_o : std_logic_vector (42 downto 0);
  signal n8248_o : std_logic_vector (43 downto 0);
  signal n8254_o : std_logic;
  signal n8255_o : std_logic;
  signal n8258_o : std_logic;
  signal n8259_o : std_logic;
  signal n8272_o : std_logic_vector (27 downto 0);
  signal n8278_o : std_logic;
  signal n8279_o : std_logic;
  signal n8282_o : std_logic;
  signal n8283_o : std_logic;
  constant n8285_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n8286_o : std_logic_vector (15 downto 0);
  signal n8287_o : std_logic_vector (43 downto 0);
  signal n8298_o : std_logic_vector (43 downto 0);
  signal n8309_o : std_logic_vector (42 downto 0);
  signal n8310_o : std_logic;
  signal n8315_o : std_logic;
  signal n8316_o : std_logic;
  signal n8319_o : std_logic;
  signal n8320_o : std_logic;
  signal n8323_o : std_logic;
  signal n8324_o : std_logic;
  signal n8331_o : std_logic;
  signal n8337_o : std_logic;
  signal n8338_o : std_logic;
  signal n8339_o : std_logic;
  signal n8340_o : std_logic;
  signal n8341_o : std_logic;
  signal n8342_o : std_logic;
  signal n8343_o : std_logic;
  signal n8344_o : std_logic;
  signal n8345_o : std_logic;
  signal n8346_o : std_logic;
  signal n8347_o : std_logic;
  signal n8348_o : std_logic;
  signal n8349_o : std_logic;
  signal n8350_o : std_logic;
  signal n8351_o : std_logic;
  signal n8352_o : std_logic;
  signal n8353_o : std_logic;
  signal n8354_o : std_logic;
  signal n8355_o : std_logic;
  signal n8356_o : std_logic;
  signal n8357_o : std_logic;
  signal n8358_o : std_logic;
  signal n8359_o : std_logic;
  signal n8360_o : std_logic;
  signal n8361_o : std_logic;
  signal n8362_o : std_logic;
  signal n8363_o : std_logic;
  signal n8364_o : std_logic;
  signal n8365_o : std_logic;
  signal n8366_o : std_logic;
  signal n8367_o : std_logic;
  signal n8368_o : std_logic;
  signal n8369_o : std_logic;
  signal n8370_o : std_logic;
  signal n8371_o : std_logic;
  signal n8372_o : std_logic;
  signal n8373_o : std_logic;
  signal n8374_o : std_logic;
  signal n8375_o : std_logic;
  signal n8376_o : std_logic;
  signal n8377_o : std_logic;
  signal n8378_o : std_logic;
  signal n8379_o : std_logic;
  signal n8380_o : std_logic_vector (3 downto 0);
  signal n8381_o : std_logic_vector (3 downto 0);
  signal n8382_o : std_logic_vector (3 downto 0);
  signal n8383_o : std_logic_vector (3 downto 0);
  signal n8384_o : std_logic_vector (3 downto 0);
  signal n8385_o : std_logic_vector (3 downto 0);
  signal n8386_o : std_logic_vector (3 downto 0);
  signal n8387_o : std_logic_vector (3 downto 0);
  signal n8388_o : std_logic_vector (3 downto 0);
  signal n8389_o : std_logic_vector (3 downto 0);
  signal n8390_o : std_logic_vector (2 downto 0);
  signal n8391_o : std_logic_vector (15 downto 0);
  signal n8392_o : std_logic_vector (15 downto 0);
  signal n8393_o : std_logic_vector (10 downto 0);
  signal n8394_o : std_logic_vector (42 downto 0);
  signal n8395_o : std_logic_vector (41 downto 0);
  signal n8396_o : std_logic_vector (42 downto 0);
  signal n8397_o : std_logic_vector (42 downto 0);
  signal n8413_o : std_logic_vector (40 downto 0);
  signal n8414_o : std_logic;
  signal n8419_o : std_logic;
  signal n8420_o : std_logic;
  signal n8423_o : std_logic;
  signal n8424_o : std_logic;
  signal n8427_o : std_logic;
  signal n8428_o : std_logic;
  signal n8435_o : std_logic;
  signal n8439_o : std_logic;
  signal n8441_o : std_logic;
  signal n8442_o : std_logic;
  signal n8444_o : std_logic;
  signal n8450_o : std_logic;
  signal n8453_o : std_logic;
  signal n8455_o : std_logic;
  signal n8456_o : std_logic;
  signal n8457_o : std_logic;
  signal n8458_o : std_logic;
  signal n8459_o : std_logic;
  signal n8460_o : std_logic;
  signal n8461_o : std_logic;
  signal n8462_o : std_logic;
  signal n8463_o : std_logic;
  signal n8464_o : std_logic;
  signal n8465_o : std_logic;
  signal n8466_o : std_logic;
  signal n8467_o : std_logic;
  signal n8468_o : std_logic;
  signal n8469_o : std_logic;
  signal n8470_o : std_logic;
  signal n8471_o : std_logic;
  signal n8472_o : std_logic;
  signal n8473_o : std_logic;
  signal n8474_o : std_logic;
  signal n8475_o : std_logic;
  signal n8476_o : std_logic;
  signal n8477_o : std_logic;
  signal n8478_o : std_logic;
  signal n8479_o : std_logic;
  signal n8480_o : std_logic_vector (3 downto 0);
  signal n8481_o : std_logic_vector (3 downto 0);
  signal n8482_o : std_logic_vector (3 downto 0);
  signal n8483_o : std_logic_vector (3 downto 0);
  signal n8484_o : std_logic_vector (3 downto 0);
  signal n8485_o : std_logic_vector (3 downto 0);
  signal n8486_o : std_logic_vector (15 downto 0);
  signal n8487_o : std_logic_vector (8 downto 0);
  signal n8488_o : std_logic_vector (24 downto 0);
  signal n8489_o : std_logic_vector (23 downto 0);
  signal n8490_o : std_logic_vector (24 downto 0);
  signal n8491_o : std_logic_vector (24 downto 0);
  signal n8492_o : std_logic_vector (24 downto 0);
  signal n8507_o : std_logic_vector (42 downto 0);
  signal n8510_o : std_logic_vector (42 downto 0);
  signal n8522_o : std_logic_vector (42 downto 0);
  signal n8525_o : std_logic_vector (42 downto 0);
  signal n8542_o : std_logic_vector (43 downto 0);
  signal n8548_o : std_logic;
  signal n8549_o : std_logic;
  signal n8552_o : std_logic;
  signal n8553_o : std_logic;
  signal n8566_o : std_logic_vector (43 downto 0);
  signal n8572_o : std_logic;
  signal n8573_o : std_logic;
  signal n8576_o : std_logic;
  signal n8577_o : std_logic;
  signal n8590_o : std_logic_vector (43 downto 0);
  signal n8601_o : std_logic_vector (42 downto 0);
  signal n8602_o : std_logic;
  signal n8607_o : std_logic;
  signal n8608_o : std_logic;
  signal n8611_o : std_logic;
  signal n8612_o : std_logic;
  signal n8615_o : std_logic;
  signal n8616_o : std_logic;
  signal n8623_o : std_logic;
  signal n8629_o : std_logic;
  signal n8630_o : std_logic;
  signal n8631_o : std_logic;
  signal n8632_o : std_logic;
  signal n8633_o : std_logic;
  signal n8634_o : std_logic;
  signal n8635_o : std_logic;
  signal n8636_o : std_logic;
  signal n8637_o : std_logic;
  signal n8638_o : std_logic;
  signal n8639_o : std_logic;
  signal n8640_o : std_logic;
  signal n8641_o : std_logic;
  signal n8642_o : std_logic;
  signal n8643_o : std_logic;
  signal n8644_o : std_logic;
  signal n8645_o : std_logic;
  signal n8646_o : std_logic;
  signal n8647_o : std_logic;
  signal n8648_o : std_logic;
  signal n8649_o : std_logic;
  signal n8650_o : std_logic;
  signal n8651_o : std_logic;
  signal n8652_o : std_logic;
  signal n8653_o : std_logic;
  signal n8654_o : std_logic;
  signal n8655_o : std_logic;
  signal n8656_o : std_logic;
  signal n8657_o : std_logic;
  signal n8658_o : std_logic;
  signal n8659_o : std_logic;
  signal n8660_o : std_logic;
  signal n8661_o : std_logic;
  signal n8662_o : std_logic;
  signal n8663_o : std_logic;
  signal n8664_o : std_logic;
  signal n8665_o : std_logic;
  signal n8666_o : std_logic;
  signal n8667_o : std_logic;
  signal n8668_o : std_logic;
  signal n8669_o : std_logic;
  signal n8670_o : std_logic;
  signal n8671_o : std_logic;
  signal n8672_o : std_logic_vector (3 downto 0);
  signal n8673_o : std_logic_vector (3 downto 0);
  signal n8674_o : std_logic_vector (3 downto 0);
  signal n8675_o : std_logic_vector (3 downto 0);
  signal n8676_o : std_logic_vector (3 downto 0);
  signal n8677_o : std_logic_vector (3 downto 0);
  signal n8678_o : std_logic_vector (3 downto 0);
  signal n8679_o : std_logic_vector (3 downto 0);
  signal n8680_o : std_logic_vector (3 downto 0);
  signal n8681_o : std_logic_vector (3 downto 0);
  signal n8682_o : std_logic_vector (2 downto 0);
  signal n8683_o : std_logic_vector (15 downto 0);
  signal n8684_o : std_logic_vector (15 downto 0);
  signal n8685_o : std_logic_vector (10 downto 0);
  signal n8686_o : std_logic_vector (42 downto 0);
  signal n8687_o : std_logic_vector (41 downto 0);
  signal n8688_o : std_logic_vector (42 downto 0);
  signal n8689_o : std_logic_vector (42 downto 0);
  signal n8705_o : std_logic_vector (40 downto 0);
  signal n8706_o : std_logic;
  signal n8711_o : std_logic;
  signal n8712_o : std_logic;
  signal n8715_o : std_logic;
  signal n8716_o : std_logic;
  signal n8719_o : std_logic;
  signal n8720_o : std_logic;
  signal n8727_o : std_logic;
  signal n8731_o : std_logic;
  signal n8733_o : std_logic;
  signal n8734_o : std_logic;
  signal n8736_o : std_logic;
  signal n8742_o : std_logic;
  signal n8745_o : std_logic;
  signal n8747_o : std_logic;
  signal n8748_o : std_logic;
  signal n8749_o : std_logic;
  signal n8750_o : std_logic;
  signal n8751_o : std_logic;
  signal n8752_o : std_logic;
  signal n8753_o : std_logic;
  signal n8754_o : std_logic;
  signal n8755_o : std_logic;
  signal n8756_o : std_logic;
  signal n8757_o : std_logic;
  signal n8758_o : std_logic;
  signal n8759_o : std_logic;
  signal n8760_o : std_logic;
  signal n8761_o : std_logic;
  signal n8762_o : std_logic;
  signal n8763_o : std_logic;
  signal n8764_o : std_logic;
  signal n8765_o : std_logic;
  signal n8766_o : std_logic;
  signal n8767_o : std_logic;
  signal n8768_o : std_logic;
  signal n8769_o : std_logic;
  signal n8770_o : std_logic;
  signal n8771_o : std_logic;
  signal n8772_o : std_logic_vector (3 downto 0);
  signal n8773_o : std_logic_vector (3 downto 0);
  signal n8774_o : std_logic_vector (3 downto 0);
  signal n8775_o : std_logic_vector (3 downto 0);
  signal n8776_o : std_logic_vector (3 downto 0);
  signal n8777_o : std_logic_vector (3 downto 0);
  signal n8778_o : std_logic_vector (15 downto 0);
  signal n8779_o : std_logic_vector (8 downto 0);
  signal n8780_o : std_logic_vector (24 downto 0);
  signal n8781_o : std_logic_vector (23 downto 0);
  signal n8782_o : std_logic_vector (24 downto 0);
  signal n8783_o : std_logic_vector (24 downto 0);
  signal n8784_o : std_logic_vector (24 downto 0);
  signal n8787_o : std_logic;
  signal n8788_o : std_logic_vector (2 downto 0);
  signal n8789_o : std_logic_vector (24 downto 0);
  signal n8790_o : std_logic_vector (24 downto 0);
  signal n8791_o : std_logic_vector (24 downto 0);
  signal n8792_o : std_logic_vector (24 downto 0);
  signal n8820_o : std_logic;
  signal n8821_o : std_logic_vector (24 downto 0);
  signal n8822_q : std_logic_vector (24 downto 0);
  signal n8823_o : std_logic;
  signal n8824_o : std_logic_vector (24 downto 0);
  signal n8825_q : std_logic_vector (24 downto 0);
  signal n8826_q : std_logic_vector (24 downto 0);
  signal n8827_q : std_logic_vector (24 downto 0);
  signal n8843_o : std_logic_vector (22 downto 0);
  signal n8844_o : std_logic;
  signal n8849_o : std_logic;
  signal n8850_o : std_logic;
  signal n8853_o : std_logic;
  signal n8854_o : std_logic;
  signal n8857_o : std_logic;
  signal n8858_o : std_logic;
  signal n8865_o : std_logic;
  signal n8869_o : std_logic;
  signal n8871_o : std_logic;
  signal n8872_o : std_logic;
  signal n8874_o : std_logic;
  signal n8880_o : std_logic;
  signal n8883_o : std_logic;
  signal n8885_o : std_logic;
  signal n8886_o : std_logic;
  signal n8887_o : std_logic;
  signal n8888_o : std_logic;
  signal n8889_o : std_logic;
  signal n8890_o : std_logic;
  signal n8891_o : std_logic;
  signal n8892_o : std_logic;
  signal n8893_o : std_logic;
  signal n8894_o : std_logic;
  signal n8895_o : std_logic;
  signal n8896_o : std_logic;
  signal n8897_o : std_logic;
  signal n8898_o : std_logic;
  signal n8899_o : std_logic;
  signal n8900_o : std_logic;
  signal n8901_o : std_logic;
  signal n8902_o : std_logic;
  signal n8903_o : std_logic_vector (3 downto 0);
  signal n8904_o : std_logic_vector (3 downto 0);
  signal n8905_o : std_logic_vector (3 downto 0);
  signal n8906_o : std_logic_vector (3 downto 0);
  signal n8907_o : std_logic_vector (1 downto 0);
  signal n8908_o : std_logic_vector (15 downto 0);
  signal n8909_o : std_logic_vector (17 downto 0);
  signal n8910_o : std_logic_vector (16 downto 0);
  signal n8911_o : std_logic_vector (17 downto 0);
  signal n8912_o : std_logic_vector (17 downto 0);
  signal n8913_o : std_logic_vector (17 downto 0);
begin
  ready_o <= n7710_o;
  valid_o <= n7715_o;
  data_o <= n8913_o;
  -- ../BiquadFilter/BiquadFilter.vhd:26:12
  state_reg <= n7706_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:12
  x_reg <= n8822_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:19
  y_reg <= n8825_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:26
  w_reg <= n8826_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:33
  v_reg <= n8827_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:33:15
  -- n7684_o <= '1' when rising_edge (clk_i) else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:36:21
  n7686_o <= state_reg when valid_i = '0' else "01";
  -- ../BiquadFilter/BiquadFilter.vhd:35:17
  n7688_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:39:17
  n7690_o <= '1' when state_reg = "01" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:41:17
  n7692_o <= '1' when state_reg = "10" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:44:21
  n7694_o <= state_reg when ready_i = '0' else "00";
  -- ../BiquadFilter/BiquadFilter.vhd:43:17
  n7696_o <= '1' when state_reg = "11" else '0';
  -- ../fixed_pkg.vhd:183:17
  n7697_o <= n7696_o & n7692_o & n7690_o & n7688_o;
  -- ../BiquadFilter/BiquadFilter.vhd:34:13
  with n7697_o select n7701_o <=
    n7694_o when "1000",
    "11" when "0100",
    "10" when "0010",
    n7686_o when "0001",
    "XX" when others;
  -- ../BiquadFilter/BiquadFilter.vhd:33:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n7706_q <= "00";
    elsif rising_edge (clk_i) then
      n7706_q <= n7701_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:51:35
  n7709_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:51:20
  n7710_o <= '0' when n7709_o = '0' else '1';
  -- ../BiquadFilter/BiquadFilter.vhd:52:35
  n7714_o <= '1' when state_reg = "11" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:52:20
  n7715_o <= '0' when n7714_o = '0' else '1';
  -- ../BiquadFilter/BiquadFilter.vhd:59:15
  -- n7718_o <= '1' when rising_edge (clk_i) else '0';
  -- ../fixed_pkg.vhd:168:39
  n7734_o <= std_logic_vector (resize (signed (data_i), 20));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n7740_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n7741_o <= n7740_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n7742: postponed assert n7741_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n7744_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n7745_o <= n7744_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n7746: postponed assert n7745_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:170:18
  n7748_o <= n7747_o (4 downto 0);
  n7749_o <= n7734_o & n7748_o;
  -- ../BiquadFilter/BiquadFilter.vhd:62:21
  n7750_o <= x_reg when valid_i = '0' else n7749_o;
  -- ../BiquadFilter/BiquadFilter.vhd:61:17
  n7752_o <= '1' when state_reg = "00" else '0';
  -- ../fixed_pkg.vhd:266:100
  n7766_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n7769_o <= std_logic_vector (resize (signed (n7766_o) * signed'("0000000000000000000000000000000001111100101"), 43));
  -- ../fixed_pkg.vhd:168:39
  n7786_o <= std_logic_vector (resize (signed (n7769_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n7792_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n7793_o <= n7792_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n7794: postponed assert n7793_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n7796_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n7797_o <= n7796_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n7798: postponed assert n7797_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n7810_o <= std_logic_vector (resize (signed (w_reg), 28));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n7816_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n7817_o <= n7816_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n7818: postponed assert n7817_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n7820_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n7821_o <= n7820_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n7822: postponed assert n7821_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:24:14
  n7824_o <= n7823_o (15 downto 0);
  -- ../fixed_pkg.vhd:24:14
  n7825_o <= n7810_o & n7824_o;
  -- ../fixed_pkg.vhd:255:67
  n7836_o <= std_logic_vector (unsigned (n7786_o) + unsigned (n7825_o));
  -- ../fixed_pkg.vhd:168:39
  n7847_o <= n7836_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n7848_o <= n7836_o (43);
  -- ../fixed_pkg.vhd:173:9
  n7853_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n7854_o <= n7853_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n7855: postponed assert n7854_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n7857_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n7858_o <= n7857_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n7859: postponed assert n7858_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n7861_o <= n7836_o (42);
  -- ../fixed_pkg.vhd:183:27
  n7862_o <= '1' when n7861_o /= n7848_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n7869_o <= '0' when n7862_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n7875_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7876_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7877_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7878_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7879_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7880_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7881_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7882_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7883_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7884_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7885_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7886_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7887_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7888_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7889_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7890_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7891_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7892_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7893_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7894_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7895_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7896_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7897_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7898_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7899_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7900_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7901_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7902_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7903_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7904_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7905_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7906_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7907_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7908_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7909_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7910_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7911_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7912_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7913_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7914_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7915_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7916_o <= not n7848_o;
  -- ../fixed_pkg.vhd:194:31
  n7917_o <= not n7848_o;
  n7918_o <= n7875_o & n7876_o & n7877_o & n7878_o;
  -- ../fixed_pkg.vhd:169:40
  n7919_o <= n7879_o & n7880_o & n7881_o & n7882_o;
  -- ../fixed_pkg.vhd:9:14
  n7920_o <= n7883_o & n7884_o & n7885_o & n7886_o;
  -- ../fixed_pkg.vhd:9:14
  n7921_o <= n7887_o & n7888_o & n7889_o & n7890_o;
  n7922_o <= n7891_o & n7892_o & n7893_o & n7894_o;
  -- ../fixed_pkg.vhd:9:14
  n7923_o <= n7895_o & n7896_o & n7897_o & n7898_o;
  -- ../fixed_pkg.vhd:24:14
  n7924_o <= n7899_o & n7900_o & n7901_o & n7902_o;
  -- ../fixed_pkg.vhd:24:14
  n7925_o <= n7903_o & n7904_o & n7905_o & n7906_o;
  n7926_o <= n7907_o & n7908_o & n7909_o & n7910_o;
  -- ../fixed_pkg.vhd:24:14
  n7927_o <= n7911_o & n7912_o & n7913_o & n7914_o;
  n7928_o <= n7915_o & n7916_o & n7917_o;
  -- ../fixed_pkg.vhd:171:18
  n7929_o <= n7918_o & n7919_o & n7920_o & n7921_o;
  n7930_o <= n7922_o & n7923_o & n7924_o & n7925_o;
  -- ../fixed_pkg.vhd:170:18
  n7931_o <= n7926_o & n7927_o & n7928_o;
  n7932_o <= n7929_o & n7930_o & n7931_o;
  -- ../fixed_pkg.vhd:169:40
  n7933_o <= n7932_o (41 downto 0);
  -- ../fixed_pkg.vhd:9:14
  n7934_o <= n7848_o & n7933_o;
  -- ../fixed_pkg.vhd:193:9
  n7935_o <= n7847_o when n7869_o = '0' else n7934_o;
  -- ../fixed_pkg.vhd:168:39
  n7951_o <= n7935_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n7952_o <= n7935_o (42);
  -- ../fixed_pkg.vhd:173:9
  n7957_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n7958_o <= n7957_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n7959: postponed assert n7958_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n7961_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n7962_o <= n7961_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n7963: postponed assert n7962_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n7965_o <= n7935_o (41);
  -- ../fixed_pkg.vhd:183:27
  n7966_o <= '1' when n7965_o /= n7952_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n7973_o <= '0' when n7966_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n7977_o <= '1' when n7966_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n7979_o <= n7935_o (40);
  -- ../fixed_pkg.vhd:183:27
  n7980_o <= '1' when n7979_o /= n7952_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n7982_o <= n7973_o when n7991_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n7988_o <= n7980_o and n7977_o;
  -- ../fixed_pkg.vhd:183:17
  n7991_o <= n7977_o and n7988_o;
  -- ../fixed_pkg.vhd:194:31
  n7993_o <= not n7952_o;
  -- ../fixed_pkg.vhd:194:31
  n7994_o <= not n7952_o;
  -- ../fixed_pkg.vhd:194:31
  n7995_o <= not n7952_o;
  -- ../fixed_pkg.vhd:194:31
  n7996_o <= not n7952_o;
  -- ../fixed_pkg.vhd:194:31
  n7997_o <= not n7952_o;
  -- ../fixed_pkg.vhd:194:31
  n7998_o <= not n7952_o;
  -- ../fixed_pkg.vhd:194:31
  n7999_o <= not n7952_o;
  -- ../fixed_pkg.vhd:194:31
  n8000_o <= not n7952_o;
  -- ../fixed_pkg.vhd:194:31
  n8001_o <= not n7952_o;
  -- ../fixed_pkg.vhd:194:31
  n8002_o <= not n7952_o;
  -- ../fixed_pkg.vhd:194:31
  n8003_o <= not n7952_o;
  -- ../fixed_pkg.vhd:194:31
  n8004_o <= not n7952_o;
  -- ../fixed_pkg.vhd:194:31
  n8005_o <= not n7952_o;
  -- ../fixed_pkg.vhd:194:31
  n8006_o <= not n7952_o;
  -- ../fixed_pkg.vhd:194:31
  n8007_o <= not n7952_o;
  -- ../fixed_pkg.vhd:194:31
  n8008_o <= not n7952_o;
  -- ../fixed_pkg.vhd:194:31
  n8009_o <= not n7952_o;
  -- ../fixed_pkg.vhd:194:31
  n8010_o <= not n7952_o;
  -- ../fixed_pkg.vhd:194:31
  n8011_o <= not n7952_o;
  -- ../fixed_pkg.vhd:194:31
  n8012_o <= not n7952_o;
  -- ../fixed_pkg.vhd:194:31
  n8013_o <= not n7952_o;
  -- ../fixed_pkg.vhd:194:31
  n8014_o <= not n7952_o;
  -- ../fixed_pkg.vhd:194:31
  n8015_o <= not n7952_o;
  -- ../fixed_pkg.vhd:194:31
  n8016_o <= not n7952_o;
  -- ../fixed_pkg.vhd:194:31
  n8017_o <= not n7952_o;
  -- ../fixed_pkg.vhd:171:18
  n8018_o <= n7993_o & n7994_o & n7995_o & n7996_o;
  -- ../fixed_pkg.vhd:9:14
  n8019_o <= n7997_o & n7998_o & n7999_o & n8000_o;
  -- ../fixed_pkg.vhd:9:14
  n8020_o <= n8001_o & n8002_o & n8003_o & n8004_o;
  -- ../fixed_pkg.vhd:183:17
  n8021_o <= n8005_o & n8006_o & n8007_o & n8008_o;
  -- ../fixed_pkg.vhd:9:14
  n8022_o <= n8009_o & n8010_o & n8011_o & n8012_o;
  -- ../fixed_pkg.vhd:40:14
  n8023_o <= n8013_o & n8014_o & n8015_o & n8016_o;
  -- ../fixed_pkg.vhd:40:14
  n8024_o <= n8018_o & n8019_o & n8020_o & n8021_o;
  -- ../fixed_pkg.vhd:9:14
  n8025_o <= n8022_o & n8023_o & n8017_o;
  -- ../fixed_pkg.vhd:40:14
  n8026_o <= n8024_o & n8025_o;
  -- ../fixed_pkg.vhd:183:17
  n8027_o <= n8026_o (23 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n8028_o <= n7951_o (40 downto 16);
  -- ../fixed_pkg.vhd:183:17
  n8029_o <= n7952_o & n8027_o;
  -- ../fixed_pkg.vhd:193:9
  n8030_o <= n8028_o when n7982_o = '0' else n8029_o;
  -- ../BiquadFilter/BiquadFilter.vhd:65:17
  n8033_o <= '1' when state_reg = "01" else '0';
  -- ../fixed_pkg.vhd:266:100
  n8048_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n8051_o <= std_logic_vector (resize (signed (n8048_o) * signed'("0000000000000000000000000000000000000000000"), 43));
  -- ../fixed_pkg.vhd:266:100
  n8063_o <= std_logic_vector (resize (signed (y_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n8066_o <= std_logic_vector (resize (signed (n8063_o) * signed'("0000000000011111111111111100010000001111000"), 43));
  -- ../fixed_pkg.vhd:168:39
  n8083_o <= std_logic_vector (resize (signed (n8051_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n8089_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n8090_o <= n8089_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n8091: postponed assert n8090_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n8093_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n8094_o <= n8093_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n8095: postponed assert n8094_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n8107_o <= std_logic_vector (resize (signed (n8066_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n8113_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n8114_o <= n8113_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n8115: postponed assert n8114_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n8117_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n8118_o <= n8117_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n8119: postponed assert n8118_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:240:67
  n8131_o <= std_logic_vector (unsigned (n8083_o) - unsigned (n8107_o));
  -- ../fixed_pkg.vhd:168:39
  n8142_o <= n8131_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n8143_o <= n8131_o (43);
  -- ../fixed_pkg.vhd:173:9
  n8148_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n8149_o <= n8148_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n8150: postponed assert n8149_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n8152_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n8153_o <= n8152_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n8154: postponed assert n8153_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n8156_o <= n8131_o (42);
  -- ../fixed_pkg.vhd:183:27
  n8157_o <= '1' when n8156_o /= n8143_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n8164_o <= '0' when n8157_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n8170_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8171_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8172_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8173_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8174_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8175_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8176_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8177_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8178_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8179_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8180_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8181_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8182_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8183_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8184_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8185_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8186_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8187_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8188_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8189_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8190_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8191_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8192_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8193_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8194_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8195_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8196_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8197_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8198_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8199_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8200_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8201_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8202_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8203_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8204_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8205_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8206_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8207_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8208_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8209_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8210_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8211_o <= not n8143_o;
  -- ../fixed_pkg.vhd:194:31
  n8212_o <= not n8143_o;
  n8213_o <= n8170_o & n8171_o & n8172_o & n8173_o;
  n8214_o <= n8174_o & n8175_o & n8176_o & n8177_o;
  n8215_o <= n8178_o & n8179_o & n8180_o & n8181_o;
  n8216_o <= n8182_o & n8183_o & n8184_o & n8185_o;
  n8217_o <= n8186_o & n8187_o & n8188_o & n8189_o;
  n8218_o <= n8190_o & n8191_o & n8192_o & n8193_o;
  n8219_o <= n8194_o & n8195_o & n8196_o & n8197_o;
  n8220_o <= n8198_o & n8199_o & n8200_o & n8201_o;
  n8221_o <= n8202_o & n8203_o & n8204_o & n8205_o;
  n8222_o <= n8206_o & n8207_o & n8208_o & n8209_o;
  n8223_o <= n8210_o & n8211_o & n8212_o;
  n8224_o <= n8213_o & n8214_o & n8215_o & n8216_o;
  n8225_o <= n8217_o & n8218_o & n8219_o & n8220_o;
  n8226_o <= n8221_o & n8222_o & n8223_o;
  n8227_o <= n8224_o & n8225_o & n8226_o;
  n8228_o <= n8227_o (41 downto 0);
  n8229_o <= n8143_o & n8228_o;
  -- ../fixed_pkg.vhd:193:9
  n8230_o <= n8142_o when n8164_o = '0' else n8229_o;
  -- ../fixed_pkg.vhd:168:39
  n8248_o <= std_logic_vector (resize (signed (n8230_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n8254_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n8255_o <= n8254_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n8256: postponed assert n8255_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n8258_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n8259_o <= n8258_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n8260: postponed assert n8259_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n8272_o <= std_logic_vector (resize (signed (v_reg), 28));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n8278_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n8279_o <= n8278_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n8280: postponed assert n8279_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n8282_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n8283_o <= n8282_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n8284: postponed assert n8283_o = '1' severity error; --  assert
  n8286_o <= n8285_o (15 downto 0);
  n8287_o <= n8272_o & n8286_o;
  -- ../fixed_pkg.vhd:255:67
  n8298_o <= std_logic_vector (unsigned (n8248_o) + unsigned (n8287_o));
  -- ../fixed_pkg.vhd:168:39
  n8309_o <= n8298_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n8310_o <= n8298_o (43);
  -- ../fixed_pkg.vhd:173:9
  n8315_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n8316_o <= n8315_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n8317: postponed assert n8316_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n8319_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n8320_o <= n8319_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n8321: postponed assert n8320_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n8323_o <= n8298_o (42);
  -- ../fixed_pkg.vhd:183:27
  n8324_o <= '1' when n8323_o /= n8310_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n8331_o <= '0' when n8324_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n8337_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8338_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8339_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8340_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8341_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8342_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8343_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8344_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8345_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8346_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8347_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8348_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8349_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8350_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8351_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8352_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8353_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8354_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8355_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8356_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8357_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8358_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8359_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8360_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8361_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8362_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8363_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8364_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8365_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8366_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8367_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8368_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8369_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8370_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8371_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8372_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8373_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8374_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8375_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8376_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8377_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8378_o <= not n8310_o;
  -- ../fixed_pkg.vhd:194:31
  n8379_o <= not n8310_o;
  n8380_o <= n8337_o & n8338_o & n8339_o & n8340_o;
  n8381_o <= n8341_o & n8342_o & n8343_o & n8344_o;
  n8382_o <= n8345_o & n8346_o & n8347_o & n8348_o;
  n8383_o <= n8349_o & n8350_o & n8351_o & n8352_o;
  n8384_o <= n8353_o & n8354_o & n8355_o & n8356_o;
  n8385_o <= n8357_o & n8358_o & n8359_o & n8360_o;
  n8386_o <= n8361_o & n8362_o & n8363_o & n8364_o;
  n8387_o <= n8365_o & n8366_o & n8367_o & n8368_o;
  n8388_o <= n8369_o & n8370_o & n8371_o & n8372_o;
  n8389_o <= n8373_o & n8374_o & n8375_o & n8376_o;
  n8390_o <= n8377_o & n8378_o & n8379_o;
  n8391_o <= n8380_o & n8381_o & n8382_o & n8383_o;
  n8392_o <= n8384_o & n8385_o & n8386_o & n8387_o;
  n8393_o <= n8388_o & n8389_o & n8390_o;
  n8394_o <= n8391_o & n8392_o & n8393_o;
  n8395_o <= n8394_o (41 downto 0);
  n8396_o <= n8310_o & n8395_o;
  -- ../fixed_pkg.vhd:193:9
  n8397_o <= n8309_o when n8331_o = '0' else n8396_o;
  -- ../fixed_pkg.vhd:168:39
  n8413_o <= n8397_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n8414_o <= n8397_o (42);
  -- ../fixed_pkg.vhd:173:9
  n8419_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n8420_o <= n8419_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n8421: postponed assert n8420_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n8423_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n8424_o <= n8423_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n8425: postponed assert n8424_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n8427_o <= n8397_o (41);
  -- ../fixed_pkg.vhd:183:27
  n8428_o <= '1' when n8427_o /= n8414_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n8435_o <= '0' when n8428_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n8439_o <= '1' when n8428_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n8441_o <= n8397_o (40);
  -- ../fixed_pkg.vhd:183:27
  n8442_o <= '1' when n8441_o /= n8414_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n8444_o <= n8435_o when n8453_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n8450_o <= n8442_o and n8439_o;
  -- ../fixed_pkg.vhd:183:17
  n8453_o <= n8439_o and n8450_o;
  -- ../fixed_pkg.vhd:194:31
  n8455_o <= not n8414_o;
  -- ../fixed_pkg.vhd:194:31
  n8456_o <= not n8414_o;
  -- ../fixed_pkg.vhd:194:31
  n8457_o <= not n8414_o;
  -- ../fixed_pkg.vhd:194:31
  n8458_o <= not n8414_o;
  -- ../fixed_pkg.vhd:194:31
  n8459_o <= not n8414_o;
  -- ../fixed_pkg.vhd:194:31
  n8460_o <= not n8414_o;
  -- ../fixed_pkg.vhd:194:31
  n8461_o <= not n8414_o;
  -- ../fixed_pkg.vhd:194:31
  n8462_o <= not n8414_o;
  -- ../fixed_pkg.vhd:194:31
  n8463_o <= not n8414_o;
  -- ../fixed_pkg.vhd:194:31
  n8464_o <= not n8414_o;
  -- ../fixed_pkg.vhd:194:31
  n8465_o <= not n8414_o;
  -- ../fixed_pkg.vhd:194:31
  n8466_o <= not n8414_o;
  -- ../fixed_pkg.vhd:194:31
  n8467_o <= not n8414_o;
  -- ../fixed_pkg.vhd:194:31
  n8468_o <= not n8414_o;
  -- ../fixed_pkg.vhd:194:31
  n8469_o <= not n8414_o;
  -- ../fixed_pkg.vhd:194:31
  n8470_o <= not n8414_o;
  -- ../fixed_pkg.vhd:194:31
  n8471_o <= not n8414_o;
  -- ../fixed_pkg.vhd:194:31
  n8472_o <= not n8414_o;
  -- ../fixed_pkg.vhd:194:31
  n8473_o <= not n8414_o;
  -- ../fixed_pkg.vhd:194:31
  n8474_o <= not n8414_o;
  -- ../fixed_pkg.vhd:194:31
  n8475_o <= not n8414_o;
  -- ../fixed_pkg.vhd:194:31
  n8476_o <= not n8414_o;
  -- ../fixed_pkg.vhd:194:31
  n8477_o <= not n8414_o;
  -- ../fixed_pkg.vhd:194:31
  n8478_o <= not n8414_o;
  -- ../fixed_pkg.vhd:194:31
  n8479_o <= not n8414_o;
  n8480_o <= n8455_o & n8456_o & n8457_o & n8458_o;
  n8481_o <= n8459_o & n8460_o & n8461_o & n8462_o;
  n8482_o <= n8463_o & n8464_o & n8465_o & n8466_o;
  n8483_o <= n8467_o & n8468_o & n8469_o & n8470_o;
  n8484_o <= n8471_o & n8472_o & n8473_o & n8474_o;
  n8485_o <= n8475_o & n8476_o & n8477_o & n8478_o;
  n8486_o <= n8480_o & n8481_o & n8482_o & n8483_o;
  n8487_o <= n8484_o & n8485_o & n8479_o;
  n8488_o <= n8486_o & n8487_o;
  n8489_o <= n8488_o (23 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n8490_o <= n8413_o (40 downto 16);
  n8491_o <= n8414_o & n8489_o;
  -- ../fixed_pkg.vhd:193:9
  n8492_o <= n8490_o when n8444_o = '0' else n8491_o;
  -- ../fixed_pkg.vhd:266:100
  n8507_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n8510_o <= std_logic_vector (resize (signed (n8507_o) * signed'("0000000000011111111111111111111110000011011"), 43));
  -- ../fixed_pkg.vhd:266:100
  n8522_o <= std_logic_vector (resize (signed (y_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n8525_o <= std_logic_vector (resize (signed (n8522_o) * signed'("0000000000000000000000000001111100000110110"), 43));
  -- ../fixed_pkg.vhd:168:39
  n8542_o <= std_logic_vector (resize (signed (n8510_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n8548_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n8549_o <= n8548_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n8550: postponed assert n8549_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n8552_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n8553_o <= n8552_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n8554: postponed assert n8553_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n8566_o <= std_logic_vector (resize (signed (n8525_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n8572_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n8573_o <= n8572_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n8574: postponed assert n8573_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n8576_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n8577_o <= n8576_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n8578: postponed assert n8577_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:240:67
  n8590_o <= std_logic_vector (unsigned (n8542_o) - unsigned (n8566_o));
  -- ../fixed_pkg.vhd:168:39
  n8601_o <= n8590_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n8602_o <= n8590_o (43);
  -- ../fixed_pkg.vhd:173:9
  n8607_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n8608_o <= n8607_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n8609: postponed assert n8608_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n8611_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n8612_o <= n8611_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n8613: postponed assert n8612_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n8615_o <= n8590_o (42);
  -- ../fixed_pkg.vhd:183:27
  n8616_o <= '1' when n8615_o /= n8602_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n8623_o <= '0' when n8616_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n8629_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8630_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8631_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8632_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8633_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8634_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8635_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8636_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8637_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8638_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8639_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8640_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8641_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8642_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8643_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8644_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8645_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8646_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8647_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8648_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8649_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8650_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8651_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8652_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8653_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8654_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8655_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8656_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8657_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8658_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8659_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8660_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8661_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8662_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8663_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8664_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8665_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8666_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8667_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8668_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8669_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8670_o <= not n8602_o;
  -- ../fixed_pkg.vhd:194:31
  n8671_o <= not n8602_o;
  n8672_o <= n8629_o & n8630_o & n8631_o & n8632_o;
  n8673_o <= n8633_o & n8634_o & n8635_o & n8636_o;
  n8674_o <= n8637_o & n8638_o & n8639_o & n8640_o;
  n8675_o <= n8641_o & n8642_o & n8643_o & n8644_o;
  n8676_o <= n8645_o & n8646_o & n8647_o & n8648_o;
  n8677_o <= n8649_o & n8650_o & n8651_o & n8652_o;
  n8678_o <= n8653_o & n8654_o & n8655_o & n8656_o;
  n8679_o <= n8657_o & n8658_o & n8659_o & n8660_o;
  n8680_o <= n8661_o & n8662_o & n8663_o & n8664_o;
  n8681_o <= n8665_o & n8666_o & n8667_o & n8668_o;
  n8682_o <= n8669_o & n8670_o & n8671_o;
  n8683_o <= n8672_o & n8673_o & n8674_o & n8675_o;
  n8684_o <= n8676_o & n8677_o & n8678_o & n8679_o;
  n8685_o <= n8680_o & n8681_o & n8682_o;
  n8686_o <= n8683_o & n8684_o & n8685_o;
  n8687_o <= n8686_o (41 downto 0);
  n8688_o <= n8602_o & n8687_o;
  -- ../fixed_pkg.vhd:193:9
  n8689_o <= n8601_o when n8623_o = '0' else n8688_o;
  -- ../fixed_pkg.vhd:168:39
  n8705_o <= n8689_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n8706_o <= n8689_o (42);
  -- ../fixed_pkg.vhd:173:9
  n8711_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n8712_o <= n8711_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n8713: postponed assert n8712_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n8715_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n8716_o <= n8715_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n8717: postponed assert n8716_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n8719_o <= n8689_o (41);
  -- ../fixed_pkg.vhd:183:27
  n8720_o <= '1' when n8719_o /= n8706_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n8727_o <= '0' when n8720_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n8731_o <= '1' when n8720_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n8733_o <= n8689_o (40);
  -- ../fixed_pkg.vhd:183:27
  n8734_o <= '1' when n8733_o /= n8706_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n8736_o <= n8727_o when n8745_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n8742_o <= n8734_o and n8731_o;
  -- ../fixed_pkg.vhd:183:17
  n8745_o <= n8731_o and n8742_o;
  -- ../fixed_pkg.vhd:194:31
  n8747_o <= not n8706_o;
  -- ../fixed_pkg.vhd:194:31
  n8748_o <= not n8706_o;
  -- ../fixed_pkg.vhd:194:31
  n8749_o <= not n8706_o;
  -- ../fixed_pkg.vhd:194:31
  n8750_o <= not n8706_o;
  -- ../fixed_pkg.vhd:194:31
  n8751_o <= not n8706_o;
  -- ../fixed_pkg.vhd:194:31
  n8752_o <= not n8706_o;
  -- ../fixed_pkg.vhd:194:31
  n8753_o <= not n8706_o;
  -- ../fixed_pkg.vhd:194:31
  n8754_o <= not n8706_o;
  -- ../fixed_pkg.vhd:194:31
  n8755_o <= not n8706_o;
  -- ../fixed_pkg.vhd:194:31
  n8756_o <= not n8706_o;
  -- ../fixed_pkg.vhd:194:31
  n8757_o <= not n8706_o;
  -- ../fixed_pkg.vhd:194:31
  n8758_o <= not n8706_o;
  -- ../fixed_pkg.vhd:194:31
  n8759_o <= not n8706_o;
  -- ../fixed_pkg.vhd:194:31
  n8760_o <= not n8706_o;
  -- ../fixed_pkg.vhd:194:31
  n8761_o <= not n8706_o;
  -- ../fixed_pkg.vhd:194:31
  n8762_o <= not n8706_o;
  -- ../fixed_pkg.vhd:194:31
  n8763_o <= not n8706_o;
  -- ../fixed_pkg.vhd:194:31
  n8764_o <= not n8706_o;
  -- ../fixed_pkg.vhd:194:31
  n8765_o <= not n8706_o;
  -- ../fixed_pkg.vhd:194:31
  n8766_o <= not n8706_o;
  -- ../fixed_pkg.vhd:194:31
  n8767_o <= not n8706_o;
  -- ../fixed_pkg.vhd:194:31
  n8768_o <= not n8706_o;
  -- ../fixed_pkg.vhd:194:31
  n8769_o <= not n8706_o;
  -- ../fixed_pkg.vhd:194:31
  n8770_o <= not n8706_o;
  -- ../fixed_pkg.vhd:194:31
  n8771_o <= not n8706_o;
  n8772_o <= n8747_o & n8748_o & n8749_o & n8750_o;
  n8773_o <= n8751_o & n8752_o & n8753_o & n8754_o;
  n8774_o <= n8755_o & n8756_o & n8757_o & n8758_o;
  n8775_o <= n8759_o & n8760_o & n8761_o & n8762_o;
  n8776_o <= n8763_o & n8764_o & n8765_o & n8766_o;
  n8777_o <= n8767_o & n8768_o & n8769_o & n8770_o;
  n8778_o <= n8772_o & n8773_o & n8774_o & n8775_o;
  n8779_o <= n8776_o & n8777_o & n8771_o;
  n8780_o <= n8778_o & n8779_o;
  n8781_o <= n8780_o (23 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n8782_o <= n8705_o (40 downto 16);
  n8783_o <= n8706_o & n8781_o;
  -- ../fixed_pkg.vhd:193:9
  n8784_o <= n8782_o when n8736_o = '0' else n8783_o;
  -- ../BiquadFilter/BiquadFilter.vhd:67:17
  n8787_o <= '1' when state_reg = "10" else '0';
  n8788_o <= n8787_o & n8033_o & n7752_o;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n8788_o select n8789_o <=
    x_reg when "100",
    x_reg when "010",
    n7750_o when "001",
    x_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n8788_o select n8790_o <=
    y_reg when "100",
    n8030_o when "010",
    y_reg when "001",
    y_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n8788_o select n8791_o <=
    n8492_o when "100",
    w_reg when "010",
    w_reg when "001",
    w_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n8788_o select n8792_o <=
    n8784_o when "100",
    v_reg when "010",
    v_reg when "001",
    v_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n8820_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n8821_o <= x_reg when n8820_o = '0' else n8789_o;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n8822_q <= n8821_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n8823_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n8824_o <= y_reg when n8823_o = '0' else n8790_o;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n8825_q <= n8824_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n8826_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n8826_q <= n8791_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n8827_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n8827_q <= n8792_o;
    end if;
  end process;
  -- ../fixed_pkg.vhd:168:39
  n8843_o <= y_reg (22 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n8844_o <= y_reg (24);
  -- ../fixed_pkg.vhd:173:9
  n8849_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n8850_o <= n8849_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n8851: postponed assert n8850_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n8853_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n8854_o <= n8853_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n8855: postponed assert n8854_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n8857_o <= y_reg (23);
  -- ../fixed_pkg.vhd:183:27
  n8858_o <= '1' when n8857_o /= n8844_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n8865_o <= '0' when n8858_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n8869_o <= '1' when n8858_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n8871_o <= y_reg (22);
  -- ../fixed_pkg.vhd:183:27
  n8872_o <= '1' when n8871_o /= n8844_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n8874_o <= n8865_o when n8883_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n8880_o <= n8872_o and n8869_o;
  -- ../fixed_pkg.vhd:183:17
  n8883_o <= n8869_o and n8880_o;
  -- ../fixed_pkg.vhd:194:31
  n8885_o <= not n8844_o;
  -- ../fixed_pkg.vhd:194:31
  n8886_o <= not n8844_o;
  -- ../fixed_pkg.vhd:194:31
  n8887_o <= not n8844_o;
  -- ../fixed_pkg.vhd:194:31
  n8888_o <= not n8844_o;
  -- ../fixed_pkg.vhd:194:31
  n8889_o <= not n8844_o;
  -- ../fixed_pkg.vhd:194:31
  n8890_o <= not n8844_o;
  -- ../fixed_pkg.vhd:194:31
  n8891_o <= not n8844_o;
  -- ../fixed_pkg.vhd:194:31
  n8892_o <= not n8844_o;
  -- ../fixed_pkg.vhd:194:31
  n8893_o <= not n8844_o;
  -- ../fixed_pkg.vhd:194:31
  n8894_o <= not n8844_o;
  -- ../fixed_pkg.vhd:194:31
  n8895_o <= not n8844_o;
  -- ../fixed_pkg.vhd:194:31
  n8896_o <= not n8844_o;
  -- ../fixed_pkg.vhd:194:31
  n8897_o <= not n8844_o;
  -- ../fixed_pkg.vhd:194:31
  n8898_o <= not n8844_o;
  -- ../fixed_pkg.vhd:194:31
  n8899_o <= not n8844_o;
  -- ../fixed_pkg.vhd:194:31
  n8900_o <= not n8844_o;
  -- ../fixed_pkg.vhd:194:31
  n8901_o <= not n8844_o;
  -- ../fixed_pkg.vhd:194:31
  n8902_o <= not n8844_o;
  n8903_o <= n8885_o & n8886_o & n8887_o & n8888_o;
  n8904_o <= n8889_o & n8890_o & n8891_o & n8892_o;
  n8905_o <= n8893_o & n8894_o & n8895_o & n8896_o;
  n8906_o <= n8897_o & n8898_o & n8899_o & n8900_o;
  n8907_o <= n8901_o & n8902_o;
  n8908_o <= n8903_o & n8904_o & n8905_o & n8906_o;
  n8909_o <= n8908_o & n8907_o;
  n8910_o <= n8909_o (16 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n8911_o <= n8843_o (22 downto 5);
  n8912_o <= n8844_o & n8910_o;
  -- ../fixed_pkg.vhd:193:9
  n8913_o <= n8911_o when n8874_o = '0' else n8912_o;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity biquadfilter_1c66bf3a8e40435213527cf7b156d31cf673b516 is
  port (
    clk_i : in std_logic;
    reset_i : in std_logic;
    valid_i : in std_logic;
    data_i : in std_logic_vector (17 downto 0);
    ready_i : in std_logic;
    ready_o : out std_logic;
    valid_o : out std_logic;
    data_o : out std_logic_vector (17 downto 0));
end entity biquadfilter_1c66bf3a8e40435213527cf7b156d31cf673b516;

architecture rtl of biquadfilter_1c66bf3a8e40435213527cf7b156d31cf673b516 is
  signal state_reg : std_logic_vector (1 downto 0);
  signal x_reg : std_logic_vector (24 downto 0);
  signal y_reg : std_logic_vector (24 downto 0);
  signal w_reg : std_logic_vector (24 downto 0);
  signal v_reg : std_logic_vector (24 downto 0);
  signal n6448_o : std_logic;
  signal n6450_o : std_logic_vector (1 downto 0);
  signal n6452_o : std_logic;
  signal n6454_o : std_logic;
  signal n6456_o : std_logic;
  signal n6458_o : std_logic_vector (1 downto 0);
  signal n6460_o : std_logic;
  signal n6461_o : std_logic_vector (3 downto 0);
  signal n6465_o : std_logic_vector (1 downto 0);
  signal n6470_q : std_logic_vector (1 downto 0);
  signal n6473_o : std_logic;
  signal n6474_o : std_logic;
  signal n6478_o : std_logic;
  signal n6479_o : std_logic;
  signal n6482_o : std_logic;
  signal n6498_o : std_logic_vector (19 downto 0);
  signal n6504_o : std_logic;
  signal n6505_o : std_logic;
  signal n6508_o : std_logic;
  signal n6509_o : std_logic;
  constant n6511_o : std_logic_vector (24 downto 0) := "0000000000000000000000000";
  signal n6512_o : std_logic_vector (4 downto 0);
  signal n6513_o : std_logic_vector (24 downto 0);
  signal n6514_o : std_logic_vector (24 downto 0);
  signal n6516_o : std_logic;
  signal n6530_o : std_logic_vector (42 downto 0);
  signal n6533_o : std_logic_vector (42 downto 0);
  signal n6550_o : std_logic_vector (43 downto 0);
  signal n6556_o : std_logic;
  signal n6557_o : std_logic;
  signal n6560_o : std_logic;
  signal n6561_o : std_logic;
  signal n6574_o : std_logic_vector (27 downto 0);
  signal n6580_o : std_logic;
  signal n6581_o : std_logic;
  signal n6584_o : std_logic;
  signal n6585_o : std_logic;
  constant n6587_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n6588_o : std_logic_vector (15 downto 0);
  signal n6589_o : std_logic_vector (43 downto 0);
  signal n6600_o : std_logic_vector (43 downto 0);
  signal n6611_o : std_logic_vector (42 downto 0);
  signal n6612_o : std_logic;
  signal n6617_o : std_logic;
  signal n6618_o : std_logic;
  signal n6621_o : std_logic;
  signal n6622_o : std_logic;
  signal n6625_o : std_logic;
  signal n6626_o : std_logic;
  signal n6633_o : std_logic;
  signal n6639_o : std_logic;
  signal n6640_o : std_logic;
  signal n6641_o : std_logic;
  signal n6642_o : std_logic;
  signal n6643_o : std_logic;
  signal n6644_o : std_logic;
  signal n6645_o : std_logic;
  signal n6646_o : std_logic;
  signal n6647_o : std_logic;
  signal n6648_o : std_logic;
  signal n6649_o : std_logic;
  signal n6650_o : std_logic;
  signal n6651_o : std_logic;
  signal n6652_o : std_logic;
  signal n6653_o : std_logic;
  signal n6654_o : std_logic;
  signal n6655_o : std_logic;
  signal n6656_o : std_logic;
  signal n6657_o : std_logic;
  signal n6658_o : std_logic;
  signal n6659_o : std_logic;
  signal n6660_o : std_logic;
  signal n6661_o : std_logic;
  signal n6662_o : std_logic;
  signal n6663_o : std_logic;
  signal n6664_o : std_logic;
  signal n6665_o : std_logic;
  signal n6666_o : std_logic;
  signal n6667_o : std_logic;
  signal n6668_o : std_logic;
  signal n6669_o : std_logic;
  signal n6670_o : std_logic;
  signal n6671_o : std_logic;
  signal n6672_o : std_logic;
  signal n6673_o : std_logic;
  signal n6674_o : std_logic;
  signal n6675_o : std_logic;
  signal n6676_o : std_logic;
  signal n6677_o : std_logic;
  signal n6678_o : std_logic;
  signal n6679_o : std_logic;
  signal n6680_o : std_logic;
  signal n6681_o : std_logic;
  signal n6682_o : std_logic_vector (3 downto 0);
  signal n6683_o : std_logic_vector (3 downto 0);
  signal n6684_o : std_logic_vector (3 downto 0);
  signal n6685_o : std_logic_vector (3 downto 0);
  signal n6686_o : std_logic_vector (3 downto 0);
  signal n6687_o : std_logic_vector (3 downto 0);
  signal n6688_o : std_logic_vector (3 downto 0);
  signal n6689_o : std_logic_vector (3 downto 0);
  signal n6690_o : std_logic_vector (3 downto 0);
  signal n6691_o : std_logic_vector (3 downto 0);
  signal n6692_o : std_logic_vector (2 downto 0);
  signal n6693_o : std_logic_vector (15 downto 0);
  signal n6694_o : std_logic_vector (15 downto 0);
  signal n6695_o : std_logic_vector (10 downto 0);
  signal n6696_o : std_logic_vector (42 downto 0);
  signal n6697_o : std_logic_vector (41 downto 0);
  signal n6698_o : std_logic_vector (42 downto 0);
  signal n6699_o : std_logic_vector (42 downto 0);
  signal n6715_o : std_logic_vector (40 downto 0);
  signal n6716_o : std_logic;
  signal n6721_o : std_logic;
  signal n6722_o : std_logic;
  signal n6725_o : std_logic;
  signal n6726_o : std_logic;
  signal n6729_o : std_logic;
  signal n6730_o : std_logic;
  signal n6737_o : std_logic;
  signal n6741_o : std_logic;
  signal n6743_o : std_logic;
  signal n6744_o : std_logic;
  signal n6746_o : std_logic;
  signal n6752_o : std_logic;
  signal n6755_o : std_logic;
  signal n6757_o : std_logic;
  signal n6758_o : std_logic;
  signal n6759_o : std_logic;
  signal n6760_o : std_logic;
  signal n6761_o : std_logic;
  signal n6762_o : std_logic;
  signal n6763_o : std_logic;
  signal n6764_o : std_logic;
  signal n6765_o : std_logic;
  signal n6766_o : std_logic;
  signal n6767_o : std_logic;
  signal n6768_o : std_logic;
  signal n6769_o : std_logic;
  signal n6770_o : std_logic;
  signal n6771_o : std_logic;
  signal n6772_o : std_logic;
  signal n6773_o : std_logic;
  signal n6774_o : std_logic;
  signal n6775_o : std_logic;
  signal n6776_o : std_logic;
  signal n6777_o : std_logic;
  signal n6778_o : std_logic;
  signal n6779_o : std_logic;
  signal n6780_o : std_logic;
  signal n6781_o : std_logic;
  signal n6782_o : std_logic_vector (3 downto 0);
  signal n6783_o : std_logic_vector (3 downto 0);
  signal n6784_o : std_logic_vector (3 downto 0);
  signal n6785_o : std_logic_vector (3 downto 0);
  signal n6786_o : std_logic_vector (3 downto 0);
  signal n6787_o : std_logic_vector (3 downto 0);
  signal n6788_o : std_logic_vector (15 downto 0);
  signal n6789_o : std_logic_vector (8 downto 0);
  signal n6790_o : std_logic_vector (24 downto 0);
  signal n6791_o : std_logic_vector (23 downto 0);
  signal n6792_o : std_logic_vector (24 downto 0);
  signal n6793_o : std_logic_vector (24 downto 0);
  signal n6794_o : std_logic_vector (24 downto 0);
  signal n6797_o : std_logic;
  signal n6812_o : std_logic_vector (42 downto 0);
  signal n6815_o : std_logic_vector (42 downto 0);
  signal n6827_o : std_logic_vector (42 downto 0);
  signal n6830_o : std_logic_vector (42 downto 0);
  signal n6847_o : std_logic_vector (43 downto 0);
  signal n6853_o : std_logic;
  signal n6854_o : std_logic;
  signal n6857_o : std_logic;
  signal n6858_o : std_logic;
  signal n6871_o : std_logic_vector (43 downto 0);
  signal n6877_o : std_logic;
  signal n6878_o : std_logic;
  signal n6881_o : std_logic;
  signal n6882_o : std_logic;
  signal n6895_o : std_logic_vector (43 downto 0);
  signal n6906_o : std_logic_vector (42 downto 0);
  signal n6907_o : std_logic;
  signal n6912_o : std_logic;
  signal n6913_o : std_logic;
  signal n6916_o : std_logic;
  signal n6917_o : std_logic;
  signal n6920_o : std_logic;
  signal n6921_o : std_logic;
  signal n6928_o : std_logic;
  signal n6934_o : std_logic;
  signal n6935_o : std_logic;
  signal n6936_o : std_logic;
  signal n6937_o : std_logic;
  signal n6938_o : std_logic;
  signal n6939_o : std_logic;
  signal n6940_o : std_logic;
  signal n6941_o : std_logic;
  signal n6942_o : std_logic;
  signal n6943_o : std_logic;
  signal n6944_o : std_logic;
  signal n6945_o : std_logic;
  signal n6946_o : std_logic;
  signal n6947_o : std_logic;
  signal n6948_o : std_logic;
  signal n6949_o : std_logic;
  signal n6950_o : std_logic;
  signal n6951_o : std_logic;
  signal n6952_o : std_logic;
  signal n6953_o : std_logic;
  signal n6954_o : std_logic;
  signal n6955_o : std_logic;
  signal n6956_o : std_logic;
  signal n6957_o : std_logic;
  signal n6958_o : std_logic;
  signal n6959_o : std_logic;
  signal n6960_o : std_logic;
  signal n6961_o : std_logic;
  signal n6962_o : std_logic;
  signal n6963_o : std_logic;
  signal n6964_o : std_logic;
  signal n6965_o : std_logic;
  signal n6966_o : std_logic;
  signal n6967_o : std_logic;
  signal n6968_o : std_logic;
  signal n6969_o : std_logic;
  signal n6970_o : std_logic;
  signal n6971_o : std_logic;
  signal n6972_o : std_logic;
  signal n6973_o : std_logic;
  signal n6974_o : std_logic;
  signal n6975_o : std_logic;
  signal n6976_o : std_logic;
  signal n6977_o : std_logic_vector (3 downto 0);
  signal n6978_o : std_logic_vector (3 downto 0);
  signal n6979_o : std_logic_vector (3 downto 0);
  signal n6980_o : std_logic_vector (3 downto 0);
  signal n6981_o : std_logic_vector (3 downto 0);
  signal n6982_o : std_logic_vector (3 downto 0);
  signal n6983_o : std_logic_vector (3 downto 0);
  signal n6984_o : std_logic_vector (3 downto 0);
  signal n6985_o : std_logic_vector (3 downto 0);
  signal n6986_o : std_logic_vector (3 downto 0);
  signal n6987_o : std_logic_vector (2 downto 0);
  signal n6988_o : std_logic_vector (15 downto 0);
  signal n6989_o : std_logic_vector (15 downto 0);
  signal n6990_o : std_logic_vector (10 downto 0);
  signal n6991_o : std_logic_vector (42 downto 0);
  signal n6992_o : std_logic_vector (41 downto 0);
  signal n6993_o : std_logic_vector (42 downto 0);
  signal n6994_o : std_logic_vector (42 downto 0);
  signal n7012_o : std_logic_vector (43 downto 0);
  signal n7018_o : std_logic;
  signal n7019_o : std_logic;
  signal n7022_o : std_logic;
  signal n7023_o : std_logic;
  signal n7036_o : std_logic_vector (27 downto 0);
  signal n7042_o : std_logic;
  signal n7043_o : std_logic;
  signal n7046_o : std_logic;
  signal n7047_o : std_logic;
  constant n7049_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n7050_o : std_logic_vector (15 downto 0);
  signal n7051_o : std_logic_vector (43 downto 0);
  signal n7062_o : std_logic_vector (43 downto 0);
  signal n7073_o : std_logic_vector (42 downto 0);
  signal n7074_o : std_logic;
  signal n7079_o : std_logic;
  signal n7080_o : std_logic;
  signal n7083_o : std_logic;
  signal n7084_o : std_logic;
  signal n7087_o : std_logic;
  signal n7088_o : std_logic;
  signal n7095_o : std_logic;
  signal n7101_o : std_logic;
  signal n7102_o : std_logic;
  signal n7103_o : std_logic;
  signal n7104_o : std_logic;
  signal n7105_o : std_logic;
  signal n7106_o : std_logic;
  signal n7107_o : std_logic;
  signal n7108_o : std_logic;
  signal n7109_o : std_logic;
  signal n7110_o : std_logic;
  signal n7111_o : std_logic;
  signal n7112_o : std_logic;
  signal n7113_o : std_logic;
  signal n7114_o : std_logic;
  signal n7115_o : std_logic;
  signal n7116_o : std_logic;
  signal n7117_o : std_logic;
  signal n7118_o : std_logic;
  signal n7119_o : std_logic;
  signal n7120_o : std_logic;
  signal n7121_o : std_logic;
  signal n7122_o : std_logic;
  signal n7123_o : std_logic;
  signal n7124_o : std_logic;
  signal n7125_o : std_logic;
  signal n7126_o : std_logic;
  signal n7127_o : std_logic;
  signal n7128_o : std_logic;
  signal n7129_o : std_logic;
  signal n7130_o : std_logic;
  signal n7131_o : std_logic;
  signal n7132_o : std_logic;
  signal n7133_o : std_logic;
  signal n7134_o : std_logic;
  signal n7135_o : std_logic;
  signal n7136_o : std_logic;
  signal n7137_o : std_logic;
  signal n7138_o : std_logic;
  signal n7139_o : std_logic;
  signal n7140_o : std_logic;
  signal n7141_o : std_logic;
  signal n7142_o : std_logic;
  signal n7143_o : std_logic;
  signal n7144_o : std_logic_vector (3 downto 0);
  signal n7145_o : std_logic_vector (3 downto 0);
  signal n7146_o : std_logic_vector (3 downto 0);
  signal n7147_o : std_logic_vector (3 downto 0);
  signal n7148_o : std_logic_vector (3 downto 0);
  signal n7149_o : std_logic_vector (3 downto 0);
  signal n7150_o : std_logic_vector (3 downto 0);
  signal n7151_o : std_logic_vector (3 downto 0);
  signal n7152_o : std_logic_vector (3 downto 0);
  signal n7153_o : std_logic_vector (3 downto 0);
  signal n7154_o : std_logic_vector (2 downto 0);
  signal n7155_o : std_logic_vector (15 downto 0);
  signal n7156_o : std_logic_vector (15 downto 0);
  signal n7157_o : std_logic_vector (10 downto 0);
  signal n7158_o : std_logic_vector (42 downto 0);
  signal n7159_o : std_logic_vector (41 downto 0);
  signal n7160_o : std_logic_vector (42 downto 0);
  signal n7161_o : std_logic_vector (42 downto 0);
  signal n7177_o : std_logic_vector (40 downto 0);
  signal n7178_o : std_logic;
  signal n7183_o : std_logic;
  signal n7184_o : std_logic;
  signal n7187_o : std_logic;
  signal n7188_o : std_logic;
  signal n7191_o : std_logic;
  signal n7192_o : std_logic;
  signal n7199_o : std_logic;
  signal n7203_o : std_logic;
  signal n7205_o : std_logic;
  signal n7206_o : std_logic;
  signal n7208_o : std_logic;
  signal n7214_o : std_logic;
  signal n7217_o : std_logic;
  signal n7219_o : std_logic;
  signal n7220_o : std_logic;
  signal n7221_o : std_logic;
  signal n7222_o : std_logic;
  signal n7223_o : std_logic;
  signal n7224_o : std_logic;
  signal n7225_o : std_logic;
  signal n7226_o : std_logic;
  signal n7227_o : std_logic;
  signal n7228_o : std_logic;
  signal n7229_o : std_logic;
  signal n7230_o : std_logic;
  signal n7231_o : std_logic;
  signal n7232_o : std_logic;
  signal n7233_o : std_logic;
  signal n7234_o : std_logic;
  signal n7235_o : std_logic;
  signal n7236_o : std_logic;
  signal n7237_o : std_logic;
  signal n7238_o : std_logic;
  signal n7239_o : std_logic;
  signal n7240_o : std_logic;
  signal n7241_o : std_logic;
  signal n7242_o : std_logic;
  signal n7243_o : std_logic;
  signal n7244_o : std_logic_vector (3 downto 0);
  signal n7245_o : std_logic_vector (3 downto 0);
  signal n7246_o : std_logic_vector (3 downto 0);
  signal n7247_o : std_logic_vector (3 downto 0);
  signal n7248_o : std_logic_vector (3 downto 0);
  signal n7249_o : std_logic_vector (3 downto 0);
  signal n7250_o : std_logic_vector (15 downto 0);
  signal n7251_o : std_logic_vector (8 downto 0);
  signal n7252_o : std_logic_vector (24 downto 0);
  signal n7253_o : std_logic_vector (23 downto 0);
  signal n7254_o : std_logic_vector (24 downto 0);
  signal n7255_o : std_logic_vector (24 downto 0);
  signal n7256_o : std_logic_vector (24 downto 0);
  signal n7271_o : std_logic_vector (42 downto 0);
  signal n7274_o : std_logic_vector (42 downto 0);
  signal n7286_o : std_logic_vector (42 downto 0);
  signal n7289_o : std_logic_vector (42 downto 0);
  signal n7306_o : std_logic_vector (43 downto 0);
  signal n7312_o : std_logic;
  signal n7313_o : std_logic;
  signal n7316_o : std_logic;
  signal n7317_o : std_logic;
  signal n7330_o : std_logic_vector (43 downto 0);
  signal n7336_o : std_logic;
  signal n7337_o : std_logic;
  signal n7340_o : std_logic;
  signal n7341_o : std_logic;
  signal n7354_o : std_logic_vector (43 downto 0);
  signal n7365_o : std_logic_vector (42 downto 0);
  signal n7366_o : std_logic;
  signal n7371_o : std_logic;
  signal n7372_o : std_logic;
  signal n7375_o : std_logic;
  signal n7376_o : std_logic;
  signal n7379_o : std_logic;
  signal n7380_o : std_logic;
  signal n7387_o : std_logic;
  signal n7393_o : std_logic;
  signal n7394_o : std_logic;
  signal n7395_o : std_logic;
  signal n7396_o : std_logic;
  signal n7397_o : std_logic;
  signal n7398_o : std_logic;
  signal n7399_o : std_logic;
  signal n7400_o : std_logic;
  signal n7401_o : std_logic;
  signal n7402_o : std_logic;
  signal n7403_o : std_logic;
  signal n7404_o : std_logic;
  signal n7405_o : std_logic;
  signal n7406_o : std_logic;
  signal n7407_o : std_logic;
  signal n7408_o : std_logic;
  signal n7409_o : std_logic;
  signal n7410_o : std_logic;
  signal n7411_o : std_logic;
  signal n7412_o : std_logic;
  signal n7413_o : std_logic;
  signal n7414_o : std_logic;
  signal n7415_o : std_logic;
  signal n7416_o : std_logic;
  signal n7417_o : std_logic;
  signal n7418_o : std_logic;
  signal n7419_o : std_logic;
  signal n7420_o : std_logic;
  signal n7421_o : std_logic;
  signal n7422_o : std_logic;
  signal n7423_o : std_logic;
  signal n7424_o : std_logic;
  signal n7425_o : std_logic;
  signal n7426_o : std_logic;
  signal n7427_o : std_logic;
  signal n7428_o : std_logic;
  signal n7429_o : std_logic;
  signal n7430_o : std_logic;
  signal n7431_o : std_logic;
  signal n7432_o : std_logic;
  signal n7433_o : std_logic;
  signal n7434_o : std_logic;
  signal n7435_o : std_logic;
  signal n7436_o : std_logic_vector (3 downto 0);
  signal n7437_o : std_logic_vector (3 downto 0);
  signal n7438_o : std_logic_vector (3 downto 0);
  signal n7439_o : std_logic_vector (3 downto 0);
  signal n7440_o : std_logic_vector (3 downto 0);
  signal n7441_o : std_logic_vector (3 downto 0);
  signal n7442_o : std_logic_vector (3 downto 0);
  signal n7443_o : std_logic_vector (3 downto 0);
  signal n7444_o : std_logic_vector (3 downto 0);
  signal n7445_o : std_logic_vector (3 downto 0);
  signal n7446_o : std_logic_vector (2 downto 0);
  signal n7447_o : std_logic_vector (15 downto 0);
  signal n7448_o : std_logic_vector (15 downto 0);
  signal n7449_o : std_logic_vector (10 downto 0);
  signal n7450_o : std_logic_vector (42 downto 0);
  signal n7451_o : std_logic_vector (41 downto 0);
  signal n7452_o : std_logic_vector (42 downto 0);
  signal n7453_o : std_logic_vector (42 downto 0);
  signal n7469_o : std_logic_vector (40 downto 0);
  signal n7470_o : std_logic;
  signal n7475_o : std_logic;
  signal n7476_o : std_logic;
  signal n7479_o : std_logic;
  signal n7480_o : std_logic;
  signal n7483_o : std_logic;
  signal n7484_o : std_logic;
  signal n7491_o : std_logic;
  signal n7495_o : std_logic;
  signal n7497_o : std_logic;
  signal n7498_o : std_logic;
  signal n7500_o : std_logic;
  signal n7506_o : std_logic;
  signal n7509_o : std_logic;
  signal n7511_o : std_logic;
  signal n7512_o : std_logic;
  signal n7513_o : std_logic;
  signal n7514_o : std_logic;
  signal n7515_o : std_logic;
  signal n7516_o : std_logic;
  signal n7517_o : std_logic;
  signal n7518_o : std_logic;
  signal n7519_o : std_logic;
  signal n7520_o : std_logic;
  signal n7521_o : std_logic;
  signal n7522_o : std_logic;
  signal n7523_o : std_logic;
  signal n7524_o : std_logic;
  signal n7525_o : std_logic;
  signal n7526_o : std_logic;
  signal n7527_o : std_logic;
  signal n7528_o : std_logic;
  signal n7529_o : std_logic;
  signal n7530_o : std_logic;
  signal n7531_o : std_logic;
  signal n7532_o : std_logic;
  signal n7533_o : std_logic;
  signal n7534_o : std_logic;
  signal n7535_o : std_logic;
  signal n7536_o : std_logic_vector (3 downto 0);
  signal n7537_o : std_logic_vector (3 downto 0);
  signal n7538_o : std_logic_vector (3 downto 0);
  signal n7539_o : std_logic_vector (3 downto 0);
  signal n7540_o : std_logic_vector (3 downto 0);
  signal n7541_o : std_logic_vector (3 downto 0);
  signal n7542_o : std_logic_vector (15 downto 0);
  signal n7543_o : std_logic_vector (8 downto 0);
  signal n7544_o : std_logic_vector (24 downto 0);
  signal n7545_o : std_logic_vector (23 downto 0);
  signal n7546_o : std_logic_vector (24 downto 0);
  signal n7547_o : std_logic_vector (24 downto 0);
  signal n7548_o : std_logic_vector (24 downto 0);
  signal n7551_o : std_logic;
  signal n7552_o : std_logic_vector (2 downto 0);
  signal n7553_o : std_logic_vector (24 downto 0);
  signal n7554_o : std_logic_vector (24 downto 0);
  signal n7555_o : std_logic_vector (24 downto 0);
  signal n7556_o : std_logic_vector (24 downto 0);
  signal n7584_o : std_logic;
  signal n7585_o : std_logic_vector (24 downto 0);
  signal n7586_q : std_logic_vector (24 downto 0);
  signal n7587_o : std_logic;
  signal n7588_o : std_logic_vector (24 downto 0);
  signal n7589_q : std_logic_vector (24 downto 0);
  signal n7590_q : std_logic_vector (24 downto 0);
  signal n7591_q : std_logic_vector (24 downto 0);
  signal n7607_o : std_logic_vector (22 downto 0);
  signal n7608_o : std_logic;
  signal n7613_o : std_logic;
  signal n7614_o : std_logic;
  signal n7617_o : std_logic;
  signal n7618_o : std_logic;
  signal n7621_o : std_logic;
  signal n7622_o : std_logic;
  signal n7629_o : std_logic;
  signal n7633_o : std_logic;
  signal n7635_o : std_logic;
  signal n7636_o : std_logic;
  signal n7638_o : std_logic;
  signal n7644_o : std_logic;
  signal n7647_o : std_logic;
  signal n7649_o : std_logic;
  signal n7650_o : std_logic;
  signal n7651_o : std_logic;
  signal n7652_o : std_logic;
  signal n7653_o : std_logic;
  signal n7654_o : std_logic;
  signal n7655_o : std_logic;
  signal n7656_o : std_logic;
  signal n7657_o : std_logic;
  signal n7658_o : std_logic;
  signal n7659_o : std_logic;
  signal n7660_o : std_logic;
  signal n7661_o : std_logic;
  signal n7662_o : std_logic;
  signal n7663_o : std_logic;
  signal n7664_o : std_logic;
  signal n7665_o : std_logic;
  signal n7666_o : std_logic;
  signal n7667_o : std_logic_vector (3 downto 0);
  signal n7668_o : std_logic_vector (3 downto 0);
  signal n7669_o : std_logic_vector (3 downto 0);
  signal n7670_o : std_logic_vector (3 downto 0);
  signal n7671_o : std_logic_vector (1 downto 0);
  signal n7672_o : std_logic_vector (15 downto 0);
  signal n7673_o : std_logic_vector (17 downto 0);
  signal n7674_o : std_logic_vector (16 downto 0);
  signal n7675_o : std_logic_vector (17 downto 0);
  signal n7676_o : std_logic_vector (17 downto 0);
  signal n7677_o : std_logic_vector (17 downto 0);
begin
  ready_o <= n6474_o;
  valid_o <= n6479_o;
  data_o <= n7677_o;
  -- ../BiquadFilter/BiquadFilter.vhd:26:12
  state_reg <= n6470_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:12
  x_reg <= n7586_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:19
  y_reg <= n7589_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:26
  w_reg <= n7590_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:33
  v_reg <= n7591_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:33:15
  -- n6448_o <= '1' when rising_edge (clk_i) else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:36:21
  n6450_o <= state_reg when valid_i = '0' else "01";
  -- ../BiquadFilter/BiquadFilter.vhd:35:17
  n6452_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:39:17
  n6454_o <= '1' when state_reg = "01" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:41:17
  n6456_o <= '1' when state_reg = "10" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:44:21
  n6458_o <= state_reg when ready_i = '0' else "00";
  -- ../BiquadFilter/BiquadFilter.vhd:43:17
  n6460_o <= '1' when state_reg = "11" else '0';
  -- ../fixed_pkg.vhd:183:17
  n6461_o <= n6460_o & n6456_o & n6454_o & n6452_o;
  -- ../BiquadFilter/BiquadFilter.vhd:34:13
  with n6461_o select n6465_o <=
    n6458_o when "1000",
    "11" when "0100",
    "10" when "0010",
    n6450_o when "0001",
    "XX" when others;
  -- ../BiquadFilter/BiquadFilter.vhd:33:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n6470_q <= "00";
    elsif rising_edge (clk_i) then
      n6470_q <= n6465_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:51:35
  n6473_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:51:20
  n6474_o <= '0' when n6473_o = '0' else '1';
  -- ../BiquadFilter/BiquadFilter.vhd:52:35
  n6478_o <= '1' when state_reg = "11" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:52:20
  n6479_o <= '0' when n6478_o = '0' else '1';
  -- ../BiquadFilter/BiquadFilter.vhd:59:15
  -- n6482_o <= '1' when rising_edge (clk_i) else '0';
  -- ../fixed_pkg.vhd:168:39
  n6498_o <= std_logic_vector (resize (signed (data_i), 20));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n6504_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n6505_o <= n6504_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n6506: postponed assert n6505_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n6508_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n6509_o <= n6508_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n6510: postponed assert n6509_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:170:18
  n6512_o <= n6511_o (4 downto 0);
  n6513_o <= n6498_o & n6512_o;
  -- ../BiquadFilter/BiquadFilter.vhd:62:21
  n6514_o <= x_reg when valid_i = '0' else n6513_o;
  -- ../BiquadFilter/BiquadFilter.vhd:61:17
  n6516_o <= '1' when state_reg = "00" else '0';
  -- ../fixed_pkg.vhd:266:100
  n6530_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n6533_o <= std_logic_vector (resize (signed (n6530_o) * signed'("0000000000000000000000000000000001100100101"), 43));
  -- ../fixed_pkg.vhd:168:39
  n6550_o <= std_logic_vector (resize (signed (n6533_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n6556_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n6557_o <= n6556_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n6558: postponed assert n6557_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n6560_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n6561_o <= n6560_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n6562: postponed assert n6561_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n6574_o <= std_logic_vector (resize (signed (w_reg), 28));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n6580_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n6581_o <= n6580_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n6582: postponed assert n6581_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n6584_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n6585_o <= n6584_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n6586: postponed assert n6585_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:24:14
  n6588_o <= n6587_o (15 downto 0);
  -- ../fixed_pkg.vhd:24:14
  n6589_o <= n6574_o & n6588_o;
  -- ../fixed_pkg.vhd:255:67
  n6600_o <= std_logic_vector (unsigned (n6550_o) + unsigned (n6589_o));
  -- ../fixed_pkg.vhd:168:39
  n6611_o <= n6600_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n6612_o <= n6600_o (43);
  -- ../fixed_pkg.vhd:173:9
  n6617_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n6618_o <= n6617_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n6619: postponed assert n6618_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n6621_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n6622_o <= n6621_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n6623: postponed assert n6622_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n6625_o <= n6600_o (42);
  -- ../fixed_pkg.vhd:183:27
  n6626_o <= '1' when n6625_o /= n6612_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n6633_o <= '0' when n6626_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n6639_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6640_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6641_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6642_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6643_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6644_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6645_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6646_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6647_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6648_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6649_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6650_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6651_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6652_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6653_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6654_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6655_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6656_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6657_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6658_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6659_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6660_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6661_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6662_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6663_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6664_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6665_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6666_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6667_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6668_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6669_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6670_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6671_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6672_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6673_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6674_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6675_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6676_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6677_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6678_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6679_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6680_o <= not n6612_o;
  -- ../fixed_pkg.vhd:194:31
  n6681_o <= not n6612_o;
  n6682_o <= n6639_o & n6640_o & n6641_o & n6642_o;
  -- ../fixed_pkg.vhd:169:40
  n6683_o <= n6643_o & n6644_o & n6645_o & n6646_o;
  -- ../fixed_pkg.vhd:9:14
  n6684_o <= n6647_o & n6648_o & n6649_o & n6650_o;
  -- ../fixed_pkg.vhd:9:14
  n6685_o <= n6651_o & n6652_o & n6653_o & n6654_o;
  n6686_o <= n6655_o & n6656_o & n6657_o & n6658_o;
  -- ../fixed_pkg.vhd:9:14
  n6687_o <= n6659_o & n6660_o & n6661_o & n6662_o;
  -- ../fixed_pkg.vhd:24:14
  n6688_o <= n6663_o & n6664_o & n6665_o & n6666_o;
  -- ../fixed_pkg.vhd:24:14
  n6689_o <= n6667_o & n6668_o & n6669_o & n6670_o;
  n6690_o <= n6671_o & n6672_o & n6673_o & n6674_o;
  -- ../fixed_pkg.vhd:24:14
  n6691_o <= n6675_o & n6676_o & n6677_o & n6678_o;
  n6692_o <= n6679_o & n6680_o & n6681_o;
  -- ../fixed_pkg.vhd:171:18
  n6693_o <= n6682_o & n6683_o & n6684_o & n6685_o;
  n6694_o <= n6686_o & n6687_o & n6688_o & n6689_o;
  -- ../fixed_pkg.vhd:170:18
  n6695_o <= n6690_o & n6691_o & n6692_o;
  n6696_o <= n6693_o & n6694_o & n6695_o;
  -- ../fixed_pkg.vhd:169:40
  n6697_o <= n6696_o (41 downto 0);
  -- ../fixed_pkg.vhd:9:14
  n6698_o <= n6612_o & n6697_o;
  -- ../fixed_pkg.vhd:193:9
  n6699_o <= n6611_o when n6633_o = '0' else n6698_o;
  -- ../fixed_pkg.vhd:168:39
  n6715_o <= n6699_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n6716_o <= n6699_o (42);
  -- ../fixed_pkg.vhd:173:9
  n6721_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n6722_o <= n6721_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n6723: postponed assert n6722_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n6725_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n6726_o <= n6725_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n6727: postponed assert n6726_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n6729_o <= n6699_o (41);
  -- ../fixed_pkg.vhd:183:27
  n6730_o <= '1' when n6729_o /= n6716_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n6737_o <= '0' when n6730_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n6741_o <= '1' when n6730_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n6743_o <= n6699_o (40);
  -- ../fixed_pkg.vhd:183:27
  n6744_o <= '1' when n6743_o /= n6716_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n6746_o <= n6737_o when n6755_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n6752_o <= n6744_o and n6741_o;
  -- ../fixed_pkg.vhd:183:17
  n6755_o <= n6741_o and n6752_o;
  -- ../fixed_pkg.vhd:194:31
  n6757_o <= not n6716_o;
  -- ../fixed_pkg.vhd:194:31
  n6758_o <= not n6716_o;
  -- ../fixed_pkg.vhd:194:31
  n6759_o <= not n6716_o;
  -- ../fixed_pkg.vhd:194:31
  n6760_o <= not n6716_o;
  -- ../fixed_pkg.vhd:194:31
  n6761_o <= not n6716_o;
  -- ../fixed_pkg.vhd:194:31
  n6762_o <= not n6716_o;
  -- ../fixed_pkg.vhd:194:31
  n6763_o <= not n6716_o;
  -- ../fixed_pkg.vhd:194:31
  n6764_o <= not n6716_o;
  -- ../fixed_pkg.vhd:194:31
  n6765_o <= not n6716_o;
  -- ../fixed_pkg.vhd:194:31
  n6766_o <= not n6716_o;
  -- ../fixed_pkg.vhd:194:31
  n6767_o <= not n6716_o;
  -- ../fixed_pkg.vhd:194:31
  n6768_o <= not n6716_o;
  -- ../fixed_pkg.vhd:194:31
  n6769_o <= not n6716_o;
  -- ../fixed_pkg.vhd:194:31
  n6770_o <= not n6716_o;
  -- ../fixed_pkg.vhd:194:31
  n6771_o <= not n6716_o;
  -- ../fixed_pkg.vhd:194:31
  n6772_o <= not n6716_o;
  -- ../fixed_pkg.vhd:194:31
  n6773_o <= not n6716_o;
  -- ../fixed_pkg.vhd:194:31
  n6774_o <= not n6716_o;
  -- ../fixed_pkg.vhd:194:31
  n6775_o <= not n6716_o;
  -- ../fixed_pkg.vhd:194:31
  n6776_o <= not n6716_o;
  -- ../fixed_pkg.vhd:194:31
  n6777_o <= not n6716_o;
  -- ../fixed_pkg.vhd:194:31
  n6778_o <= not n6716_o;
  -- ../fixed_pkg.vhd:194:31
  n6779_o <= not n6716_o;
  -- ../fixed_pkg.vhd:194:31
  n6780_o <= not n6716_o;
  -- ../fixed_pkg.vhd:194:31
  n6781_o <= not n6716_o;
  -- ../fixed_pkg.vhd:171:18
  n6782_o <= n6757_o & n6758_o & n6759_o & n6760_o;
  -- ../fixed_pkg.vhd:9:14
  n6783_o <= n6761_o & n6762_o & n6763_o & n6764_o;
  -- ../fixed_pkg.vhd:9:14
  n6784_o <= n6765_o & n6766_o & n6767_o & n6768_o;
  -- ../fixed_pkg.vhd:183:17
  n6785_o <= n6769_o & n6770_o & n6771_o & n6772_o;
  -- ../fixed_pkg.vhd:9:14
  n6786_o <= n6773_o & n6774_o & n6775_o & n6776_o;
  -- ../fixed_pkg.vhd:40:14
  n6787_o <= n6777_o & n6778_o & n6779_o & n6780_o;
  -- ../fixed_pkg.vhd:40:14
  n6788_o <= n6782_o & n6783_o & n6784_o & n6785_o;
  -- ../fixed_pkg.vhd:9:14
  n6789_o <= n6786_o & n6787_o & n6781_o;
  -- ../fixed_pkg.vhd:40:14
  n6790_o <= n6788_o & n6789_o;
  -- ../fixed_pkg.vhd:183:17
  n6791_o <= n6790_o (23 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n6792_o <= n6715_o (40 downto 16);
  -- ../fixed_pkg.vhd:183:17
  n6793_o <= n6716_o & n6791_o;
  -- ../fixed_pkg.vhd:193:9
  n6794_o <= n6792_o when n6746_o = '0' else n6793_o;
  -- ../BiquadFilter/BiquadFilter.vhd:65:17
  n6797_o <= '1' when state_reg = "01" else '0';
  -- ../fixed_pkg.vhd:266:100
  n6812_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n6815_o <= std_logic_vector (resize (signed (n6812_o) * signed'("0000000000000000000000000000000000000000000"), 43));
  -- ../fixed_pkg.vhd:266:100
  n6827_o <= std_logic_vector (resize (signed (y_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n6830_o <= std_logic_vector (resize (signed (n6827_o) * signed'("0000000000011111111111111100001011000101101"), 43));
  -- ../fixed_pkg.vhd:168:39
  n6847_o <= std_logic_vector (resize (signed (n6815_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n6853_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n6854_o <= n6853_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n6855: postponed assert n6854_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n6857_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n6858_o <= n6857_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n6859: postponed assert n6858_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n6871_o <= std_logic_vector (resize (signed (n6830_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n6877_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n6878_o <= n6877_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n6879: postponed assert n6878_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n6881_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n6882_o <= n6881_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n6883: postponed assert n6882_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:240:67
  n6895_o <= std_logic_vector (unsigned (n6847_o) - unsigned (n6871_o));
  -- ../fixed_pkg.vhd:168:39
  n6906_o <= n6895_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n6907_o <= n6895_o (43);
  -- ../fixed_pkg.vhd:173:9
  n6912_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n6913_o <= n6912_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n6914: postponed assert n6913_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n6916_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n6917_o <= n6916_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n6918: postponed assert n6917_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n6920_o <= n6895_o (42);
  -- ../fixed_pkg.vhd:183:27
  n6921_o <= '1' when n6920_o /= n6907_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n6928_o <= '0' when n6921_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n6934_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6935_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6936_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6937_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6938_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6939_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6940_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6941_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6942_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6943_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6944_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6945_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6946_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6947_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6948_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6949_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6950_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6951_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6952_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6953_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6954_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6955_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6956_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6957_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6958_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6959_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6960_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6961_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6962_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6963_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6964_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6965_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6966_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6967_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6968_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6969_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6970_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6971_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6972_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6973_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6974_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6975_o <= not n6907_o;
  -- ../fixed_pkg.vhd:194:31
  n6976_o <= not n6907_o;
  n6977_o <= n6934_o & n6935_o & n6936_o & n6937_o;
  n6978_o <= n6938_o & n6939_o & n6940_o & n6941_o;
  n6979_o <= n6942_o & n6943_o & n6944_o & n6945_o;
  n6980_o <= n6946_o & n6947_o & n6948_o & n6949_o;
  n6981_o <= n6950_o & n6951_o & n6952_o & n6953_o;
  n6982_o <= n6954_o & n6955_o & n6956_o & n6957_o;
  n6983_o <= n6958_o & n6959_o & n6960_o & n6961_o;
  n6984_o <= n6962_o & n6963_o & n6964_o & n6965_o;
  n6985_o <= n6966_o & n6967_o & n6968_o & n6969_o;
  n6986_o <= n6970_o & n6971_o & n6972_o & n6973_o;
  n6987_o <= n6974_o & n6975_o & n6976_o;
  n6988_o <= n6977_o & n6978_o & n6979_o & n6980_o;
  n6989_o <= n6981_o & n6982_o & n6983_o & n6984_o;
  n6990_o <= n6985_o & n6986_o & n6987_o;
  n6991_o <= n6988_o & n6989_o & n6990_o;
  n6992_o <= n6991_o (41 downto 0);
  n6993_o <= n6907_o & n6992_o;
  -- ../fixed_pkg.vhd:193:9
  n6994_o <= n6906_o when n6928_o = '0' else n6993_o;
  -- ../fixed_pkg.vhd:168:39
  n7012_o <= std_logic_vector (resize (signed (n6994_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n7018_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n7019_o <= n7018_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n7020: postponed assert n7019_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n7022_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n7023_o <= n7022_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n7024: postponed assert n7023_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n7036_o <= std_logic_vector (resize (signed (v_reg), 28));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n7042_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n7043_o <= n7042_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n7044: postponed assert n7043_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n7046_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n7047_o <= n7046_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n7048: postponed assert n7047_o = '1' severity error; --  assert
  n7050_o <= n7049_o (15 downto 0);
  n7051_o <= n7036_o & n7050_o;
  -- ../fixed_pkg.vhd:255:67
  n7062_o <= std_logic_vector (unsigned (n7012_o) + unsigned (n7051_o));
  -- ../fixed_pkg.vhd:168:39
  n7073_o <= n7062_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n7074_o <= n7062_o (43);
  -- ../fixed_pkg.vhd:173:9
  n7079_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n7080_o <= n7079_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n7081: postponed assert n7080_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n7083_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n7084_o <= n7083_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n7085: postponed assert n7084_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n7087_o <= n7062_o (42);
  -- ../fixed_pkg.vhd:183:27
  n7088_o <= '1' when n7087_o /= n7074_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n7095_o <= '0' when n7088_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n7101_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7102_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7103_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7104_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7105_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7106_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7107_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7108_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7109_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7110_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7111_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7112_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7113_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7114_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7115_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7116_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7117_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7118_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7119_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7120_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7121_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7122_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7123_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7124_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7125_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7126_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7127_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7128_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7129_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7130_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7131_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7132_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7133_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7134_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7135_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7136_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7137_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7138_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7139_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7140_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7141_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7142_o <= not n7074_o;
  -- ../fixed_pkg.vhd:194:31
  n7143_o <= not n7074_o;
  n7144_o <= n7101_o & n7102_o & n7103_o & n7104_o;
  n7145_o <= n7105_o & n7106_o & n7107_o & n7108_o;
  n7146_o <= n7109_o & n7110_o & n7111_o & n7112_o;
  n7147_o <= n7113_o & n7114_o & n7115_o & n7116_o;
  n7148_o <= n7117_o & n7118_o & n7119_o & n7120_o;
  n7149_o <= n7121_o & n7122_o & n7123_o & n7124_o;
  n7150_o <= n7125_o & n7126_o & n7127_o & n7128_o;
  n7151_o <= n7129_o & n7130_o & n7131_o & n7132_o;
  n7152_o <= n7133_o & n7134_o & n7135_o & n7136_o;
  n7153_o <= n7137_o & n7138_o & n7139_o & n7140_o;
  n7154_o <= n7141_o & n7142_o & n7143_o;
  n7155_o <= n7144_o & n7145_o & n7146_o & n7147_o;
  n7156_o <= n7148_o & n7149_o & n7150_o & n7151_o;
  n7157_o <= n7152_o & n7153_o & n7154_o;
  n7158_o <= n7155_o & n7156_o & n7157_o;
  n7159_o <= n7158_o (41 downto 0);
  n7160_o <= n7074_o & n7159_o;
  -- ../fixed_pkg.vhd:193:9
  n7161_o <= n7073_o when n7095_o = '0' else n7160_o;
  -- ../fixed_pkg.vhd:168:39
  n7177_o <= n7161_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n7178_o <= n7161_o (42);
  -- ../fixed_pkg.vhd:173:9
  n7183_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n7184_o <= n7183_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n7185: postponed assert n7184_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n7187_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n7188_o <= n7187_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n7189: postponed assert n7188_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n7191_o <= n7161_o (41);
  -- ../fixed_pkg.vhd:183:27
  n7192_o <= '1' when n7191_o /= n7178_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n7199_o <= '0' when n7192_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n7203_o <= '1' when n7192_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n7205_o <= n7161_o (40);
  -- ../fixed_pkg.vhd:183:27
  n7206_o <= '1' when n7205_o /= n7178_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n7208_o <= n7199_o when n7217_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n7214_o <= n7206_o and n7203_o;
  -- ../fixed_pkg.vhd:183:17
  n7217_o <= n7203_o and n7214_o;
  -- ../fixed_pkg.vhd:194:31
  n7219_o <= not n7178_o;
  -- ../fixed_pkg.vhd:194:31
  n7220_o <= not n7178_o;
  -- ../fixed_pkg.vhd:194:31
  n7221_o <= not n7178_o;
  -- ../fixed_pkg.vhd:194:31
  n7222_o <= not n7178_o;
  -- ../fixed_pkg.vhd:194:31
  n7223_o <= not n7178_o;
  -- ../fixed_pkg.vhd:194:31
  n7224_o <= not n7178_o;
  -- ../fixed_pkg.vhd:194:31
  n7225_o <= not n7178_o;
  -- ../fixed_pkg.vhd:194:31
  n7226_o <= not n7178_o;
  -- ../fixed_pkg.vhd:194:31
  n7227_o <= not n7178_o;
  -- ../fixed_pkg.vhd:194:31
  n7228_o <= not n7178_o;
  -- ../fixed_pkg.vhd:194:31
  n7229_o <= not n7178_o;
  -- ../fixed_pkg.vhd:194:31
  n7230_o <= not n7178_o;
  -- ../fixed_pkg.vhd:194:31
  n7231_o <= not n7178_o;
  -- ../fixed_pkg.vhd:194:31
  n7232_o <= not n7178_o;
  -- ../fixed_pkg.vhd:194:31
  n7233_o <= not n7178_o;
  -- ../fixed_pkg.vhd:194:31
  n7234_o <= not n7178_o;
  -- ../fixed_pkg.vhd:194:31
  n7235_o <= not n7178_o;
  -- ../fixed_pkg.vhd:194:31
  n7236_o <= not n7178_o;
  -- ../fixed_pkg.vhd:194:31
  n7237_o <= not n7178_o;
  -- ../fixed_pkg.vhd:194:31
  n7238_o <= not n7178_o;
  -- ../fixed_pkg.vhd:194:31
  n7239_o <= not n7178_o;
  -- ../fixed_pkg.vhd:194:31
  n7240_o <= not n7178_o;
  -- ../fixed_pkg.vhd:194:31
  n7241_o <= not n7178_o;
  -- ../fixed_pkg.vhd:194:31
  n7242_o <= not n7178_o;
  -- ../fixed_pkg.vhd:194:31
  n7243_o <= not n7178_o;
  n7244_o <= n7219_o & n7220_o & n7221_o & n7222_o;
  n7245_o <= n7223_o & n7224_o & n7225_o & n7226_o;
  n7246_o <= n7227_o & n7228_o & n7229_o & n7230_o;
  n7247_o <= n7231_o & n7232_o & n7233_o & n7234_o;
  n7248_o <= n7235_o & n7236_o & n7237_o & n7238_o;
  n7249_o <= n7239_o & n7240_o & n7241_o & n7242_o;
  n7250_o <= n7244_o & n7245_o & n7246_o & n7247_o;
  n7251_o <= n7248_o & n7249_o & n7243_o;
  n7252_o <= n7250_o & n7251_o;
  n7253_o <= n7252_o (23 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n7254_o <= n7177_o (40 downto 16);
  n7255_o <= n7178_o & n7253_o;
  -- ../fixed_pkg.vhd:193:9
  n7256_o <= n7254_o when n7208_o = '0' else n7255_o;
  -- ../fixed_pkg.vhd:266:100
  n7271_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n7274_o <= std_logic_vector (resize (signed (n7271_o) * signed'("0000000000011111111111111111111110011011011"), 43));
  -- ../fixed_pkg.vhd:266:100
  n7286_o <= std_logic_vector (resize (signed (y_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n7289_o <= std_logic_vector (resize (signed (n7286_o) * signed'("0000000000000000000000000001111100110110110"), 43));
  -- ../fixed_pkg.vhd:168:39
  n7306_o <= std_logic_vector (resize (signed (n7274_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n7312_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n7313_o <= n7312_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n7314: postponed assert n7313_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n7316_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n7317_o <= n7316_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n7318: postponed assert n7317_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n7330_o <= std_logic_vector (resize (signed (n7289_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n7336_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n7337_o <= n7336_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n7338: postponed assert n7337_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n7340_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n7341_o <= n7340_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n7342: postponed assert n7341_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:240:67
  n7354_o <= std_logic_vector (unsigned (n7306_o) - unsigned (n7330_o));
  -- ../fixed_pkg.vhd:168:39
  n7365_o <= n7354_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n7366_o <= n7354_o (43);
  -- ../fixed_pkg.vhd:173:9
  n7371_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n7372_o <= n7371_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n7373: postponed assert n7372_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n7375_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n7376_o <= n7375_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n7377: postponed assert n7376_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n7379_o <= n7354_o (42);
  -- ../fixed_pkg.vhd:183:27
  n7380_o <= '1' when n7379_o /= n7366_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n7387_o <= '0' when n7380_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n7393_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7394_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7395_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7396_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7397_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7398_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7399_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7400_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7401_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7402_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7403_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7404_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7405_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7406_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7407_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7408_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7409_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7410_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7411_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7412_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7413_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7414_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7415_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7416_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7417_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7418_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7419_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7420_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7421_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7422_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7423_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7424_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7425_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7426_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7427_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7428_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7429_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7430_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7431_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7432_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7433_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7434_o <= not n7366_o;
  -- ../fixed_pkg.vhd:194:31
  n7435_o <= not n7366_o;
  n7436_o <= n7393_o & n7394_o & n7395_o & n7396_o;
  n7437_o <= n7397_o & n7398_o & n7399_o & n7400_o;
  n7438_o <= n7401_o & n7402_o & n7403_o & n7404_o;
  n7439_o <= n7405_o & n7406_o & n7407_o & n7408_o;
  n7440_o <= n7409_o & n7410_o & n7411_o & n7412_o;
  n7441_o <= n7413_o & n7414_o & n7415_o & n7416_o;
  n7442_o <= n7417_o & n7418_o & n7419_o & n7420_o;
  n7443_o <= n7421_o & n7422_o & n7423_o & n7424_o;
  n7444_o <= n7425_o & n7426_o & n7427_o & n7428_o;
  n7445_o <= n7429_o & n7430_o & n7431_o & n7432_o;
  n7446_o <= n7433_o & n7434_o & n7435_o;
  n7447_o <= n7436_o & n7437_o & n7438_o & n7439_o;
  n7448_o <= n7440_o & n7441_o & n7442_o & n7443_o;
  n7449_o <= n7444_o & n7445_o & n7446_o;
  n7450_o <= n7447_o & n7448_o & n7449_o;
  n7451_o <= n7450_o (41 downto 0);
  n7452_o <= n7366_o & n7451_o;
  -- ../fixed_pkg.vhd:193:9
  n7453_o <= n7365_o when n7387_o = '0' else n7452_o;
  -- ../fixed_pkg.vhd:168:39
  n7469_o <= n7453_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n7470_o <= n7453_o (42);
  -- ../fixed_pkg.vhd:173:9
  n7475_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n7476_o <= n7475_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n7477: postponed assert n7476_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n7479_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n7480_o <= n7479_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n7481: postponed assert n7480_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n7483_o <= n7453_o (41);
  -- ../fixed_pkg.vhd:183:27
  n7484_o <= '1' when n7483_o /= n7470_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n7491_o <= '0' when n7484_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n7495_o <= '1' when n7484_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n7497_o <= n7453_o (40);
  -- ../fixed_pkg.vhd:183:27
  n7498_o <= '1' when n7497_o /= n7470_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n7500_o <= n7491_o when n7509_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n7506_o <= n7498_o and n7495_o;
  -- ../fixed_pkg.vhd:183:17
  n7509_o <= n7495_o and n7506_o;
  -- ../fixed_pkg.vhd:194:31
  n7511_o <= not n7470_o;
  -- ../fixed_pkg.vhd:194:31
  n7512_o <= not n7470_o;
  -- ../fixed_pkg.vhd:194:31
  n7513_o <= not n7470_o;
  -- ../fixed_pkg.vhd:194:31
  n7514_o <= not n7470_o;
  -- ../fixed_pkg.vhd:194:31
  n7515_o <= not n7470_o;
  -- ../fixed_pkg.vhd:194:31
  n7516_o <= not n7470_o;
  -- ../fixed_pkg.vhd:194:31
  n7517_o <= not n7470_o;
  -- ../fixed_pkg.vhd:194:31
  n7518_o <= not n7470_o;
  -- ../fixed_pkg.vhd:194:31
  n7519_o <= not n7470_o;
  -- ../fixed_pkg.vhd:194:31
  n7520_o <= not n7470_o;
  -- ../fixed_pkg.vhd:194:31
  n7521_o <= not n7470_o;
  -- ../fixed_pkg.vhd:194:31
  n7522_o <= not n7470_o;
  -- ../fixed_pkg.vhd:194:31
  n7523_o <= not n7470_o;
  -- ../fixed_pkg.vhd:194:31
  n7524_o <= not n7470_o;
  -- ../fixed_pkg.vhd:194:31
  n7525_o <= not n7470_o;
  -- ../fixed_pkg.vhd:194:31
  n7526_o <= not n7470_o;
  -- ../fixed_pkg.vhd:194:31
  n7527_o <= not n7470_o;
  -- ../fixed_pkg.vhd:194:31
  n7528_o <= not n7470_o;
  -- ../fixed_pkg.vhd:194:31
  n7529_o <= not n7470_o;
  -- ../fixed_pkg.vhd:194:31
  n7530_o <= not n7470_o;
  -- ../fixed_pkg.vhd:194:31
  n7531_o <= not n7470_o;
  -- ../fixed_pkg.vhd:194:31
  n7532_o <= not n7470_o;
  -- ../fixed_pkg.vhd:194:31
  n7533_o <= not n7470_o;
  -- ../fixed_pkg.vhd:194:31
  n7534_o <= not n7470_o;
  -- ../fixed_pkg.vhd:194:31
  n7535_o <= not n7470_o;
  n7536_o <= n7511_o & n7512_o & n7513_o & n7514_o;
  n7537_o <= n7515_o & n7516_o & n7517_o & n7518_o;
  n7538_o <= n7519_o & n7520_o & n7521_o & n7522_o;
  n7539_o <= n7523_o & n7524_o & n7525_o & n7526_o;
  n7540_o <= n7527_o & n7528_o & n7529_o & n7530_o;
  n7541_o <= n7531_o & n7532_o & n7533_o & n7534_o;
  n7542_o <= n7536_o & n7537_o & n7538_o & n7539_o;
  n7543_o <= n7540_o & n7541_o & n7535_o;
  n7544_o <= n7542_o & n7543_o;
  n7545_o <= n7544_o (23 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n7546_o <= n7469_o (40 downto 16);
  n7547_o <= n7470_o & n7545_o;
  -- ../fixed_pkg.vhd:193:9
  n7548_o <= n7546_o when n7500_o = '0' else n7547_o;
  -- ../BiquadFilter/BiquadFilter.vhd:67:17
  n7551_o <= '1' when state_reg = "10" else '0';
  n7552_o <= n7551_o & n6797_o & n6516_o;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n7552_o select n7553_o <=
    x_reg when "100",
    x_reg when "010",
    n6514_o when "001",
    x_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n7552_o select n7554_o <=
    y_reg when "100",
    n6794_o when "010",
    y_reg when "001",
    y_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n7552_o select n7555_o <=
    n7256_o when "100",
    w_reg when "010",
    w_reg when "001",
    w_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n7552_o select n7556_o <=
    n7548_o when "100",
    v_reg when "010",
    v_reg when "001",
    v_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n7584_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n7585_o <= x_reg when n7584_o = '0' else n7553_o;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n7586_q <= n7585_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n7587_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n7588_o <= y_reg when n7587_o = '0' else n7554_o;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n7589_q <= n7588_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n7590_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n7590_q <= n7555_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n7591_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n7591_q <= n7556_o;
    end if;
  end process;
  -- ../fixed_pkg.vhd:168:39
  n7607_o <= y_reg (22 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n7608_o <= y_reg (24);
  -- ../fixed_pkg.vhd:173:9
  n7613_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n7614_o <= n7613_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n7615: postponed assert n7614_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n7617_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n7618_o <= n7617_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n7619: postponed assert n7618_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n7621_o <= y_reg (23);
  -- ../fixed_pkg.vhd:183:27
  n7622_o <= '1' when n7621_o /= n7608_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n7629_o <= '0' when n7622_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n7633_o <= '1' when n7622_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n7635_o <= y_reg (22);
  -- ../fixed_pkg.vhd:183:27
  n7636_o <= '1' when n7635_o /= n7608_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n7638_o <= n7629_o when n7647_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n7644_o <= n7636_o and n7633_o;
  -- ../fixed_pkg.vhd:183:17
  n7647_o <= n7633_o and n7644_o;
  -- ../fixed_pkg.vhd:194:31
  n7649_o <= not n7608_o;
  -- ../fixed_pkg.vhd:194:31
  n7650_o <= not n7608_o;
  -- ../fixed_pkg.vhd:194:31
  n7651_o <= not n7608_o;
  -- ../fixed_pkg.vhd:194:31
  n7652_o <= not n7608_o;
  -- ../fixed_pkg.vhd:194:31
  n7653_o <= not n7608_o;
  -- ../fixed_pkg.vhd:194:31
  n7654_o <= not n7608_o;
  -- ../fixed_pkg.vhd:194:31
  n7655_o <= not n7608_o;
  -- ../fixed_pkg.vhd:194:31
  n7656_o <= not n7608_o;
  -- ../fixed_pkg.vhd:194:31
  n7657_o <= not n7608_o;
  -- ../fixed_pkg.vhd:194:31
  n7658_o <= not n7608_o;
  -- ../fixed_pkg.vhd:194:31
  n7659_o <= not n7608_o;
  -- ../fixed_pkg.vhd:194:31
  n7660_o <= not n7608_o;
  -- ../fixed_pkg.vhd:194:31
  n7661_o <= not n7608_o;
  -- ../fixed_pkg.vhd:194:31
  n7662_o <= not n7608_o;
  -- ../fixed_pkg.vhd:194:31
  n7663_o <= not n7608_o;
  -- ../fixed_pkg.vhd:194:31
  n7664_o <= not n7608_o;
  -- ../fixed_pkg.vhd:194:31
  n7665_o <= not n7608_o;
  -- ../fixed_pkg.vhd:194:31
  n7666_o <= not n7608_o;
  n7667_o <= n7649_o & n7650_o & n7651_o & n7652_o;
  n7668_o <= n7653_o & n7654_o & n7655_o & n7656_o;
  n7669_o <= n7657_o & n7658_o & n7659_o & n7660_o;
  n7670_o <= n7661_o & n7662_o & n7663_o & n7664_o;
  n7671_o <= n7665_o & n7666_o;
  n7672_o <= n7667_o & n7668_o & n7669_o & n7670_o;
  n7673_o <= n7672_o & n7671_o;
  n7674_o <= n7673_o (16 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n7675_o <= n7607_o (22 downto 5);
  n7676_o <= n7608_o & n7674_o;
  -- ../fixed_pkg.vhd:193:9
  n7677_o <= n7675_o when n7638_o = '0' else n7676_o;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity biquadfilter_7219f090b8e97a5f56406d3102d0d9a2fe57c6ac is
  port (
    clk_i : in std_logic;
    reset_i : in std_logic;
    valid_i : in std_logic;
    data_i : in std_logic_vector (17 downto 0);
    ready_i : in std_logic;
    ready_o : out std_logic;
    valid_o : out std_logic;
    data_o : out std_logic_vector (17 downto 0));
end entity biquadfilter_7219f090b8e97a5f56406d3102d0d9a2fe57c6ac;

architecture rtl of biquadfilter_7219f090b8e97a5f56406d3102d0d9a2fe57c6ac is
  signal state_reg : std_logic_vector (1 downto 0);
  signal x_reg : std_logic_vector (24 downto 0);
  signal y_reg : std_logic_vector (24 downto 0);
  signal w_reg : std_logic_vector (24 downto 0);
  signal v_reg : std_logic_vector (24 downto 0);
  signal n5212_o : std_logic;
  signal n5214_o : std_logic_vector (1 downto 0);
  signal n5216_o : std_logic;
  signal n5218_o : std_logic;
  signal n5220_o : std_logic;
  signal n5222_o : std_logic_vector (1 downto 0);
  signal n5224_o : std_logic;
  signal n5225_o : std_logic_vector (3 downto 0);
  signal n5229_o : std_logic_vector (1 downto 0);
  signal n5234_q : std_logic_vector (1 downto 0);
  signal n5237_o : std_logic;
  signal n5238_o : std_logic;
  signal n5242_o : std_logic;
  signal n5243_o : std_logic;
  signal n5246_o : std_logic;
  signal n5262_o : std_logic_vector (19 downto 0);
  signal n5268_o : std_logic;
  signal n5269_o : std_logic;
  signal n5272_o : std_logic;
  signal n5273_o : std_logic;
  constant n5275_o : std_logic_vector (24 downto 0) := "0000000000000000000000000";
  signal n5276_o : std_logic_vector (4 downto 0);
  signal n5277_o : std_logic_vector (24 downto 0);
  signal n5278_o : std_logic_vector (24 downto 0);
  signal n5280_o : std_logic;
  signal n5294_o : std_logic_vector (42 downto 0);
  signal n5297_o : std_logic_vector (42 downto 0);
  signal n5314_o : std_logic_vector (43 downto 0);
  signal n5320_o : std_logic;
  signal n5321_o : std_logic;
  signal n5324_o : std_logic;
  signal n5325_o : std_logic;
  signal n5338_o : std_logic_vector (27 downto 0);
  signal n5344_o : std_logic;
  signal n5345_o : std_logic;
  signal n5348_o : std_logic;
  signal n5349_o : std_logic;
  constant n5351_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n5352_o : std_logic_vector (15 downto 0);
  signal n5353_o : std_logic_vector (43 downto 0);
  signal n5364_o : std_logic_vector (43 downto 0);
  signal n5375_o : std_logic_vector (42 downto 0);
  signal n5376_o : std_logic;
  signal n5381_o : std_logic;
  signal n5382_o : std_logic;
  signal n5385_o : std_logic;
  signal n5386_o : std_logic;
  signal n5389_o : std_logic;
  signal n5390_o : std_logic;
  signal n5397_o : std_logic;
  signal n5403_o : std_logic;
  signal n5404_o : std_logic;
  signal n5405_o : std_logic;
  signal n5406_o : std_logic;
  signal n5407_o : std_logic;
  signal n5408_o : std_logic;
  signal n5409_o : std_logic;
  signal n5410_o : std_logic;
  signal n5411_o : std_logic;
  signal n5412_o : std_logic;
  signal n5413_o : std_logic;
  signal n5414_o : std_logic;
  signal n5415_o : std_logic;
  signal n5416_o : std_logic;
  signal n5417_o : std_logic;
  signal n5418_o : std_logic;
  signal n5419_o : std_logic;
  signal n5420_o : std_logic;
  signal n5421_o : std_logic;
  signal n5422_o : std_logic;
  signal n5423_o : std_logic;
  signal n5424_o : std_logic;
  signal n5425_o : std_logic;
  signal n5426_o : std_logic;
  signal n5427_o : std_logic;
  signal n5428_o : std_logic;
  signal n5429_o : std_logic;
  signal n5430_o : std_logic;
  signal n5431_o : std_logic;
  signal n5432_o : std_logic;
  signal n5433_o : std_logic;
  signal n5434_o : std_logic;
  signal n5435_o : std_logic;
  signal n5436_o : std_logic;
  signal n5437_o : std_logic;
  signal n5438_o : std_logic;
  signal n5439_o : std_logic;
  signal n5440_o : std_logic;
  signal n5441_o : std_logic;
  signal n5442_o : std_logic;
  signal n5443_o : std_logic;
  signal n5444_o : std_logic;
  signal n5445_o : std_logic;
  signal n5446_o : std_logic_vector (3 downto 0);
  signal n5447_o : std_logic_vector (3 downto 0);
  signal n5448_o : std_logic_vector (3 downto 0);
  signal n5449_o : std_logic_vector (3 downto 0);
  signal n5450_o : std_logic_vector (3 downto 0);
  signal n5451_o : std_logic_vector (3 downto 0);
  signal n5452_o : std_logic_vector (3 downto 0);
  signal n5453_o : std_logic_vector (3 downto 0);
  signal n5454_o : std_logic_vector (3 downto 0);
  signal n5455_o : std_logic_vector (3 downto 0);
  signal n5456_o : std_logic_vector (2 downto 0);
  signal n5457_o : std_logic_vector (15 downto 0);
  signal n5458_o : std_logic_vector (15 downto 0);
  signal n5459_o : std_logic_vector (10 downto 0);
  signal n5460_o : std_logic_vector (42 downto 0);
  signal n5461_o : std_logic_vector (41 downto 0);
  signal n5462_o : std_logic_vector (42 downto 0);
  signal n5463_o : std_logic_vector (42 downto 0);
  signal n5479_o : std_logic_vector (40 downto 0);
  signal n5480_o : std_logic;
  signal n5485_o : std_logic;
  signal n5486_o : std_logic;
  signal n5489_o : std_logic;
  signal n5490_o : std_logic;
  signal n5493_o : std_logic;
  signal n5494_o : std_logic;
  signal n5501_o : std_logic;
  signal n5505_o : std_logic;
  signal n5507_o : std_logic;
  signal n5508_o : std_logic;
  signal n5510_o : std_logic;
  signal n5516_o : std_logic;
  signal n5519_o : std_logic;
  signal n5521_o : std_logic;
  signal n5522_o : std_logic;
  signal n5523_o : std_logic;
  signal n5524_o : std_logic;
  signal n5525_o : std_logic;
  signal n5526_o : std_logic;
  signal n5527_o : std_logic;
  signal n5528_o : std_logic;
  signal n5529_o : std_logic;
  signal n5530_o : std_logic;
  signal n5531_o : std_logic;
  signal n5532_o : std_logic;
  signal n5533_o : std_logic;
  signal n5534_o : std_logic;
  signal n5535_o : std_logic;
  signal n5536_o : std_logic;
  signal n5537_o : std_logic;
  signal n5538_o : std_logic;
  signal n5539_o : std_logic;
  signal n5540_o : std_logic;
  signal n5541_o : std_logic;
  signal n5542_o : std_logic;
  signal n5543_o : std_logic;
  signal n5544_o : std_logic;
  signal n5545_o : std_logic;
  signal n5546_o : std_logic_vector (3 downto 0);
  signal n5547_o : std_logic_vector (3 downto 0);
  signal n5548_o : std_logic_vector (3 downto 0);
  signal n5549_o : std_logic_vector (3 downto 0);
  signal n5550_o : std_logic_vector (3 downto 0);
  signal n5551_o : std_logic_vector (3 downto 0);
  signal n5552_o : std_logic_vector (15 downto 0);
  signal n5553_o : std_logic_vector (8 downto 0);
  signal n5554_o : std_logic_vector (24 downto 0);
  signal n5555_o : std_logic_vector (23 downto 0);
  signal n5556_o : std_logic_vector (24 downto 0);
  signal n5557_o : std_logic_vector (24 downto 0);
  signal n5558_o : std_logic_vector (24 downto 0);
  signal n5561_o : std_logic;
  signal n5576_o : std_logic_vector (42 downto 0);
  signal n5579_o : std_logic_vector (42 downto 0);
  signal n5591_o : std_logic_vector (42 downto 0);
  signal n5594_o : std_logic_vector (42 downto 0);
  signal n5611_o : std_logic_vector (43 downto 0);
  signal n5617_o : std_logic;
  signal n5618_o : std_logic;
  signal n5621_o : std_logic;
  signal n5622_o : std_logic;
  signal n5635_o : std_logic_vector (43 downto 0);
  signal n5641_o : std_logic;
  signal n5642_o : std_logic;
  signal n5645_o : std_logic;
  signal n5646_o : std_logic;
  signal n5659_o : std_logic_vector (43 downto 0);
  signal n5670_o : std_logic_vector (42 downto 0);
  signal n5671_o : std_logic;
  signal n5676_o : std_logic;
  signal n5677_o : std_logic;
  signal n5680_o : std_logic;
  signal n5681_o : std_logic;
  signal n5684_o : std_logic;
  signal n5685_o : std_logic;
  signal n5692_o : std_logic;
  signal n5698_o : std_logic;
  signal n5699_o : std_logic;
  signal n5700_o : std_logic;
  signal n5701_o : std_logic;
  signal n5702_o : std_logic;
  signal n5703_o : std_logic;
  signal n5704_o : std_logic;
  signal n5705_o : std_logic;
  signal n5706_o : std_logic;
  signal n5707_o : std_logic;
  signal n5708_o : std_logic;
  signal n5709_o : std_logic;
  signal n5710_o : std_logic;
  signal n5711_o : std_logic;
  signal n5712_o : std_logic;
  signal n5713_o : std_logic;
  signal n5714_o : std_logic;
  signal n5715_o : std_logic;
  signal n5716_o : std_logic;
  signal n5717_o : std_logic;
  signal n5718_o : std_logic;
  signal n5719_o : std_logic;
  signal n5720_o : std_logic;
  signal n5721_o : std_logic;
  signal n5722_o : std_logic;
  signal n5723_o : std_logic;
  signal n5724_o : std_logic;
  signal n5725_o : std_logic;
  signal n5726_o : std_logic;
  signal n5727_o : std_logic;
  signal n5728_o : std_logic;
  signal n5729_o : std_logic;
  signal n5730_o : std_logic;
  signal n5731_o : std_logic;
  signal n5732_o : std_logic;
  signal n5733_o : std_logic;
  signal n5734_o : std_logic;
  signal n5735_o : std_logic;
  signal n5736_o : std_logic;
  signal n5737_o : std_logic;
  signal n5738_o : std_logic;
  signal n5739_o : std_logic;
  signal n5740_o : std_logic;
  signal n5741_o : std_logic_vector (3 downto 0);
  signal n5742_o : std_logic_vector (3 downto 0);
  signal n5743_o : std_logic_vector (3 downto 0);
  signal n5744_o : std_logic_vector (3 downto 0);
  signal n5745_o : std_logic_vector (3 downto 0);
  signal n5746_o : std_logic_vector (3 downto 0);
  signal n5747_o : std_logic_vector (3 downto 0);
  signal n5748_o : std_logic_vector (3 downto 0);
  signal n5749_o : std_logic_vector (3 downto 0);
  signal n5750_o : std_logic_vector (3 downto 0);
  signal n5751_o : std_logic_vector (2 downto 0);
  signal n5752_o : std_logic_vector (15 downto 0);
  signal n5753_o : std_logic_vector (15 downto 0);
  signal n5754_o : std_logic_vector (10 downto 0);
  signal n5755_o : std_logic_vector (42 downto 0);
  signal n5756_o : std_logic_vector (41 downto 0);
  signal n5757_o : std_logic_vector (42 downto 0);
  signal n5758_o : std_logic_vector (42 downto 0);
  signal n5776_o : std_logic_vector (43 downto 0);
  signal n5782_o : std_logic;
  signal n5783_o : std_logic;
  signal n5786_o : std_logic;
  signal n5787_o : std_logic;
  signal n5800_o : std_logic_vector (27 downto 0);
  signal n5806_o : std_logic;
  signal n5807_o : std_logic;
  signal n5810_o : std_logic;
  signal n5811_o : std_logic;
  constant n5813_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n5814_o : std_logic_vector (15 downto 0);
  signal n5815_o : std_logic_vector (43 downto 0);
  signal n5826_o : std_logic_vector (43 downto 0);
  signal n5837_o : std_logic_vector (42 downto 0);
  signal n5838_o : std_logic;
  signal n5843_o : std_logic;
  signal n5844_o : std_logic;
  signal n5847_o : std_logic;
  signal n5848_o : std_logic;
  signal n5851_o : std_logic;
  signal n5852_o : std_logic;
  signal n5859_o : std_logic;
  signal n5865_o : std_logic;
  signal n5866_o : std_logic;
  signal n5867_o : std_logic;
  signal n5868_o : std_logic;
  signal n5869_o : std_logic;
  signal n5870_o : std_logic;
  signal n5871_o : std_logic;
  signal n5872_o : std_logic;
  signal n5873_o : std_logic;
  signal n5874_o : std_logic;
  signal n5875_o : std_logic;
  signal n5876_o : std_logic;
  signal n5877_o : std_logic;
  signal n5878_o : std_logic;
  signal n5879_o : std_logic;
  signal n5880_o : std_logic;
  signal n5881_o : std_logic;
  signal n5882_o : std_logic;
  signal n5883_o : std_logic;
  signal n5884_o : std_logic;
  signal n5885_o : std_logic;
  signal n5886_o : std_logic;
  signal n5887_o : std_logic;
  signal n5888_o : std_logic;
  signal n5889_o : std_logic;
  signal n5890_o : std_logic;
  signal n5891_o : std_logic;
  signal n5892_o : std_logic;
  signal n5893_o : std_logic;
  signal n5894_o : std_logic;
  signal n5895_o : std_logic;
  signal n5896_o : std_logic;
  signal n5897_o : std_logic;
  signal n5898_o : std_logic;
  signal n5899_o : std_logic;
  signal n5900_o : std_logic;
  signal n5901_o : std_logic;
  signal n5902_o : std_logic;
  signal n5903_o : std_logic;
  signal n5904_o : std_logic;
  signal n5905_o : std_logic;
  signal n5906_o : std_logic;
  signal n5907_o : std_logic;
  signal n5908_o : std_logic_vector (3 downto 0);
  signal n5909_o : std_logic_vector (3 downto 0);
  signal n5910_o : std_logic_vector (3 downto 0);
  signal n5911_o : std_logic_vector (3 downto 0);
  signal n5912_o : std_logic_vector (3 downto 0);
  signal n5913_o : std_logic_vector (3 downto 0);
  signal n5914_o : std_logic_vector (3 downto 0);
  signal n5915_o : std_logic_vector (3 downto 0);
  signal n5916_o : std_logic_vector (3 downto 0);
  signal n5917_o : std_logic_vector (3 downto 0);
  signal n5918_o : std_logic_vector (2 downto 0);
  signal n5919_o : std_logic_vector (15 downto 0);
  signal n5920_o : std_logic_vector (15 downto 0);
  signal n5921_o : std_logic_vector (10 downto 0);
  signal n5922_o : std_logic_vector (42 downto 0);
  signal n5923_o : std_logic_vector (41 downto 0);
  signal n5924_o : std_logic_vector (42 downto 0);
  signal n5925_o : std_logic_vector (42 downto 0);
  signal n5941_o : std_logic_vector (40 downto 0);
  signal n5942_o : std_logic;
  signal n5947_o : std_logic;
  signal n5948_o : std_logic;
  signal n5951_o : std_logic;
  signal n5952_o : std_logic;
  signal n5955_o : std_logic;
  signal n5956_o : std_logic;
  signal n5963_o : std_logic;
  signal n5967_o : std_logic;
  signal n5969_o : std_logic;
  signal n5970_o : std_logic;
  signal n5972_o : std_logic;
  signal n5978_o : std_logic;
  signal n5981_o : std_logic;
  signal n5983_o : std_logic;
  signal n5984_o : std_logic;
  signal n5985_o : std_logic;
  signal n5986_o : std_logic;
  signal n5987_o : std_logic;
  signal n5988_o : std_logic;
  signal n5989_o : std_logic;
  signal n5990_o : std_logic;
  signal n5991_o : std_logic;
  signal n5992_o : std_logic;
  signal n5993_o : std_logic;
  signal n5994_o : std_logic;
  signal n5995_o : std_logic;
  signal n5996_o : std_logic;
  signal n5997_o : std_logic;
  signal n5998_o : std_logic;
  signal n5999_o : std_logic;
  signal n6000_o : std_logic;
  signal n6001_o : std_logic;
  signal n6002_o : std_logic;
  signal n6003_o : std_logic;
  signal n6004_o : std_logic;
  signal n6005_o : std_logic;
  signal n6006_o : std_logic;
  signal n6007_o : std_logic;
  signal n6008_o : std_logic_vector (3 downto 0);
  signal n6009_o : std_logic_vector (3 downto 0);
  signal n6010_o : std_logic_vector (3 downto 0);
  signal n6011_o : std_logic_vector (3 downto 0);
  signal n6012_o : std_logic_vector (3 downto 0);
  signal n6013_o : std_logic_vector (3 downto 0);
  signal n6014_o : std_logic_vector (15 downto 0);
  signal n6015_o : std_logic_vector (8 downto 0);
  signal n6016_o : std_logic_vector (24 downto 0);
  signal n6017_o : std_logic_vector (23 downto 0);
  signal n6018_o : std_logic_vector (24 downto 0);
  signal n6019_o : std_logic_vector (24 downto 0);
  signal n6020_o : std_logic_vector (24 downto 0);
  signal n6035_o : std_logic_vector (42 downto 0);
  signal n6038_o : std_logic_vector (42 downto 0);
  signal n6050_o : std_logic_vector (42 downto 0);
  signal n6053_o : std_logic_vector (42 downto 0);
  signal n6070_o : std_logic_vector (43 downto 0);
  signal n6076_o : std_logic;
  signal n6077_o : std_logic;
  signal n6080_o : std_logic;
  signal n6081_o : std_logic;
  signal n6094_o : std_logic_vector (43 downto 0);
  signal n6100_o : std_logic;
  signal n6101_o : std_logic;
  signal n6104_o : std_logic;
  signal n6105_o : std_logic;
  signal n6118_o : std_logic_vector (43 downto 0);
  signal n6129_o : std_logic_vector (42 downto 0);
  signal n6130_o : std_logic;
  signal n6135_o : std_logic;
  signal n6136_o : std_logic;
  signal n6139_o : std_logic;
  signal n6140_o : std_logic;
  signal n6143_o : std_logic;
  signal n6144_o : std_logic;
  signal n6151_o : std_logic;
  signal n6157_o : std_logic;
  signal n6158_o : std_logic;
  signal n6159_o : std_logic;
  signal n6160_o : std_logic;
  signal n6161_o : std_logic;
  signal n6162_o : std_logic;
  signal n6163_o : std_logic;
  signal n6164_o : std_logic;
  signal n6165_o : std_logic;
  signal n6166_o : std_logic;
  signal n6167_o : std_logic;
  signal n6168_o : std_logic;
  signal n6169_o : std_logic;
  signal n6170_o : std_logic;
  signal n6171_o : std_logic;
  signal n6172_o : std_logic;
  signal n6173_o : std_logic;
  signal n6174_o : std_logic;
  signal n6175_o : std_logic;
  signal n6176_o : std_logic;
  signal n6177_o : std_logic;
  signal n6178_o : std_logic;
  signal n6179_o : std_logic;
  signal n6180_o : std_logic;
  signal n6181_o : std_logic;
  signal n6182_o : std_logic;
  signal n6183_o : std_logic;
  signal n6184_o : std_logic;
  signal n6185_o : std_logic;
  signal n6186_o : std_logic;
  signal n6187_o : std_logic;
  signal n6188_o : std_logic;
  signal n6189_o : std_logic;
  signal n6190_o : std_logic;
  signal n6191_o : std_logic;
  signal n6192_o : std_logic;
  signal n6193_o : std_logic;
  signal n6194_o : std_logic;
  signal n6195_o : std_logic;
  signal n6196_o : std_logic;
  signal n6197_o : std_logic;
  signal n6198_o : std_logic;
  signal n6199_o : std_logic;
  signal n6200_o : std_logic_vector (3 downto 0);
  signal n6201_o : std_logic_vector (3 downto 0);
  signal n6202_o : std_logic_vector (3 downto 0);
  signal n6203_o : std_logic_vector (3 downto 0);
  signal n6204_o : std_logic_vector (3 downto 0);
  signal n6205_o : std_logic_vector (3 downto 0);
  signal n6206_o : std_logic_vector (3 downto 0);
  signal n6207_o : std_logic_vector (3 downto 0);
  signal n6208_o : std_logic_vector (3 downto 0);
  signal n6209_o : std_logic_vector (3 downto 0);
  signal n6210_o : std_logic_vector (2 downto 0);
  signal n6211_o : std_logic_vector (15 downto 0);
  signal n6212_o : std_logic_vector (15 downto 0);
  signal n6213_o : std_logic_vector (10 downto 0);
  signal n6214_o : std_logic_vector (42 downto 0);
  signal n6215_o : std_logic_vector (41 downto 0);
  signal n6216_o : std_logic_vector (42 downto 0);
  signal n6217_o : std_logic_vector (42 downto 0);
  signal n6233_o : std_logic_vector (40 downto 0);
  signal n6234_o : std_logic;
  signal n6239_o : std_logic;
  signal n6240_o : std_logic;
  signal n6243_o : std_logic;
  signal n6244_o : std_logic;
  signal n6247_o : std_logic;
  signal n6248_o : std_logic;
  signal n6255_o : std_logic;
  signal n6259_o : std_logic;
  signal n6261_o : std_logic;
  signal n6262_o : std_logic;
  signal n6264_o : std_logic;
  signal n6270_o : std_logic;
  signal n6273_o : std_logic;
  signal n6275_o : std_logic;
  signal n6276_o : std_logic;
  signal n6277_o : std_logic;
  signal n6278_o : std_logic;
  signal n6279_o : std_logic;
  signal n6280_o : std_logic;
  signal n6281_o : std_logic;
  signal n6282_o : std_logic;
  signal n6283_o : std_logic;
  signal n6284_o : std_logic;
  signal n6285_o : std_logic;
  signal n6286_o : std_logic;
  signal n6287_o : std_logic;
  signal n6288_o : std_logic;
  signal n6289_o : std_logic;
  signal n6290_o : std_logic;
  signal n6291_o : std_logic;
  signal n6292_o : std_logic;
  signal n6293_o : std_logic;
  signal n6294_o : std_logic;
  signal n6295_o : std_logic;
  signal n6296_o : std_logic;
  signal n6297_o : std_logic;
  signal n6298_o : std_logic;
  signal n6299_o : std_logic;
  signal n6300_o : std_logic_vector (3 downto 0);
  signal n6301_o : std_logic_vector (3 downto 0);
  signal n6302_o : std_logic_vector (3 downto 0);
  signal n6303_o : std_logic_vector (3 downto 0);
  signal n6304_o : std_logic_vector (3 downto 0);
  signal n6305_o : std_logic_vector (3 downto 0);
  signal n6306_o : std_logic_vector (15 downto 0);
  signal n6307_o : std_logic_vector (8 downto 0);
  signal n6308_o : std_logic_vector (24 downto 0);
  signal n6309_o : std_logic_vector (23 downto 0);
  signal n6310_o : std_logic_vector (24 downto 0);
  signal n6311_o : std_logic_vector (24 downto 0);
  signal n6312_o : std_logic_vector (24 downto 0);
  signal n6315_o : std_logic;
  signal n6316_o : std_logic_vector (2 downto 0);
  signal n6317_o : std_logic_vector (24 downto 0);
  signal n6318_o : std_logic_vector (24 downto 0);
  signal n6319_o : std_logic_vector (24 downto 0);
  signal n6320_o : std_logic_vector (24 downto 0);
  signal n6348_o : std_logic;
  signal n6349_o : std_logic_vector (24 downto 0);
  signal n6350_q : std_logic_vector (24 downto 0);
  signal n6351_o : std_logic;
  signal n6352_o : std_logic_vector (24 downto 0);
  signal n6353_q : std_logic_vector (24 downto 0);
  signal n6354_q : std_logic_vector (24 downto 0);
  signal n6355_q : std_logic_vector (24 downto 0);
  signal n6371_o : std_logic_vector (22 downto 0);
  signal n6372_o : std_logic;
  signal n6377_o : std_logic;
  signal n6378_o : std_logic;
  signal n6381_o : std_logic;
  signal n6382_o : std_logic;
  signal n6385_o : std_logic;
  signal n6386_o : std_logic;
  signal n6393_o : std_logic;
  signal n6397_o : std_logic;
  signal n6399_o : std_logic;
  signal n6400_o : std_logic;
  signal n6402_o : std_logic;
  signal n6408_o : std_logic;
  signal n6411_o : std_logic;
  signal n6413_o : std_logic;
  signal n6414_o : std_logic;
  signal n6415_o : std_logic;
  signal n6416_o : std_logic;
  signal n6417_o : std_logic;
  signal n6418_o : std_logic;
  signal n6419_o : std_logic;
  signal n6420_o : std_logic;
  signal n6421_o : std_logic;
  signal n6422_o : std_logic;
  signal n6423_o : std_logic;
  signal n6424_o : std_logic;
  signal n6425_o : std_logic;
  signal n6426_o : std_logic;
  signal n6427_o : std_logic;
  signal n6428_o : std_logic;
  signal n6429_o : std_logic;
  signal n6430_o : std_logic;
  signal n6431_o : std_logic_vector (3 downto 0);
  signal n6432_o : std_logic_vector (3 downto 0);
  signal n6433_o : std_logic_vector (3 downto 0);
  signal n6434_o : std_logic_vector (3 downto 0);
  signal n6435_o : std_logic_vector (1 downto 0);
  signal n6436_o : std_logic_vector (15 downto 0);
  signal n6437_o : std_logic_vector (17 downto 0);
  signal n6438_o : std_logic_vector (16 downto 0);
  signal n6439_o : std_logic_vector (17 downto 0);
  signal n6440_o : std_logic_vector (17 downto 0);
  signal n6441_o : std_logic_vector (17 downto 0);
begin
  ready_o <= n5238_o;
  valid_o <= n5243_o;
  data_o <= n6441_o;
  -- ../BiquadFilter/BiquadFilter.vhd:26:12
  state_reg <= n5234_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:12
  x_reg <= n6350_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:19
  y_reg <= n6353_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:26
  w_reg <= n6354_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:33
  v_reg <= n6355_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:33:15
  -- n5212_o <= '1' when rising_edge (clk_i) else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:36:21
  n5214_o <= state_reg when valid_i = '0' else "01";
  -- ../BiquadFilter/BiquadFilter.vhd:35:17
  n5216_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:39:17
  n5218_o <= '1' when state_reg = "01" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:41:17
  n5220_o <= '1' when state_reg = "10" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:44:21
  n5222_o <= state_reg when ready_i = '0' else "00";
  -- ../BiquadFilter/BiquadFilter.vhd:43:17
  n5224_o <= '1' when state_reg = "11" else '0';
  -- ../fixed_pkg.vhd:183:17
  n5225_o <= n5224_o & n5220_o & n5218_o & n5216_o;
  -- ../BiquadFilter/BiquadFilter.vhd:34:13
  with n5225_o select n5229_o <=
    n5222_o when "1000",
    "11" when "0100",
    "10" when "0010",
    n5214_o when "0001",
    "XX" when others;
  -- ../BiquadFilter/BiquadFilter.vhd:33:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n5234_q <= "00";
    elsif rising_edge (clk_i) then
      n5234_q <= n5229_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:51:35
  n5237_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:51:20
  n5238_o <= '0' when n5237_o = '0' else '1';
  -- ../BiquadFilter/BiquadFilter.vhd:52:35
  n5242_o <= '1' when state_reg = "11" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:52:20
  n5243_o <= '0' when n5242_o = '0' else '1';
  -- ../BiquadFilter/BiquadFilter.vhd:59:15
  -- n5246_o <= '1' when rising_edge (clk_i) else '0';
  -- ../fixed_pkg.vhd:168:39
  n5262_o <= std_logic_vector (resize (signed (data_i), 20));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n5268_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n5269_o <= n5268_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n5270: postponed assert n5269_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n5272_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n5273_o <= n5272_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n5274: postponed assert n5273_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:170:18
  n5276_o <= n5275_o (4 downto 0);
  n5277_o <= n5262_o & n5276_o;
  -- ../BiquadFilter/BiquadFilter.vhd:62:21
  n5278_o <= x_reg when valid_i = '0' else n5277_o;
  -- ../BiquadFilter/BiquadFilter.vhd:61:17
  n5280_o <= '1' when state_reg = "00" else '0';
  -- ../fixed_pkg.vhd:266:100
  n5294_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n5297_o <= std_logic_vector (resize (signed (n5294_o) * signed'("0000000000000000000000000000000001001100000"), 43));
  -- ../fixed_pkg.vhd:168:39
  n5314_o <= std_logic_vector (resize (signed (n5297_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n5320_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n5321_o <= n5320_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n5322: postponed assert n5321_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n5324_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n5325_o <= n5324_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n5326: postponed assert n5325_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n5338_o <= std_logic_vector (resize (signed (w_reg), 28));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n5344_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n5345_o <= n5344_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n5346: postponed assert n5345_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n5348_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n5349_o <= n5348_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n5350: postponed assert n5349_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:24:14
  n5352_o <= n5351_o (15 downto 0);
  -- ../fixed_pkg.vhd:24:14
  n5353_o <= n5338_o & n5352_o;
  -- ../fixed_pkg.vhd:255:67
  n5364_o <= std_logic_vector (unsigned (n5314_o) + unsigned (n5353_o));
  -- ../fixed_pkg.vhd:168:39
  n5375_o <= n5364_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n5376_o <= n5364_o (43);
  -- ../fixed_pkg.vhd:173:9
  n5381_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n5382_o <= n5381_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n5383: postponed assert n5382_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n5385_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n5386_o <= n5385_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n5387: postponed assert n5386_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n5389_o <= n5364_o (42);
  -- ../fixed_pkg.vhd:183:27
  n5390_o <= '1' when n5389_o /= n5376_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n5397_o <= '0' when n5390_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n5403_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5404_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5405_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5406_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5407_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5408_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5409_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5410_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5411_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5412_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5413_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5414_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5415_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5416_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5417_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5418_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5419_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5420_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5421_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5422_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5423_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5424_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5425_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5426_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5427_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5428_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5429_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5430_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5431_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5432_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5433_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5434_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5435_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5436_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5437_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5438_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5439_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5440_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5441_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5442_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5443_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5444_o <= not n5376_o;
  -- ../fixed_pkg.vhd:194:31
  n5445_o <= not n5376_o;
  n5446_o <= n5403_o & n5404_o & n5405_o & n5406_o;
  -- ../fixed_pkg.vhd:169:40
  n5447_o <= n5407_o & n5408_o & n5409_o & n5410_o;
  -- ../fixed_pkg.vhd:9:14
  n5448_o <= n5411_o & n5412_o & n5413_o & n5414_o;
  -- ../fixed_pkg.vhd:9:14
  n5449_o <= n5415_o & n5416_o & n5417_o & n5418_o;
  n5450_o <= n5419_o & n5420_o & n5421_o & n5422_o;
  -- ../fixed_pkg.vhd:9:14
  n5451_o <= n5423_o & n5424_o & n5425_o & n5426_o;
  -- ../fixed_pkg.vhd:24:14
  n5452_o <= n5427_o & n5428_o & n5429_o & n5430_o;
  -- ../fixed_pkg.vhd:24:14
  n5453_o <= n5431_o & n5432_o & n5433_o & n5434_o;
  n5454_o <= n5435_o & n5436_o & n5437_o & n5438_o;
  -- ../fixed_pkg.vhd:24:14
  n5455_o <= n5439_o & n5440_o & n5441_o & n5442_o;
  n5456_o <= n5443_o & n5444_o & n5445_o;
  -- ../fixed_pkg.vhd:171:18
  n5457_o <= n5446_o & n5447_o & n5448_o & n5449_o;
  n5458_o <= n5450_o & n5451_o & n5452_o & n5453_o;
  -- ../fixed_pkg.vhd:170:18
  n5459_o <= n5454_o & n5455_o & n5456_o;
  n5460_o <= n5457_o & n5458_o & n5459_o;
  -- ../fixed_pkg.vhd:169:40
  n5461_o <= n5460_o (41 downto 0);
  -- ../fixed_pkg.vhd:9:14
  n5462_o <= n5376_o & n5461_o;
  -- ../fixed_pkg.vhd:193:9
  n5463_o <= n5375_o when n5397_o = '0' else n5462_o;
  -- ../fixed_pkg.vhd:168:39
  n5479_o <= n5463_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n5480_o <= n5463_o (42);
  -- ../fixed_pkg.vhd:173:9
  n5485_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n5486_o <= n5485_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n5487: postponed assert n5486_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n5489_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n5490_o <= n5489_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n5491: postponed assert n5490_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n5493_o <= n5463_o (41);
  -- ../fixed_pkg.vhd:183:27
  n5494_o <= '1' when n5493_o /= n5480_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n5501_o <= '0' when n5494_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n5505_o <= '1' when n5494_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n5507_o <= n5463_o (40);
  -- ../fixed_pkg.vhd:183:27
  n5508_o <= '1' when n5507_o /= n5480_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n5510_o <= n5501_o when n5519_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n5516_o <= n5508_o and n5505_o;
  -- ../fixed_pkg.vhd:183:17
  n5519_o <= n5505_o and n5516_o;
  -- ../fixed_pkg.vhd:194:31
  n5521_o <= not n5480_o;
  -- ../fixed_pkg.vhd:194:31
  n5522_o <= not n5480_o;
  -- ../fixed_pkg.vhd:194:31
  n5523_o <= not n5480_o;
  -- ../fixed_pkg.vhd:194:31
  n5524_o <= not n5480_o;
  -- ../fixed_pkg.vhd:194:31
  n5525_o <= not n5480_o;
  -- ../fixed_pkg.vhd:194:31
  n5526_o <= not n5480_o;
  -- ../fixed_pkg.vhd:194:31
  n5527_o <= not n5480_o;
  -- ../fixed_pkg.vhd:194:31
  n5528_o <= not n5480_o;
  -- ../fixed_pkg.vhd:194:31
  n5529_o <= not n5480_o;
  -- ../fixed_pkg.vhd:194:31
  n5530_o <= not n5480_o;
  -- ../fixed_pkg.vhd:194:31
  n5531_o <= not n5480_o;
  -- ../fixed_pkg.vhd:194:31
  n5532_o <= not n5480_o;
  -- ../fixed_pkg.vhd:194:31
  n5533_o <= not n5480_o;
  -- ../fixed_pkg.vhd:194:31
  n5534_o <= not n5480_o;
  -- ../fixed_pkg.vhd:194:31
  n5535_o <= not n5480_o;
  -- ../fixed_pkg.vhd:194:31
  n5536_o <= not n5480_o;
  -- ../fixed_pkg.vhd:194:31
  n5537_o <= not n5480_o;
  -- ../fixed_pkg.vhd:194:31
  n5538_o <= not n5480_o;
  -- ../fixed_pkg.vhd:194:31
  n5539_o <= not n5480_o;
  -- ../fixed_pkg.vhd:194:31
  n5540_o <= not n5480_o;
  -- ../fixed_pkg.vhd:194:31
  n5541_o <= not n5480_o;
  -- ../fixed_pkg.vhd:194:31
  n5542_o <= not n5480_o;
  -- ../fixed_pkg.vhd:194:31
  n5543_o <= not n5480_o;
  -- ../fixed_pkg.vhd:194:31
  n5544_o <= not n5480_o;
  -- ../fixed_pkg.vhd:194:31
  n5545_o <= not n5480_o;
  -- ../BiquadFilter/BiquadFilter.vhd:29:5
  n5546_o <= n5521_o & n5522_o & n5523_o & n5524_o;
  -- ../fixed_pkg.vhd:9:14
  n5547_o <= n5525_o & n5526_o & n5527_o & n5528_o;
  -- ../fixed_pkg.vhd:9:14
  n5548_o <= n5529_o & n5530_o & n5531_o & n5532_o;
  -- ../fixed_pkg.vhd:24:14
  n5549_o <= n5533_o & n5534_o & n5535_o & n5536_o;
  -- ../fixed_pkg.vhd:9:14
  n5550_o <= n5537_o & n5538_o & n5539_o & n5540_o;
  -- ../fixed_pkg.vhd:40:14
  n5551_o <= n5541_o & n5542_o & n5543_o & n5544_o;
  -- ../fixed_pkg.vhd:40:14
  n5552_o <= n5546_o & n5547_o & n5548_o & n5549_o;
  -- ../Vocoder/Vocoder_pkg.vhd:11:14
  n5553_o <= n5550_o & n5551_o & n5545_o;
  -- ../fixed_pkg.vhd:40:14
  n5554_o <= n5552_o & n5553_o;
  n5555_o <= n5554_o (23 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n5556_o <= n5479_o (40 downto 16);
  -- ../fixed_pkg.vhd:183:17
  n5557_o <= n5480_o & n5555_o;
  -- ../fixed_pkg.vhd:193:9
  n5558_o <= n5556_o when n5510_o = '0' else n5557_o;
  -- ../BiquadFilter/BiquadFilter.vhd:65:17
  n5561_o <= '1' when state_reg = "01" else '0';
  -- ../fixed_pkg.vhd:266:100
  n5576_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n5579_o <= std_logic_vector (resize (signed (n5576_o) * signed'("0000000000000000000000000000000000000000000"), 43));
  -- ../fixed_pkg.vhd:266:100
  n5591_o <= std_logic_vector (resize (signed (y_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n5594_o <= std_logic_vector (resize (signed (n5591_o) * signed'("0000000000011111111111111100000110110111101"), 43));
  -- ../fixed_pkg.vhd:168:39
  n5611_o <= std_logic_vector (resize (signed (n5579_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n5617_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n5618_o <= n5617_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n5619: postponed assert n5618_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n5621_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n5622_o <= n5621_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n5623: postponed assert n5622_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n5635_o <= std_logic_vector (resize (signed (n5594_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n5641_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n5642_o <= n5641_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n5643: postponed assert n5642_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n5645_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n5646_o <= n5645_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n5647: postponed assert n5646_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:240:67
  n5659_o <= std_logic_vector (unsigned (n5611_o) - unsigned (n5635_o));
  -- ../fixed_pkg.vhd:168:39
  n5670_o <= n5659_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n5671_o <= n5659_o (43);
  -- ../fixed_pkg.vhd:173:9
  n5676_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n5677_o <= n5676_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n5678: postponed assert n5677_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n5680_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n5681_o <= n5680_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n5682: postponed assert n5681_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n5684_o <= n5659_o (42);
  -- ../fixed_pkg.vhd:183:27
  n5685_o <= '1' when n5684_o /= n5671_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n5692_o <= '0' when n5685_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n5698_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5699_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5700_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5701_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5702_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5703_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5704_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5705_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5706_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5707_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5708_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5709_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5710_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5711_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5712_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5713_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5714_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5715_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5716_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5717_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5718_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5719_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5720_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5721_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5722_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5723_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5724_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5725_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5726_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5727_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5728_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5729_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5730_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5731_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5732_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5733_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5734_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5735_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5736_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5737_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5738_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5739_o <= not n5671_o;
  -- ../fixed_pkg.vhd:194:31
  n5740_o <= not n5671_o;
  n5741_o <= n5698_o & n5699_o & n5700_o & n5701_o;
  n5742_o <= n5702_o & n5703_o & n5704_o & n5705_o;
  n5743_o <= n5706_o & n5707_o & n5708_o & n5709_o;
  n5744_o <= n5710_o & n5711_o & n5712_o & n5713_o;
  n5745_o <= n5714_o & n5715_o & n5716_o & n5717_o;
  n5746_o <= n5718_o & n5719_o & n5720_o & n5721_o;
  n5747_o <= n5722_o & n5723_o & n5724_o & n5725_o;
  n5748_o <= n5726_o & n5727_o & n5728_o & n5729_o;
  n5749_o <= n5730_o & n5731_o & n5732_o & n5733_o;
  n5750_o <= n5734_o & n5735_o & n5736_o & n5737_o;
  n5751_o <= n5738_o & n5739_o & n5740_o;
  n5752_o <= n5741_o & n5742_o & n5743_o & n5744_o;
  n5753_o <= n5745_o & n5746_o & n5747_o & n5748_o;
  n5754_o <= n5749_o & n5750_o & n5751_o;
  n5755_o <= n5752_o & n5753_o & n5754_o;
  n5756_o <= n5755_o (41 downto 0);
  n5757_o <= n5671_o & n5756_o;
  -- ../fixed_pkg.vhd:193:9
  n5758_o <= n5670_o when n5692_o = '0' else n5757_o;
  -- ../fixed_pkg.vhd:168:39
  n5776_o <= std_logic_vector (resize (signed (n5758_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n5782_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n5783_o <= n5782_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n5784: postponed assert n5783_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n5786_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n5787_o <= n5786_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n5788: postponed assert n5787_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n5800_o <= std_logic_vector (resize (signed (v_reg), 28));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n5806_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n5807_o <= n5806_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n5808: postponed assert n5807_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n5810_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n5811_o <= n5810_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n5812: postponed assert n5811_o = '1' severity error; --  assert
  n5814_o <= n5813_o (15 downto 0);
  n5815_o <= n5800_o & n5814_o;
  -- ../fixed_pkg.vhd:255:67
  n5826_o <= std_logic_vector (unsigned (n5776_o) + unsigned (n5815_o));
  -- ../fixed_pkg.vhd:168:39
  n5837_o <= n5826_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n5838_o <= n5826_o (43);
  -- ../fixed_pkg.vhd:173:9
  n5843_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n5844_o <= n5843_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n5845: postponed assert n5844_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n5847_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n5848_o <= n5847_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n5849: postponed assert n5848_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n5851_o <= n5826_o (42);
  -- ../fixed_pkg.vhd:183:27
  n5852_o <= '1' when n5851_o /= n5838_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n5859_o <= '0' when n5852_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n5865_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5866_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5867_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5868_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5869_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5870_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5871_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5872_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5873_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5874_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5875_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5876_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5877_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5878_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5879_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5880_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5881_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5882_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5883_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5884_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5885_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5886_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5887_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5888_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5889_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5890_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5891_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5892_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5893_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5894_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5895_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5896_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5897_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5898_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5899_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5900_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5901_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5902_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5903_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5904_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5905_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5906_o <= not n5838_o;
  -- ../fixed_pkg.vhd:194:31
  n5907_o <= not n5838_o;
  n5908_o <= n5865_o & n5866_o & n5867_o & n5868_o;
  n5909_o <= n5869_o & n5870_o & n5871_o & n5872_o;
  n5910_o <= n5873_o & n5874_o & n5875_o & n5876_o;
  n5911_o <= n5877_o & n5878_o & n5879_o & n5880_o;
  n5912_o <= n5881_o & n5882_o & n5883_o & n5884_o;
  n5913_o <= n5885_o & n5886_o & n5887_o & n5888_o;
  n5914_o <= n5889_o & n5890_o & n5891_o & n5892_o;
  n5915_o <= n5893_o & n5894_o & n5895_o & n5896_o;
  n5916_o <= n5897_o & n5898_o & n5899_o & n5900_o;
  n5917_o <= n5901_o & n5902_o & n5903_o & n5904_o;
  n5918_o <= n5905_o & n5906_o & n5907_o;
  n5919_o <= n5908_o & n5909_o & n5910_o & n5911_o;
  n5920_o <= n5912_o & n5913_o & n5914_o & n5915_o;
  n5921_o <= n5916_o & n5917_o & n5918_o;
  n5922_o <= n5919_o & n5920_o & n5921_o;
  n5923_o <= n5922_o (41 downto 0);
  n5924_o <= n5838_o & n5923_o;
  -- ../fixed_pkg.vhd:193:9
  n5925_o <= n5837_o when n5859_o = '0' else n5924_o;
  -- ../fixed_pkg.vhd:168:39
  n5941_o <= n5925_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n5942_o <= n5925_o (42);
  -- ../fixed_pkg.vhd:173:9
  n5947_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n5948_o <= n5947_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n5949: postponed assert n5948_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n5951_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n5952_o <= n5951_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n5953: postponed assert n5952_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n5955_o <= n5925_o (41);
  -- ../fixed_pkg.vhd:183:27
  n5956_o <= '1' when n5955_o /= n5942_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n5963_o <= '0' when n5956_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n5967_o <= '1' when n5956_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n5969_o <= n5925_o (40);
  -- ../fixed_pkg.vhd:183:27
  n5970_o <= '1' when n5969_o /= n5942_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n5972_o <= n5963_o when n5981_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n5978_o <= n5970_o and n5967_o;
  -- ../fixed_pkg.vhd:183:17
  n5981_o <= n5967_o and n5978_o;
  -- ../fixed_pkg.vhd:194:31
  n5983_o <= not n5942_o;
  -- ../fixed_pkg.vhd:194:31
  n5984_o <= not n5942_o;
  -- ../fixed_pkg.vhd:194:31
  n5985_o <= not n5942_o;
  -- ../fixed_pkg.vhd:194:31
  n5986_o <= not n5942_o;
  -- ../fixed_pkg.vhd:194:31
  n5987_o <= not n5942_o;
  -- ../fixed_pkg.vhd:194:31
  n5988_o <= not n5942_o;
  -- ../fixed_pkg.vhd:194:31
  n5989_o <= not n5942_o;
  -- ../fixed_pkg.vhd:194:31
  n5990_o <= not n5942_o;
  -- ../fixed_pkg.vhd:194:31
  n5991_o <= not n5942_o;
  -- ../fixed_pkg.vhd:194:31
  n5992_o <= not n5942_o;
  -- ../fixed_pkg.vhd:194:31
  n5993_o <= not n5942_o;
  -- ../fixed_pkg.vhd:194:31
  n5994_o <= not n5942_o;
  -- ../fixed_pkg.vhd:194:31
  n5995_o <= not n5942_o;
  -- ../fixed_pkg.vhd:194:31
  n5996_o <= not n5942_o;
  -- ../fixed_pkg.vhd:194:31
  n5997_o <= not n5942_o;
  -- ../fixed_pkg.vhd:194:31
  n5998_o <= not n5942_o;
  -- ../fixed_pkg.vhd:194:31
  n5999_o <= not n5942_o;
  -- ../fixed_pkg.vhd:194:31
  n6000_o <= not n5942_o;
  -- ../fixed_pkg.vhd:194:31
  n6001_o <= not n5942_o;
  -- ../fixed_pkg.vhd:194:31
  n6002_o <= not n5942_o;
  -- ../fixed_pkg.vhd:194:31
  n6003_o <= not n5942_o;
  -- ../fixed_pkg.vhd:194:31
  n6004_o <= not n5942_o;
  -- ../fixed_pkg.vhd:194:31
  n6005_o <= not n5942_o;
  -- ../fixed_pkg.vhd:194:31
  n6006_o <= not n5942_o;
  -- ../fixed_pkg.vhd:194:31
  n6007_o <= not n5942_o;
  n6008_o <= n5983_o & n5984_o & n5985_o & n5986_o;
  n6009_o <= n5987_o & n5988_o & n5989_o & n5990_o;
  n6010_o <= n5991_o & n5992_o & n5993_o & n5994_o;
  n6011_o <= n5995_o & n5996_o & n5997_o & n5998_o;
  n6012_o <= n5999_o & n6000_o & n6001_o & n6002_o;
  n6013_o <= n6003_o & n6004_o & n6005_o & n6006_o;
  n6014_o <= n6008_o & n6009_o & n6010_o & n6011_o;
  n6015_o <= n6012_o & n6013_o & n6007_o;
  n6016_o <= n6014_o & n6015_o;
  n6017_o <= n6016_o (23 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n6018_o <= n5941_o (40 downto 16);
  n6019_o <= n5942_o & n6017_o;
  -- ../fixed_pkg.vhd:193:9
  n6020_o <= n6018_o when n5972_o = '0' else n6019_o;
  -- ../fixed_pkg.vhd:266:100
  n6035_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n6038_o <= std_logic_vector (resize (signed (n6035_o) * signed'("0000000000011111111111111111111110110100000"), 43));
  -- ../fixed_pkg.vhd:266:100
  n6050_o <= std_logic_vector (resize (signed (y_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n6053_o <= std_logic_vector (resize (signed (n6050_o) * signed'("0000000000000000000000000001111101100111111"), 43));
  -- ../fixed_pkg.vhd:168:39
  n6070_o <= std_logic_vector (resize (signed (n6038_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n6076_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n6077_o <= n6076_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n6078: postponed assert n6077_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n6080_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n6081_o <= n6080_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n6082: postponed assert n6081_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n6094_o <= std_logic_vector (resize (signed (n6053_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n6100_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n6101_o <= n6100_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n6102: postponed assert n6101_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n6104_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n6105_o <= n6104_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n6106: postponed assert n6105_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:240:67
  n6118_o <= std_logic_vector (unsigned (n6070_o) - unsigned (n6094_o));
  -- ../fixed_pkg.vhd:168:39
  n6129_o <= n6118_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n6130_o <= n6118_o (43);
  -- ../fixed_pkg.vhd:173:9
  n6135_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n6136_o <= n6135_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n6137: postponed assert n6136_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n6139_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n6140_o <= n6139_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n6141: postponed assert n6140_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n6143_o <= n6118_o (42);
  -- ../fixed_pkg.vhd:183:27
  n6144_o <= '1' when n6143_o /= n6130_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n6151_o <= '0' when n6144_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n6157_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6158_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6159_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6160_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6161_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6162_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6163_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6164_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6165_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6166_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6167_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6168_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6169_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6170_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6171_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6172_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6173_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6174_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6175_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6176_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6177_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6178_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6179_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6180_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6181_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6182_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6183_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6184_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6185_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6186_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6187_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6188_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6189_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6190_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6191_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6192_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6193_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6194_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6195_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6196_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6197_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6198_o <= not n6130_o;
  -- ../fixed_pkg.vhd:194:31
  n6199_o <= not n6130_o;
  n6200_o <= n6157_o & n6158_o & n6159_o & n6160_o;
  n6201_o <= n6161_o & n6162_o & n6163_o & n6164_o;
  n6202_o <= n6165_o & n6166_o & n6167_o & n6168_o;
  n6203_o <= n6169_o & n6170_o & n6171_o & n6172_o;
  n6204_o <= n6173_o & n6174_o & n6175_o & n6176_o;
  n6205_o <= n6177_o & n6178_o & n6179_o & n6180_o;
  n6206_o <= n6181_o & n6182_o & n6183_o & n6184_o;
  n6207_o <= n6185_o & n6186_o & n6187_o & n6188_o;
  n6208_o <= n6189_o & n6190_o & n6191_o & n6192_o;
  n6209_o <= n6193_o & n6194_o & n6195_o & n6196_o;
  n6210_o <= n6197_o & n6198_o & n6199_o;
  n6211_o <= n6200_o & n6201_o & n6202_o & n6203_o;
  n6212_o <= n6204_o & n6205_o & n6206_o & n6207_o;
  n6213_o <= n6208_o & n6209_o & n6210_o;
  n6214_o <= n6211_o & n6212_o & n6213_o;
  n6215_o <= n6214_o (41 downto 0);
  n6216_o <= n6130_o & n6215_o;
  -- ../fixed_pkg.vhd:193:9
  n6217_o <= n6129_o when n6151_o = '0' else n6216_o;
  -- ../fixed_pkg.vhd:168:39
  n6233_o <= n6217_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n6234_o <= n6217_o (42);
  -- ../fixed_pkg.vhd:173:9
  n6239_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n6240_o <= n6239_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n6241: postponed assert n6240_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n6243_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n6244_o <= n6243_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n6245: postponed assert n6244_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n6247_o <= n6217_o (41);
  -- ../fixed_pkg.vhd:183:27
  n6248_o <= '1' when n6247_o /= n6234_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n6255_o <= '0' when n6248_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n6259_o <= '1' when n6248_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n6261_o <= n6217_o (40);
  -- ../fixed_pkg.vhd:183:27
  n6262_o <= '1' when n6261_o /= n6234_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n6264_o <= n6255_o when n6273_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n6270_o <= n6262_o and n6259_o;
  -- ../fixed_pkg.vhd:183:17
  n6273_o <= n6259_o and n6270_o;
  -- ../fixed_pkg.vhd:194:31
  n6275_o <= not n6234_o;
  -- ../fixed_pkg.vhd:194:31
  n6276_o <= not n6234_o;
  -- ../fixed_pkg.vhd:194:31
  n6277_o <= not n6234_o;
  -- ../fixed_pkg.vhd:194:31
  n6278_o <= not n6234_o;
  -- ../fixed_pkg.vhd:194:31
  n6279_o <= not n6234_o;
  -- ../fixed_pkg.vhd:194:31
  n6280_o <= not n6234_o;
  -- ../fixed_pkg.vhd:194:31
  n6281_o <= not n6234_o;
  -- ../fixed_pkg.vhd:194:31
  n6282_o <= not n6234_o;
  -- ../fixed_pkg.vhd:194:31
  n6283_o <= not n6234_o;
  -- ../fixed_pkg.vhd:194:31
  n6284_o <= not n6234_o;
  -- ../fixed_pkg.vhd:194:31
  n6285_o <= not n6234_o;
  -- ../fixed_pkg.vhd:194:31
  n6286_o <= not n6234_o;
  -- ../fixed_pkg.vhd:194:31
  n6287_o <= not n6234_o;
  -- ../fixed_pkg.vhd:194:31
  n6288_o <= not n6234_o;
  -- ../fixed_pkg.vhd:194:31
  n6289_o <= not n6234_o;
  -- ../fixed_pkg.vhd:194:31
  n6290_o <= not n6234_o;
  -- ../fixed_pkg.vhd:194:31
  n6291_o <= not n6234_o;
  -- ../fixed_pkg.vhd:194:31
  n6292_o <= not n6234_o;
  -- ../fixed_pkg.vhd:194:31
  n6293_o <= not n6234_o;
  -- ../fixed_pkg.vhd:194:31
  n6294_o <= not n6234_o;
  -- ../fixed_pkg.vhd:194:31
  n6295_o <= not n6234_o;
  -- ../fixed_pkg.vhd:194:31
  n6296_o <= not n6234_o;
  -- ../fixed_pkg.vhd:194:31
  n6297_o <= not n6234_o;
  -- ../fixed_pkg.vhd:194:31
  n6298_o <= not n6234_o;
  -- ../fixed_pkg.vhd:194:31
  n6299_o <= not n6234_o;
  n6300_o <= n6275_o & n6276_o & n6277_o & n6278_o;
  n6301_o <= n6279_o & n6280_o & n6281_o & n6282_o;
  n6302_o <= n6283_o & n6284_o & n6285_o & n6286_o;
  n6303_o <= n6287_o & n6288_o & n6289_o & n6290_o;
  n6304_o <= n6291_o & n6292_o & n6293_o & n6294_o;
  n6305_o <= n6295_o & n6296_o & n6297_o & n6298_o;
  n6306_o <= n6300_o & n6301_o & n6302_o & n6303_o;
  n6307_o <= n6304_o & n6305_o & n6299_o;
  n6308_o <= n6306_o & n6307_o;
  n6309_o <= n6308_o (23 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n6310_o <= n6233_o (40 downto 16);
  n6311_o <= n6234_o & n6309_o;
  -- ../fixed_pkg.vhd:193:9
  n6312_o <= n6310_o when n6264_o = '0' else n6311_o;
  -- ../BiquadFilter/BiquadFilter.vhd:67:17
  n6315_o <= '1' when state_reg = "10" else '0';
  n6316_o <= n6315_o & n5561_o & n5280_o;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n6316_o select n6317_o <=
    x_reg when "100",
    x_reg when "010",
    n5278_o when "001",
    x_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n6316_o select n6318_o <=
    y_reg when "100",
    n5558_o when "010",
    y_reg when "001",
    y_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n6316_o select n6319_o <=
    n6020_o when "100",
    w_reg when "010",
    w_reg when "001",
    w_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n6316_o select n6320_o <=
    n6312_o when "100",
    v_reg when "010",
    v_reg when "001",
    v_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n6348_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n6349_o <= x_reg when n6348_o = '0' else n6317_o;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n6350_q <= n6349_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n6351_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n6352_o <= y_reg when n6351_o = '0' else n6318_o;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n6353_q <= n6352_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n6354_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n6354_q <= n6319_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n6355_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n6355_q <= n6320_o;
    end if;
  end process;
  -- ../fixed_pkg.vhd:168:39
  n6371_o <= y_reg (22 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n6372_o <= y_reg (24);
  -- ../fixed_pkg.vhd:173:9
  n6377_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n6378_o <= n6377_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n6379: postponed assert n6378_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n6381_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n6382_o <= n6381_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n6383: postponed assert n6382_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n6385_o <= y_reg (23);
  -- ../fixed_pkg.vhd:183:27
  n6386_o <= '1' when n6385_o /= n6372_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n6393_o <= '0' when n6386_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n6397_o <= '1' when n6386_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n6399_o <= y_reg (22);
  -- ../fixed_pkg.vhd:183:27
  n6400_o <= '1' when n6399_o /= n6372_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n6402_o <= n6393_o when n6411_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n6408_o <= n6400_o and n6397_o;
  -- ../fixed_pkg.vhd:183:17
  n6411_o <= n6397_o and n6408_o;
  -- ../fixed_pkg.vhd:194:31
  n6413_o <= not n6372_o;
  -- ../fixed_pkg.vhd:194:31
  n6414_o <= not n6372_o;
  -- ../fixed_pkg.vhd:194:31
  n6415_o <= not n6372_o;
  -- ../fixed_pkg.vhd:194:31
  n6416_o <= not n6372_o;
  -- ../fixed_pkg.vhd:194:31
  n6417_o <= not n6372_o;
  -- ../fixed_pkg.vhd:194:31
  n6418_o <= not n6372_o;
  -- ../fixed_pkg.vhd:194:31
  n6419_o <= not n6372_o;
  -- ../fixed_pkg.vhd:194:31
  n6420_o <= not n6372_o;
  -- ../fixed_pkg.vhd:194:31
  n6421_o <= not n6372_o;
  -- ../fixed_pkg.vhd:194:31
  n6422_o <= not n6372_o;
  -- ../fixed_pkg.vhd:194:31
  n6423_o <= not n6372_o;
  -- ../fixed_pkg.vhd:194:31
  n6424_o <= not n6372_o;
  -- ../fixed_pkg.vhd:194:31
  n6425_o <= not n6372_o;
  -- ../fixed_pkg.vhd:194:31
  n6426_o <= not n6372_o;
  -- ../fixed_pkg.vhd:194:31
  n6427_o <= not n6372_o;
  -- ../fixed_pkg.vhd:194:31
  n6428_o <= not n6372_o;
  -- ../fixed_pkg.vhd:194:31
  n6429_o <= not n6372_o;
  -- ../fixed_pkg.vhd:194:31
  n6430_o <= not n6372_o;
  n6431_o <= n6413_o & n6414_o & n6415_o & n6416_o;
  n6432_o <= n6417_o & n6418_o & n6419_o & n6420_o;
  n6433_o <= n6421_o & n6422_o & n6423_o & n6424_o;
  n6434_o <= n6425_o & n6426_o & n6427_o & n6428_o;
  n6435_o <= n6429_o & n6430_o;
  n6436_o <= n6431_o & n6432_o & n6433_o & n6434_o;
  n6437_o <= n6436_o & n6435_o;
  n6438_o <= n6437_o (16 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n6439_o <= n6371_o (22 downto 5);
  n6440_o <= n6372_o & n6438_o;
  -- ../fixed_pkg.vhd:193:9
  n6441_o <= n6439_o when n6402_o = '0' else n6440_o;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity biquadfilter_a8d8a4d0d0a0f8df06960275d213b2bd370e1dd4 is
  port (
    clk_i : in std_logic;
    reset_i : in std_logic;
    valid_i : in std_logic;
    data_i : in std_logic_vector (17 downto 0);
    ready_i : in std_logic;
    ready_o : out std_logic;
    valid_o : out std_logic;
    data_o : out std_logic_vector (17 downto 0));
end entity biquadfilter_a8d8a4d0d0a0f8df06960275d213b2bd370e1dd4;

architecture rtl of biquadfilter_a8d8a4d0d0a0f8df06960275d213b2bd370e1dd4 is
  signal state_reg : std_logic_vector (1 downto 0);
  signal x_reg : std_logic_vector (24 downto 0);
  signal y_reg : std_logic_vector (24 downto 0);
  signal w_reg : std_logic_vector (24 downto 0);
  signal v_reg : std_logic_vector (24 downto 0);
  signal n3976_o : std_logic;
  signal n3978_o : std_logic_vector (1 downto 0);
  signal n3980_o : std_logic;
  signal n3982_o : std_logic;
  signal n3984_o : std_logic;
  signal n3986_o : std_logic_vector (1 downto 0);
  signal n3988_o : std_logic;
  signal n3989_o : std_logic_vector (3 downto 0);
  signal n3993_o : std_logic_vector (1 downto 0);
  signal n3998_q : std_logic_vector (1 downto 0);
  signal n4001_o : std_logic;
  signal n4002_o : std_logic;
  signal n4006_o : std_logic;
  signal n4007_o : std_logic;
  signal n4010_o : std_logic;
  signal n4026_o : std_logic_vector (19 downto 0);
  signal n4032_o : std_logic;
  signal n4033_o : std_logic;
  signal n4036_o : std_logic;
  signal n4037_o : std_logic;
  constant n4039_o : std_logic_vector (24 downto 0) := "0000000000000000000000000";
  signal n4040_o : std_logic_vector (4 downto 0);
  signal n4041_o : std_logic_vector (24 downto 0);
  signal n4042_o : std_logic_vector (24 downto 0);
  signal n4044_o : std_logic;
  signal n4058_o : std_logic_vector (42 downto 0);
  signal n4061_o : std_logic_vector (42 downto 0);
  signal n4078_o : std_logic_vector (43 downto 0);
  signal n4084_o : std_logic;
  signal n4085_o : std_logic;
  signal n4088_o : std_logic;
  signal n4089_o : std_logic;
  signal n4102_o : std_logic_vector (27 downto 0);
  signal n4108_o : std_logic;
  signal n4109_o : std_logic;
  signal n4112_o : std_logic;
  signal n4113_o : std_logic;
  constant n4115_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n4116_o : std_logic_vector (15 downto 0);
  signal n4117_o : std_logic_vector (43 downto 0);
  signal n4128_o : std_logic_vector (43 downto 0);
  signal n4139_o : std_logic_vector (42 downto 0);
  signal n4140_o : std_logic;
  signal n4145_o : std_logic;
  signal n4146_o : std_logic;
  signal n4149_o : std_logic;
  signal n4150_o : std_logic;
  signal n4153_o : std_logic;
  signal n4154_o : std_logic;
  signal n4161_o : std_logic;
  signal n4167_o : std_logic;
  signal n4168_o : std_logic;
  signal n4169_o : std_logic;
  signal n4170_o : std_logic;
  signal n4171_o : std_logic;
  signal n4172_o : std_logic;
  signal n4173_o : std_logic;
  signal n4174_o : std_logic;
  signal n4175_o : std_logic;
  signal n4176_o : std_logic;
  signal n4177_o : std_logic;
  signal n4178_o : std_logic;
  signal n4179_o : std_logic;
  signal n4180_o : std_logic;
  signal n4181_o : std_logic;
  signal n4182_o : std_logic;
  signal n4183_o : std_logic;
  signal n4184_o : std_logic;
  signal n4185_o : std_logic;
  signal n4186_o : std_logic;
  signal n4187_o : std_logic;
  signal n4188_o : std_logic;
  signal n4189_o : std_logic;
  signal n4190_o : std_logic;
  signal n4191_o : std_logic;
  signal n4192_o : std_logic;
  signal n4193_o : std_logic;
  signal n4194_o : std_logic;
  signal n4195_o : std_logic;
  signal n4196_o : std_logic;
  signal n4197_o : std_logic;
  signal n4198_o : std_logic;
  signal n4199_o : std_logic;
  signal n4200_o : std_logic;
  signal n4201_o : std_logic;
  signal n4202_o : std_logic;
  signal n4203_o : std_logic;
  signal n4204_o : std_logic;
  signal n4205_o : std_logic;
  signal n4206_o : std_logic;
  signal n4207_o : std_logic;
  signal n4208_o : std_logic;
  signal n4209_o : std_logic;
  signal n4210_o : std_logic_vector (3 downto 0);
  signal n4211_o : std_logic_vector (3 downto 0);
  signal n4212_o : std_logic_vector (3 downto 0);
  signal n4213_o : std_logic_vector (3 downto 0);
  signal n4214_o : std_logic_vector (3 downto 0);
  signal n4215_o : std_logic_vector (3 downto 0);
  signal n4216_o : std_logic_vector (3 downto 0);
  signal n4217_o : std_logic_vector (3 downto 0);
  signal n4218_o : std_logic_vector (3 downto 0);
  signal n4219_o : std_logic_vector (3 downto 0);
  signal n4220_o : std_logic_vector (2 downto 0);
  signal n4221_o : std_logic_vector (15 downto 0);
  signal n4222_o : std_logic_vector (15 downto 0);
  signal n4223_o : std_logic_vector (10 downto 0);
  signal n4224_o : std_logic_vector (42 downto 0);
  signal n4225_o : std_logic_vector (41 downto 0);
  signal n4226_o : std_logic_vector (42 downto 0);
  signal n4227_o : std_logic_vector (42 downto 0);
  signal n4243_o : std_logic_vector (40 downto 0);
  signal n4244_o : std_logic;
  signal n4249_o : std_logic;
  signal n4250_o : std_logic;
  signal n4253_o : std_logic;
  signal n4254_o : std_logic;
  signal n4257_o : std_logic;
  signal n4258_o : std_logic;
  signal n4265_o : std_logic;
  signal n4269_o : std_logic;
  signal n4271_o : std_logic;
  signal n4272_o : std_logic;
  signal n4274_o : std_logic;
  signal n4280_o : std_logic;
  signal n4283_o : std_logic;
  signal n4285_o : std_logic;
  signal n4286_o : std_logic;
  signal n4287_o : std_logic;
  signal n4288_o : std_logic;
  signal n4289_o : std_logic;
  signal n4290_o : std_logic;
  signal n4291_o : std_logic;
  signal n4292_o : std_logic;
  signal n4293_o : std_logic;
  signal n4294_o : std_logic;
  signal n4295_o : std_logic;
  signal n4296_o : std_logic;
  signal n4297_o : std_logic;
  signal n4298_o : std_logic;
  signal n4299_o : std_logic;
  signal n4300_o : std_logic;
  signal n4301_o : std_logic;
  signal n4302_o : std_logic;
  signal n4303_o : std_logic;
  signal n4304_o : std_logic;
  signal n4305_o : std_logic;
  signal n4306_o : std_logic;
  signal n4307_o : std_logic;
  signal n4308_o : std_logic;
  signal n4309_o : std_logic;
  signal n4310_o : std_logic_vector (3 downto 0);
  signal n4311_o : std_logic_vector (3 downto 0);
  signal n4312_o : std_logic_vector (3 downto 0);
  signal n4313_o : std_logic_vector (3 downto 0);
  signal n4314_o : std_logic_vector (3 downto 0);
  signal n4315_o : std_logic_vector (3 downto 0);
  signal n4316_o : std_logic_vector (15 downto 0);
  signal n4317_o : std_logic_vector (8 downto 0);
  signal n4318_o : std_logic_vector (24 downto 0);
  signal n4319_o : std_logic_vector (23 downto 0);
  signal n4320_o : std_logic_vector (24 downto 0);
  signal n4321_o : std_logic_vector (24 downto 0);
  signal n4322_o : std_logic_vector (24 downto 0);
  signal n4325_o : std_logic;
  signal n4340_o : std_logic_vector (42 downto 0);
  signal n4343_o : std_logic_vector (42 downto 0);
  signal n4355_o : std_logic_vector (42 downto 0);
  signal n4358_o : std_logic_vector (42 downto 0);
  signal n4375_o : std_logic_vector (43 downto 0);
  signal n4381_o : std_logic;
  signal n4382_o : std_logic;
  signal n4385_o : std_logic;
  signal n4386_o : std_logic;
  signal n4399_o : std_logic_vector (43 downto 0);
  signal n4405_o : std_logic;
  signal n4406_o : std_logic;
  signal n4409_o : std_logic;
  signal n4410_o : std_logic;
  signal n4423_o : std_logic_vector (43 downto 0);
  signal n4434_o : std_logic_vector (42 downto 0);
  signal n4435_o : std_logic;
  signal n4440_o : std_logic;
  signal n4441_o : std_logic;
  signal n4444_o : std_logic;
  signal n4445_o : std_logic;
  signal n4448_o : std_logic;
  signal n4449_o : std_logic;
  signal n4456_o : std_logic;
  signal n4462_o : std_logic;
  signal n4463_o : std_logic;
  signal n4464_o : std_logic;
  signal n4465_o : std_logic;
  signal n4466_o : std_logic;
  signal n4467_o : std_logic;
  signal n4468_o : std_logic;
  signal n4469_o : std_logic;
  signal n4470_o : std_logic;
  signal n4471_o : std_logic;
  signal n4472_o : std_logic;
  signal n4473_o : std_logic;
  signal n4474_o : std_logic;
  signal n4475_o : std_logic;
  signal n4476_o : std_logic;
  signal n4477_o : std_logic;
  signal n4478_o : std_logic;
  signal n4479_o : std_logic;
  signal n4480_o : std_logic;
  signal n4481_o : std_logic;
  signal n4482_o : std_logic;
  signal n4483_o : std_logic;
  signal n4484_o : std_logic;
  signal n4485_o : std_logic;
  signal n4486_o : std_logic;
  signal n4487_o : std_logic;
  signal n4488_o : std_logic;
  signal n4489_o : std_logic;
  signal n4490_o : std_logic;
  signal n4491_o : std_logic;
  signal n4492_o : std_logic;
  signal n4493_o : std_logic;
  signal n4494_o : std_logic;
  signal n4495_o : std_logic;
  signal n4496_o : std_logic;
  signal n4497_o : std_logic;
  signal n4498_o : std_logic;
  signal n4499_o : std_logic;
  signal n4500_o : std_logic;
  signal n4501_o : std_logic;
  signal n4502_o : std_logic;
  signal n4503_o : std_logic;
  signal n4504_o : std_logic;
  signal n4505_o : std_logic_vector (3 downto 0);
  signal n4506_o : std_logic_vector (3 downto 0);
  signal n4507_o : std_logic_vector (3 downto 0);
  signal n4508_o : std_logic_vector (3 downto 0);
  signal n4509_o : std_logic_vector (3 downto 0);
  signal n4510_o : std_logic_vector (3 downto 0);
  signal n4511_o : std_logic_vector (3 downto 0);
  signal n4512_o : std_logic_vector (3 downto 0);
  signal n4513_o : std_logic_vector (3 downto 0);
  signal n4514_o : std_logic_vector (3 downto 0);
  signal n4515_o : std_logic_vector (2 downto 0);
  signal n4516_o : std_logic_vector (15 downto 0);
  signal n4517_o : std_logic_vector (15 downto 0);
  signal n4518_o : std_logic_vector (10 downto 0);
  signal n4519_o : std_logic_vector (42 downto 0);
  signal n4520_o : std_logic_vector (41 downto 0);
  signal n4521_o : std_logic_vector (42 downto 0);
  signal n4522_o : std_logic_vector (42 downto 0);
  signal n4540_o : std_logic_vector (43 downto 0);
  signal n4546_o : std_logic;
  signal n4547_o : std_logic;
  signal n4550_o : std_logic;
  signal n4551_o : std_logic;
  signal n4564_o : std_logic_vector (27 downto 0);
  signal n4570_o : std_logic;
  signal n4571_o : std_logic;
  signal n4574_o : std_logic;
  signal n4575_o : std_logic;
  constant n4577_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n4578_o : std_logic_vector (15 downto 0);
  signal n4579_o : std_logic_vector (43 downto 0);
  signal n4590_o : std_logic_vector (43 downto 0);
  signal n4601_o : std_logic_vector (42 downto 0);
  signal n4602_o : std_logic;
  signal n4607_o : std_logic;
  signal n4608_o : std_logic;
  signal n4611_o : std_logic;
  signal n4612_o : std_logic;
  signal n4615_o : std_logic;
  signal n4616_o : std_logic;
  signal n4623_o : std_logic;
  signal n4629_o : std_logic;
  signal n4630_o : std_logic;
  signal n4631_o : std_logic;
  signal n4632_o : std_logic;
  signal n4633_o : std_logic;
  signal n4634_o : std_logic;
  signal n4635_o : std_logic;
  signal n4636_o : std_logic;
  signal n4637_o : std_logic;
  signal n4638_o : std_logic;
  signal n4639_o : std_logic;
  signal n4640_o : std_logic;
  signal n4641_o : std_logic;
  signal n4642_o : std_logic;
  signal n4643_o : std_logic;
  signal n4644_o : std_logic;
  signal n4645_o : std_logic;
  signal n4646_o : std_logic;
  signal n4647_o : std_logic;
  signal n4648_o : std_logic;
  signal n4649_o : std_logic;
  signal n4650_o : std_logic;
  signal n4651_o : std_logic;
  signal n4652_o : std_logic;
  signal n4653_o : std_logic;
  signal n4654_o : std_logic;
  signal n4655_o : std_logic;
  signal n4656_o : std_logic;
  signal n4657_o : std_logic;
  signal n4658_o : std_logic;
  signal n4659_o : std_logic;
  signal n4660_o : std_logic;
  signal n4661_o : std_logic;
  signal n4662_o : std_logic;
  signal n4663_o : std_logic;
  signal n4664_o : std_logic;
  signal n4665_o : std_logic;
  signal n4666_o : std_logic;
  signal n4667_o : std_logic;
  signal n4668_o : std_logic;
  signal n4669_o : std_logic;
  signal n4670_o : std_logic;
  signal n4671_o : std_logic;
  signal n4672_o : std_logic_vector (3 downto 0);
  signal n4673_o : std_logic_vector (3 downto 0);
  signal n4674_o : std_logic_vector (3 downto 0);
  signal n4675_o : std_logic_vector (3 downto 0);
  signal n4676_o : std_logic_vector (3 downto 0);
  signal n4677_o : std_logic_vector (3 downto 0);
  signal n4678_o : std_logic_vector (3 downto 0);
  signal n4679_o : std_logic_vector (3 downto 0);
  signal n4680_o : std_logic_vector (3 downto 0);
  signal n4681_o : std_logic_vector (3 downto 0);
  signal n4682_o : std_logic_vector (2 downto 0);
  signal n4683_o : std_logic_vector (15 downto 0);
  signal n4684_o : std_logic_vector (15 downto 0);
  signal n4685_o : std_logic_vector (10 downto 0);
  signal n4686_o : std_logic_vector (42 downto 0);
  signal n4687_o : std_logic_vector (41 downto 0);
  signal n4688_o : std_logic_vector (42 downto 0);
  signal n4689_o : std_logic_vector (42 downto 0);
  signal n4705_o : std_logic_vector (40 downto 0);
  signal n4706_o : std_logic;
  signal n4711_o : std_logic;
  signal n4712_o : std_logic;
  signal n4715_o : std_logic;
  signal n4716_o : std_logic;
  signal n4719_o : std_logic;
  signal n4720_o : std_logic;
  signal n4727_o : std_logic;
  signal n4731_o : std_logic;
  signal n4733_o : std_logic;
  signal n4734_o : std_logic;
  signal n4736_o : std_logic;
  signal n4742_o : std_logic;
  signal n4745_o : std_logic;
  signal n4747_o : std_logic;
  signal n4748_o : std_logic;
  signal n4749_o : std_logic;
  signal n4750_o : std_logic;
  signal n4751_o : std_logic;
  signal n4752_o : std_logic;
  signal n4753_o : std_logic;
  signal n4754_o : std_logic;
  signal n4755_o : std_logic;
  signal n4756_o : std_logic;
  signal n4757_o : std_logic;
  signal n4758_o : std_logic;
  signal n4759_o : std_logic;
  signal n4760_o : std_logic;
  signal n4761_o : std_logic;
  signal n4762_o : std_logic;
  signal n4763_o : std_logic;
  signal n4764_o : std_logic;
  signal n4765_o : std_logic;
  signal n4766_o : std_logic;
  signal n4767_o : std_logic;
  signal n4768_o : std_logic;
  signal n4769_o : std_logic;
  signal n4770_o : std_logic;
  signal n4771_o : std_logic;
  signal n4772_o : std_logic_vector (3 downto 0);
  signal n4773_o : std_logic_vector (3 downto 0);
  signal n4774_o : std_logic_vector (3 downto 0);
  signal n4775_o : std_logic_vector (3 downto 0);
  signal n4776_o : std_logic_vector (3 downto 0);
  signal n4777_o : std_logic_vector (3 downto 0);
  signal n4778_o : std_logic_vector (15 downto 0);
  signal n4779_o : std_logic_vector (8 downto 0);
  signal n4780_o : std_logic_vector (24 downto 0);
  signal n4781_o : std_logic_vector (23 downto 0);
  signal n4782_o : std_logic_vector (24 downto 0);
  signal n4783_o : std_logic_vector (24 downto 0);
  signal n4784_o : std_logic_vector (24 downto 0);
  signal n4799_o : std_logic_vector (42 downto 0);
  signal n4802_o : std_logic_vector (42 downto 0);
  signal n4814_o : std_logic_vector (42 downto 0);
  signal n4817_o : std_logic_vector (42 downto 0);
  signal n4834_o : std_logic_vector (43 downto 0);
  signal n4840_o : std_logic;
  signal n4841_o : std_logic;
  signal n4844_o : std_logic;
  signal n4845_o : std_logic;
  signal n4858_o : std_logic_vector (43 downto 0);
  signal n4864_o : std_logic;
  signal n4865_o : std_logic;
  signal n4868_o : std_logic;
  signal n4869_o : std_logic;
  signal n4882_o : std_logic_vector (43 downto 0);
  signal n4893_o : std_logic_vector (42 downto 0);
  signal n4894_o : std_logic;
  signal n4899_o : std_logic;
  signal n4900_o : std_logic;
  signal n4903_o : std_logic;
  signal n4904_o : std_logic;
  signal n4907_o : std_logic;
  signal n4908_o : std_logic;
  signal n4915_o : std_logic;
  signal n4921_o : std_logic;
  signal n4922_o : std_logic;
  signal n4923_o : std_logic;
  signal n4924_o : std_logic;
  signal n4925_o : std_logic;
  signal n4926_o : std_logic;
  signal n4927_o : std_logic;
  signal n4928_o : std_logic;
  signal n4929_o : std_logic;
  signal n4930_o : std_logic;
  signal n4931_o : std_logic;
  signal n4932_o : std_logic;
  signal n4933_o : std_logic;
  signal n4934_o : std_logic;
  signal n4935_o : std_logic;
  signal n4936_o : std_logic;
  signal n4937_o : std_logic;
  signal n4938_o : std_logic;
  signal n4939_o : std_logic;
  signal n4940_o : std_logic;
  signal n4941_o : std_logic;
  signal n4942_o : std_logic;
  signal n4943_o : std_logic;
  signal n4944_o : std_logic;
  signal n4945_o : std_logic;
  signal n4946_o : std_logic;
  signal n4947_o : std_logic;
  signal n4948_o : std_logic;
  signal n4949_o : std_logic;
  signal n4950_o : std_logic;
  signal n4951_o : std_logic;
  signal n4952_o : std_logic;
  signal n4953_o : std_logic;
  signal n4954_o : std_logic;
  signal n4955_o : std_logic;
  signal n4956_o : std_logic;
  signal n4957_o : std_logic;
  signal n4958_o : std_logic;
  signal n4959_o : std_logic;
  signal n4960_o : std_logic;
  signal n4961_o : std_logic;
  signal n4962_o : std_logic;
  signal n4963_o : std_logic;
  signal n4964_o : std_logic_vector (3 downto 0);
  signal n4965_o : std_logic_vector (3 downto 0);
  signal n4966_o : std_logic_vector (3 downto 0);
  signal n4967_o : std_logic_vector (3 downto 0);
  signal n4968_o : std_logic_vector (3 downto 0);
  signal n4969_o : std_logic_vector (3 downto 0);
  signal n4970_o : std_logic_vector (3 downto 0);
  signal n4971_o : std_logic_vector (3 downto 0);
  signal n4972_o : std_logic_vector (3 downto 0);
  signal n4973_o : std_logic_vector (3 downto 0);
  signal n4974_o : std_logic_vector (2 downto 0);
  signal n4975_o : std_logic_vector (15 downto 0);
  signal n4976_o : std_logic_vector (15 downto 0);
  signal n4977_o : std_logic_vector (10 downto 0);
  signal n4978_o : std_logic_vector (42 downto 0);
  signal n4979_o : std_logic_vector (41 downto 0);
  signal n4980_o : std_logic_vector (42 downto 0);
  signal n4981_o : std_logic_vector (42 downto 0);
  signal n4997_o : std_logic_vector (40 downto 0);
  signal n4998_o : std_logic;
  signal n5003_o : std_logic;
  signal n5004_o : std_logic;
  signal n5007_o : std_logic;
  signal n5008_o : std_logic;
  signal n5011_o : std_logic;
  signal n5012_o : std_logic;
  signal n5019_o : std_logic;
  signal n5023_o : std_logic;
  signal n5025_o : std_logic;
  signal n5026_o : std_logic;
  signal n5028_o : std_logic;
  signal n5034_o : std_logic;
  signal n5037_o : std_logic;
  signal n5039_o : std_logic;
  signal n5040_o : std_logic;
  signal n5041_o : std_logic;
  signal n5042_o : std_logic;
  signal n5043_o : std_logic;
  signal n5044_o : std_logic;
  signal n5045_o : std_logic;
  signal n5046_o : std_logic;
  signal n5047_o : std_logic;
  signal n5048_o : std_logic;
  signal n5049_o : std_logic;
  signal n5050_o : std_logic;
  signal n5051_o : std_logic;
  signal n5052_o : std_logic;
  signal n5053_o : std_logic;
  signal n5054_o : std_logic;
  signal n5055_o : std_logic;
  signal n5056_o : std_logic;
  signal n5057_o : std_logic;
  signal n5058_o : std_logic;
  signal n5059_o : std_logic;
  signal n5060_o : std_logic;
  signal n5061_o : std_logic;
  signal n5062_o : std_logic;
  signal n5063_o : std_logic;
  signal n5064_o : std_logic_vector (3 downto 0);
  signal n5065_o : std_logic_vector (3 downto 0);
  signal n5066_o : std_logic_vector (3 downto 0);
  signal n5067_o : std_logic_vector (3 downto 0);
  signal n5068_o : std_logic_vector (3 downto 0);
  signal n5069_o : std_logic_vector (3 downto 0);
  signal n5070_o : std_logic_vector (15 downto 0);
  signal n5071_o : std_logic_vector (8 downto 0);
  signal n5072_o : std_logic_vector (24 downto 0);
  signal n5073_o : std_logic_vector (23 downto 0);
  signal n5074_o : std_logic_vector (24 downto 0);
  signal n5075_o : std_logic_vector (24 downto 0);
  signal n5076_o : std_logic_vector (24 downto 0);
  signal n5079_o : std_logic;
  signal n5080_o : std_logic_vector (2 downto 0);
  signal n5081_o : std_logic_vector (24 downto 0);
  signal n5082_o : std_logic_vector (24 downto 0);
  signal n5083_o : std_logic_vector (24 downto 0);
  signal n5084_o : std_logic_vector (24 downto 0);
  signal n5112_o : std_logic;
  signal n5113_o : std_logic_vector (24 downto 0);
  signal n5114_q : std_logic_vector (24 downto 0);
  signal n5115_o : std_logic;
  signal n5116_o : std_logic_vector (24 downto 0);
  signal n5117_q : std_logic_vector (24 downto 0);
  signal n5118_q : std_logic_vector (24 downto 0);
  signal n5119_q : std_logic_vector (24 downto 0);
  signal n5135_o : std_logic_vector (22 downto 0);
  signal n5136_o : std_logic;
  signal n5141_o : std_logic;
  signal n5142_o : std_logic;
  signal n5145_o : std_logic;
  signal n5146_o : std_logic;
  signal n5149_o : std_logic;
  signal n5150_o : std_logic;
  signal n5157_o : std_logic;
  signal n5161_o : std_logic;
  signal n5163_o : std_logic;
  signal n5164_o : std_logic;
  signal n5166_o : std_logic;
  signal n5172_o : std_logic;
  signal n5175_o : std_logic;
  signal n5177_o : std_logic;
  signal n5178_o : std_logic;
  signal n5179_o : std_logic;
  signal n5180_o : std_logic;
  signal n5181_o : std_logic;
  signal n5182_o : std_logic;
  signal n5183_o : std_logic;
  signal n5184_o : std_logic;
  signal n5185_o : std_logic;
  signal n5186_o : std_logic;
  signal n5187_o : std_logic;
  signal n5188_o : std_logic;
  signal n5189_o : std_logic;
  signal n5190_o : std_logic;
  signal n5191_o : std_logic;
  signal n5192_o : std_logic;
  signal n5193_o : std_logic;
  signal n5194_o : std_logic;
  signal n5195_o : std_logic_vector (3 downto 0);
  signal n5196_o : std_logic_vector (3 downto 0);
  signal n5197_o : std_logic_vector (3 downto 0);
  signal n5198_o : std_logic_vector (3 downto 0);
  signal n5199_o : std_logic_vector (1 downto 0);
  signal n5200_o : std_logic_vector (15 downto 0);
  signal n5201_o : std_logic_vector (17 downto 0);
  signal n5202_o : std_logic_vector (16 downto 0);
  signal n5203_o : std_logic_vector (17 downto 0);
  signal n5204_o : std_logic_vector (17 downto 0);
  signal n5205_o : std_logic_vector (17 downto 0);
begin
  ready_o <= n4002_o;
  valid_o <= n4007_o;
  data_o <= n5205_o;
  -- ../BiquadFilter/BiquadFilter.vhd:26:12
  state_reg <= n3998_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:12
  x_reg <= n5114_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:19
  y_reg <= n5117_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:26
  w_reg <= n5118_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:33
  v_reg <= n5119_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:33:15
  -- n3976_o <= '1' when rising_edge (clk_i) else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:36:21
  n3978_o <= state_reg when valid_i = '0' else "01";
  -- ../BiquadFilter/BiquadFilter.vhd:35:17
  n3980_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:39:17
  n3982_o <= '1' when state_reg = "01" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:41:17
  n3984_o <= '1' when state_reg = "10" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:44:21
  n3986_o <= state_reg when ready_i = '0' else "00";
  -- ../BiquadFilter/BiquadFilter.vhd:43:17
  n3988_o <= '1' when state_reg = "11" else '0';
  -- ../fixed_pkg.vhd:24:14
  n3989_o <= n3988_o & n3984_o & n3982_o & n3980_o;
  -- ../BiquadFilter/BiquadFilter.vhd:34:13
  with n3989_o select n3993_o <=
    n3986_o when "1000",
    "11" when "0100",
    "10" when "0010",
    n3978_o when "0001",
    "XX" when others;
  -- ../BiquadFilter/BiquadFilter.vhd:33:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n3998_q <= "00";
    elsif rising_edge (clk_i) then
      n3998_q <= n3993_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:51:35
  n4001_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:51:20
  n4002_o <= '0' when n4001_o = '0' else '1';
  -- ../BiquadFilter/BiquadFilter.vhd:52:35
  n4006_o <= '1' when state_reg = "11" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:52:20
  n4007_o <= '0' when n4006_o = '0' else '1';
  -- ../BiquadFilter/BiquadFilter.vhd:59:15
  -- n4010_o <= '1' when rising_edge (clk_i) else '0';
  -- ../fixed_pkg.vhd:168:39
  n4026_o <= std_logic_vector (resize (signed (data_i), 20));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n4032_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n4033_o <= n4032_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n4034: postponed assert n4033_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n4036_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n4037_o <= n4036_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n4038: postponed assert n4037_o = '1' severity error; --  assert
  n4040_o <= n4039_o (4 downto 0);
  -- ../fixed_pkg.vhd:183:17
  n4041_o <= n4026_o & n4040_o;
  -- ../BiquadFilter/BiquadFilter.vhd:62:21
  n4042_o <= x_reg when valid_i = '0' else n4041_o;
  -- ../BiquadFilter/BiquadFilter.vhd:61:17
  n4044_o <= '1' when state_reg = "00" else '0';
  -- ../fixed_pkg.vhd:266:100
  n4058_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n4061_o <= std_logic_vector (resize (signed (n4058_o) * signed'("0000000000000000000000000000000000110011000"), 43));
  -- ../fixed_pkg.vhd:168:39
  n4078_o <= std_logic_vector (resize (signed (n4061_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n4084_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n4085_o <= n4084_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n4086: postponed assert n4085_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n4088_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n4089_o <= n4088_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n4090: postponed assert n4089_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n4102_o <= std_logic_vector (resize (signed (w_reg), 28));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n4108_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n4109_o <= n4108_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n4110: postponed assert n4109_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n4112_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n4113_o <= n4112_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n4114: postponed assert n4113_o = '1' severity error; --  assert
  n4116_o <= n4115_o (15 downto 0);
  -- ../fixed_pkg.vhd:169:40
  n4117_o <= n4102_o & n4116_o;
  -- ../fixed_pkg.vhd:255:67
  n4128_o <= std_logic_vector (unsigned (n4078_o) + unsigned (n4117_o));
  -- ../fixed_pkg.vhd:168:39
  n4139_o <= n4128_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n4140_o <= n4128_o (43);
  -- ../fixed_pkg.vhd:173:9
  n4145_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n4146_o <= n4145_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n4147: postponed assert n4146_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n4149_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n4150_o <= n4149_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n4151: postponed assert n4150_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n4153_o <= n4128_o (42);
  -- ../fixed_pkg.vhd:183:27
  n4154_o <= '1' when n4153_o /= n4140_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n4161_o <= '0' when n4154_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n4167_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4168_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4169_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4170_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4171_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4172_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4173_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4174_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4175_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4176_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4177_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4178_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4179_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4180_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4181_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4182_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4183_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4184_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4185_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4186_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4187_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4188_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4189_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4190_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4191_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4192_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4193_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4194_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4195_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4196_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4197_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4198_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4199_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4200_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4201_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4202_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4203_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4204_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4205_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4206_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4207_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4208_o <= not n4140_o;
  -- ../fixed_pkg.vhd:194:31
  n4209_o <= not n4140_o;
  -- ../fixed_pkg.vhd:40:14
  n4210_o <= n4167_o & n4168_o & n4169_o & n4170_o;
  -- ../fixed_pkg.vhd:25:14
  n4211_o <= n4171_o & n4172_o & n4173_o & n4174_o;
  -- ../fixed_pkg.vhd:40:14
  n4212_o <= n4175_o & n4176_o & n4177_o & n4178_o;
  -- ../fixed_pkg.vhd:183:17
  n4213_o <= n4179_o & n4180_o & n4181_o & n4182_o;
  -- ../fixed_pkg.vhd:183:17
  n4214_o <= n4183_o & n4184_o & n4185_o & n4186_o;
  -- ../fixed_pkg.vhd:183:17
  n4215_o <= n4187_o & n4188_o & n4189_o & n4190_o;
  -- ../fixed_pkg.vhd:183:17
  n4216_o <= n4191_o & n4192_o & n4193_o & n4194_o;
  -- ../fixed_pkg.vhd:183:17
  n4217_o <= n4195_o & n4196_o & n4197_o & n4198_o;
  -- ../fixed_pkg.vhd:183:17
  n4218_o <= n4199_o & n4200_o & n4201_o & n4202_o;
  -- ../fixed_pkg.vhd:183:17
  n4219_o <= n4203_o & n4204_o & n4205_o & n4206_o;
  -- ../fixed_pkg.vhd:183:17
  n4220_o <= n4207_o & n4208_o & n4209_o;
  -- ../fixed_pkg.vhd:9:14
  n4221_o <= n4210_o & n4211_o & n4212_o & n4213_o;
  -- ../fixed_pkg.vhd:171:18
  n4222_o <= n4214_o & n4215_o & n4216_o & n4217_o;
  -- ../fixed_pkg.vhd:9:14
  n4223_o <= n4218_o & n4219_o & n4220_o;
  -- ../fixed_pkg.vhd:9:14
  n4224_o <= n4221_o & n4222_o & n4223_o;
  -- ../fixed_pkg.vhd:183:17
  n4225_o <= n4224_o (41 downto 0);
  -- ../fixed_pkg.vhd:24:14
  n4226_o <= n4140_o & n4225_o;
  -- ../fixed_pkg.vhd:193:9
  n4227_o <= n4139_o when n4161_o = '0' else n4226_o;
  -- ../fixed_pkg.vhd:168:39
  n4243_o <= n4227_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n4244_o <= n4227_o (42);
  -- ../fixed_pkg.vhd:173:9
  n4249_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n4250_o <= n4249_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n4251: postponed assert n4250_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n4253_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n4254_o <= n4253_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n4255: postponed assert n4254_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n4257_o <= n4227_o (41);
  -- ../fixed_pkg.vhd:183:27
  n4258_o <= '1' when n4257_o /= n4244_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n4265_o <= '0' when n4258_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n4269_o <= '1' when n4258_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n4271_o <= n4227_o (40);
  -- ../fixed_pkg.vhd:183:27
  n4272_o <= '1' when n4271_o /= n4244_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n4274_o <= n4265_o when n4283_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n4280_o <= n4272_o and n4269_o;
  -- ../fixed_pkg.vhd:183:17
  n4283_o <= n4269_o and n4280_o;
  -- ../fixed_pkg.vhd:194:31
  n4285_o <= not n4244_o;
  -- ../fixed_pkg.vhd:194:31
  n4286_o <= not n4244_o;
  -- ../fixed_pkg.vhd:194:31
  n4287_o <= not n4244_o;
  -- ../fixed_pkg.vhd:194:31
  n4288_o <= not n4244_o;
  -- ../fixed_pkg.vhd:194:31
  n4289_o <= not n4244_o;
  -- ../fixed_pkg.vhd:194:31
  n4290_o <= not n4244_o;
  -- ../fixed_pkg.vhd:194:31
  n4291_o <= not n4244_o;
  -- ../fixed_pkg.vhd:194:31
  n4292_o <= not n4244_o;
  -- ../fixed_pkg.vhd:194:31
  n4293_o <= not n4244_o;
  -- ../fixed_pkg.vhd:194:31
  n4294_o <= not n4244_o;
  -- ../fixed_pkg.vhd:194:31
  n4295_o <= not n4244_o;
  -- ../fixed_pkg.vhd:194:31
  n4296_o <= not n4244_o;
  -- ../fixed_pkg.vhd:194:31
  n4297_o <= not n4244_o;
  -- ../fixed_pkg.vhd:194:31
  n4298_o <= not n4244_o;
  -- ../fixed_pkg.vhd:194:31
  n4299_o <= not n4244_o;
  -- ../fixed_pkg.vhd:194:31
  n4300_o <= not n4244_o;
  -- ../fixed_pkg.vhd:194:31
  n4301_o <= not n4244_o;
  -- ../fixed_pkg.vhd:194:31
  n4302_o <= not n4244_o;
  -- ../fixed_pkg.vhd:194:31
  n4303_o <= not n4244_o;
  -- ../fixed_pkg.vhd:194:31
  n4304_o <= not n4244_o;
  -- ../fixed_pkg.vhd:194:31
  n4305_o <= not n4244_o;
  -- ../fixed_pkg.vhd:194:31
  n4306_o <= not n4244_o;
  -- ../fixed_pkg.vhd:194:31
  n4307_o <= not n4244_o;
  -- ../fixed_pkg.vhd:194:31
  n4308_o <= not n4244_o;
  -- ../fixed_pkg.vhd:194:31
  n4309_o <= not n4244_o;
  -- ../Vocoder/Vocoder_pkg.vhd:14:14
  n4310_o <= n4285_o & n4286_o & n4287_o & n4288_o;
  -- ../fixed_pkg.vhd:9:14
  n4311_o <= n4289_o & n4290_o & n4291_o & n4292_o;
  -- ../fixed_pkg.vhd:40:14
  n4312_o <= n4293_o & n4294_o & n4295_o & n4296_o;
  -- ../fixed_pkg.vhd:40:14
  n4313_o <= n4297_o & n4298_o & n4299_o & n4300_o;
  -- ../fixed_pkg.vhd:24:14
  n4314_o <= n4301_o & n4302_o & n4303_o & n4304_o;
  -- ../fixed_pkg.vhd:40:14
  n4315_o <= n4305_o & n4306_o & n4307_o & n4308_o;
  -- ../fixed_pkg.vhd:171:18
  n4316_o <= n4310_o & n4311_o & n4312_o & n4313_o;
  n4317_o <= n4314_o & n4315_o & n4309_o;
  -- ../fixed_pkg.vhd:170:18
  n4318_o <= n4316_o & n4317_o;
  -- ../fixed_pkg.vhd:183:17
  n4319_o <= n4318_o (23 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n4320_o <= n4243_o (40 downto 16);
  -- ../fixed_pkg.vhd:9:14
  n4321_o <= n4244_o & n4319_o;
  -- ../fixed_pkg.vhd:193:9
  n4322_o <= n4320_o when n4274_o = '0' else n4321_o;
  -- ../BiquadFilter/BiquadFilter.vhd:65:17
  n4325_o <= '1' when state_reg = "01" else '0';
  -- ../fixed_pkg.vhd:266:100
  n4340_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n4343_o <= std_logic_vector (resize (signed (n4340_o) * signed'("0000000000000000000000000000000000000000000"), 43));
  -- ../fixed_pkg.vhd:266:100
  n4355_o <= std_logic_vector (resize (signed (y_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n4358_o <= std_logic_vector (resize (signed (n4355_o) * signed'("0000000000011111111111111100000011100110011"), 43));
  -- ../fixed_pkg.vhd:168:39
  n4375_o <= std_logic_vector (resize (signed (n4343_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n4381_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n4382_o <= n4381_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n4383: postponed assert n4382_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n4385_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n4386_o <= n4385_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n4387: postponed assert n4386_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n4399_o <= std_logic_vector (resize (signed (n4358_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n4405_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n4406_o <= n4405_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n4407: postponed assert n4406_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n4409_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n4410_o <= n4409_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n4411: postponed assert n4410_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:240:67
  n4423_o <= std_logic_vector (unsigned (n4375_o) - unsigned (n4399_o));
  -- ../fixed_pkg.vhd:168:39
  n4434_o <= n4423_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n4435_o <= n4423_o (43);
  -- ../fixed_pkg.vhd:173:9
  n4440_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n4441_o <= n4440_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n4442: postponed assert n4441_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n4444_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n4445_o <= n4444_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n4446: postponed assert n4445_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n4448_o <= n4423_o (42);
  -- ../fixed_pkg.vhd:183:27
  n4449_o <= '1' when n4448_o /= n4435_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n4456_o <= '0' when n4449_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n4462_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4463_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4464_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4465_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4466_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4467_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4468_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4469_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4470_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4471_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4472_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4473_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4474_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4475_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4476_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4477_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4478_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4479_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4480_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4481_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4482_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4483_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4484_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4485_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4486_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4487_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4488_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4489_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4490_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4491_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4492_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4493_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4494_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4495_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4496_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4497_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4498_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4499_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4500_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4501_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4502_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4503_o <= not n4435_o;
  -- ../fixed_pkg.vhd:194:31
  n4504_o <= not n4435_o;
  n4505_o <= n4462_o & n4463_o & n4464_o & n4465_o;
  n4506_o <= n4466_o & n4467_o & n4468_o & n4469_o;
  n4507_o <= n4470_o & n4471_o & n4472_o & n4473_o;
  n4508_o <= n4474_o & n4475_o & n4476_o & n4477_o;
  n4509_o <= n4478_o & n4479_o & n4480_o & n4481_o;
  n4510_o <= n4482_o & n4483_o & n4484_o & n4485_o;
  n4511_o <= n4486_o & n4487_o & n4488_o & n4489_o;
  n4512_o <= n4490_o & n4491_o & n4492_o & n4493_o;
  n4513_o <= n4494_o & n4495_o & n4496_o & n4497_o;
  n4514_o <= n4498_o & n4499_o & n4500_o & n4501_o;
  n4515_o <= n4502_o & n4503_o & n4504_o;
  n4516_o <= n4505_o & n4506_o & n4507_o & n4508_o;
  n4517_o <= n4509_o & n4510_o & n4511_o & n4512_o;
  n4518_o <= n4513_o & n4514_o & n4515_o;
  n4519_o <= n4516_o & n4517_o & n4518_o;
  n4520_o <= n4519_o (41 downto 0);
  n4521_o <= n4435_o & n4520_o;
  -- ../fixed_pkg.vhd:193:9
  n4522_o <= n4434_o when n4456_o = '0' else n4521_o;
  -- ../fixed_pkg.vhd:168:39
  n4540_o <= std_logic_vector (resize (signed (n4522_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n4546_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n4547_o <= n4546_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n4548: postponed assert n4547_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n4550_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n4551_o <= n4550_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n4552: postponed assert n4551_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n4564_o <= std_logic_vector (resize (signed (v_reg), 28));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n4570_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n4571_o <= n4570_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n4572: postponed assert n4571_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n4574_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n4575_o <= n4574_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n4576: postponed assert n4575_o = '1' severity error; --  assert
  n4578_o <= n4577_o (15 downto 0);
  n4579_o <= n4564_o & n4578_o;
  -- ../fixed_pkg.vhd:255:67
  n4590_o <= std_logic_vector (unsigned (n4540_o) + unsigned (n4579_o));
  -- ../fixed_pkg.vhd:168:39
  n4601_o <= n4590_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n4602_o <= n4590_o (43);
  -- ../fixed_pkg.vhd:173:9
  n4607_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n4608_o <= n4607_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n4609: postponed assert n4608_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n4611_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n4612_o <= n4611_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n4613: postponed assert n4612_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n4615_o <= n4590_o (42);
  -- ../fixed_pkg.vhd:183:27
  n4616_o <= '1' when n4615_o /= n4602_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n4623_o <= '0' when n4616_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n4629_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4630_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4631_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4632_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4633_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4634_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4635_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4636_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4637_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4638_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4639_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4640_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4641_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4642_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4643_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4644_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4645_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4646_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4647_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4648_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4649_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4650_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4651_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4652_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4653_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4654_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4655_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4656_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4657_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4658_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4659_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4660_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4661_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4662_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4663_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4664_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4665_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4666_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4667_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4668_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4669_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4670_o <= not n4602_o;
  -- ../fixed_pkg.vhd:194:31
  n4671_o <= not n4602_o;
  n4672_o <= n4629_o & n4630_o & n4631_o & n4632_o;
  n4673_o <= n4633_o & n4634_o & n4635_o & n4636_o;
  n4674_o <= n4637_o & n4638_o & n4639_o & n4640_o;
  n4675_o <= n4641_o & n4642_o & n4643_o & n4644_o;
  n4676_o <= n4645_o & n4646_o & n4647_o & n4648_o;
  n4677_o <= n4649_o & n4650_o & n4651_o & n4652_o;
  n4678_o <= n4653_o & n4654_o & n4655_o & n4656_o;
  n4679_o <= n4657_o & n4658_o & n4659_o & n4660_o;
  n4680_o <= n4661_o & n4662_o & n4663_o & n4664_o;
  n4681_o <= n4665_o & n4666_o & n4667_o & n4668_o;
  n4682_o <= n4669_o & n4670_o & n4671_o;
  n4683_o <= n4672_o & n4673_o & n4674_o & n4675_o;
  n4684_o <= n4676_o & n4677_o & n4678_o & n4679_o;
  n4685_o <= n4680_o & n4681_o & n4682_o;
  n4686_o <= n4683_o & n4684_o & n4685_o;
  n4687_o <= n4686_o (41 downto 0);
  n4688_o <= n4602_o & n4687_o;
  -- ../fixed_pkg.vhd:193:9
  n4689_o <= n4601_o when n4623_o = '0' else n4688_o;
  -- ../fixed_pkg.vhd:168:39
  n4705_o <= n4689_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n4706_o <= n4689_o (42);
  -- ../fixed_pkg.vhd:173:9
  n4711_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n4712_o <= n4711_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n4713: postponed assert n4712_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n4715_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n4716_o <= n4715_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n4717: postponed assert n4716_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n4719_o <= n4689_o (41);
  -- ../fixed_pkg.vhd:183:27
  n4720_o <= '1' when n4719_o /= n4706_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n4727_o <= '0' when n4720_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n4731_o <= '1' when n4720_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n4733_o <= n4689_o (40);
  -- ../fixed_pkg.vhd:183:27
  n4734_o <= '1' when n4733_o /= n4706_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n4736_o <= n4727_o when n4745_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n4742_o <= n4734_o and n4731_o;
  -- ../fixed_pkg.vhd:183:17
  n4745_o <= n4731_o and n4742_o;
  -- ../fixed_pkg.vhd:194:31
  n4747_o <= not n4706_o;
  -- ../fixed_pkg.vhd:194:31
  n4748_o <= not n4706_o;
  -- ../fixed_pkg.vhd:194:31
  n4749_o <= not n4706_o;
  -- ../fixed_pkg.vhd:194:31
  n4750_o <= not n4706_o;
  -- ../fixed_pkg.vhd:194:31
  n4751_o <= not n4706_o;
  -- ../fixed_pkg.vhd:194:31
  n4752_o <= not n4706_o;
  -- ../fixed_pkg.vhd:194:31
  n4753_o <= not n4706_o;
  -- ../fixed_pkg.vhd:194:31
  n4754_o <= not n4706_o;
  -- ../fixed_pkg.vhd:194:31
  n4755_o <= not n4706_o;
  -- ../fixed_pkg.vhd:194:31
  n4756_o <= not n4706_o;
  -- ../fixed_pkg.vhd:194:31
  n4757_o <= not n4706_o;
  -- ../fixed_pkg.vhd:194:31
  n4758_o <= not n4706_o;
  -- ../fixed_pkg.vhd:194:31
  n4759_o <= not n4706_o;
  -- ../fixed_pkg.vhd:194:31
  n4760_o <= not n4706_o;
  -- ../fixed_pkg.vhd:194:31
  n4761_o <= not n4706_o;
  -- ../fixed_pkg.vhd:194:31
  n4762_o <= not n4706_o;
  -- ../fixed_pkg.vhd:194:31
  n4763_o <= not n4706_o;
  -- ../fixed_pkg.vhd:194:31
  n4764_o <= not n4706_o;
  -- ../fixed_pkg.vhd:194:31
  n4765_o <= not n4706_o;
  -- ../fixed_pkg.vhd:194:31
  n4766_o <= not n4706_o;
  -- ../fixed_pkg.vhd:194:31
  n4767_o <= not n4706_o;
  -- ../fixed_pkg.vhd:194:31
  n4768_o <= not n4706_o;
  -- ../fixed_pkg.vhd:194:31
  n4769_o <= not n4706_o;
  -- ../fixed_pkg.vhd:194:31
  n4770_o <= not n4706_o;
  -- ../fixed_pkg.vhd:194:31
  n4771_o <= not n4706_o;
  n4772_o <= n4747_o & n4748_o & n4749_o & n4750_o;
  n4773_o <= n4751_o & n4752_o & n4753_o & n4754_o;
  n4774_o <= n4755_o & n4756_o & n4757_o & n4758_o;
  n4775_o <= n4759_o & n4760_o & n4761_o & n4762_o;
  n4776_o <= n4763_o & n4764_o & n4765_o & n4766_o;
  n4777_o <= n4767_o & n4768_o & n4769_o & n4770_o;
  n4778_o <= n4772_o & n4773_o & n4774_o & n4775_o;
  n4779_o <= n4776_o & n4777_o & n4771_o;
  n4780_o <= n4778_o & n4779_o;
  n4781_o <= n4780_o (23 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n4782_o <= n4705_o (40 downto 16);
  n4783_o <= n4706_o & n4781_o;
  -- ../fixed_pkg.vhd:193:9
  n4784_o <= n4782_o when n4736_o = '0' else n4783_o;
  -- ../fixed_pkg.vhd:266:100
  n4799_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n4802_o <= std_logic_vector (resize (signed (n4799_o) * signed'("0000000000011111111111111111111111001101000"), 43));
  -- ../fixed_pkg.vhd:266:100
  n4814_o <= std_logic_vector (resize (signed (y_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n4817_o <= std_logic_vector (resize (signed (n4814_o) * signed'("0000000000000000000000000001111110011010000"), 43));
  -- ../fixed_pkg.vhd:168:39
  n4834_o <= std_logic_vector (resize (signed (n4802_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n4840_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n4841_o <= n4840_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n4842: postponed assert n4841_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n4844_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n4845_o <= n4844_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n4846: postponed assert n4845_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n4858_o <= std_logic_vector (resize (signed (n4817_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n4864_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n4865_o <= n4864_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n4866: postponed assert n4865_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n4868_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n4869_o <= n4868_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n4870: postponed assert n4869_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:240:67
  n4882_o <= std_logic_vector (unsigned (n4834_o) - unsigned (n4858_o));
  -- ../fixed_pkg.vhd:168:39
  n4893_o <= n4882_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n4894_o <= n4882_o (43);
  -- ../fixed_pkg.vhd:173:9
  n4899_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n4900_o <= n4899_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n4901: postponed assert n4900_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n4903_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n4904_o <= n4903_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n4905: postponed assert n4904_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n4907_o <= n4882_o (42);
  -- ../fixed_pkg.vhd:183:27
  n4908_o <= '1' when n4907_o /= n4894_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n4915_o <= '0' when n4908_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n4921_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4922_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4923_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4924_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4925_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4926_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4927_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4928_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4929_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4930_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4931_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4932_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4933_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4934_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4935_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4936_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4937_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4938_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4939_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4940_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4941_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4942_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4943_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4944_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4945_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4946_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4947_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4948_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4949_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4950_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4951_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4952_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4953_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4954_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4955_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4956_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4957_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4958_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4959_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4960_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4961_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4962_o <= not n4894_o;
  -- ../fixed_pkg.vhd:194:31
  n4963_o <= not n4894_o;
  n4964_o <= n4921_o & n4922_o & n4923_o & n4924_o;
  n4965_o <= n4925_o & n4926_o & n4927_o & n4928_o;
  n4966_o <= n4929_o & n4930_o & n4931_o & n4932_o;
  n4967_o <= n4933_o & n4934_o & n4935_o & n4936_o;
  n4968_o <= n4937_o & n4938_o & n4939_o & n4940_o;
  n4969_o <= n4941_o & n4942_o & n4943_o & n4944_o;
  n4970_o <= n4945_o & n4946_o & n4947_o & n4948_o;
  n4971_o <= n4949_o & n4950_o & n4951_o & n4952_o;
  n4972_o <= n4953_o & n4954_o & n4955_o & n4956_o;
  n4973_o <= n4957_o & n4958_o & n4959_o & n4960_o;
  n4974_o <= n4961_o & n4962_o & n4963_o;
  n4975_o <= n4964_o & n4965_o & n4966_o & n4967_o;
  n4976_o <= n4968_o & n4969_o & n4970_o & n4971_o;
  n4977_o <= n4972_o & n4973_o & n4974_o;
  n4978_o <= n4975_o & n4976_o & n4977_o;
  n4979_o <= n4978_o (41 downto 0);
  n4980_o <= n4894_o & n4979_o;
  -- ../fixed_pkg.vhd:193:9
  n4981_o <= n4893_o when n4915_o = '0' else n4980_o;
  -- ../fixed_pkg.vhd:168:39
  n4997_o <= n4981_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n4998_o <= n4981_o (42);
  -- ../fixed_pkg.vhd:173:9
  n5003_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n5004_o <= n5003_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n5005: postponed assert n5004_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n5007_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n5008_o <= n5007_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n5009: postponed assert n5008_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n5011_o <= n4981_o (41);
  -- ../fixed_pkg.vhd:183:27
  n5012_o <= '1' when n5011_o /= n4998_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n5019_o <= '0' when n5012_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n5023_o <= '1' when n5012_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n5025_o <= n4981_o (40);
  -- ../fixed_pkg.vhd:183:27
  n5026_o <= '1' when n5025_o /= n4998_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n5028_o <= n5019_o when n5037_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n5034_o <= n5026_o and n5023_o;
  -- ../fixed_pkg.vhd:183:17
  n5037_o <= n5023_o and n5034_o;
  -- ../fixed_pkg.vhd:194:31
  n5039_o <= not n4998_o;
  -- ../fixed_pkg.vhd:194:31
  n5040_o <= not n4998_o;
  -- ../fixed_pkg.vhd:194:31
  n5041_o <= not n4998_o;
  -- ../fixed_pkg.vhd:194:31
  n5042_o <= not n4998_o;
  -- ../fixed_pkg.vhd:194:31
  n5043_o <= not n4998_o;
  -- ../fixed_pkg.vhd:194:31
  n5044_o <= not n4998_o;
  -- ../fixed_pkg.vhd:194:31
  n5045_o <= not n4998_o;
  -- ../fixed_pkg.vhd:194:31
  n5046_o <= not n4998_o;
  -- ../fixed_pkg.vhd:194:31
  n5047_o <= not n4998_o;
  -- ../fixed_pkg.vhd:194:31
  n5048_o <= not n4998_o;
  -- ../fixed_pkg.vhd:194:31
  n5049_o <= not n4998_o;
  -- ../fixed_pkg.vhd:194:31
  n5050_o <= not n4998_o;
  -- ../fixed_pkg.vhd:194:31
  n5051_o <= not n4998_o;
  -- ../fixed_pkg.vhd:194:31
  n5052_o <= not n4998_o;
  -- ../fixed_pkg.vhd:194:31
  n5053_o <= not n4998_o;
  -- ../fixed_pkg.vhd:194:31
  n5054_o <= not n4998_o;
  -- ../fixed_pkg.vhd:194:31
  n5055_o <= not n4998_o;
  -- ../fixed_pkg.vhd:194:31
  n5056_o <= not n4998_o;
  -- ../fixed_pkg.vhd:194:31
  n5057_o <= not n4998_o;
  -- ../fixed_pkg.vhd:194:31
  n5058_o <= not n4998_o;
  -- ../fixed_pkg.vhd:194:31
  n5059_o <= not n4998_o;
  -- ../fixed_pkg.vhd:194:31
  n5060_o <= not n4998_o;
  -- ../fixed_pkg.vhd:194:31
  n5061_o <= not n4998_o;
  -- ../fixed_pkg.vhd:194:31
  n5062_o <= not n4998_o;
  -- ../fixed_pkg.vhd:194:31
  n5063_o <= not n4998_o;
  n5064_o <= n5039_o & n5040_o & n5041_o & n5042_o;
  n5065_o <= n5043_o & n5044_o & n5045_o & n5046_o;
  n5066_o <= n5047_o & n5048_o & n5049_o & n5050_o;
  n5067_o <= n5051_o & n5052_o & n5053_o & n5054_o;
  n5068_o <= n5055_o & n5056_o & n5057_o & n5058_o;
  n5069_o <= n5059_o & n5060_o & n5061_o & n5062_o;
  n5070_o <= n5064_o & n5065_o & n5066_o & n5067_o;
  n5071_o <= n5068_o & n5069_o & n5063_o;
  n5072_o <= n5070_o & n5071_o;
  n5073_o <= n5072_o (23 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n5074_o <= n4997_o (40 downto 16);
  n5075_o <= n4998_o & n5073_o;
  -- ../fixed_pkg.vhd:193:9
  n5076_o <= n5074_o when n5028_o = '0' else n5075_o;
  -- ../BiquadFilter/BiquadFilter.vhd:67:17
  n5079_o <= '1' when state_reg = "10" else '0';
  n5080_o <= n5079_o & n4325_o & n4044_o;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n5080_o select n5081_o <=
    x_reg when "100",
    x_reg when "010",
    n4042_o when "001",
    x_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n5080_o select n5082_o <=
    y_reg when "100",
    n4322_o when "010",
    y_reg when "001",
    y_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n5080_o select n5083_o <=
    n4784_o when "100",
    w_reg when "010",
    w_reg when "001",
    w_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n5080_o select n5084_o <=
    n5076_o when "100",
    v_reg when "010",
    v_reg when "001",
    v_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n5112_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n5113_o <= x_reg when n5112_o = '0' else n5081_o;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n5114_q <= n5113_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n5115_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n5116_o <= y_reg when n5115_o = '0' else n5082_o;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n5117_q <= n5116_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n5118_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n5118_q <= n5083_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n5119_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n5119_q <= n5084_o;
    end if;
  end process;
  -- ../fixed_pkg.vhd:168:39
  n5135_o <= y_reg (22 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n5136_o <= y_reg (24);
  -- ../fixed_pkg.vhd:173:9
  n5141_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n5142_o <= n5141_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n5143: postponed assert n5142_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n5145_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n5146_o <= n5145_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n5147: postponed assert n5146_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n5149_o <= y_reg (23);
  -- ../fixed_pkg.vhd:183:27
  n5150_o <= '1' when n5149_o /= n5136_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n5157_o <= '0' when n5150_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n5161_o <= '1' when n5150_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n5163_o <= y_reg (22);
  -- ../fixed_pkg.vhd:183:27
  n5164_o <= '1' when n5163_o /= n5136_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n5166_o <= n5157_o when n5175_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n5172_o <= n5164_o and n5161_o;
  -- ../fixed_pkg.vhd:183:17
  n5175_o <= n5161_o and n5172_o;
  -- ../fixed_pkg.vhd:194:31
  n5177_o <= not n5136_o;
  -- ../fixed_pkg.vhd:194:31
  n5178_o <= not n5136_o;
  -- ../fixed_pkg.vhd:194:31
  n5179_o <= not n5136_o;
  -- ../fixed_pkg.vhd:194:31
  n5180_o <= not n5136_o;
  -- ../fixed_pkg.vhd:194:31
  n5181_o <= not n5136_o;
  -- ../fixed_pkg.vhd:194:31
  n5182_o <= not n5136_o;
  -- ../fixed_pkg.vhd:194:31
  n5183_o <= not n5136_o;
  -- ../fixed_pkg.vhd:194:31
  n5184_o <= not n5136_o;
  -- ../fixed_pkg.vhd:194:31
  n5185_o <= not n5136_o;
  -- ../fixed_pkg.vhd:194:31
  n5186_o <= not n5136_o;
  -- ../fixed_pkg.vhd:194:31
  n5187_o <= not n5136_o;
  -- ../fixed_pkg.vhd:194:31
  n5188_o <= not n5136_o;
  -- ../fixed_pkg.vhd:194:31
  n5189_o <= not n5136_o;
  -- ../fixed_pkg.vhd:194:31
  n5190_o <= not n5136_o;
  -- ../fixed_pkg.vhd:194:31
  n5191_o <= not n5136_o;
  -- ../fixed_pkg.vhd:194:31
  n5192_o <= not n5136_o;
  -- ../fixed_pkg.vhd:194:31
  n5193_o <= not n5136_o;
  -- ../fixed_pkg.vhd:194:31
  n5194_o <= not n5136_o;
  n5195_o <= n5177_o & n5178_o & n5179_o & n5180_o;
  n5196_o <= n5181_o & n5182_o & n5183_o & n5184_o;
  n5197_o <= n5185_o & n5186_o & n5187_o & n5188_o;
  n5198_o <= n5189_o & n5190_o & n5191_o & n5192_o;
  n5199_o <= n5193_o & n5194_o;
  n5200_o <= n5195_o & n5196_o & n5197_o & n5198_o;
  n5201_o <= n5200_o & n5199_o;
  n5202_o <= n5201_o (16 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n5203_o <= n5135_o (22 downto 5);
  n5204_o <= n5136_o & n5202_o;
  -- ../fixed_pkg.vhd:193:9
  n5205_o <= n5203_o when n5166_o = '0' else n5204_o;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity oscillator is
  port (
    clk_i : in std_logic;
    reset_i : in std_logic;
    step_i : in std_logic_vector (4 downto 0);
    ready_i : in std_logic;
    data_o : out std_logic_vector (17 downto 0));
end entity oscillator;

architecture rtl of oscillator is
  signal down_reg : std_logic;
  signal sign_reg : std_logic;
  signal index_reg : std_logic_vector (4 downto 0);
  signal n3807_o : std_logic;
  signal n3808_o : std_logic_vector (31 downto 0);
  signal n3809_o : std_logic_vector (31 downto 0);
  signal n3810_o : std_logic_vector (31 downto 0);
  signal n3811_o : std_logic_vector (6 downto 0);
  signal n3812_o : std_logic_vector (31 downto 0);
  signal n3813_o : std_logic_vector (31 downto 0);
  signal n3814_o : std_logic_vector (31 downto 0);
  signal n3815_o : std_logic_vector (6 downto 0);
  signal n3816_o : std_logic_vector (6 downto 0);
  signal n3817_o : std_logic_vector (31 downto 0);
  signal n3819_o : std_logic;
  signal n3820_o : std_logic_vector (31 downto 0);
  signal n3822_o : std_logic_vector (31 downto 0);
  signal n3823_o : std_logic_vector (4 downto 0);
  signal n3824_o : std_logic_vector (31 downto 0);
  signal n3826_o : std_logic;
  signal n3827_o : std_logic_vector (31 downto 0);
  signal n3828_o : std_logic_vector (31 downto 0);
  signal n3829_o : std_logic_vector (4 downto 0);
  signal n3830_o : std_logic;
  signal n3831_o : std_logic_vector (4 downto 0);
  signal n3833_o : std_logic;
  signal n3834_o : std_logic;
  signal n3835_o : std_logic_vector (4 downto 0);
  signal n3837_o : std_logic;
  signal n3838_o : std_logic;
  signal n3839_o : std_logic_vector (4 downto 0);
  signal n3856_o : std_logic;
  signal n3857_q : std_logic;
  signal n3858_o : std_logic;
  signal n3859_q : std_logic;
  signal n3860_o : std_logic_vector (4 downto 0);
  signal n3861_q : std_logic_vector (4 downto 0);
  signal n3867_o : std_logic;
  signal n3868_o : std_logic;
  signal n3870_o : std_logic_vector (4 downto 0);
  signal n3876_o : std_logic_vector (4 downto 0);
  signal n3889_o : std_logic_vector (18 downto 0);
  signal n3890_o : std_logic_vector (18 downto 0);
  signal n3906_o : std_logic_vector (17 downto 0);
  signal n3907_o : std_logic;
  signal n3912_o : std_logic;
  signal n3913_o : std_logic;
  signal n3916_o : std_logic;
  signal n3917_o : std_logic;
  signal n3920_o : std_logic;
  signal n3921_o : std_logic;
  signal n3928_o : std_logic;
  signal n3934_o : std_logic;
  signal n3935_o : std_logic;
  signal n3936_o : std_logic;
  signal n3937_o : std_logic;
  signal n3938_o : std_logic;
  signal n3939_o : std_logic;
  signal n3940_o : std_logic;
  signal n3941_o : std_logic;
  signal n3942_o : std_logic;
  signal n3943_o : std_logic;
  signal n3944_o : std_logic;
  signal n3945_o : std_logic;
  signal n3946_o : std_logic;
  signal n3947_o : std_logic;
  signal n3948_o : std_logic;
  signal n3949_o : std_logic;
  signal n3950_o : std_logic;
  signal n3951_o : std_logic;
  signal n3952_o : std_logic_vector (3 downto 0);
  signal n3953_o : std_logic_vector (3 downto 0);
  signal n3954_o : std_logic_vector (3 downto 0);
  signal n3955_o : std_logic_vector (3 downto 0);
  signal n3956_o : std_logic_vector (1 downto 0);
  signal n3957_o : std_logic_vector (15 downto 0);
  signal n3958_o : std_logic_vector (17 downto 0);
  signal n3959_o : std_logic_vector (16 downto 0);
  signal n3960_o : std_logic_vector (17 downto 0);
  signal n3961_o : std_logic_vector (17 downto 0);
  signal n3963_o : std_logic_vector (17 downto 0);
  signal n3967_q : std_logic_vector (17 downto 0);
  signal n3969_data : std_logic_vector (17 downto 0);
  signal n3971_data : std_logic_vector (17 downto 0);
begin
  data_o <= n3967_q;
  -- ../Oscillator/Oscillator.vhd:19:12
  down_reg <= n3857_q; -- (signal)
  -- ../Oscillator/Oscillator.vhd:19:22
  sign_reg <= n3859_q; -- (signal)
  -- ../Oscillator/Oscillator.vhd:20:12
  index_reg <= n3861_q; -- (signal)
  -- ../Oscillator/Oscillator.vhd:29:15
  -- n3807_o <= '1' when rising_edge (clk_i) else '0';
  -- ../Oscillator/Oscillator.vhd:32:45
  n3808_o <= "000000000000000000000000000" & index_reg;  --  uext
  -- ../Oscillator/Oscillator.vhd:32:45
  n3809_o <= "000000000000000000000000000" & step_i;  --  uext
  -- ../Oscillator/Oscillator.vhd:32:45
  n3810_o <= std_logic_vector (unsigned (n3808_o) - unsigned (n3809_o));
  -- ../Oscillator/Oscillator.vhd:32:21
  n3811_o <= n3810_o (6 downto 0);  --  trunc
  -- ../Oscillator/Oscillator.vhd:34:45
  n3812_o <= "000000000000000000000000000" & index_reg;  --  uext
  -- ../Oscillator/Oscillator.vhd:34:45
  n3813_o <= "000000000000000000000000000" & step_i;  --  uext
  -- ../Oscillator/Oscillator.vhd:34:45
  n3814_o <= std_logic_vector (unsigned (n3812_o) + unsigned (n3813_o));
  -- ../Oscillator/Oscillator.vhd:34:21
  n3815_o <= n3814_o (6 downto 0);  --  trunc
  -- ../Oscillator/Oscillator.vhd:31:17
  n3816_o <= n3815_o when down_reg = '0' else n3811_o;
  -- ../Oscillator/Oscillator.vhd:36:31
  n3817_o <= std_logic_vector (resize (signed (n3816_o), 32));  --  sext
  -- ../Oscillator/Oscillator.vhd:36:31
  n3819_o <= '1' when signed (n3817_o) >= signed'("00000000000000000000000000011001") else '0';
  -- ../Oscillator/Oscillator.vhd:37:53
  n3820_o <= std_logic_vector (resize (signed (n3816_o), 32));  --  sext
  -- ../Oscillator/Oscillator.vhd:37:53
  n3822_o <= std_logic_vector (unsigned'("00000000000000000000000000110010") - unsigned (n3820_o));
  -- ../Oscillator/Oscillator.vhd:37:34
  n3823_o <= n3822_o (4 downto 0);  --  trunc
  -- ../Oscillator/Oscillator.vhd:39:34
  n3824_o <= std_logic_vector (resize (signed (n3816_o), 32));  --  sext
  -- ../Oscillator/Oscillator.vhd:39:34
  n3826_o <= '1' when signed (n3824_o) <= signed'("00000000000000000000000000000000") else '0';
  -- ../Oscillator/Oscillator.vhd:40:34
  n3827_o <= std_logic_vector (resize (signed (n3816_o), 32));  --  sext
  -- ../Oscillator/Oscillator.vhd:40:34
  n3828_o <= std_logic_vector(-signed (n3827_o));
  -- ../Oscillator/Oscillator.vhd:40:34
  n3829_o <= n3828_o (4 downto 0);  --  trunc
  -- ../Oscillator/Oscillator.vhd:42:34
  n3830_o <= not sign_reg;
  -- ../Oscillator/Oscillator.vhd:44:34
  n3831_o <= n3816_o (4 downto 0);  --  trunc
  -- ../Oscillator/Oscillator.vhd:39:17
  n3833_o <= down_reg when n3826_o = '0' else '0';
  -- ../Oscillator/Oscillator.vhd:39:17
  n3834_o <= sign_reg when n3826_o = '0' else n3830_o;
  -- ../Oscillator/Oscillator.vhd:39:17
  n3835_o <= n3831_o when n3826_o = '0' else n3829_o;
  -- ../Oscillator/Oscillator.vhd:36:17
  n3837_o <= n3833_o when n3819_o = '0' else '1';
  -- ../Oscillator/Oscillator.vhd:36:17
  n3838_o <= n3834_o when n3819_o = '0' else sign_reg;
  -- ../Oscillator/Oscillator.vhd:36:17
  n3839_o <= n3835_o when n3819_o = '0' else n3823_o;
  -- ../Oscillator/Oscillator.vhd:8:8
  n3856_o <= down_reg when ready_i = '0' else n3837_o;
  -- ../Oscillator/Oscillator.vhd:29:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n3857_q <= '0';
    elsif rising_edge (clk_i) then
      n3857_q <= n3856_o;
    end if;
  end process;
  -- ../Oscillator/Oscillator.vhd:8:8
  n3858_o <= sign_reg when ready_i = '0' else n3838_o;
  -- ../Oscillator/Oscillator.vhd:29:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n3859_q <= '0';
    elsif rising_edge (clk_i) then
      n3859_q <= n3858_o;
    end if;
  end process;
  -- ../Oscillator/Oscillator.vhd:8:8
  n3860_o <= index_reg when ready_i = '0' else n3839_o;
  -- ../Oscillator/Oscillator.vhd:29:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n3861_q <= "00000";
    elsif rising_edge (clk_i) then
      n3861_q <= n3860_o;
    end if;
  end process;
  -- ../Oscillator/Oscillator.vhd:52:12
  -- n3867_o <= '1' when rising_edge (clk_i) else '0';
  -- ../Oscillator/Oscillator.vhd:53:25
  n3868_o <= not sign_reg;
  -- ../Oscillator/Oscillator.vhd:54:37
  n3870_o <= std_logic_vector (unsigned'("11001") - unsigned (index_reg));
  -- ../Oscillator/Oscillator.vhd:56:38
  n3876_o <= std_logic_vector (unsigned'("11001") - unsigned (index_reg));
  -- ../fixed_pkg.vhd:229:32
  n3889_o <= std_logic_vector (resize (signed (n3971_data), 19));  --  sext
  -- ../fixed_pkg.vhd:230:68
  n3890_o <= std_logic_vector(-signed (n3889_o));
  -- ../fixed_pkg.vhd:168:39
  n3906_o <= n3890_o (17 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n3907_o <= n3890_o (18);
  -- ../fixed_pkg.vhd:173:9
  n3912_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n3913_o <= n3912_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n3914: postponed assert n3913_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n3916_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n3917_o <= n3916_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n3918: postponed assert n3917_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n3920_o <= n3890_o (17);
  -- ../fixed_pkg.vhd:183:27
  n3921_o <= '1' when n3920_o /= n3907_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n3928_o <= '0' when n3921_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n3934_o <= not n3907_o;
  -- ../fixed_pkg.vhd:194:31
  n3935_o <= not n3907_o;
  -- ../fixed_pkg.vhd:194:31
  n3936_o <= not n3907_o;
  -- ../fixed_pkg.vhd:194:31
  n3937_o <= not n3907_o;
  -- ../fixed_pkg.vhd:194:31
  n3938_o <= not n3907_o;
  -- ../fixed_pkg.vhd:194:31
  n3939_o <= not n3907_o;
  -- ../fixed_pkg.vhd:194:31
  n3940_o <= not n3907_o;
  -- ../fixed_pkg.vhd:194:31
  n3941_o <= not n3907_o;
  -- ../fixed_pkg.vhd:194:31
  n3942_o <= not n3907_o;
  -- ../fixed_pkg.vhd:194:31
  n3943_o <= not n3907_o;
  -- ../fixed_pkg.vhd:194:31
  n3944_o <= not n3907_o;
  -- ../fixed_pkg.vhd:194:31
  n3945_o <= not n3907_o;
  -- ../fixed_pkg.vhd:194:31
  n3946_o <= not n3907_o;
  -- ../fixed_pkg.vhd:194:31
  n3947_o <= not n3907_o;
  -- ../fixed_pkg.vhd:194:31
  n3948_o <= not n3907_o;
  -- ../fixed_pkg.vhd:194:31
  n3949_o <= not n3907_o;
  -- ../fixed_pkg.vhd:194:31
  n3950_o <= not n3907_o;
  -- ../fixed_pkg.vhd:194:31
  n3951_o <= not n3907_o;
  n3952_o <= n3934_o & n3935_o & n3936_o & n3937_o;
  -- ../fixed_pkg.vhd:24:14
  n3953_o <= n3938_o & n3939_o & n3940_o & n3941_o;
  -- ../fixed_pkg.vhd:34:14
  n3954_o <= n3942_o & n3943_o & n3944_o & n3945_o;
  -- ../fixed_pkg.vhd:34:14
  n3955_o <= n3946_o & n3947_o & n3948_o & n3949_o;
  n3956_o <= n3950_o & n3951_o;
  -- ../fixed_pkg.vhd:34:14
  n3957_o <= n3952_o & n3953_o & n3954_o & n3955_o;
  n3958_o <= n3957_o & n3956_o;
  -- ../fixed_pkg.vhd:9:14
  n3959_o <= n3958_o (16 downto 0);
  -- ../fixed_pkg.vhd:9:14
  n3960_o <= n3907_o & n3959_o;
  -- ../fixed_pkg.vhd:193:9
  n3961_o <= n3906_o when n3928_o = '0' else n3960_o;
  -- ../Oscillator/Oscillator.vhd:53:13
  n3963_o <= n3961_o when n3868_o = '0' else n3969_data;
  -- ../Oscillator/Oscillator.vhd:52:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n3967_q <= n3963_o;
    end if;
  end process;
  -- ../fixed_pkg.vhd:173:9
  process (n3870_o) is
    type n3968_oport_type is array (0 to 25)
      of std_logic_vector (17 downto 0);
    variable n3968_oport : n3968_oport_type :=
      (25 => "000000000000000000",
       24 => "000001000000010011",
       23 => "000010000000010110",
       22 => "000010111111111000",
       21 => "000011111110101010",
       20 => "000100111100011100",
       19 => "000101111000111101",
       18 => "000110110100000000",
       17 => "000111101101010100",
       16 => "001000100100101100",
       15 => "001001011001111001",
       14 => "001010001100101110",
       13 => "001010111100111110",
       12 => "001011101010011110",
       11 => "001100010101000000",
       10 => "001100111100011100",
       9 => "001101100000100110",
       8 => "001110000001010110",
       7 => "001110011110100011",
       6 => "001110111000000110",
       5 => "001111001101111000",
       4 => "001111011111110101",
       3 => "001111101101110111",
       2 => "001111110111111011",
       1 => "001111111101111111",
       0 => "010000000000000000");
  begin
    n3969_data <= n3968_oport(to_integer (unsigned (n3870_o)));
  end process;
  -- ../Oscillator/Oscillator.vhd:54:38
  -- ../Oscillator/Oscillator.vhd:54:37
  process (n3876_o) is
    type n3970_oport_type is array (0 to 25)
      of std_logic_vector (17 downto 0);
    variable n3970_oport : n3970_oport_type :=
      (25 => "000000000000000000",
       24 => "000001000000010011",
       23 => "000010000000010110",
       22 => "000010111111111000",
       21 => "000011111110101010",
       20 => "000100111100011100",
       19 => "000101111000111101",
       18 => "000110110100000000",
       17 => "000111101101010100",
       16 => "001000100100101100",
       15 => "001001011001111001",
       14 => "001010001100101110",
       13 => "001010111100111110",
       12 => "001011101010011110",
       11 => "001100010101000000",
       10 => "001100111100011100",
       9 => "001101100000100110",
       8 => "001110000001010110",
       7 => "001110011110100011",
       6 => "001110111000000110",
       5 => "001111001101111000",
       4 => "001111011111110101",
       3 => "001111101101110111",
       2 => "001111110111111011",
       1 => "001111111101111111",
       0 => "010000000000000000");
  begin
    n3971_data <= n3970_oport(to_integer (unsigned (n3876_o)));
  end process;
  -- ../Oscillator/Oscillator.vhd:56:39
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity biquadfilter_97b779b18cb8cdee50a9e62c5c999787ca4e4f2b is
  port (
    clk_i : in std_logic;
    reset_i : in std_logic;
    valid_i : in std_logic;
    data_i : in std_logic_vector (17 downto 0);
    ready_i : in std_logic;
    ready_o : out std_logic;
    valid_o : out std_logic;
    data_o : out std_logic_vector (17 downto 0));
end entity biquadfilter_97b779b18cb8cdee50a9e62c5c999787ca4e4f2b;

architecture rtl of biquadfilter_97b779b18cb8cdee50a9e62c5c999787ca4e4f2b is
  signal state_reg : std_logic_vector (1 downto 0);
  signal x_reg : std_logic_vector (24 downto 0);
  signal y_reg : std_logic_vector (24 downto 0);
  signal w_reg : std_logic_vector (24 downto 0);
  signal v_reg : std_logic_vector (24 downto 0);
  signal n2572_o : std_logic;
  signal n2574_o : std_logic_vector (1 downto 0);
  signal n2576_o : std_logic;
  signal n2578_o : std_logic;
  signal n2580_o : std_logic;
  signal n2582_o : std_logic_vector (1 downto 0);
  signal n2584_o : std_logic;
  signal n2585_o : std_logic_vector (3 downto 0);
  signal n2589_o : std_logic_vector (1 downto 0);
  signal n2594_q : std_logic_vector (1 downto 0);
  signal n2597_o : std_logic;
  signal n2598_o : std_logic;
  signal n2602_o : std_logic;
  signal n2603_o : std_logic;
  signal n2606_o : std_logic;
  signal n2622_o : std_logic_vector (19 downto 0);
  signal n2628_o : std_logic;
  signal n2629_o : std_logic;
  signal n2632_o : std_logic;
  signal n2633_o : std_logic;
  constant n2635_o : std_logic_vector (24 downto 0) := "0000000000000000000000000";
  signal n2636_o : std_logic_vector (4 downto 0);
  signal n2637_o : std_logic_vector (24 downto 0);
  signal n2638_o : std_logic_vector (24 downto 0);
  signal n2640_o : std_logic;
  signal n2654_o : std_logic_vector (42 downto 0);
  signal n2657_o : std_logic_vector (42 downto 0);
  signal n2674_o : std_logic_vector (43 downto 0);
  signal n2680_o : std_logic;
  signal n2681_o : std_logic;
  signal n2684_o : std_logic;
  signal n2685_o : std_logic;
  signal n2698_o : std_logic_vector (27 downto 0);
  signal n2704_o : std_logic;
  signal n2705_o : std_logic;
  signal n2708_o : std_logic;
  signal n2709_o : std_logic;
  constant n2711_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n2712_o : std_logic_vector (15 downto 0);
  signal n2713_o : std_logic_vector (43 downto 0);
  signal n2724_o : std_logic_vector (43 downto 0);
  signal n2735_o : std_logic_vector (42 downto 0);
  signal n2736_o : std_logic;
  signal n2741_o : std_logic;
  signal n2742_o : std_logic;
  signal n2745_o : std_logic;
  signal n2746_o : std_logic;
  signal n2749_o : std_logic;
  signal n2750_o : std_logic;
  signal n2757_o : std_logic;
  signal n2763_o : std_logic;
  signal n2764_o : std_logic;
  signal n2765_o : std_logic;
  signal n2766_o : std_logic;
  signal n2767_o : std_logic;
  signal n2768_o : std_logic;
  signal n2769_o : std_logic;
  signal n2770_o : std_logic;
  signal n2771_o : std_logic;
  signal n2772_o : std_logic;
  signal n2773_o : std_logic;
  signal n2774_o : std_logic;
  signal n2775_o : std_logic;
  signal n2776_o : std_logic;
  signal n2777_o : std_logic;
  signal n2778_o : std_logic;
  signal n2779_o : std_logic;
  signal n2780_o : std_logic;
  signal n2781_o : std_logic;
  signal n2782_o : std_logic;
  signal n2783_o : std_logic;
  signal n2784_o : std_logic;
  signal n2785_o : std_logic;
  signal n2786_o : std_logic;
  signal n2787_o : std_logic;
  signal n2788_o : std_logic;
  signal n2789_o : std_logic;
  signal n2790_o : std_logic;
  signal n2791_o : std_logic;
  signal n2792_o : std_logic;
  signal n2793_o : std_logic;
  signal n2794_o : std_logic;
  signal n2795_o : std_logic;
  signal n2796_o : std_logic;
  signal n2797_o : std_logic;
  signal n2798_o : std_logic;
  signal n2799_o : std_logic;
  signal n2800_o : std_logic;
  signal n2801_o : std_logic;
  signal n2802_o : std_logic;
  signal n2803_o : std_logic;
  signal n2804_o : std_logic;
  signal n2805_o : std_logic;
  signal n2806_o : std_logic_vector (3 downto 0);
  signal n2807_o : std_logic_vector (3 downto 0);
  signal n2808_o : std_logic_vector (3 downto 0);
  signal n2809_o : std_logic_vector (3 downto 0);
  signal n2810_o : std_logic_vector (3 downto 0);
  signal n2811_o : std_logic_vector (3 downto 0);
  signal n2812_o : std_logic_vector (3 downto 0);
  signal n2813_o : std_logic_vector (3 downto 0);
  signal n2814_o : std_logic_vector (3 downto 0);
  signal n2815_o : std_logic_vector (3 downto 0);
  signal n2816_o : std_logic_vector (2 downto 0);
  signal n2817_o : std_logic_vector (15 downto 0);
  signal n2818_o : std_logic_vector (15 downto 0);
  signal n2819_o : std_logic_vector (10 downto 0);
  signal n2820_o : std_logic_vector (42 downto 0);
  signal n2821_o : std_logic_vector (41 downto 0);
  signal n2822_o : std_logic_vector (42 downto 0);
  signal n2823_o : std_logic_vector (42 downto 0);
  signal n2839_o : std_logic_vector (40 downto 0);
  signal n2840_o : std_logic;
  signal n2845_o : std_logic;
  signal n2846_o : std_logic;
  signal n2849_o : std_logic;
  signal n2850_o : std_logic;
  signal n2853_o : std_logic;
  signal n2854_o : std_logic;
  signal n2861_o : std_logic;
  signal n2865_o : std_logic;
  signal n2867_o : std_logic;
  signal n2868_o : std_logic;
  signal n2870_o : std_logic;
  signal n2876_o : std_logic;
  signal n2879_o : std_logic;
  signal n2881_o : std_logic;
  signal n2882_o : std_logic;
  signal n2883_o : std_logic;
  signal n2884_o : std_logic;
  signal n2885_o : std_logic;
  signal n2886_o : std_logic;
  signal n2887_o : std_logic;
  signal n2888_o : std_logic;
  signal n2889_o : std_logic;
  signal n2890_o : std_logic;
  signal n2891_o : std_logic;
  signal n2892_o : std_logic;
  signal n2893_o : std_logic;
  signal n2894_o : std_logic;
  signal n2895_o : std_logic;
  signal n2896_o : std_logic;
  signal n2897_o : std_logic;
  signal n2898_o : std_logic;
  signal n2899_o : std_logic;
  signal n2900_o : std_logic;
  signal n2901_o : std_logic;
  signal n2902_o : std_logic;
  signal n2903_o : std_logic;
  signal n2904_o : std_logic;
  signal n2905_o : std_logic;
  signal n2906_o : std_logic_vector (3 downto 0);
  signal n2907_o : std_logic_vector (3 downto 0);
  signal n2908_o : std_logic_vector (3 downto 0);
  signal n2909_o : std_logic_vector (3 downto 0);
  signal n2910_o : std_logic_vector (3 downto 0);
  signal n2911_o : std_logic_vector (3 downto 0);
  signal n2912_o : std_logic_vector (15 downto 0);
  signal n2913_o : std_logic_vector (8 downto 0);
  signal n2914_o : std_logic_vector (24 downto 0);
  signal n2915_o : std_logic_vector (23 downto 0);
  signal n2916_o : std_logic_vector (24 downto 0);
  signal n2917_o : std_logic_vector (24 downto 0);
  signal n2918_o : std_logic_vector (24 downto 0);
  signal n2921_o : std_logic;
  signal n2936_o : std_logic_vector (42 downto 0);
  signal n2939_o : std_logic_vector (42 downto 0);
  signal n2951_o : std_logic_vector (42 downto 0);
  signal n2954_o : std_logic_vector (42 downto 0);
  signal n2971_o : std_logic_vector (43 downto 0);
  signal n2977_o : std_logic;
  signal n2978_o : std_logic;
  signal n2981_o : std_logic;
  signal n2982_o : std_logic;
  signal n2995_o : std_logic_vector (43 downto 0);
  signal n3001_o : std_logic;
  signal n3002_o : std_logic;
  signal n3005_o : std_logic;
  signal n3006_o : std_logic;
  signal n3019_o : std_logic_vector (43 downto 0);
  signal n3030_o : std_logic_vector (42 downto 0);
  signal n3031_o : std_logic;
  signal n3036_o : std_logic;
  signal n3037_o : std_logic;
  signal n3040_o : std_logic;
  signal n3041_o : std_logic;
  signal n3044_o : std_logic;
  signal n3045_o : std_logic;
  signal n3052_o : std_logic;
  signal n3058_o : std_logic;
  signal n3059_o : std_logic;
  signal n3060_o : std_logic;
  signal n3061_o : std_logic;
  signal n3062_o : std_logic;
  signal n3063_o : std_logic;
  signal n3064_o : std_logic;
  signal n3065_o : std_logic;
  signal n3066_o : std_logic;
  signal n3067_o : std_logic;
  signal n3068_o : std_logic;
  signal n3069_o : std_logic;
  signal n3070_o : std_logic;
  signal n3071_o : std_logic;
  signal n3072_o : std_logic;
  signal n3073_o : std_logic;
  signal n3074_o : std_logic;
  signal n3075_o : std_logic;
  signal n3076_o : std_logic;
  signal n3077_o : std_logic;
  signal n3078_o : std_logic;
  signal n3079_o : std_logic;
  signal n3080_o : std_logic;
  signal n3081_o : std_logic;
  signal n3082_o : std_logic;
  signal n3083_o : std_logic;
  signal n3084_o : std_logic;
  signal n3085_o : std_logic;
  signal n3086_o : std_logic;
  signal n3087_o : std_logic;
  signal n3088_o : std_logic;
  signal n3089_o : std_logic;
  signal n3090_o : std_logic;
  signal n3091_o : std_logic;
  signal n3092_o : std_logic;
  signal n3093_o : std_logic;
  signal n3094_o : std_logic;
  signal n3095_o : std_logic;
  signal n3096_o : std_logic;
  signal n3097_o : std_logic;
  signal n3098_o : std_logic;
  signal n3099_o : std_logic;
  signal n3100_o : std_logic;
  signal n3101_o : std_logic_vector (3 downto 0);
  signal n3102_o : std_logic_vector (3 downto 0);
  signal n3103_o : std_logic_vector (3 downto 0);
  signal n3104_o : std_logic_vector (3 downto 0);
  signal n3105_o : std_logic_vector (3 downto 0);
  signal n3106_o : std_logic_vector (3 downto 0);
  signal n3107_o : std_logic_vector (3 downto 0);
  signal n3108_o : std_logic_vector (3 downto 0);
  signal n3109_o : std_logic_vector (3 downto 0);
  signal n3110_o : std_logic_vector (3 downto 0);
  signal n3111_o : std_logic_vector (2 downto 0);
  signal n3112_o : std_logic_vector (15 downto 0);
  signal n3113_o : std_logic_vector (15 downto 0);
  signal n3114_o : std_logic_vector (10 downto 0);
  signal n3115_o : std_logic_vector (42 downto 0);
  signal n3116_o : std_logic_vector (41 downto 0);
  signal n3117_o : std_logic_vector (42 downto 0);
  signal n3118_o : std_logic_vector (42 downto 0);
  signal n3136_o : std_logic_vector (43 downto 0);
  signal n3142_o : std_logic;
  signal n3143_o : std_logic;
  signal n3146_o : std_logic;
  signal n3147_o : std_logic;
  signal n3160_o : std_logic_vector (27 downto 0);
  signal n3166_o : std_logic;
  signal n3167_o : std_logic;
  signal n3170_o : std_logic;
  signal n3171_o : std_logic;
  constant n3173_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n3174_o : std_logic_vector (15 downto 0);
  signal n3175_o : std_logic_vector (43 downto 0);
  signal n3186_o : std_logic_vector (43 downto 0);
  signal n3197_o : std_logic_vector (42 downto 0);
  signal n3198_o : std_logic;
  signal n3203_o : std_logic;
  signal n3204_o : std_logic;
  signal n3207_o : std_logic;
  signal n3208_o : std_logic;
  signal n3211_o : std_logic;
  signal n3212_o : std_logic;
  signal n3219_o : std_logic;
  signal n3225_o : std_logic;
  signal n3226_o : std_logic;
  signal n3227_o : std_logic;
  signal n3228_o : std_logic;
  signal n3229_o : std_logic;
  signal n3230_o : std_logic;
  signal n3231_o : std_logic;
  signal n3232_o : std_logic;
  signal n3233_o : std_logic;
  signal n3234_o : std_logic;
  signal n3235_o : std_logic;
  signal n3236_o : std_logic;
  signal n3237_o : std_logic;
  signal n3238_o : std_logic;
  signal n3239_o : std_logic;
  signal n3240_o : std_logic;
  signal n3241_o : std_logic;
  signal n3242_o : std_logic;
  signal n3243_o : std_logic;
  signal n3244_o : std_logic;
  signal n3245_o : std_logic;
  signal n3246_o : std_logic;
  signal n3247_o : std_logic;
  signal n3248_o : std_logic;
  signal n3249_o : std_logic;
  signal n3250_o : std_logic;
  signal n3251_o : std_logic;
  signal n3252_o : std_logic;
  signal n3253_o : std_logic;
  signal n3254_o : std_logic;
  signal n3255_o : std_logic;
  signal n3256_o : std_logic;
  signal n3257_o : std_logic;
  signal n3258_o : std_logic;
  signal n3259_o : std_logic;
  signal n3260_o : std_logic;
  signal n3261_o : std_logic;
  signal n3262_o : std_logic;
  signal n3263_o : std_logic;
  signal n3264_o : std_logic;
  signal n3265_o : std_logic;
  signal n3266_o : std_logic;
  signal n3267_o : std_logic;
  signal n3268_o : std_logic_vector (3 downto 0);
  signal n3269_o : std_logic_vector (3 downto 0);
  signal n3270_o : std_logic_vector (3 downto 0);
  signal n3271_o : std_logic_vector (3 downto 0);
  signal n3272_o : std_logic_vector (3 downto 0);
  signal n3273_o : std_logic_vector (3 downto 0);
  signal n3274_o : std_logic_vector (3 downto 0);
  signal n3275_o : std_logic_vector (3 downto 0);
  signal n3276_o : std_logic_vector (3 downto 0);
  signal n3277_o : std_logic_vector (3 downto 0);
  signal n3278_o : std_logic_vector (2 downto 0);
  signal n3279_o : std_logic_vector (15 downto 0);
  signal n3280_o : std_logic_vector (15 downto 0);
  signal n3281_o : std_logic_vector (10 downto 0);
  signal n3282_o : std_logic_vector (42 downto 0);
  signal n3283_o : std_logic_vector (41 downto 0);
  signal n3284_o : std_logic_vector (42 downto 0);
  signal n3285_o : std_logic_vector (42 downto 0);
  signal n3301_o : std_logic_vector (40 downto 0);
  signal n3302_o : std_logic;
  signal n3307_o : std_logic;
  signal n3308_o : std_logic;
  signal n3311_o : std_logic;
  signal n3312_o : std_logic;
  signal n3315_o : std_logic;
  signal n3316_o : std_logic;
  signal n3323_o : std_logic;
  signal n3327_o : std_logic;
  signal n3329_o : std_logic;
  signal n3330_o : std_logic;
  signal n3332_o : std_logic;
  signal n3338_o : std_logic;
  signal n3341_o : std_logic;
  signal n3343_o : std_logic;
  signal n3344_o : std_logic;
  signal n3345_o : std_logic;
  signal n3346_o : std_logic;
  signal n3347_o : std_logic;
  signal n3348_o : std_logic;
  signal n3349_o : std_logic;
  signal n3350_o : std_logic;
  signal n3351_o : std_logic;
  signal n3352_o : std_logic;
  signal n3353_o : std_logic;
  signal n3354_o : std_logic;
  signal n3355_o : std_logic;
  signal n3356_o : std_logic;
  signal n3357_o : std_logic;
  signal n3358_o : std_logic;
  signal n3359_o : std_logic;
  signal n3360_o : std_logic;
  signal n3361_o : std_logic;
  signal n3362_o : std_logic;
  signal n3363_o : std_logic;
  signal n3364_o : std_logic;
  signal n3365_o : std_logic;
  signal n3366_o : std_logic;
  signal n3367_o : std_logic;
  signal n3368_o : std_logic_vector (3 downto 0);
  signal n3369_o : std_logic_vector (3 downto 0);
  signal n3370_o : std_logic_vector (3 downto 0);
  signal n3371_o : std_logic_vector (3 downto 0);
  signal n3372_o : std_logic_vector (3 downto 0);
  signal n3373_o : std_logic_vector (3 downto 0);
  signal n3374_o : std_logic_vector (15 downto 0);
  signal n3375_o : std_logic_vector (8 downto 0);
  signal n3376_o : std_logic_vector (24 downto 0);
  signal n3377_o : std_logic_vector (23 downto 0);
  signal n3378_o : std_logic_vector (24 downto 0);
  signal n3379_o : std_logic_vector (24 downto 0);
  signal n3380_o : std_logic_vector (24 downto 0);
  signal n3395_o : std_logic_vector (42 downto 0);
  signal n3398_o : std_logic_vector (42 downto 0);
  signal n3410_o : std_logic_vector (42 downto 0);
  signal n3413_o : std_logic_vector (42 downto 0);
  signal n3430_o : std_logic_vector (43 downto 0);
  signal n3436_o : std_logic;
  signal n3437_o : std_logic;
  signal n3440_o : std_logic;
  signal n3441_o : std_logic;
  signal n3454_o : std_logic_vector (43 downto 0);
  signal n3460_o : std_logic;
  signal n3461_o : std_logic;
  signal n3464_o : std_logic;
  signal n3465_o : std_logic;
  signal n3478_o : std_logic_vector (43 downto 0);
  signal n3489_o : std_logic_vector (42 downto 0);
  signal n3490_o : std_logic;
  signal n3495_o : std_logic;
  signal n3496_o : std_logic;
  signal n3499_o : std_logic;
  signal n3500_o : std_logic;
  signal n3503_o : std_logic;
  signal n3504_o : std_logic;
  signal n3511_o : std_logic;
  signal n3517_o : std_logic;
  signal n3518_o : std_logic;
  signal n3519_o : std_logic;
  signal n3520_o : std_logic;
  signal n3521_o : std_logic;
  signal n3522_o : std_logic;
  signal n3523_o : std_logic;
  signal n3524_o : std_logic;
  signal n3525_o : std_logic;
  signal n3526_o : std_logic;
  signal n3527_o : std_logic;
  signal n3528_o : std_logic;
  signal n3529_o : std_logic;
  signal n3530_o : std_logic;
  signal n3531_o : std_logic;
  signal n3532_o : std_logic;
  signal n3533_o : std_logic;
  signal n3534_o : std_logic;
  signal n3535_o : std_logic;
  signal n3536_o : std_logic;
  signal n3537_o : std_logic;
  signal n3538_o : std_logic;
  signal n3539_o : std_logic;
  signal n3540_o : std_logic;
  signal n3541_o : std_logic;
  signal n3542_o : std_logic;
  signal n3543_o : std_logic;
  signal n3544_o : std_logic;
  signal n3545_o : std_logic;
  signal n3546_o : std_logic;
  signal n3547_o : std_logic;
  signal n3548_o : std_logic;
  signal n3549_o : std_logic;
  signal n3550_o : std_logic;
  signal n3551_o : std_logic;
  signal n3552_o : std_logic;
  signal n3553_o : std_logic;
  signal n3554_o : std_logic;
  signal n3555_o : std_logic;
  signal n3556_o : std_logic;
  signal n3557_o : std_logic;
  signal n3558_o : std_logic;
  signal n3559_o : std_logic;
  signal n3560_o : std_logic_vector (3 downto 0);
  signal n3561_o : std_logic_vector (3 downto 0);
  signal n3562_o : std_logic_vector (3 downto 0);
  signal n3563_o : std_logic_vector (3 downto 0);
  signal n3564_o : std_logic_vector (3 downto 0);
  signal n3565_o : std_logic_vector (3 downto 0);
  signal n3566_o : std_logic_vector (3 downto 0);
  signal n3567_o : std_logic_vector (3 downto 0);
  signal n3568_o : std_logic_vector (3 downto 0);
  signal n3569_o : std_logic_vector (3 downto 0);
  signal n3570_o : std_logic_vector (2 downto 0);
  signal n3571_o : std_logic_vector (15 downto 0);
  signal n3572_o : std_logic_vector (15 downto 0);
  signal n3573_o : std_logic_vector (10 downto 0);
  signal n3574_o : std_logic_vector (42 downto 0);
  signal n3575_o : std_logic_vector (41 downto 0);
  signal n3576_o : std_logic_vector (42 downto 0);
  signal n3577_o : std_logic_vector (42 downto 0);
  signal n3593_o : std_logic_vector (40 downto 0);
  signal n3594_o : std_logic;
  signal n3599_o : std_logic;
  signal n3600_o : std_logic;
  signal n3603_o : std_logic;
  signal n3604_o : std_logic;
  signal n3607_o : std_logic;
  signal n3608_o : std_logic;
  signal n3615_o : std_logic;
  signal n3619_o : std_logic;
  signal n3621_o : std_logic;
  signal n3622_o : std_logic;
  signal n3624_o : std_logic;
  signal n3630_o : std_logic;
  signal n3633_o : std_logic;
  signal n3635_o : std_logic;
  signal n3636_o : std_logic;
  signal n3637_o : std_logic;
  signal n3638_o : std_logic;
  signal n3639_o : std_logic;
  signal n3640_o : std_logic;
  signal n3641_o : std_logic;
  signal n3642_o : std_logic;
  signal n3643_o : std_logic;
  signal n3644_o : std_logic;
  signal n3645_o : std_logic;
  signal n3646_o : std_logic;
  signal n3647_o : std_logic;
  signal n3648_o : std_logic;
  signal n3649_o : std_logic;
  signal n3650_o : std_logic;
  signal n3651_o : std_logic;
  signal n3652_o : std_logic;
  signal n3653_o : std_logic;
  signal n3654_o : std_logic;
  signal n3655_o : std_logic;
  signal n3656_o : std_logic;
  signal n3657_o : std_logic;
  signal n3658_o : std_logic;
  signal n3659_o : std_logic;
  signal n3660_o : std_logic_vector (3 downto 0);
  signal n3661_o : std_logic_vector (3 downto 0);
  signal n3662_o : std_logic_vector (3 downto 0);
  signal n3663_o : std_logic_vector (3 downto 0);
  signal n3664_o : std_logic_vector (3 downto 0);
  signal n3665_o : std_logic_vector (3 downto 0);
  signal n3666_o : std_logic_vector (15 downto 0);
  signal n3667_o : std_logic_vector (8 downto 0);
  signal n3668_o : std_logic_vector (24 downto 0);
  signal n3669_o : std_logic_vector (23 downto 0);
  signal n3670_o : std_logic_vector (24 downto 0);
  signal n3671_o : std_logic_vector (24 downto 0);
  signal n3672_o : std_logic_vector (24 downto 0);
  signal n3675_o : std_logic;
  signal n3676_o : std_logic_vector (2 downto 0);
  signal n3677_o : std_logic_vector (24 downto 0);
  signal n3678_o : std_logic_vector (24 downto 0);
  signal n3679_o : std_logic_vector (24 downto 0);
  signal n3680_o : std_logic_vector (24 downto 0);
  signal n3708_o : std_logic;
  signal n3709_o : std_logic_vector (24 downto 0);
  signal n3710_q : std_logic_vector (24 downto 0);
  signal n3711_o : std_logic;
  signal n3712_o : std_logic_vector (24 downto 0);
  signal n3713_q : std_logic_vector (24 downto 0);
  signal n3714_q : std_logic_vector (24 downto 0);
  signal n3715_q : std_logic_vector (24 downto 0);
  signal n3731_o : std_logic_vector (22 downto 0);
  signal n3732_o : std_logic;
  signal n3737_o : std_logic;
  signal n3738_o : std_logic;
  signal n3741_o : std_logic;
  signal n3742_o : std_logic;
  signal n3745_o : std_logic;
  signal n3746_o : std_logic;
  signal n3753_o : std_logic;
  signal n3757_o : std_logic;
  signal n3759_o : std_logic;
  signal n3760_o : std_logic;
  signal n3762_o : std_logic;
  signal n3768_o : std_logic;
  signal n3771_o : std_logic;
  signal n3773_o : std_logic;
  signal n3774_o : std_logic;
  signal n3775_o : std_logic;
  signal n3776_o : std_logic;
  signal n3777_o : std_logic;
  signal n3778_o : std_logic;
  signal n3779_o : std_logic;
  signal n3780_o : std_logic;
  signal n3781_o : std_logic;
  signal n3782_o : std_logic;
  signal n3783_o : std_logic;
  signal n3784_o : std_logic;
  signal n3785_o : std_logic;
  signal n3786_o : std_logic;
  signal n3787_o : std_logic;
  signal n3788_o : std_logic;
  signal n3789_o : std_logic;
  signal n3790_o : std_logic;
  signal n3791_o : std_logic_vector (3 downto 0);
  signal n3792_o : std_logic_vector (3 downto 0);
  signal n3793_o : std_logic_vector (3 downto 0);
  signal n3794_o : std_logic_vector (3 downto 0);
  signal n3795_o : std_logic_vector (1 downto 0);
  signal n3796_o : std_logic_vector (15 downto 0);
  signal n3797_o : std_logic_vector (17 downto 0);
  signal n3798_o : std_logic_vector (16 downto 0);
  signal n3799_o : std_logic_vector (17 downto 0);
  signal n3800_o : std_logic_vector (17 downto 0);
  signal n3801_o : std_logic_vector (17 downto 0);
begin
  ready_o <= n2598_o;
  valid_o <= n2603_o;
  data_o <= n3801_o;
  -- ../BiquadFilter/BiquadFilter.vhd:26:12
  state_reg <= n2594_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:12
  x_reg <= n3710_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:19
  y_reg <= n3713_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:26
  w_reg <= n3714_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:33
  v_reg <= n3715_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:33:15
  -- n2572_o <= '1' when rising_edge (clk_i) else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:36:21
  n2574_o <= state_reg when valid_i = '0' else "01";
  -- ../BiquadFilter/BiquadFilter.vhd:35:17
  n2576_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:39:17
  n2578_o <= '1' when state_reg = "01" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:41:17
  n2580_o <= '1' when state_reg = "10" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:44:21
  n2582_o <= state_reg when ready_i = '0' else "00";
  -- ../BiquadFilter/BiquadFilter.vhd:43:17
  n2584_o <= '1' when state_reg = "11" else '0';
  -- ../fixed_pkg.vhd:183:17
  n2585_o <= n2584_o & n2580_o & n2578_o & n2576_o;
  -- ../BiquadFilter/BiquadFilter.vhd:34:13
  with n2585_o select n2589_o <=
    n2582_o when "1000",
    "11" when "0100",
    "10" when "0010",
    n2574_o when "0001",
    "XX" when others;
  -- ../BiquadFilter/BiquadFilter.vhd:33:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n2594_q <= "00";
    elsif rising_edge (clk_i) then
      n2594_q <= n2589_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:51:35
  n2597_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:51:20
  n2598_o <= '0' when n2597_o = '0' else '1';
  -- ../BiquadFilter/BiquadFilter.vhd:52:35
  n2602_o <= '1' when state_reg = "11" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:52:20
  n2603_o <= '0' when n2602_o = '0' else '1';
  -- ../BiquadFilter/BiquadFilter.vhd:59:15
  -- n2606_o <= '1' when rising_edge (clk_i) else '0';
  -- ../fixed_pkg.vhd:168:39
  n2622_o <= std_logic_vector (resize (signed (data_i), 20));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n2628_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n2629_o <= n2628_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n2630: postponed assert n2629_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n2632_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n2633_o <= n2632_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n2634: postponed assert n2633_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:170:18
  n2636_o <= n2635_o (4 downto 0);
  n2637_o <= n2622_o & n2636_o;
  -- ../BiquadFilter/BiquadFilter.vhd:62:21
  n2638_o <= x_reg when valid_i = '0' else n2637_o;
  -- ../BiquadFilter/BiquadFilter.vhd:61:17
  n2640_o <= '1' when state_reg = "00" else '0';
  -- ../fixed_pkg.vhd:266:100
  n2654_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n2657_o <= std_logic_vector (resize (signed (n2654_o) * signed'("0000000000000000000000000000000000000000100"), 43));
  -- ../fixed_pkg.vhd:168:39
  n2674_o <= std_logic_vector (resize (signed (n2657_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n2680_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n2681_o <= n2680_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n2682: postponed assert n2681_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n2684_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n2685_o <= n2684_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n2686: postponed assert n2685_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n2698_o <= std_logic_vector (resize (signed (w_reg), 28));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n2704_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n2705_o <= n2704_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n2706: postponed assert n2705_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n2708_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n2709_o <= n2708_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n2710: postponed assert n2709_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:24:14
  n2712_o <= n2711_o (15 downto 0);
  -- ../fixed_pkg.vhd:24:14
  n2713_o <= n2698_o & n2712_o;
  -- ../fixed_pkg.vhd:255:67
  n2724_o <= std_logic_vector (unsigned (n2674_o) + unsigned (n2713_o));
  -- ../fixed_pkg.vhd:168:39
  n2735_o <= n2724_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n2736_o <= n2724_o (43);
  -- ../fixed_pkg.vhd:173:9
  n2741_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n2742_o <= n2741_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n2743: postponed assert n2742_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n2745_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n2746_o <= n2745_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n2747: postponed assert n2746_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n2749_o <= n2724_o (42);
  -- ../fixed_pkg.vhd:183:27
  n2750_o <= '1' when n2749_o /= n2736_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n2757_o <= '0' when n2750_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n2763_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2764_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2765_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2766_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2767_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2768_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2769_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2770_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2771_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2772_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2773_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2774_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2775_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2776_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2777_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2778_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2779_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2780_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2781_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2782_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2783_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2784_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2785_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2786_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2787_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2788_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2789_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2790_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2791_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2792_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2793_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2794_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2795_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2796_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2797_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2798_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2799_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2800_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2801_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2802_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2803_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2804_o <= not n2736_o;
  -- ../fixed_pkg.vhd:194:31
  n2805_o <= not n2736_o;
  -- ../fixed_pkg.vhd:30:14
  n2806_o <= n2763_o & n2764_o & n2765_o & n2766_o;
  -- ../fixed_pkg.vhd:169:40
  n2807_o <= n2767_o & n2768_o & n2769_o & n2770_o;
  -- ../fixed_pkg.vhd:9:14
  n2808_o <= n2771_o & n2772_o & n2773_o & n2774_o;
  -- ../fixed_pkg.vhd:9:14
  n2809_o <= n2775_o & n2776_o & n2777_o & n2778_o;
  -- ../fixed_pkg.vhd:32:14
  n2810_o <= n2779_o & n2780_o & n2781_o & n2782_o;
  -- ../fixed_pkg.vhd:9:14
  n2811_o <= n2783_o & n2784_o & n2785_o & n2786_o;
  -- ../fixed_pkg.vhd:24:14
  n2812_o <= n2787_o & n2788_o & n2789_o & n2790_o;
  -- ../fixed_pkg.vhd:24:14
  n2813_o <= n2791_o & n2792_o & n2793_o & n2794_o;
  -- ../fixed_pkg.vhd:9:14
  n2814_o <= n2795_o & n2796_o & n2797_o & n2798_o;
  -- ../fixed_pkg.vhd:24:14
  n2815_o <= n2799_o & n2800_o & n2801_o & n2802_o;
  -- ../fixed_pkg.vhd:9:14
  n2816_o <= n2803_o & n2804_o & n2805_o;
  -- ../fixed_pkg.vhd:171:18
  n2817_o <= n2806_o & n2807_o & n2808_o & n2809_o;
  n2818_o <= n2810_o & n2811_o & n2812_o & n2813_o;
  -- ../fixed_pkg.vhd:170:18
  n2819_o <= n2814_o & n2815_o & n2816_o;
  -- ../fixed_pkg.vhd:9:14
  n2820_o <= n2817_o & n2818_o & n2819_o;
  -- ../fixed_pkg.vhd:169:40
  n2821_o <= n2820_o (41 downto 0);
  -- ../fixed_pkg.vhd:9:14
  n2822_o <= n2736_o & n2821_o;
  -- ../fixed_pkg.vhd:193:9
  n2823_o <= n2735_o when n2757_o = '0' else n2822_o;
  -- ../fixed_pkg.vhd:168:39
  n2839_o <= n2823_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n2840_o <= n2823_o (42);
  -- ../fixed_pkg.vhd:173:9
  n2845_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n2846_o <= n2845_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n2847: postponed assert n2846_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n2849_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n2850_o <= n2849_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n2851: postponed assert n2850_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n2853_o <= n2823_o (41);
  -- ../fixed_pkg.vhd:183:27
  n2854_o <= '1' when n2853_o /= n2840_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n2861_o <= '0' when n2854_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n2865_o <= '1' when n2854_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n2867_o <= n2823_o (40);
  -- ../fixed_pkg.vhd:183:27
  n2868_o <= '1' when n2867_o /= n2840_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n2870_o <= n2861_o when n2879_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n2876_o <= n2868_o and n2865_o;
  -- ../fixed_pkg.vhd:183:17
  n2879_o <= n2865_o and n2876_o;
  -- ../fixed_pkg.vhd:194:31
  n2881_o <= not n2840_o;
  -- ../fixed_pkg.vhd:194:31
  n2882_o <= not n2840_o;
  -- ../fixed_pkg.vhd:194:31
  n2883_o <= not n2840_o;
  -- ../fixed_pkg.vhd:194:31
  n2884_o <= not n2840_o;
  -- ../fixed_pkg.vhd:194:31
  n2885_o <= not n2840_o;
  -- ../fixed_pkg.vhd:194:31
  n2886_o <= not n2840_o;
  -- ../fixed_pkg.vhd:194:31
  n2887_o <= not n2840_o;
  -- ../fixed_pkg.vhd:194:31
  n2888_o <= not n2840_o;
  -- ../fixed_pkg.vhd:194:31
  n2889_o <= not n2840_o;
  -- ../fixed_pkg.vhd:194:31
  n2890_o <= not n2840_o;
  -- ../fixed_pkg.vhd:194:31
  n2891_o <= not n2840_o;
  -- ../fixed_pkg.vhd:194:31
  n2892_o <= not n2840_o;
  -- ../fixed_pkg.vhd:194:31
  n2893_o <= not n2840_o;
  -- ../fixed_pkg.vhd:194:31
  n2894_o <= not n2840_o;
  -- ../fixed_pkg.vhd:194:31
  n2895_o <= not n2840_o;
  -- ../fixed_pkg.vhd:194:31
  n2896_o <= not n2840_o;
  -- ../fixed_pkg.vhd:194:31
  n2897_o <= not n2840_o;
  -- ../fixed_pkg.vhd:194:31
  n2898_o <= not n2840_o;
  -- ../fixed_pkg.vhd:194:31
  n2899_o <= not n2840_o;
  -- ../fixed_pkg.vhd:194:31
  n2900_o <= not n2840_o;
  -- ../fixed_pkg.vhd:194:31
  n2901_o <= not n2840_o;
  -- ../fixed_pkg.vhd:194:31
  n2902_o <= not n2840_o;
  -- ../fixed_pkg.vhd:194:31
  n2903_o <= not n2840_o;
  -- ../fixed_pkg.vhd:194:31
  n2904_o <= not n2840_o;
  -- ../fixed_pkg.vhd:194:31
  n2905_o <= not n2840_o;
  -- ../fixed_pkg.vhd:30:14
  n2906_o <= n2881_o & n2882_o & n2883_o & n2884_o;
  -- ../fixed_pkg.vhd:9:14
  n2907_o <= n2885_o & n2886_o & n2887_o & n2888_o;
  -- ../fixed_pkg.vhd:9:14
  n2908_o <= n2889_o & n2890_o & n2891_o & n2892_o;
  -- ../fixed_pkg.vhd:28:14
  n2909_o <= n2893_o & n2894_o & n2895_o & n2896_o;
  -- ../fixed_pkg.vhd:9:14
  n2910_o <= n2897_o & n2898_o & n2899_o & n2900_o;
  -- ../fixed_pkg.vhd:40:14
  n2911_o <= n2901_o & n2902_o & n2903_o & n2904_o;
  -- ../fixed_pkg.vhd:40:14
  n2912_o <= n2906_o & n2907_o & n2908_o & n2909_o;
  -- ../fixed_pkg.vhd:32:14
  n2913_o <= n2910_o & n2911_o & n2905_o;
  -- ../fixed_pkg.vhd:40:14
  n2914_o <= n2912_o & n2913_o;
  -- ../fixed_pkg.vhd:9:14
  n2915_o <= n2914_o (23 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n2916_o <= n2839_o (40 downto 16);
  -- ../fixed_pkg.vhd:183:17
  n2917_o <= n2840_o & n2915_o;
  -- ../fixed_pkg.vhd:193:9
  n2918_o <= n2916_o when n2870_o = '0' else n2917_o;
  -- ../BiquadFilter/BiquadFilter.vhd:65:17
  n2921_o <= '1' when state_reg = "01" else '0';
  -- ../fixed_pkg.vhd:266:100
  n2936_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n2939_o <= std_logic_vector (resize (signed (n2936_o) * signed'("0000000000000000000000000000000000000001000"), 43));
  -- ../fixed_pkg.vhd:266:100
  n2951_o <= std_logic_vector (resize (signed (y_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n2954_o <= std_logic_vector (resize (signed (n2951_o) * signed'("0000000000011111111111111100000010110111110"), 43));
  -- ../fixed_pkg.vhd:168:39
  n2971_o <= std_logic_vector (resize (signed (n2939_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n2977_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n2978_o <= n2977_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n2979: postponed assert n2978_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n2981_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n2982_o <= n2981_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n2983: postponed assert n2982_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n2995_o <= std_logic_vector (resize (signed (n2954_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n3001_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n3002_o <= n3001_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n3003: postponed assert n3002_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n3005_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n3006_o <= n3005_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n3007: postponed assert n3006_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:240:67
  n3019_o <= std_logic_vector (unsigned (n2971_o) - unsigned (n2995_o));
  -- ../fixed_pkg.vhd:168:39
  n3030_o <= n3019_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n3031_o <= n3019_o (43);
  -- ../fixed_pkg.vhd:173:9
  n3036_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n3037_o <= n3036_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n3038: postponed assert n3037_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n3040_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n3041_o <= n3040_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n3042: postponed assert n3041_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n3044_o <= n3019_o (42);
  -- ../fixed_pkg.vhd:183:27
  n3045_o <= '1' when n3044_o /= n3031_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n3052_o <= '0' when n3045_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n3058_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3059_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3060_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3061_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3062_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3063_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3064_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3065_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3066_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3067_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3068_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3069_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3070_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3071_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3072_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3073_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3074_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3075_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3076_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3077_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3078_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3079_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3080_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3081_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3082_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3083_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3084_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3085_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3086_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3087_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3088_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3089_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3090_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3091_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3092_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3093_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3094_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3095_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3096_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3097_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3098_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3099_o <= not n3031_o;
  -- ../fixed_pkg.vhd:194:31
  n3100_o <= not n3031_o;
  n3101_o <= n3058_o & n3059_o & n3060_o & n3061_o;
  n3102_o <= n3062_o & n3063_o & n3064_o & n3065_o;
  n3103_o <= n3066_o & n3067_o & n3068_o & n3069_o;
  n3104_o <= n3070_o & n3071_o & n3072_o & n3073_o;
  n3105_o <= n3074_o & n3075_o & n3076_o & n3077_o;
  n3106_o <= n3078_o & n3079_o & n3080_o & n3081_o;
  n3107_o <= n3082_o & n3083_o & n3084_o & n3085_o;
  n3108_o <= n3086_o & n3087_o & n3088_o & n3089_o;
  n3109_o <= n3090_o & n3091_o & n3092_o & n3093_o;
  n3110_o <= n3094_o & n3095_o & n3096_o & n3097_o;
  n3111_o <= n3098_o & n3099_o & n3100_o;
  n3112_o <= n3101_o & n3102_o & n3103_o & n3104_o;
  n3113_o <= n3105_o & n3106_o & n3107_o & n3108_o;
  n3114_o <= n3109_o & n3110_o & n3111_o;
  n3115_o <= n3112_o & n3113_o & n3114_o;
  n3116_o <= n3115_o (41 downto 0);
  n3117_o <= n3031_o & n3116_o;
  -- ../fixed_pkg.vhd:193:9
  n3118_o <= n3030_o when n3052_o = '0' else n3117_o;
  -- ../fixed_pkg.vhd:168:39
  n3136_o <= std_logic_vector (resize (signed (n3118_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n3142_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n3143_o <= n3142_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n3144: postponed assert n3143_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n3146_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n3147_o <= n3146_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n3148: postponed assert n3147_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n3160_o <= std_logic_vector (resize (signed (v_reg), 28));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n3166_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n3167_o <= n3166_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n3168: postponed assert n3167_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n3170_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n3171_o <= n3170_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n3172: postponed assert n3171_o = '1' severity error; --  assert
  n3174_o <= n3173_o (15 downto 0);
  n3175_o <= n3160_o & n3174_o;
  -- ../fixed_pkg.vhd:255:67
  n3186_o <= std_logic_vector (unsigned (n3136_o) + unsigned (n3175_o));
  -- ../fixed_pkg.vhd:168:39
  n3197_o <= n3186_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n3198_o <= n3186_o (43);
  -- ../fixed_pkg.vhd:173:9
  n3203_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n3204_o <= n3203_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n3205: postponed assert n3204_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n3207_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n3208_o <= n3207_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n3209: postponed assert n3208_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n3211_o <= n3186_o (42);
  -- ../fixed_pkg.vhd:183:27
  n3212_o <= '1' when n3211_o /= n3198_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n3219_o <= '0' when n3212_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n3225_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3226_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3227_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3228_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3229_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3230_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3231_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3232_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3233_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3234_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3235_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3236_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3237_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3238_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3239_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3240_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3241_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3242_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3243_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3244_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3245_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3246_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3247_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3248_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3249_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3250_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3251_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3252_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3253_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3254_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3255_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3256_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3257_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3258_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3259_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3260_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3261_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3262_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3263_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3264_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3265_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3266_o <= not n3198_o;
  -- ../fixed_pkg.vhd:194:31
  n3267_o <= not n3198_o;
  n3268_o <= n3225_o & n3226_o & n3227_o & n3228_o;
  n3269_o <= n3229_o & n3230_o & n3231_o & n3232_o;
  n3270_o <= n3233_o & n3234_o & n3235_o & n3236_o;
  n3271_o <= n3237_o & n3238_o & n3239_o & n3240_o;
  n3272_o <= n3241_o & n3242_o & n3243_o & n3244_o;
  n3273_o <= n3245_o & n3246_o & n3247_o & n3248_o;
  n3274_o <= n3249_o & n3250_o & n3251_o & n3252_o;
  n3275_o <= n3253_o & n3254_o & n3255_o & n3256_o;
  n3276_o <= n3257_o & n3258_o & n3259_o & n3260_o;
  n3277_o <= n3261_o & n3262_o & n3263_o & n3264_o;
  n3278_o <= n3265_o & n3266_o & n3267_o;
  n3279_o <= n3268_o & n3269_o & n3270_o & n3271_o;
  n3280_o <= n3272_o & n3273_o & n3274_o & n3275_o;
  n3281_o <= n3276_o & n3277_o & n3278_o;
  n3282_o <= n3279_o & n3280_o & n3281_o;
  n3283_o <= n3282_o (41 downto 0);
  n3284_o <= n3198_o & n3283_o;
  -- ../fixed_pkg.vhd:193:9
  n3285_o <= n3197_o when n3219_o = '0' else n3284_o;
  -- ../fixed_pkg.vhd:168:39
  n3301_o <= n3285_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n3302_o <= n3285_o (42);
  -- ../fixed_pkg.vhd:173:9
  n3307_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n3308_o <= n3307_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n3309: postponed assert n3308_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n3311_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n3312_o <= n3311_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n3313: postponed assert n3312_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n3315_o <= n3285_o (41);
  -- ../fixed_pkg.vhd:183:27
  n3316_o <= '1' when n3315_o /= n3302_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n3323_o <= '0' when n3316_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n3327_o <= '1' when n3316_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n3329_o <= n3285_o (40);
  -- ../fixed_pkg.vhd:183:27
  n3330_o <= '1' when n3329_o /= n3302_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n3332_o <= n3323_o when n3341_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n3338_o <= n3330_o and n3327_o;
  -- ../fixed_pkg.vhd:183:17
  n3341_o <= n3327_o and n3338_o;
  -- ../fixed_pkg.vhd:194:31
  n3343_o <= not n3302_o;
  -- ../fixed_pkg.vhd:194:31
  n3344_o <= not n3302_o;
  -- ../fixed_pkg.vhd:194:31
  n3345_o <= not n3302_o;
  -- ../fixed_pkg.vhd:194:31
  n3346_o <= not n3302_o;
  -- ../fixed_pkg.vhd:194:31
  n3347_o <= not n3302_o;
  -- ../fixed_pkg.vhd:194:31
  n3348_o <= not n3302_o;
  -- ../fixed_pkg.vhd:194:31
  n3349_o <= not n3302_o;
  -- ../fixed_pkg.vhd:194:31
  n3350_o <= not n3302_o;
  -- ../fixed_pkg.vhd:194:31
  n3351_o <= not n3302_o;
  -- ../fixed_pkg.vhd:194:31
  n3352_o <= not n3302_o;
  -- ../fixed_pkg.vhd:194:31
  n3353_o <= not n3302_o;
  -- ../fixed_pkg.vhd:194:31
  n3354_o <= not n3302_o;
  -- ../fixed_pkg.vhd:194:31
  n3355_o <= not n3302_o;
  -- ../fixed_pkg.vhd:194:31
  n3356_o <= not n3302_o;
  -- ../fixed_pkg.vhd:194:31
  n3357_o <= not n3302_o;
  -- ../fixed_pkg.vhd:194:31
  n3358_o <= not n3302_o;
  -- ../fixed_pkg.vhd:194:31
  n3359_o <= not n3302_o;
  -- ../fixed_pkg.vhd:194:31
  n3360_o <= not n3302_o;
  -- ../fixed_pkg.vhd:194:31
  n3361_o <= not n3302_o;
  -- ../fixed_pkg.vhd:194:31
  n3362_o <= not n3302_o;
  -- ../fixed_pkg.vhd:194:31
  n3363_o <= not n3302_o;
  -- ../fixed_pkg.vhd:194:31
  n3364_o <= not n3302_o;
  -- ../fixed_pkg.vhd:194:31
  n3365_o <= not n3302_o;
  -- ../fixed_pkg.vhd:194:31
  n3366_o <= not n3302_o;
  -- ../fixed_pkg.vhd:194:31
  n3367_o <= not n3302_o;
  n3368_o <= n3343_o & n3344_o & n3345_o & n3346_o;
  n3369_o <= n3347_o & n3348_o & n3349_o & n3350_o;
  n3370_o <= n3351_o & n3352_o & n3353_o & n3354_o;
  n3371_o <= n3355_o & n3356_o & n3357_o & n3358_o;
  n3372_o <= n3359_o & n3360_o & n3361_o & n3362_o;
  n3373_o <= n3363_o & n3364_o & n3365_o & n3366_o;
  n3374_o <= n3368_o & n3369_o & n3370_o & n3371_o;
  n3375_o <= n3372_o & n3373_o & n3367_o;
  n3376_o <= n3374_o & n3375_o;
  n3377_o <= n3376_o (23 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n3378_o <= n3301_o (40 downto 16);
  n3379_o <= n3302_o & n3377_o;
  -- ../fixed_pkg.vhd:193:9
  n3380_o <= n3378_o when n3332_o = '0' else n3379_o;
  -- ../fixed_pkg.vhd:266:100
  n3395_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n3398_o <= std_logic_vector (resize (signed (n3395_o) * signed'("0000000000000000000000000000000000000000100"), 43));
  -- ../fixed_pkg.vhd:266:100
  n3410_o <= std_logic_vector (resize (signed (y_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n3413_o <= std_logic_vector (resize (signed (n3410_o) * signed'("0000000000000000000000000001111101001010010"), 43));
  -- ../fixed_pkg.vhd:168:39
  n3430_o <= std_logic_vector (resize (signed (n3398_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n3436_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n3437_o <= n3436_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n3438: postponed assert n3437_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n3440_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n3441_o <= n3440_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n3442: postponed assert n3441_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n3454_o <= std_logic_vector (resize (signed (n3413_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n3460_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n3461_o <= n3460_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n3462: postponed assert n3461_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n3464_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n3465_o <= n3464_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n3466: postponed assert n3465_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:240:67
  n3478_o <= std_logic_vector (unsigned (n3430_o) - unsigned (n3454_o));
  -- ../fixed_pkg.vhd:168:39
  n3489_o <= n3478_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n3490_o <= n3478_o (43);
  -- ../fixed_pkg.vhd:173:9
  n3495_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n3496_o <= n3495_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n3497: postponed assert n3496_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n3499_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n3500_o <= n3499_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n3501: postponed assert n3500_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n3503_o <= n3478_o (42);
  -- ../fixed_pkg.vhd:183:27
  n3504_o <= '1' when n3503_o /= n3490_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n3511_o <= '0' when n3504_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n3517_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3518_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3519_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3520_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3521_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3522_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3523_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3524_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3525_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3526_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3527_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3528_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3529_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3530_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3531_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3532_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3533_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3534_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3535_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3536_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3537_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3538_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3539_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3540_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3541_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3542_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3543_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3544_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3545_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3546_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3547_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3548_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3549_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3550_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3551_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3552_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3553_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3554_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3555_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3556_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3557_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3558_o <= not n3490_o;
  -- ../fixed_pkg.vhd:194:31
  n3559_o <= not n3490_o;
  n3560_o <= n3517_o & n3518_o & n3519_o & n3520_o;
  n3561_o <= n3521_o & n3522_o & n3523_o & n3524_o;
  n3562_o <= n3525_o & n3526_o & n3527_o & n3528_o;
  n3563_o <= n3529_o & n3530_o & n3531_o & n3532_o;
  n3564_o <= n3533_o & n3534_o & n3535_o & n3536_o;
  n3565_o <= n3537_o & n3538_o & n3539_o & n3540_o;
  n3566_o <= n3541_o & n3542_o & n3543_o & n3544_o;
  n3567_o <= n3545_o & n3546_o & n3547_o & n3548_o;
  n3568_o <= n3549_o & n3550_o & n3551_o & n3552_o;
  n3569_o <= n3553_o & n3554_o & n3555_o & n3556_o;
  n3570_o <= n3557_o & n3558_o & n3559_o;
  n3571_o <= n3560_o & n3561_o & n3562_o & n3563_o;
  n3572_o <= n3564_o & n3565_o & n3566_o & n3567_o;
  n3573_o <= n3568_o & n3569_o & n3570_o;
  n3574_o <= n3571_o & n3572_o & n3573_o;
  n3575_o <= n3574_o (41 downto 0);
  n3576_o <= n3490_o & n3575_o;
  -- ../fixed_pkg.vhd:193:9
  n3577_o <= n3489_o when n3511_o = '0' else n3576_o;
  -- ../fixed_pkg.vhd:168:39
  n3593_o <= n3577_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n3594_o <= n3577_o (42);
  -- ../fixed_pkg.vhd:173:9
  n3599_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n3600_o <= n3599_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n3601: postponed assert n3600_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n3603_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n3604_o <= n3603_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n3605: postponed assert n3604_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n3607_o <= n3577_o (41);
  -- ../fixed_pkg.vhd:183:27
  n3608_o <= '1' when n3607_o /= n3594_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n3615_o <= '0' when n3608_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n3619_o <= '1' when n3608_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n3621_o <= n3577_o (40);
  -- ../fixed_pkg.vhd:183:27
  n3622_o <= '1' when n3621_o /= n3594_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n3624_o <= n3615_o when n3633_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n3630_o <= n3622_o and n3619_o;
  -- ../fixed_pkg.vhd:183:17
  n3633_o <= n3619_o and n3630_o;
  -- ../fixed_pkg.vhd:194:31
  n3635_o <= not n3594_o;
  -- ../fixed_pkg.vhd:194:31
  n3636_o <= not n3594_o;
  -- ../fixed_pkg.vhd:194:31
  n3637_o <= not n3594_o;
  -- ../fixed_pkg.vhd:194:31
  n3638_o <= not n3594_o;
  -- ../fixed_pkg.vhd:194:31
  n3639_o <= not n3594_o;
  -- ../fixed_pkg.vhd:194:31
  n3640_o <= not n3594_o;
  -- ../fixed_pkg.vhd:194:31
  n3641_o <= not n3594_o;
  -- ../fixed_pkg.vhd:194:31
  n3642_o <= not n3594_o;
  -- ../fixed_pkg.vhd:194:31
  n3643_o <= not n3594_o;
  -- ../fixed_pkg.vhd:194:31
  n3644_o <= not n3594_o;
  -- ../fixed_pkg.vhd:194:31
  n3645_o <= not n3594_o;
  -- ../fixed_pkg.vhd:194:31
  n3646_o <= not n3594_o;
  -- ../fixed_pkg.vhd:194:31
  n3647_o <= not n3594_o;
  -- ../fixed_pkg.vhd:194:31
  n3648_o <= not n3594_o;
  -- ../fixed_pkg.vhd:194:31
  n3649_o <= not n3594_o;
  -- ../fixed_pkg.vhd:194:31
  n3650_o <= not n3594_o;
  -- ../fixed_pkg.vhd:194:31
  n3651_o <= not n3594_o;
  -- ../fixed_pkg.vhd:194:31
  n3652_o <= not n3594_o;
  -- ../fixed_pkg.vhd:194:31
  n3653_o <= not n3594_o;
  -- ../fixed_pkg.vhd:194:31
  n3654_o <= not n3594_o;
  -- ../fixed_pkg.vhd:194:31
  n3655_o <= not n3594_o;
  -- ../fixed_pkg.vhd:194:31
  n3656_o <= not n3594_o;
  -- ../fixed_pkg.vhd:194:31
  n3657_o <= not n3594_o;
  -- ../fixed_pkg.vhd:194:31
  n3658_o <= not n3594_o;
  -- ../fixed_pkg.vhd:194:31
  n3659_o <= not n3594_o;
  n3660_o <= n3635_o & n3636_o & n3637_o & n3638_o;
  n3661_o <= n3639_o & n3640_o & n3641_o & n3642_o;
  n3662_o <= n3643_o & n3644_o & n3645_o & n3646_o;
  n3663_o <= n3647_o & n3648_o & n3649_o & n3650_o;
  n3664_o <= n3651_o & n3652_o & n3653_o & n3654_o;
  n3665_o <= n3655_o & n3656_o & n3657_o & n3658_o;
  n3666_o <= n3660_o & n3661_o & n3662_o & n3663_o;
  n3667_o <= n3664_o & n3665_o & n3659_o;
  n3668_o <= n3666_o & n3667_o;
  n3669_o <= n3668_o (23 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n3670_o <= n3593_o (40 downto 16);
  n3671_o <= n3594_o & n3669_o;
  -- ../fixed_pkg.vhd:193:9
  n3672_o <= n3670_o when n3624_o = '0' else n3671_o;
  -- ../BiquadFilter/BiquadFilter.vhd:67:17
  n3675_o <= '1' when state_reg = "10" else '0';
  n3676_o <= n3675_o & n2921_o & n2640_o;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n3676_o select n3677_o <=
    x_reg when "100",
    x_reg when "010",
    n2638_o when "001",
    x_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n3676_o select n3678_o <=
    y_reg when "100",
    n2918_o when "010",
    y_reg when "001",
    y_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n3676_o select n3679_o <=
    n3380_o when "100",
    w_reg when "010",
    w_reg when "001",
    w_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n3676_o select n3680_o <=
    n3672_o when "100",
    v_reg when "010",
    v_reg when "001",
    v_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n3708_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n3709_o <= x_reg when n3708_o = '0' else n3677_o;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n3710_q <= n3709_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n3711_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n3712_o <= y_reg when n3711_o = '0' else n3678_o;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n3713_q <= n3712_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n3714_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n3714_q <= n3679_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n3715_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n3715_q <= n3680_o;
    end if;
  end process;
  -- ../fixed_pkg.vhd:168:39
  n3731_o <= y_reg (22 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n3732_o <= y_reg (24);
  -- ../fixed_pkg.vhd:173:9
  n3737_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n3738_o <= n3737_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n3739: postponed assert n3738_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n3741_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n3742_o <= n3741_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n3743: postponed assert n3742_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n3745_o <= y_reg (23);
  -- ../fixed_pkg.vhd:183:27
  n3746_o <= '1' when n3745_o /= n3732_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n3753_o <= '0' when n3746_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n3757_o <= '1' when n3746_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n3759_o <= y_reg (22);
  -- ../fixed_pkg.vhd:183:27
  n3760_o <= '1' when n3759_o /= n3732_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n3762_o <= n3753_o when n3771_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n3768_o <= n3760_o and n3757_o;
  -- ../fixed_pkg.vhd:183:17
  n3771_o <= n3757_o and n3768_o;
  -- ../fixed_pkg.vhd:194:31
  n3773_o <= not n3732_o;
  -- ../fixed_pkg.vhd:194:31
  n3774_o <= not n3732_o;
  -- ../fixed_pkg.vhd:194:31
  n3775_o <= not n3732_o;
  -- ../fixed_pkg.vhd:194:31
  n3776_o <= not n3732_o;
  -- ../fixed_pkg.vhd:194:31
  n3777_o <= not n3732_o;
  -- ../fixed_pkg.vhd:194:31
  n3778_o <= not n3732_o;
  -- ../fixed_pkg.vhd:194:31
  n3779_o <= not n3732_o;
  -- ../fixed_pkg.vhd:194:31
  n3780_o <= not n3732_o;
  -- ../fixed_pkg.vhd:194:31
  n3781_o <= not n3732_o;
  -- ../fixed_pkg.vhd:194:31
  n3782_o <= not n3732_o;
  -- ../fixed_pkg.vhd:194:31
  n3783_o <= not n3732_o;
  -- ../fixed_pkg.vhd:194:31
  n3784_o <= not n3732_o;
  -- ../fixed_pkg.vhd:194:31
  n3785_o <= not n3732_o;
  -- ../fixed_pkg.vhd:194:31
  n3786_o <= not n3732_o;
  -- ../fixed_pkg.vhd:194:31
  n3787_o <= not n3732_o;
  -- ../fixed_pkg.vhd:194:31
  n3788_o <= not n3732_o;
  -- ../fixed_pkg.vhd:194:31
  n3789_o <= not n3732_o;
  -- ../fixed_pkg.vhd:194:31
  n3790_o <= not n3732_o;
  n3791_o <= n3773_o & n3774_o & n3775_o & n3776_o;
  n3792_o <= n3777_o & n3778_o & n3779_o & n3780_o;
  n3793_o <= n3781_o & n3782_o & n3783_o & n3784_o;
  n3794_o <= n3785_o & n3786_o & n3787_o & n3788_o;
  n3795_o <= n3789_o & n3790_o;
  n3796_o <= n3791_o & n3792_o & n3793_o & n3794_o;
  n3797_o <= n3796_o & n3795_o;
  n3798_o <= n3797_o (16 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n3799_o <= n3731_o (22 downto 5);
  n3800_o <= n3732_o & n3798_o;
  -- ../fixed_pkg.vhd:193:9
  n3801_o <= n3799_o when n3762_o = '0' else n3800_o;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity biquadfilter_b8edb8c1ddb8ce49b98343d308dc8c4d73c37c7f is
  port (
    clk_i : in std_logic;
    reset_i : in std_logic;
    valid_i : in std_logic;
    data_i : in std_logic_vector (17 downto 0);
    ready_i : in std_logic;
    ready_o : out std_logic;
    valid_o : out std_logic;
    data_o : out std_logic_vector (17 downto 0));
end entity biquadfilter_b8edb8c1ddb8ce49b98343d308dc8c4d73c37c7f;

architecture rtl of biquadfilter_b8edb8c1ddb8ce49b98343d308dc8c4d73c37c7f is
  signal state_reg : std_logic_vector (1 downto 0);
  signal x_reg : std_logic_vector (24 downto 0);
  signal y_reg : std_logic_vector (24 downto 0);
  signal w_reg : std_logic_vector (24 downto 0);
  signal v_reg : std_logic_vector (24 downto 0);
  signal n1336_o : std_logic;
  signal n1338_o : std_logic_vector (1 downto 0);
  signal n1340_o : std_logic;
  signal n1342_o : std_logic;
  signal n1344_o : std_logic;
  signal n1346_o : std_logic_vector (1 downto 0);
  signal n1348_o : std_logic;
  signal n1349_o : std_logic_vector (3 downto 0);
  signal n1353_o : std_logic_vector (1 downto 0);
  signal n1358_q : std_logic_vector (1 downto 0);
  signal n1361_o : std_logic;
  signal n1362_o : std_logic;
  signal n1366_o : std_logic;
  signal n1367_o : std_logic;
  signal n1370_o : std_logic;
  signal n1386_o : std_logic_vector (19 downto 0);
  signal n1392_o : std_logic;
  signal n1393_o : std_logic;
  signal n1396_o : std_logic;
  signal n1397_o : std_logic;
  constant n1399_o : std_logic_vector (24 downto 0) := "0000000000000000000000000";
  signal n1400_o : std_logic_vector (4 downto 0);
  signal n1401_o : std_logic_vector (24 downto 0);
  signal n1402_o : std_logic_vector (24 downto 0);
  signal n1404_o : std_logic;
  signal n1418_o : std_logic_vector (42 downto 0);
  signal n1421_o : std_logic_vector (42 downto 0);
  signal n1438_o : std_logic_vector (43 downto 0);
  signal n1444_o : std_logic;
  signal n1445_o : std_logic;
  signal n1448_o : std_logic;
  signal n1449_o : std_logic;
  signal n1462_o : std_logic_vector (27 downto 0);
  signal n1468_o : std_logic;
  signal n1469_o : std_logic;
  signal n1472_o : std_logic;
  signal n1473_o : std_logic;
  constant n1475_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n1476_o : std_logic_vector (15 downto 0);
  signal n1477_o : std_logic_vector (43 downto 0);
  signal n1488_o : std_logic_vector (43 downto 0);
  signal n1499_o : std_logic_vector (42 downto 0);
  signal n1500_o : std_logic;
  signal n1505_o : std_logic;
  signal n1506_o : std_logic;
  signal n1509_o : std_logic;
  signal n1510_o : std_logic;
  signal n1513_o : std_logic;
  signal n1514_o : std_logic;
  signal n1521_o : std_logic;
  signal n1527_o : std_logic;
  signal n1528_o : std_logic;
  signal n1529_o : std_logic;
  signal n1530_o : std_logic;
  signal n1531_o : std_logic;
  signal n1532_o : std_logic;
  signal n1533_o : std_logic;
  signal n1534_o : std_logic;
  signal n1535_o : std_logic;
  signal n1536_o : std_logic;
  signal n1537_o : std_logic;
  signal n1538_o : std_logic;
  signal n1539_o : std_logic;
  signal n1540_o : std_logic;
  signal n1541_o : std_logic;
  signal n1542_o : std_logic;
  signal n1543_o : std_logic;
  signal n1544_o : std_logic;
  signal n1545_o : std_logic;
  signal n1546_o : std_logic;
  signal n1547_o : std_logic;
  signal n1548_o : std_logic;
  signal n1549_o : std_logic;
  signal n1550_o : std_logic;
  signal n1551_o : std_logic;
  signal n1552_o : std_logic;
  signal n1553_o : std_logic;
  signal n1554_o : std_logic;
  signal n1555_o : std_logic;
  signal n1556_o : std_logic;
  signal n1557_o : std_logic;
  signal n1558_o : std_logic;
  signal n1559_o : std_logic;
  signal n1560_o : std_logic;
  signal n1561_o : std_logic;
  signal n1562_o : std_logic;
  signal n1563_o : std_logic;
  signal n1564_o : std_logic;
  signal n1565_o : std_logic;
  signal n1566_o : std_logic;
  signal n1567_o : std_logic;
  signal n1568_o : std_logic;
  signal n1569_o : std_logic;
  signal n1570_o : std_logic_vector (3 downto 0);
  signal n1571_o : std_logic_vector (3 downto 0);
  signal n1572_o : std_logic_vector (3 downto 0);
  signal n1573_o : std_logic_vector (3 downto 0);
  signal n1574_o : std_logic_vector (3 downto 0);
  signal n1575_o : std_logic_vector (3 downto 0);
  signal n1576_o : std_logic_vector (3 downto 0);
  signal n1577_o : std_logic_vector (3 downto 0);
  signal n1578_o : std_logic_vector (3 downto 0);
  signal n1579_o : std_logic_vector (3 downto 0);
  signal n1580_o : std_logic_vector (2 downto 0);
  signal n1581_o : std_logic_vector (15 downto 0);
  signal n1582_o : std_logic_vector (15 downto 0);
  signal n1583_o : std_logic_vector (10 downto 0);
  signal n1584_o : std_logic_vector (42 downto 0);
  signal n1585_o : std_logic_vector (41 downto 0);
  signal n1586_o : std_logic_vector (42 downto 0);
  signal n1587_o : std_logic_vector (42 downto 0);
  signal n1603_o : std_logic_vector (40 downto 0);
  signal n1604_o : std_logic;
  signal n1609_o : std_logic;
  signal n1610_o : std_logic;
  signal n1613_o : std_logic;
  signal n1614_o : std_logic;
  signal n1617_o : std_logic;
  signal n1618_o : std_logic;
  signal n1625_o : std_logic;
  signal n1629_o : std_logic;
  signal n1631_o : std_logic;
  signal n1632_o : std_logic;
  signal n1634_o : std_logic;
  signal n1640_o : std_logic;
  signal n1643_o : std_logic;
  signal n1645_o : std_logic;
  signal n1646_o : std_logic;
  signal n1647_o : std_logic;
  signal n1648_o : std_logic;
  signal n1649_o : std_logic;
  signal n1650_o : std_logic;
  signal n1651_o : std_logic;
  signal n1652_o : std_logic;
  signal n1653_o : std_logic;
  signal n1654_o : std_logic;
  signal n1655_o : std_logic;
  signal n1656_o : std_logic;
  signal n1657_o : std_logic;
  signal n1658_o : std_logic;
  signal n1659_o : std_logic;
  signal n1660_o : std_logic;
  signal n1661_o : std_logic;
  signal n1662_o : std_logic;
  signal n1663_o : std_logic;
  signal n1664_o : std_logic;
  signal n1665_o : std_logic;
  signal n1666_o : std_logic;
  signal n1667_o : std_logic;
  signal n1668_o : std_logic;
  signal n1669_o : std_logic;
  signal n1670_o : std_logic_vector (3 downto 0);
  signal n1671_o : std_logic_vector (3 downto 0);
  signal n1672_o : std_logic_vector (3 downto 0);
  signal n1673_o : std_logic_vector (3 downto 0);
  signal n1674_o : std_logic_vector (3 downto 0);
  signal n1675_o : std_logic_vector (3 downto 0);
  signal n1676_o : std_logic_vector (15 downto 0);
  signal n1677_o : std_logic_vector (8 downto 0);
  signal n1678_o : std_logic_vector (24 downto 0);
  signal n1679_o : std_logic_vector (23 downto 0);
  signal n1680_o : std_logic_vector (24 downto 0);
  signal n1681_o : std_logic_vector (24 downto 0);
  signal n1682_o : std_logic_vector (24 downto 0);
  signal n1685_o : std_logic;
  signal n1700_o : std_logic_vector (42 downto 0);
  signal n1703_o : std_logic_vector (42 downto 0);
  signal n1715_o : std_logic_vector (42 downto 0);
  signal n1718_o : std_logic_vector (42 downto 0);
  signal n1735_o : std_logic_vector (43 downto 0);
  signal n1741_o : std_logic;
  signal n1742_o : std_logic;
  signal n1745_o : std_logic;
  signal n1746_o : std_logic;
  signal n1759_o : std_logic_vector (43 downto 0);
  signal n1765_o : std_logic;
  signal n1766_o : std_logic;
  signal n1769_o : std_logic;
  signal n1770_o : std_logic;
  signal n1783_o : std_logic_vector (43 downto 0);
  signal n1794_o : std_logic_vector (42 downto 0);
  signal n1795_o : std_logic;
  signal n1800_o : std_logic;
  signal n1801_o : std_logic;
  signal n1804_o : std_logic;
  signal n1805_o : std_logic;
  signal n1808_o : std_logic;
  signal n1809_o : std_logic;
  signal n1816_o : std_logic;
  signal n1822_o : std_logic;
  signal n1823_o : std_logic;
  signal n1824_o : std_logic;
  signal n1825_o : std_logic;
  signal n1826_o : std_logic;
  signal n1827_o : std_logic;
  signal n1828_o : std_logic;
  signal n1829_o : std_logic;
  signal n1830_o : std_logic;
  signal n1831_o : std_logic;
  signal n1832_o : std_logic;
  signal n1833_o : std_logic;
  signal n1834_o : std_logic;
  signal n1835_o : std_logic;
  signal n1836_o : std_logic;
  signal n1837_o : std_logic;
  signal n1838_o : std_logic;
  signal n1839_o : std_logic;
  signal n1840_o : std_logic;
  signal n1841_o : std_logic;
  signal n1842_o : std_logic;
  signal n1843_o : std_logic;
  signal n1844_o : std_logic;
  signal n1845_o : std_logic;
  signal n1846_o : std_logic;
  signal n1847_o : std_logic;
  signal n1848_o : std_logic;
  signal n1849_o : std_logic;
  signal n1850_o : std_logic;
  signal n1851_o : std_logic;
  signal n1852_o : std_logic;
  signal n1853_o : std_logic;
  signal n1854_o : std_logic;
  signal n1855_o : std_logic;
  signal n1856_o : std_logic;
  signal n1857_o : std_logic;
  signal n1858_o : std_logic;
  signal n1859_o : std_logic;
  signal n1860_o : std_logic;
  signal n1861_o : std_logic;
  signal n1862_o : std_logic;
  signal n1863_o : std_logic;
  signal n1864_o : std_logic;
  signal n1865_o : std_logic_vector (3 downto 0);
  signal n1866_o : std_logic_vector (3 downto 0);
  signal n1867_o : std_logic_vector (3 downto 0);
  signal n1868_o : std_logic_vector (3 downto 0);
  signal n1869_o : std_logic_vector (3 downto 0);
  signal n1870_o : std_logic_vector (3 downto 0);
  signal n1871_o : std_logic_vector (3 downto 0);
  signal n1872_o : std_logic_vector (3 downto 0);
  signal n1873_o : std_logic_vector (3 downto 0);
  signal n1874_o : std_logic_vector (3 downto 0);
  signal n1875_o : std_logic_vector (2 downto 0);
  signal n1876_o : std_logic_vector (15 downto 0);
  signal n1877_o : std_logic_vector (15 downto 0);
  signal n1878_o : std_logic_vector (10 downto 0);
  signal n1879_o : std_logic_vector (42 downto 0);
  signal n1880_o : std_logic_vector (41 downto 0);
  signal n1881_o : std_logic_vector (42 downto 0);
  signal n1882_o : std_logic_vector (42 downto 0);
  signal n1900_o : std_logic_vector (43 downto 0);
  signal n1906_o : std_logic;
  signal n1907_o : std_logic;
  signal n1910_o : std_logic;
  signal n1911_o : std_logic;
  signal n1924_o : std_logic_vector (27 downto 0);
  signal n1930_o : std_logic;
  signal n1931_o : std_logic;
  signal n1934_o : std_logic;
  signal n1935_o : std_logic;
  constant n1937_o : std_logic_vector (43 downto 0) := "00000000000000000000000000000000000000000000";
  signal n1938_o : std_logic_vector (15 downto 0);
  signal n1939_o : std_logic_vector (43 downto 0);
  signal n1950_o : std_logic_vector (43 downto 0);
  signal n1961_o : std_logic_vector (42 downto 0);
  signal n1962_o : std_logic;
  signal n1967_o : std_logic;
  signal n1968_o : std_logic;
  signal n1971_o : std_logic;
  signal n1972_o : std_logic;
  signal n1975_o : std_logic;
  signal n1976_o : std_logic;
  signal n1983_o : std_logic;
  signal n1989_o : std_logic;
  signal n1990_o : std_logic;
  signal n1991_o : std_logic;
  signal n1992_o : std_logic;
  signal n1993_o : std_logic;
  signal n1994_o : std_logic;
  signal n1995_o : std_logic;
  signal n1996_o : std_logic;
  signal n1997_o : std_logic;
  signal n1998_o : std_logic;
  signal n1999_o : std_logic;
  signal n2000_o : std_logic;
  signal n2001_o : std_logic;
  signal n2002_o : std_logic;
  signal n2003_o : std_logic;
  signal n2004_o : std_logic;
  signal n2005_o : std_logic;
  signal n2006_o : std_logic;
  signal n2007_o : std_logic;
  signal n2008_o : std_logic;
  signal n2009_o : std_logic;
  signal n2010_o : std_logic;
  signal n2011_o : std_logic;
  signal n2012_o : std_logic;
  signal n2013_o : std_logic;
  signal n2014_o : std_logic;
  signal n2015_o : std_logic;
  signal n2016_o : std_logic;
  signal n2017_o : std_logic;
  signal n2018_o : std_logic;
  signal n2019_o : std_logic;
  signal n2020_o : std_logic;
  signal n2021_o : std_logic;
  signal n2022_o : std_logic;
  signal n2023_o : std_logic;
  signal n2024_o : std_logic;
  signal n2025_o : std_logic;
  signal n2026_o : std_logic;
  signal n2027_o : std_logic;
  signal n2028_o : std_logic;
  signal n2029_o : std_logic;
  signal n2030_o : std_logic;
  signal n2031_o : std_logic;
  signal n2032_o : std_logic_vector (3 downto 0);
  signal n2033_o : std_logic_vector (3 downto 0);
  signal n2034_o : std_logic_vector (3 downto 0);
  signal n2035_o : std_logic_vector (3 downto 0);
  signal n2036_o : std_logic_vector (3 downto 0);
  signal n2037_o : std_logic_vector (3 downto 0);
  signal n2038_o : std_logic_vector (3 downto 0);
  signal n2039_o : std_logic_vector (3 downto 0);
  signal n2040_o : std_logic_vector (3 downto 0);
  signal n2041_o : std_logic_vector (3 downto 0);
  signal n2042_o : std_logic_vector (2 downto 0);
  signal n2043_o : std_logic_vector (15 downto 0);
  signal n2044_o : std_logic_vector (15 downto 0);
  signal n2045_o : std_logic_vector (10 downto 0);
  signal n2046_o : std_logic_vector (42 downto 0);
  signal n2047_o : std_logic_vector (41 downto 0);
  signal n2048_o : std_logic_vector (42 downto 0);
  signal n2049_o : std_logic_vector (42 downto 0);
  signal n2065_o : std_logic_vector (40 downto 0);
  signal n2066_o : std_logic;
  signal n2071_o : std_logic;
  signal n2072_o : std_logic;
  signal n2075_o : std_logic;
  signal n2076_o : std_logic;
  signal n2079_o : std_logic;
  signal n2080_o : std_logic;
  signal n2087_o : std_logic;
  signal n2091_o : std_logic;
  signal n2093_o : std_logic;
  signal n2094_o : std_logic;
  signal n2096_o : std_logic;
  signal n2102_o : std_logic;
  signal n2105_o : std_logic;
  signal n2107_o : std_logic;
  signal n2108_o : std_logic;
  signal n2109_o : std_logic;
  signal n2110_o : std_logic;
  signal n2111_o : std_logic;
  signal n2112_o : std_logic;
  signal n2113_o : std_logic;
  signal n2114_o : std_logic;
  signal n2115_o : std_logic;
  signal n2116_o : std_logic;
  signal n2117_o : std_logic;
  signal n2118_o : std_logic;
  signal n2119_o : std_logic;
  signal n2120_o : std_logic;
  signal n2121_o : std_logic;
  signal n2122_o : std_logic;
  signal n2123_o : std_logic;
  signal n2124_o : std_logic;
  signal n2125_o : std_logic;
  signal n2126_o : std_logic;
  signal n2127_o : std_logic;
  signal n2128_o : std_logic;
  signal n2129_o : std_logic;
  signal n2130_o : std_logic;
  signal n2131_o : std_logic;
  signal n2132_o : std_logic_vector (3 downto 0);
  signal n2133_o : std_logic_vector (3 downto 0);
  signal n2134_o : std_logic_vector (3 downto 0);
  signal n2135_o : std_logic_vector (3 downto 0);
  signal n2136_o : std_logic_vector (3 downto 0);
  signal n2137_o : std_logic_vector (3 downto 0);
  signal n2138_o : std_logic_vector (15 downto 0);
  signal n2139_o : std_logic_vector (8 downto 0);
  signal n2140_o : std_logic_vector (24 downto 0);
  signal n2141_o : std_logic_vector (23 downto 0);
  signal n2142_o : std_logic_vector (24 downto 0);
  signal n2143_o : std_logic_vector (24 downto 0);
  signal n2144_o : std_logic_vector (24 downto 0);
  signal n2159_o : std_logic_vector (42 downto 0);
  signal n2162_o : std_logic_vector (42 downto 0);
  signal n2174_o : std_logic_vector (42 downto 0);
  signal n2177_o : std_logic_vector (42 downto 0);
  signal n2194_o : std_logic_vector (43 downto 0);
  signal n2200_o : std_logic;
  signal n2201_o : std_logic;
  signal n2204_o : std_logic;
  signal n2205_o : std_logic;
  signal n2218_o : std_logic_vector (43 downto 0);
  signal n2224_o : std_logic;
  signal n2225_o : std_logic;
  signal n2228_o : std_logic;
  signal n2229_o : std_logic;
  signal n2242_o : std_logic_vector (43 downto 0);
  signal n2253_o : std_logic_vector (42 downto 0);
  signal n2254_o : std_logic;
  signal n2259_o : std_logic;
  signal n2260_o : std_logic;
  signal n2263_o : std_logic;
  signal n2264_o : std_logic;
  signal n2267_o : std_logic;
  signal n2268_o : std_logic;
  signal n2275_o : std_logic;
  signal n2281_o : std_logic;
  signal n2282_o : std_logic;
  signal n2283_o : std_logic;
  signal n2284_o : std_logic;
  signal n2285_o : std_logic;
  signal n2286_o : std_logic;
  signal n2287_o : std_logic;
  signal n2288_o : std_logic;
  signal n2289_o : std_logic;
  signal n2290_o : std_logic;
  signal n2291_o : std_logic;
  signal n2292_o : std_logic;
  signal n2293_o : std_logic;
  signal n2294_o : std_logic;
  signal n2295_o : std_logic;
  signal n2296_o : std_logic;
  signal n2297_o : std_logic;
  signal n2298_o : std_logic;
  signal n2299_o : std_logic;
  signal n2300_o : std_logic;
  signal n2301_o : std_logic;
  signal n2302_o : std_logic;
  signal n2303_o : std_logic;
  signal n2304_o : std_logic;
  signal n2305_o : std_logic;
  signal n2306_o : std_logic;
  signal n2307_o : std_logic;
  signal n2308_o : std_logic;
  signal n2309_o : std_logic;
  signal n2310_o : std_logic;
  signal n2311_o : std_logic;
  signal n2312_o : std_logic;
  signal n2313_o : std_logic;
  signal n2314_o : std_logic;
  signal n2315_o : std_logic;
  signal n2316_o : std_logic;
  signal n2317_o : std_logic;
  signal n2318_o : std_logic;
  signal n2319_o : std_logic;
  signal n2320_o : std_logic;
  signal n2321_o : std_logic;
  signal n2322_o : std_logic;
  signal n2323_o : std_logic;
  signal n2324_o : std_logic_vector (3 downto 0);
  signal n2325_o : std_logic_vector (3 downto 0);
  signal n2326_o : std_logic_vector (3 downto 0);
  signal n2327_o : std_logic_vector (3 downto 0);
  signal n2328_o : std_logic_vector (3 downto 0);
  signal n2329_o : std_logic_vector (3 downto 0);
  signal n2330_o : std_logic_vector (3 downto 0);
  signal n2331_o : std_logic_vector (3 downto 0);
  signal n2332_o : std_logic_vector (3 downto 0);
  signal n2333_o : std_logic_vector (3 downto 0);
  signal n2334_o : std_logic_vector (2 downto 0);
  signal n2335_o : std_logic_vector (15 downto 0);
  signal n2336_o : std_logic_vector (15 downto 0);
  signal n2337_o : std_logic_vector (10 downto 0);
  signal n2338_o : std_logic_vector (42 downto 0);
  signal n2339_o : std_logic_vector (41 downto 0);
  signal n2340_o : std_logic_vector (42 downto 0);
  signal n2341_o : std_logic_vector (42 downto 0);
  signal n2357_o : std_logic_vector (40 downto 0);
  signal n2358_o : std_logic;
  signal n2363_o : std_logic;
  signal n2364_o : std_logic;
  signal n2367_o : std_logic;
  signal n2368_o : std_logic;
  signal n2371_o : std_logic;
  signal n2372_o : std_logic;
  signal n2379_o : std_logic;
  signal n2383_o : std_logic;
  signal n2385_o : std_logic;
  signal n2386_o : std_logic;
  signal n2388_o : std_logic;
  signal n2394_o : std_logic;
  signal n2397_o : std_logic;
  signal n2399_o : std_logic;
  signal n2400_o : std_logic;
  signal n2401_o : std_logic;
  signal n2402_o : std_logic;
  signal n2403_o : std_logic;
  signal n2404_o : std_logic;
  signal n2405_o : std_logic;
  signal n2406_o : std_logic;
  signal n2407_o : std_logic;
  signal n2408_o : std_logic;
  signal n2409_o : std_logic;
  signal n2410_o : std_logic;
  signal n2411_o : std_logic;
  signal n2412_o : std_logic;
  signal n2413_o : std_logic;
  signal n2414_o : std_logic;
  signal n2415_o : std_logic;
  signal n2416_o : std_logic;
  signal n2417_o : std_logic;
  signal n2418_o : std_logic;
  signal n2419_o : std_logic;
  signal n2420_o : std_logic;
  signal n2421_o : std_logic;
  signal n2422_o : std_logic;
  signal n2423_o : std_logic;
  signal n2424_o : std_logic_vector (3 downto 0);
  signal n2425_o : std_logic_vector (3 downto 0);
  signal n2426_o : std_logic_vector (3 downto 0);
  signal n2427_o : std_logic_vector (3 downto 0);
  signal n2428_o : std_logic_vector (3 downto 0);
  signal n2429_o : std_logic_vector (3 downto 0);
  signal n2430_o : std_logic_vector (15 downto 0);
  signal n2431_o : std_logic_vector (8 downto 0);
  signal n2432_o : std_logic_vector (24 downto 0);
  signal n2433_o : std_logic_vector (23 downto 0);
  signal n2434_o : std_logic_vector (24 downto 0);
  signal n2435_o : std_logic_vector (24 downto 0);
  signal n2436_o : std_logic_vector (24 downto 0);
  signal n2439_o : std_logic;
  signal n2440_o : std_logic_vector (2 downto 0);
  signal n2441_o : std_logic_vector (24 downto 0);
  signal n2442_o : std_logic_vector (24 downto 0);
  signal n2443_o : std_logic_vector (24 downto 0);
  signal n2444_o : std_logic_vector (24 downto 0);
  signal n2472_o : std_logic;
  signal n2473_o : std_logic_vector (24 downto 0);
  signal n2474_q : std_logic_vector (24 downto 0);
  signal n2475_o : std_logic;
  signal n2476_o : std_logic_vector (24 downto 0);
  signal n2477_q : std_logic_vector (24 downto 0);
  signal n2478_q : std_logic_vector (24 downto 0);
  signal n2479_q : std_logic_vector (24 downto 0);
  signal n2495_o : std_logic_vector (22 downto 0);
  signal n2496_o : std_logic;
  signal n2501_o : std_logic;
  signal n2502_o : std_logic;
  signal n2505_o : std_logic;
  signal n2506_o : std_logic;
  signal n2509_o : std_logic;
  signal n2510_o : std_logic;
  signal n2517_o : std_logic;
  signal n2521_o : std_logic;
  signal n2523_o : std_logic;
  signal n2524_o : std_logic;
  signal n2526_o : std_logic;
  signal n2532_o : std_logic;
  signal n2535_o : std_logic;
  signal n2537_o : std_logic;
  signal n2538_o : std_logic;
  signal n2539_o : std_logic;
  signal n2540_o : std_logic;
  signal n2541_o : std_logic;
  signal n2542_o : std_logic;
  signal n2543_o : std_logic;
  signal n2544_o : std_logic;
  signal n2545_o : std_logic;
  signal n2546_o : std_logic;
  signal n2547_o : std_logic;
  signal n2548_o : std_logic;
  signal n2549_o : std_logic;
  signal n2550_o : std_logic;
  signal n2551_o : std_logic;
  signal n2552_o : std_logic;
  signal n2553_o : std_logic;
  signal n2554_o : std_logic;
  signal n2555_o : std_logic_vector (3 downto 0);
  signal n2556_o : std_logic_vector (3 downto 0);
  signal n2557_o : std_logic_vector (3 downto 0);
  signal n2558_o : std_logic_vector (3 downto 0);
  signal n2559_o : std_logic_vector (1 downto 0);
  signal n2560_o : std_logic_vector (15 downto 0);
  signal n2561_o : std_logic_vector (17 downto 0);
  signal n2562_o : std_logic_vector (16 downto 0);
  signal n2563_o : std_logic_vector (17 downto 0);
  signal n2564_o : std_logic_vector (17 downto 0);
  signal n2565_o : std_logic_vector (17 downto 0);
begin
  ready_o <= n1362_o;
  valid_o <= n1367_o;
  data_o <= n2565_o;
  -- ../BiquadFilter/BiquadFilter.vhd:26:12
  state_reg <= n1358_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:12
  x_reg <= n2474_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:19
  y_reg <= n2477_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:26
  w_reg <= n2478_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:27:33
  v_reg <= n2479_q; -- (signal)
  -- ../BiquadFilter/BiquadFilter.vhd:33:15
  -- n1336_o <= '1' when rising_edge (clk_i) else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:36:21
  n1338_o <= state_reg when valid_i = '0' else "01";
  -- ../BiquadFilter/BiquadFilter.vhd:35:17
  n1340_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:39:17
  n1342_o <= '1' when state_reg = "01" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:41:17
  n1344_o <= '1' when state_reg = "10" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:44:21
  n1346_o <= state_reg when ready_i = '0' else "00";
  -- ../BiquadFilter/BiquadFilter.vhd:43:17
  n1348_o <= '1' when state_reg = "11" else '0';
  -- ../fixed_pkg.vhd:173:9
  n1349_o <= n1348_o & n1344_o & n1342_o & n1340_o;
  -- ../BiquadFilter/BiquadFilter.vhd:34:13
  with n1349_o select n1353_o <=
    n1346_o when "1000",
    "11" when "0100",
    "10" when "0010",
    n1338_o when "0001",
    "XX" when others;
  -- ../BiquadFilter/BiquadFilter.vhd:33:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n1358_q <= "00";
    elsif rising_edge (clk_i) then
      n1358_q <= n1353_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:51:35
  n1361_o <= '1' when state_reg = "00" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:51:20
  n1362_o <= '0' when n1361_o = '0' else '1';
  -- ../BiquadFilter/BiquadFilter.vhd:52:35
  n1366_o <= '1' when state_reg = "11" else '0';
  -- ../BiquadFilter/BiquadFilter.vhd:52:20
  n1367_o <= '0' when n1366_o = '0' else '1';
  -- ../BiquadFilter/BiquadFilter.vhd:59:15
  -- n1370_o <= '1' when rising_edge (clk_i) else '0';
  -- ../fixed_pkg.vhd:168:39
  n1386_o <= std_logic_vector (resize (signed (data_i), 20));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n1392_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n1393_o <= n1392_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n1394: postponed assert n1393_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n1396_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n1397_o <= n1396_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n1398: postponed assert n1397_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:173:9
  n1400_o <= n1399_o (4 downto 0);
  -- Vocoder.vhd:46:28
  n1401_o <= n1386_o & n1400_o;
  -- ../BiquadFilter/BiquadFilter.vhd:62:21
  n1402_o <= x_reg when valid_i = '0' else n1401_o;
  -- ../BiquadFilter/BiquadFilter.vhd:61:17
  n1404_o <= '1' when state_reg = "00" else '0';
  -- ../fixed_pkg.vhd:266:100
  n1418_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n1421_o <= std_logic_vector (resize (signed (n1418_o) * signed'("0000000000000000000000000000000000011001101"), 43));
  -- ../fixed_pkg.vhd:168:39
  n1438_o <= std_logic_vector (resize (signed (n1421_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n1444_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n1445_o <= n1444_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n1446: postponed assert n1445_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n1448_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n1449_o <= n1448_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n1450: postponed assert n1449_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n1462_o <= std_logic_vector (resize (signed (w_reg), 28));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n1468_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n1469_o <= n1468_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n1470: postponed assert n1469_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n1472_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n1473_o <= n1472_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n1474: postponed assert n1473_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:28:14
  n1476_o <= n1475_o (15 downto 0);
  -- ../fixed_pkg.vhd:30:14
  n1477_o <= n1462_o & n1476_o;
  -- ../fixed_pkg.vhd:255:67
  n1488_o <= std_logic_vector (unsigned (n1438_o) + unsigned (n1477_o));
  -- ../fixed_pkg.vhd:168:39
  n1499_o <= n1488_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n1500_o <= n1488_o (43);
  -- ../fixed_pkg.vhd:173:9
  n1505_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n1506_o <= n1505_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n1507: postponed assert n1506_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n1509_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n1510_o <= n1509_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n1511: postponed assert n1510_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n1513_o <= n1488_o (42);
  -- ../fixed_pkg.vhd:183:27
  n1514_o <= '1' when n1513_o /= n1500_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n1521_o <= '0' when n1514_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n1527_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1528_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1529_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1530_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1531_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1532_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1533_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1534_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1535_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1536_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1537_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1538_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1539_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1540_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1541_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1542_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1543_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1544_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1545_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1546_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1547_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1548_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1549_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1550_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1551_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1552_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1553_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1554_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1555_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1556_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1557_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1558_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1559_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1560_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1561_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1562_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1563_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1564_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1565_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1566_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1567_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1568_o <= not n1500_o;
  -- ../fixed_pkg.vhd:194:31
  n1569_o <= not n1500_o;
  n1570_o <= n1527_o & n1528_o & n1529_o & n1530_o;
  -- ../fixed_pkg.vhd:183:17
  n1571_o <= n1531_o & n1532_o & n1533_o & n1534_o;
  n1572_o <= n1535_o & n1536_o & n1537_o & n1538_o;
  n1573_o <= n1539_o & n1540_o & n1541_o & n1542_o;
  n1574_o <= n1543_o & n1544_o & n1545_o & n1546_o;
  n1575_o <= n1547_o & n1548_o & n1549_o & n1550_o;
  -- ../fixed_pkg.vhd:183:17
  n1576_o <= n1551_o & n1552_o & n1553_o & n1554_o;
  n1577_o <= n1555_o & n1556_o & n1557_o & n1558_o;
  n1578_o <= n1559_o & n1560_o & n1561_o & n1562_o;
  -- ../fixed_pkg.vhd:182:13
  n1579_o <= n1563_o & n1564_o & n1565_o & n1566_o;
  -- ../fixed_pkg.vhd:171:18
  n1580_o <= n1567_o & n1568_o & n1569_o;
  n1581_o <= n1570_o & n1571_o & n1572_o & n1573_o;
  -- ../fixed_pkg.vhd:170:18
  n1582_o <= n1574_o & n1575_o & n1576_o & n1577_o;
  n1583_o <= n1578_o & n1579_o & n1580_o;
  -- ../fixed_pkg.vhd:9:14
  n1584_o <= n1581_o & n1582_o & n1583_o;
  -- ../fixed_pkg.vhd:9:14
  n1585_o <= n1584_o (41 downto 0);
  n1586_o <= n1500_o & n1585_o;
  -- ../fixed_pkg.vhd:193:9
  n1587_o <= n1499_o when n1521_o = '0' else n1586_o;
  -- ../fixed_pkg.vhd:168:39
  n1603_o <= n1587_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n1604_o <= n1587_o (42);
  -- ../fixed_pkg.vhd:173:9
  n1609_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n1610_o <= n1609_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n1611: postponed assert n1610_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n1613_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n1614_o <= n1613_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n1615: postponed assert n1614_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n1617_o <= n1587_o (41);
  -- ../fixed_pkg.vhd:183:27
  n1618_o <= '1' when n1617_o /= n1604_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n1625_o <= '0' when n1618_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n1629_o <= '1' when n1618_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n1631_o <= n1587_o (40);
  -- ../fixed_pkg.vhd:183:27
  n1632_o <= '1' when n1631_o /= n1604_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n1634_o <= n1625_o when n1643_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n1640_o <= n1632_o and n1629_o;
  -- ../fixed_pkg.vhd:183:17
  n1643_o <= n1629_o and n1640_o;
  -- ../fixed_pkg.vhd:194:31
  n1645_o <= not n1604_o;
  -- ../fixed_pkg.vhd:194:31
  n1646_o <= not n1604_o;
  -- ../fixed_pkg.vhd:194:31
  n1647_o <= not n1604_o;
  -- ../fixed_pkg.vhd:194:31
  n1648_o <= not n1604_o;
  -- ../fixed_pkg.vhd:194:31
  n1649_o <= not n1604_o;
  -- ../fixed_pkg.vhd:194:31
  n1650_o <= not n1604_o;
  -- ../fixed_pkg.vhd:194:31
  n1651_o <= not n1604_o;
  -- ../fixed_pkg.vhd:194:31
  n1652_o <= not n1604_o;
  -- ../fixed_pkg.vhd:194:31
  n1653_o <= not n1604_o;
  -- ../fixed_pkg.vhd:194:31
  n1654_o <= not n1604_o;
  -- ../fixed_pkg.vhd:194:31
  n1655_o <= not n1604_o;
  -- ../fixed_pkg.vhd:194:31
  n1656_o <= not n1604_o;
  -- ../fixed_pkg.vhd:194:31
  n1657_o <= not n1604_o;
  -- ../fixed_pkg.vhd:194:31
  n1658_o <= not n1604_o;
  -- ../fixed_pkg.vhd:194:31
  n1659_o <= not n1604_o;
  -- ../fixed_pkg.vhd:194:31
  n1660_o <= not n1604_o;
  -- ../fixed_pkg.vhd:194:31
  n1661_o <= not n1604_o;
  -- ../fixed_pkg.vhd:194:31
  n1662_o <= not n1604_o;
  -- ../fixed_pkg.vhd:194:31
  n1663_o <= not n1604_o;
  -- ../fixed_pkg.vhd:194:31
  n1664_o <= not n1604_o;
  -- ../fixed_pkg.vhd:194:31
  n1665_o <= not n1604_o;
  -- ../fixed_pkg.vhd:194:31
  n1666_o <= not n1604_o;
  -- ../fixed_pkg.vhd:194:31
  n1667_o <= not n1604_o;
  -- ../fixed_pkg.vhd:194:31
  n1668_o <= not n1604_o;
  -- ../fixed_pkg.vhd:194:31
  n1669_o <= not n1604_o;
  -- ../fixed_pkg.vhd:9:14
  n1670_o <= n1645_o & n1646_o & n1647_o & n1648_o;
  -- ../fixed_pkg.vhd:9:14
  n1671_o <= n1649_o & n1650_o & n1651_o & n1652_o;
  n1672_o <= n1653_o & n1654_o & n1655_o & n1656_o;
  -- ../fixed_pkg.vhd:9:14
  n1673_o <= n1657_o & n1658_o & n1659_o & n1660_o;
  -- ../fixed_pkg.vhd:24:14
  n1674_o <= n1661_o & n1662_o & n1663_o & n1664_o;
  -- ../fixed_pkg.vhd:24:14
  n1675_o <= n1665_o & n1666_o & n1667_o & n1668_o;
  n1676_o <= n1670_o & n1671_o & n1672_o & n1673_o;
  -- ../fixed_pkg.vhd:24:14
  n1677_o <= n1674_o & n1675_o & n1669_o;
  -- ../fixed_pkg.vhd:25:14
  n1678_o <= n1676_o & n1677_o;
  -- ../fixed_pkg.vhd:25:14
  n1679_o <= n1678_o (23 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n1680_o <= n1603_o (40 downto 16);
  -- ../fixed_pkg.vhd:25:14
  n1681_o <= n1604_o & n1679_o;
  -- ../fixed_pkg.vhd:193:9
  n1682_o <= n1680_o when n1634_o = '0' else n1681_o;
  -- ../BiquadFilter/BiquadFilter.vhd:65:17
  n1685_o <= '1' when state_reg = "01" else '0';
  -- ../fixed_pkg.vhd:266:100
  n1700_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n1703_o <= std_logic_vector (resize (signed (n1700_o) * signed'("0000000000000000000000000000000000000000000"), 43));
  -- ../fixed_pkg.vhd:266:100
  n1715_o <= std_logic_vector (resize (signed (y_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n1718_o <= std_logic_vector (resize (signed (n1715_o) * signed'("0000000000011111111111111100000001010011100"), 43));
  -- ../fixed_pkg.vhd:168:39
  n1735_o <= std_logic_vector (resize (signed (n1703_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n1741_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n1742_o <= n1741_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n1743: postponed assert n1742_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n1745_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n1746_o <= n1745_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n1747: postponed assert n1746_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n1759_o <= std_logic_vector (resize (signed (n1718_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n1765_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n1766_o <= n1765_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n1767: postponed assert n1766_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n1769_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n1770_o <= n1769_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n1771: postponed assert n1770_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:240:67
  n1783_o <= std_logic_vector (unsigned (n1735_o) - unsigned (n1759_o));
  -- ../fixed_pkg.vhd:168:39
  n1794_o <= n1783_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n1795_o <= n1783_o (43);
  -- ../fixed_pkg.vhd:173:9
  n1800_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n1801_o <= n1800_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n1802: postponed assert n1801_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n1804_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n1805_o <= n1804_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n1806: postponed assert n1805_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n1808_o <= n1783_o (42);
  -- ../fixed_pkg.vhd:183:27
  n1809_o <= '1' when n1808_o /= n1795_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n1816_o <= '0' when n1809_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n1822_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1823_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1824_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1825_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1826_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1827_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1828_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1829_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1830_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1831_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1832_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1833_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1834_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1835_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1836_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1837_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1838_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1839_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1840_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1841_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1842_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1843_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1844_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1845_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1846_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1847_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1848_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1849_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1850_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1851_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1852_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1853_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1854_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1855_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1856_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1857_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1858_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1859_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1860_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1861_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1862_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1863_o <= not n1795_o;
  -- ../fixed_pkg.vhd:194:31
  n1864_o <= not n1795_o;
  n1865_o <= n1822_o & n1823_o & n1824_o & n1825_o;
  -- ../fixed_pkg.vhd:25:14
  n1866_o <= n1826_o & n1827_o & n1828_o & n1829_o;
  -- ../fixed_pkg.vhd:9:14
  n1867_o <= n1830_o & n1831_o & n1832_o & n1833_o;
  -- ../fixed_pkg.vhd:9:14
  n1868_o <= n1834_o & n1835_o & n1836_o & n1837_o;
  n1869_o <= n1838_o & n1839_o & n1840_o & n1841_o;
  -- ../fixed_pkg.vhd:9:14
  n1870_o <= n1842_o & n1843_o & n1844_o & n1845_o;
  -- ../fixed_pkg.vhd:32:14
  n1871_o <= n1846_o & n1847_o & n1848_o & n1849_o;
  -- ../fixed_pkg.vhd:32:14
  n1872_o <= n1850_o & n1851_o & n1852_o & n1853_o;
  n1873_o <= n1854_o & n1855_o & n1856_o & n1857_o;
  -- ../fixed_pkg.vhd:32:14
  n1874_o <= n1858_o & n1859_o & n1860_o & n1861_o;
  -- ../fixed_pkg.vhd:28:14
  n1875_o <= n1862_o & n1863_o & n1864_o;
  -- ../fixed_pkg.vhd:28:14
  n1876_o <= n1865_o & n1866_o & n1867_o & n1868_o;
  n1877_o <= n1869_o & n1870_o & n1871_o & n1872_o;
  -- ../fixed_pkg.vhd:28:14
  n1878_o <= n1873_o & n1874_o & n1875_o;
  -- ../fixed_pkg.vhd:30:14
  n1879_o <= n1876_o & n1877_o & n1878_o;
  -- ../fixed_pkg.vhd:30:14
  n1880_o <= n1879_o (41 downto 0);
  n1881_o <= n1795_o & n1880_o;
  -- ../fixed_pkg.vhd:193:9
  n1882_o <= n1794_o when n1816_o = '0' else n1881_o;
  -- ../fixed_pkg.vhd:168:39
  n1900_o <= std_logic_vector (resize (signed (n1882_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n1906_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n1907_o <= n1906_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n1908: postponed assert n1907_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n1910_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n1911_o <= n1910_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n1912: postponed assert n1911_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n1924_o <= std_logic_vector (resize (signed (v_reg), 28));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n1930_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n1931_o <= n1930_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n1932: postponed assert n1931_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n1934_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n1935_o <= n1934_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n1936: postponed assert n1935_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:182:13
  n1938_o <= n1937_o (15 downto 0);
  -- ../fixed_pkg.vhd:171:18
  n1939_o <= n1924_o & n1938_o;
  -- ../fixed_pkg.vhd:255:67
  n1950_o <= std_logic_vector (unsigned (n1900_o) + unsigned (n1939_o));
  -- ../fixed_pkg.vhd:168:39
  n1961_o <= n1950_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n1962_o <= n1950_o (43);
  -- ../fixed_pkg.vhd:173:9
  n1967_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n1968_o <= n1967_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n1969: postponed assert n1968_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n1971_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n1972_o <= n1971_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n1973: postponed assert n1972_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n1975_o <= n1950_o (42);
  -- ../fixed_pkg.vhd:183:27
  n1976_o <= '1' when n1975_o /= n1962_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n1983_o <= '0' when n1976_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n1989_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n1990_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n1991_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n1992_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n1993_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n1994_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n1995_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n1996_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n1997_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n1998_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n1999_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n2000_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n2001_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n2002_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n2003_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n2004_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n2005_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n2006_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n2007_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n2008_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n2009_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n2010_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n2011_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n2012_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n2013_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n2014_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n2015_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n2016_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n2017_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n2018_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n2019_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n2020_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n2021_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n2022_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n2023_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n2024_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n2025_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n2026_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n2027_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n2028_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n2029_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n2030_o <= not n1962_o;
  -- ../fixed_pkg.vhd:194:31
  n2031_o <= not n1962_o;
  n2032_o <= n1989_o & n1990_o & n1991_o & n1992_o;
  n2033_o <= n1993_o & n1994_o & n1995_o & n1996_o;
  n2034_o <= n1997_o & n1998_o & n1999_o & n2000_o;
  n2035_o <= n2001_o & n2002_o & n2003_o & n2004_o;
  n2036_o <= n2005_o & n2006_o & n2007_o & n2008_o;
  n2037_o <= n2009_o & n2010_o & n2011_o & n2012_o;
  n2038_o <= n2013_o & n2014_o & n2015_o & n2016_o;
  n2039_o <= n2017_o & n2018_o & n2019_o & n2020_o;
  n2040_o <= n2021_o & n2022_o & n2023_o & n2024_o;
  n2041_o <= n2025_o & n2026_o & n2027_o & n2028_o;
  n2042_o <= n2029_o & n2030_o & n2031_o;
  n2043_o <= n2032_o & n2033_o & n2034_o & n2035_o;
  n2044_o <= n2036_o & n2037_o & n2038_o & n2039_o;
  n2045_o <= n2040_o & n2041_o & n2042_o;
  n2046_o <= n2043_o & n2044_o & n2045_o;
  n2047_o <= n2046_o (41 downto 0);
  n2048_o <= n1962_o & n2047_o;
  -- ../fixed_pkg.vhd:193:9
  n2049_o <= n1961_o when n1983_o = '0' else n2048_o;
  -- ../fixed_pkg.vhd:168:39
  n2065_o <= n2049_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n2066_o <= n2049_o (42);
  -- ../fixed_pkg.vhd:173:9
  n2071_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n2072_o <= n2071_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n2073: postponed assert n2072_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n2075_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n2076_o <= n2075_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n2077: postponed assert n2076_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n2079_o <= n2049_o (41);
  -- ../fixed_pkg.vhd:183:27
  n2080_o <= '1' when n2079_o /= n2066_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n2087_o <= '0' when n2080_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n2091_o <= '1' when n2080_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n2093_o <= n2049_o (40);
  -- ../fixed_pkg.vhd:183:27
  n2094_o <= '1' when n2093_o /= n2066_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n2096_o <= n2087_o when n2105_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n2102_o <= n2094_o and n2091_o;
  -- ../fixed_pkg.vhd:183:17
  n2105_o <= n2091_o and n2102_o;
  -- ../fixed_pkg.vhd:194:31
  n2107_o <= not n2066_o;
  -- ../fixed_pkg.vhd:194:31
  n2108_o <= not n2066_o;
  -- ../fixed_pkg.vhd:194:31
  n2109_o <= not n2066_o;
  -- ../fixed_pkg.vhd:194:31
  n2110_o <= not n2066_o;
  -- ../fixed_pkg.vhd:194:31
  n2111_o <= not n2066_o;
  -- ../fixed_pkg.vhd:194:31
  n2112_o <= not n2066_o;
  -- ../fixed_pkg.vhd:194:31
  n2113_o <= not n2066_o;
  -- ../fixed_pkg.vhd:194:31
  n2114_o <= not n2066_o;
  -- ../fixed_pkg.vhd:194:31
  n2115_o <= not n2066_o;
  -- ../fixed_pkg.vhd:194:31
  n2116_o <= not n2066_o;
  -- ../fixed_pkg.vhd:194:31
  n2117_o <= not n2066_o;
  -- ../fixed_pkg.vhd:194:31
  n2118_o <= not n2066_o;
  -- ../fixed_pkg.vhd:194:31
  n2119_o <= not n2066_o;
  -- ../fixed_pkg.vhd:194:31
  n2120_o <= not n2066_o;
  -- ../fixed_pkg.vhd:194:31
  n2121_o <= not n2066_o;
  -- ../fixed_pkg.vhd:194:31
  n2122_o <= not n2066_o;
  -- ../fixed_pkg.vhd:194:31
  n2123_o <= not n2066_o;
  -- ../fixed_pkg.vhd:194:31
  n2124_o <= not n2066_o;
  -- ../fixed_pkg.vhd:194:31
  n2125_o <= not n2066_o;
  -- ../fixed_pkg.vhd:194:31
  n2126_o <= not n2066_o;
  -- ../fixed_pkg.vhd:194:31
  n2127_o <= not n2066_o;
  -- ../fixed_pkg.vhd:194:31
  n2128_o <= not n2066_o;
  -- ../fixed_pkg.vhd:194:31
  n2129_o <= not n2066_o;
  -- ../fixed_pkg.vhd:194:31
  n2130_o <= not n2066_o;
  -- ../fixed_pkg.vhd:194:31
  n2131_o <= not n2066_o;
  n2132_o <= n2107_o & n2108_o & n2109_o & n2110_o;
  n2133_o <= n2111_o & n2112_o & n2113_o & n2114_o;
  n2134_o <= n2115_o & n2116_o & n2117_o & n2118_o;
  n2135_o <= n2119_o & n2120_o & n2121_o & n2122_o;
  n2136_o <= n2123_o & n2124_o & n2125_o & n2126_o;
  n2137_o <= n2127_o & n2128_o & n2129_o & n2130_o;
  n2138_o <= n2132_o & n2133_o & n2134_o & n2135_o;
  n2139_o <= n2136_o & n2137_o & n2131_o;
  n2140_o <= n2138_o & n2139_o;
  n2141_o <= n2140_o (23 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n2142_o <= n2065_o (40 downto 16);
  n2143_o <= n2066_o & n2141_o;
  -- ../fixed_pkg.vhd:193:9
  n2144_o <= n2142_o when n2096_o = '0' else n2143_o;
  -- ../fixed_pkg.vhd:266:100
  n2159_o <= std_logic_vector (resize (signed (x_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n2162_o <= std_logic_vector (resize (signed (n2159_o) * signed'("0000000000011111111111111111111111100110011"), 43));
  -- ../fixed_pkg.vhd:266:100
  n2174_o <= std_logic_vector (resize (signed (y_reg), 43));  --  sext
  -- ../fixed_pkg.vhd:266:100
  n2177_o <= std_logic_vector (resize (signed (n2174_o) * signed'("0000000000000000000000000001111111001100110"), 43));
  -- ../fixed_pkg.vhd:168:39
  n2194_o <= std_logic_vector (resize (signed (n2162_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n2200_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n2201_o <= n2200_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n2202: postponed assert n2201_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n2204_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n2205_o <= n2204_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n2206: postponed assert n2205_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:168:39
  n2218_o <= std_logic_vector (resize (signed (n2177_o), 44));  --  sext
  -- ../fixed_pkg.vhd:173:9
  n2224_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n2225_o <= n2224_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n2226: postponed assert n2225_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n2228_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n2229_o <= n2228_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n2230: postponed assert n2229_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:240:67
  n2242_o <= std_logic_vector (unsigned (n2194_o) - unsigned (n2218_o));
  -- ../fixed_pkg.vhd:168:39
  n2253_o <= n2242_o (42 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n2254_o <= n2242_o (43);
  -- ../fixed_pkg.vhd:173:9
  n2259_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n2260_o <= n2259_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n2261: postponed assert n2260_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n2263_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n2264_o <= n2263_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n2265: postponed assert n2264_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n2267_o <= n2242_o (42);
  -- ../fixed_pkg.vhd:183:27
  n2268_o <= '1' when n2267_o /= n2254_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n2275_o <= '0' when n2268_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n2281_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2282_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2283_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2284_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2285_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2286_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2287_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2288_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2289_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2290_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2291_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2292_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2293_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2294_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2295_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2296_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2297_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2298_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2299_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2300_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2301_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2302_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2303_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2304_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2305_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2306_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2307_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2308_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2309_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2310_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2311_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2312_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2313_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2314_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2315_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2316_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2317_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2318_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2319_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2320_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2321_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2322_o <= not n2254_o;
  -- ../fixed_pkg.vhd:194:31
  n2323_o <= not n2254_o;
  n2324_o <= n2281_o & n2282_o & n2283_o & n2284_o;
  n2325_o <= n2285_o & n2286_o & n2287_o & n2288_o;
  n2326_o <= n2289_o & n2290_o & n2291_o & n2292_o;
  n2327_o <= n2293_o & n2294_o & n2295_o & n2296_o;
  n2328_o <= n2297_o & n2298_o & n2299_o & n2300_o;
  n2329_o <= n2301_o & n2302_o & n2303_o & n2304_o;
  n2330_o <= n2305_o & n2306_o & n2307_o & n2308_o;
  n2331_o <= n2309_o & n2310_o & n2311_o & n2312_o;
  n2332_o <= n2313_o & n2314_o & n2315_o & n2316_o;
  n2333_o <= n2317_o & n2318_o & n2319_o & n2320_o;
  n2334_o <= n2321_o & n2322_o & n2323_o;
  n2335_o <= n2324_o & n2325_o & n2326_o & n2327_o;
  n2336_o <= n2328_o & n2329_o & n2330_o & n2331_o;
  n2337_o <= n2332_o & n2333_o & n2334_o;
  n2338_o <= n2335_o & n2336_o & n2337_o;
  n2339_o <= n2338_o (41 downto 0);
  n2340_o <= n2254_o & n2339_o;
  -- ../fixed_pkg.vhd:193:9
  n2341_o <= n2253_o when n2275_o = '0' else n2340_o;
  -- ../fixed_pkg.vhd:168:39
  n2357_o <= n2341_o (40 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n2358_o <= n2341_o (42);
  -- ../fixed_pkg.vhd:173:9
  n2363_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n2364_o <= n2363_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n2365: postponed assert n2364_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n2367_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n2368_o <= n2367_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n2369: postponed assert n2368_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n2371_o <= n2341_o (41);
  -- ../fixed_pkg.vhd:183:27
  n2372_o <= '1' when n2371_o /= n2358_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n2379_o <= '0' when n2372_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n2383_o <= '1' when n2372_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n2385_o <= n2341_o (40);
  -- ../fixed_pkg.vhd:183:27
  n2386_o <= '1' when n2385_o /= n2358_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n2388_o <= n2379_o when n2397_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n2394_o <= n2386_o and n2383_o;
  -- ../fixed_pkg.vhd:183:17
  n2397_o <= n2383_o and n2394_o;
  -- ../fixed_pkg.vhd:194:31
  n2399_o <= not n2358_o;
  -- ../fixed_pkg.vhd:194:31
  n2400_o <= not n2358_o;
  -- ../fixed_pkg.vhd:194:31
  n2401_o <= not n2358_o;
  -- ../fixed_pkg.vhd:194:31
  n2402_o <= not n2358_o;
  -- ../fixed_pkg.vhd:194:31
  n2403_o <= not n2358_o;
  -- ../fixed_pkg.vhd:194:31
  n2404_o <= not n2358_o;
  -- ../fixed_pkg.vhd:194:31
  n2405_o <= not n2358_o;
  -- ../fixed_pkg.vhd:194:31
  n2406_o <= not n2358_o;
  -- ../fixed_pkg.vhd:194:31
  n2407_o <= not n2358_o;
  -- ../fixed_pkg.vhd:194:31
  n2408_o <= not n2358_o;
  -- ../fixed_pkg.vhd:194:31
  n2409_o <= not n2358_o;
  -- ../fixed_pkg.vhd:194:31
  n2410_o <= not n2358_o;
  -- ../fixed_pkg.vhd:194:31
  n2411_o <= not n2358_o;
  -- ../fixed_pkg.vhd:194:31
  n2412_o <= not n2358_o;
  -- ../fixed_pkg.vhd:194:31
  n2413_o <= not n2358_o;
  -- ../fixed_pkg.vhd:194:31
  n2414_o <= not n2358_o;
  -- ../fixed_pkg.vhd:194:31
  n2415_o <= not n2358_o;
  -- ../fixed_pkg.vhd:194:31
  n2416_o <= not n2358_o;
  -- ../fixed_pkg.vhd:194:31
  n2417_o <= not n2358_o;
  -- ../fixed_pkg.vhd:194:31
  n2418_o <= not n2358_o;
  -- ../fixed_pkg.vhd:194:31
  n2419_o <= not n2358_o;
  -- ../fixed_pkg.vhd:194:31
  n2420_o <= not n2358_o;
  -- ../fixed_pkg.vhd:194:31
  n2421_o <= not n2358_o;
  -- ../fixed_pkg.vhd:194:31
  n2422_o <= not n2358_o;
  -- ../fixed_pkg.vhd:194:31
  n2423_o <= not n2358_o;
  n2424_o <= n2399_o & n2400_o & n2401_o & n2402_o;
  n2425_o <= n2403_o & n2404_o & n2405_o & n2406_o;
  n2426_o <= n2407_o & n2408_o & n2409_o & n2410_o;
  n2427_o <= n2411_o & n2412_o & n2413_o & n2414_o;
  n2428_o <= n2415_o & n2416_o & n2417_o & n2418_o;
  n2429_o <= n2419_o & n2420_o & n2421_o & n2422_o;
  n2430_o <= n2424_o & n2425_o & n2426_o & n2427_o;
  n2431_o <= n2428_o & n2429_o & n2423_o;
  n2432_o <= n2430_o & n2431_o;
  n2433_o <= n2432_o (23 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n2434_o <= n2357_o (40 downto 16);
  n2435_o <= n2358_o & n2433_o;
  -- ../fixed_pkg.vhd:193:9
  n2436_o <= n2434_o when n2388_o = '0' else n2435_o;
  -- ../BiquadFilter/BiquadFilter.vhd:67:17
  n2439_o <= '1' when state_reg = "10" else '0';
  n2440_o <= n2439_o & n1685_o & n1404_o;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n2440_o select n2441_o <=
    x_reg when "100",
    x_reg when "010",
    n1402_o when "001",
    x_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n2440_o select n2442_o <=
    y_reg when "100",
    n1682_o when "010",
    y_reg when "001",
    y_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n2440_o select n2443_o <=
    n2144_o when "100",
    w_reg when "010",
    w_reg when "001",
    w_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:60:13
  with n2440_o select n2444_o <=
    n2436_o when "100",
    v_reg when "010",
    v_reg when "001",
    v_reg when others;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n2472_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n2473_o <= x_reg when n2472_o = '0' else n2441_o;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n2474_q <= n2473_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n2475_o <= not reset_i;
  -- ../BiquadFilter/BiquadFilter.vhd:54:5
  n2476_o <= y_reg when n2475_o = '0' else n2442_o;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      n2477_q <= n2476_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n2478_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n2478_q <= n2443_o;
    end if;
  end process;
  -- ../BiquadFilter/BiquadFilter.vhd:59:9
  process (clk_i, reset_i)
  begin
    if reset_i = '1' then
      n2479_q <= "0000000000000000000000000";
    elsif rising_edge (clk_i) then
      n2479_q <= n2444_o;
    end if;
  end process;
  -- ../fixed_pkg.vhd:168:39
  n2495_o <= y_reg (22 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n2496_o <= y_reg (24);
  -- ../fixed_pkg.vhd:173:9
  n2501_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n2502_o <= n2501_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n2503: postponed assert n2502_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n2505_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n2506_o <= n2505_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n2507: postponed assert n2506_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n2509_o <= y_reg (23);
  -- ../fixed_pkg.vhd:183:27
  n2510_o <= '1' when n2509_o /= n2496_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n2517_o <= '0' when n2510_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n2521_o <= '1' when n2510_o = '0' else '0';
  -- ../fixed_pkg.vhd:183:23
  n2523_o <= y_reg (22);
  -- ../fixed_pkg.vhd:183:27
  n2524_o <= '1' when n2523_o /= n2496_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n2526_o <= n2517_o when n2535_o = '0' else '1';
  -- ../fixed_pkg.vhd:183:17
  n2532_o <= n2524_o and n2521_o;
  -- ../fixed_pkg.vhd:183:17
  n2535_o <= n2521_o and n2532_o;
  -- ../fixed_pkg.vhd:194:31
  n2537_o <= not n2496_o;
  -- ../fixed_pkg.vhd:194:31
  n2538_o <= not n2496_o;
  -- ../fixed_pkg.vhd:194:31
  n2539_o <= not n2496_o;
  -- ../fixed_pkg.vhd:194:31
  n2540_o <= not n2496_o;
  -- ../fixed_pkg.vhd:194:31
  n2541_o <= not n2496_o;
  -- ../fixed_pkg.vhd:194:31
  n2542_o <= not n2496_o;
  -- ../fixed_pkg.vhd:194:31
  n2543_o <= not n2496_o;
  -- ../fixed_pkg.vhd:194:31
  n2544_o <= not n2496_o;
  -- ../fixed_pkg.vhd:194:31
  n2545_o <= not n2496_o;
  -- ../fixed_pkg.vhd:194:31
  n2546_o <= not n2496_o;
  -- ../fixed_pkg.vhd:194:31
  n2547_o <= not n2496_o;
  -- ../fixed_pkg.vhd:194:31
  n2548_o <= not n2496_o;
  -- ../fixed_pkg.vhd:194:31
  n2549_o <= not n2496_o;
  -- ../fixed_pkg.vhd:194:31
  n2550_o <= not n2496_o;
  -- ../fixed_pkg.vhd:194:31
  n2551_o <= not n2496_o;
  -- ../fixed_pkg.vhd:194:31
  n2552_o <= not n2496_o;
  -- ../fixed_pkg.vhd:194:31
  n2553_o <= not n2496_o;
  -- ../fixed_pkg.vhd:194:31
  n2554_o <= not n2496_o;
  n2555_o <= n2537_o & n2538_o & n2539_o & n2540_o;
  n2556_o <= n2541_o & n2542_o & n2543_o & n2544_o;
  n2557_o <= n2545_o & n2546_o & n2547_o & n2548_o;
  n2558_o <= n2549_o & n2550_o & n2551_o & n2552_o;
  n2559_o <= n2553_o & n2554_o;
  n2560_o <= n2555_o & n2556_o & n2557_o & n2558_o;
  n2561_o <= n2560_o & n2559_o;
  n2562_o <= n2561_o (16 downto 0);
  -- ../fixed_pkg.vhd:199:40
  n2563_o <= n2495_o (22 downto 5);
  n2564_o <= n2496_o & n2562_o;
  -- ../fixed_pkg.vhd:193:9
  n2565_o <= n2563_o when n2526_o = '0' else n2564_o;
end rtl;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture rtl of vocoder is
  signal wrap_clk_i: std_logic;
  signal wrap_reset_i: std_logic;
  signal wrap_valid_i: std_logic;
  subtype typwrap_data_i is std_logic_vector (17 downto 0);
  signal wrap_data_i: typwrap_data_i;
  signal wrap_ready_i: std_logic;
  signal wrap_ready_o: std_logic;
  signal wrap_valid_o: std_logic;
  subtype typwrap_data_o is std_logic_vector (17 downto 0);
  signal wrap_data_o: typwrap_data_o;
  signal bandpass_ready : std_logic_vector (11 downto 0);
  signal bandpass_valid : std_logic_vector (11 downto 0);
  signal lowpass_ready : std_logic_vector (11 downto 0);
  signal lowpass_valid : std_logic_vector (11 downto 0);
  signal bandpass_data : std_logic_vector (215 downto 0);
  signal abs_data : std_logic_vector (215 downto 0);
  signal lowpass_data : std_logic_vector (215 downto 0);
  signal osc_data : std_logic_vector (215 downto 0);
  signal all_lowpass_valid : std_logic;
  signal mixer_ready : std_logic;
  signal channels_gen_n0_bandpass_inst_ready_o : std_logic;
  signal channels_gen_n0_bandpass_inst_valid_o : std_logic;
  signal channels_gen_n0_bandpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n5_o : std_logic;
  signal n8_o : std_logic_vector (17 downto 0);
  signal n18_o : std_logic;
  signal n29_o : std_logic_vector (18 downto 0);
  signal n30_o : std_logic_vector (18 downto 0);
  signal n46_o : std_logic_vector (17 downto 0);
  signal n47_o : std_logic;
  signal n52_o : std_logic;
  signal n53_o : std_logic;
  signal n56_o : std_logic;
  signal n57_o : std_logic;
  signal n60_o : std_logic;
  signal n61_o : std_logic;
  signal n68_o : std_logic;
  signal n74_o : std_logic;
  signal n75_o : std_logic;
  signal n76_o : std_logic;
  signal n77_o : std_logic;
  signal n78_o : std_logic;
  signal n79_o : std_logic;
  signal n80_o : std_logic;
  signal n81_o : std_logic;
  signal n82_o : std_logic;
  signal n83_o : std_logic;
  signal n84_o : std_logic;
  signal n85_o : std_logic;
  signal n86_o : std_logic;
  signal n87_o : std_logic;
  signal n88_o : std_logic;
  signal n89_o : std_logic;
  signal n90_o : std_logic;
  signal n91_o : std_logic;
  signal n92_o : std_logic_vector (3 downto 0);
  signal n93_o : std_logic_vector (3 downto 0);
  signal n94_o : std_logic_vector (3 downto 0);
  signal n95_o : std_logic_vector (3 downto 0);
  signal n96_o : std_logic_vector (1 downto 0);
  signal n97_o : std_logic_vector (15 downto 0);
  signal n98_o : std_logic_vector (17 downto 0);
  signal n99_o : std_logic_vector (16 downto 0);
  signal n100_o : std_logic_vector (17 downto 0);
  signal n101_o : std_logic_vector (17 downto 0);
  signal n103_o : std_logic_vector (17 downto 0);
  signal channels_gen_n0_lowpass_inst_ready_o : std_logic;
  signal channels_gen_n0_lowpass_inst_valid_o : std_logic;
  signal channels_gen_n0_lowpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n105_o : std_logic;
  signal n107_o : std_logic_vector (17 downto 0);
  signal channels_gen_n0_osc_inst_data_o : std_logic_vector (17 downto 0);
  constant n110_o : std_logic_vector (4 downto 0) := "00001";
  signal channels_gen_n1_bandpass_inst_ready_o : std_logic;
  signal channels_gen_n1_bandpass_inst_valid_o : std_logic;
  signal channels_gen_n1_bandpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n114_o : std_logic;
  signal n117_o : std_logic_vector (17 downto 0);
  signal n127_o : std_logic;
  signal n138_o : std_logic_vector (18 downto 0);
  signal n139_o : std_logic_vector (18 downto 0);
  signal n155_o : std_logic_vector (17 downto 0);
  signal n156_o : std_logic;
  signal n161_o : std_logic;
  signal n162_o : std_logic;
  signal n165_o : std_logic;
  signal n166_o : std_logic;
  signal n169_o : std_logic;
  signal n170_o : std_logic;
  signal n177_o : std_logic;
  signal n183_o : std_logic;
  signal n184_o : std_logic;
  signal n185_o : std_logic;
  signal n186_o : std_logic;
  signal n187_o : std_logic;
  signal n188_o : std_logic;
  signal n189_o : std_logic;
  signal n190_o : std_logic;
  signal n191_o : std_logic;
  signal n192_o : std_logic;
  signal n193_o : std_logic;
  signal n194_o : std_logic;
  signal n195_o : std_logic;
  signal n196_o : std_logic;
  signal n197_o : std_logic;
  signal n198_o : std_logic;
  signal n199_o : std_logic;
  signal n200_o : std_logic;
  signal n201_o : std_logic_vector (3 downto 0);
  signal n202_o : std_logic_vector (3 downto 0);
  signal n203_o : std_logic_vector (3 downto 0);
  signal n204_o : std_logic_vector (3 downto 0);
  signal n205_o : std_logic_vector (1 downto 0);
  signal n206_o : std_logic_vector (15 downto 0);
  signal n207_o : std_logic_vector (17 downto 0);
  signal n208_o : std_logic_vector (16 downto 0);
  signal n209_o : std_logic_vector (17 downto 0);
  signal n210_o : std_logic_vector (17 downto 0);
  signal n212_o : std_logic_vector (17 downto 0);
  signal channels_gen_n1_lowpass_inst_ready_o : std_logic;
  signal channels_gen_n1_lowpass_inst_valid_o : std_logic;
  signal channels_gen_n1_lowpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n214_o : std_logic;
  signal n216_o : std_logic_vector (17 downto 0);
  signal channels_gen_n1_osc_inst_data_o : std_logic_vector (17 downto 0);
  constant n219_o : std_logic_vector (4 downto 0) := "00010";
  signal channels_gen_n2_bandpass_inst_ready_o : std_logic;
  signal channels_gen_n2_bandpass_inst_valid_o : std_logic;
  signal channels_gen_n2_bandpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n223_o : std_logic;
  signal n226_o : std_logic_vector (17 downto 0);
  signal n236_o : std_logic;
  signal n247_o : std_logic_vector (18 downto 0);
  signal n248_o : std_logic_vector (18 downto 0);
  signal n264_o : std_logic_vector (17 downto 0);
  signal n265_o : std_logic;
  signal n270_o : std_logic;
  signal n271_o : std_logic;
  signal n274_o : std_logic;
  signal n275_o : std_logic;
  signal n278_o : std_logic;
  signal n279_o : std_logic;
  signal n286_o : std_logic;
  signal n292_o : std_logic;
  signal n293_o : std_logic;
  signal n294_o : std_logic;
  signal n295_o : std_logic;
  signal n296_o : std_logic;
  signal n297_o : std_logic;
  signal n298_o : std_logic;
  signal n299_o : std_logic;
  signal n300_o : std_logic;
  signal n301_o : std_logic;
  signal n302_o : std_logic;
  signal n303_o : std_logic;
  signal n304_o : std_logic;
  signal n305_o : std_logic;
  signal n306_o : std_logic;
  signal n307_o : std_logic;
  signal n308_o : std_logic;
  signal n309_o : std_logic;
  signal n310_o : std_logic_vector (3 downto 0);
  signal n311_o : std_logic_vector (3 downto 0);
  signal n312_o : std_logic_vector (3 downto 0);
  signal n313_o : std_logic_vector (3 downto 0);
  signal n314_o : std_logic_vector (1 downto 0);
  signal n315_o : std_logic_vector (15 downto 0);
  signal n316_o : std_logic_vector (17 downto 0);
  signal n317_o : std_logic_vector (16 downto 0);
  signal n318_o : std_logic_vector (17 downto 0);
  signal n319_o : std_logic_vector (17 downto 0);
  signal n321_o : std_logic_vector (17 downto 0);
  signal channels_gen_n2_lowpass_inst_ready_o : std_logic;
  signal channels_gen_n2_lowpass_inst_valid_o : std_logic;
  signal channels_gen_n2_lowpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n323_o : std_logic;
  signal n325_o : std_logic_vector (17 downto 0);
  signal channels_gen_n2_osc_inst_data_o : std_logic_vector (17 downto 0);
  constant n328_o : std_logic_vector (4 downto 0) := "00011";
  signal channels_gen_n3_bandpass_inst_ready_o : std_logic;
  signal channels_gen_n3_bandpass_inst_valid_o : std_logic;
  signal channels_gen_n3_bandpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n332_o : std_logic;
  signal n335_o : std_logic_vector (17 downto 0);
  signal n345_o : std_logic;
  signal n356_o : std_logic_vector (18 downto 0);
  signal n357_o : std_logic_vector (18 downto 0);
  signal n373_o : std_logic_vector (17 downto 0);
  signal n374_o : std_logic;
  signal n379_o : std_logic;
  signal n380_o : std_logic;
  signal n383_o : std_logic;
  signal n384_o : std_logic;
  signal n387_o : std_logic;
  signal n388_o : std_logic;
  signal n395_o : std_logic;
  signal n401_o : std_logic;
  signal n402_o : std_logic;
  signal n403_o : std_logic;
  signal n404_o : std_logic;
  signal n405_o : std_logic;
  signal n406_o : std_logic;
  signal n407_o : std_logic;
  signal n408_o : std_logic;
  signal n409_o : std_logic;
  signal n410_o : std_logic;
  signal n411_o : std_logic;
  signal n412_o : std_logic;
  signal n413_o : std_logic;
  signal n414_o : std_logic;
  signal n415_o : std_logic;
  signal n416_o : std_logic;
  signal n417_o : std_logic;
  signal n418_o : std_logic;
  signal n419_o : std_logic_vector (3 downto 0);
  signal n420_o : std_logic_vector (3 downto 0);
  signal n421_o : std_logic_vector (3 downto 0);
  signal n422_o : std_logic_vector (3 downto 0);
  signal n423_o : std_logic_vector (1 downto 0);
  signal n424_o : std_logic_vector (15 downto 0);
  signal n425_o : std_logic_vector (17 downto 0);
  signal n426_o : std_logic_vector (16 downto 0);
  signal n427_o : std_logic_vector (17 downto 0);
  signal n428_o : std_logic_vector (17 downto 0);
  signal n430_o : std_logic_vector (17 downto 0);
  signal channels_gen_n3_lowpass_inst_ready_o : std_logic;
  signal channels_gen_n3_lowpass_inst_valid_o : std_logic;
  signal channels_gen_n3_lowpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n432_o : std_logic;
  signal n434_o : std_logic_vector (17 downto 0);
  signal channels_gen_n3_osc_inst_data_o : std_logic_vector (17 downto 0);
  constant n437_o : std_logic_vector (4 downto 0) := "00100";
  signal channels_gen_n4_bandpass_inst_ready_o : std_logic;
  signal channels_gen_n4_bandpass_inst_valid_o : std_logic;
  signal channels_gen_n4_bandpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n441_o : std_logic;
  signal n444_o : std_logic_vector (17 downto 0);
  signal n454_o : std_logic;
  signal n465_o : std_logic_vector (18 downto 0);
  signal n466_o : std_logic_vector (18 downto 0);
  signal n482_o : std_logic_vector (17 downto 0);
  signal n483_o : std_logic;
  signal n488_o : std_logic;
  signal n489_o : std_logic;
  signal n492_o : std_logic;
  signal n493_o : std_logic;
  signal n496_o : std_logic;
  signal n497_o : std_logic;
  signal n504_o : std_logic;
  signal n510_o : std_logic;
  signal n511_o : std_logic;
  signal n512_o : std_logic;
  signal n513_o : std_logic;
  signal n514_o : std_logic;
  signal n515_o : std_logic;
  signal n516_o : std_logic;
  signal n517_o : std_logic;
  signal n518_o : std_logic;
  signal n519_o : std_logic;
  signal n520_o : std_logic;
  signal n521_o : std_logic;
  signal n522_o : std_logic;
  signal n523_o : std_logic;
  signal n524_o : std_logic;
  signal n525_o : std_logic;
  signal n526_o : std_logic;
  signal n527_o : std_logic;
  signal n528_o : std_logic_vector (3 downto 0);
  signal n529_o : std_logic_vector (3 downto 0);
  signal n530_o : std_logic_vector (3 downto 0);
  signal n531_o : std_logic_vector (3 downto 0);
  signal n532_o : std_logic_vector (1 downto 0);
  signal n533_o : std_logic_vector (15 downto 0);
  signal n534_o : std_logic_vector (17 downto 0);
  signal n535_o : std_logic_vector (16 downto 0);
  signal n536_o : std_logic_vector (17 downto 0);
  signal n537_o : std_logic_vector (17 downto 0);
  signal n539_o : std_logic_vector (17 downto 0);
  signal channels_gen_n4_lowpass_inst_ready_o : std_logic;
  signal channels_gen_n4_lowpass_inst_valid_o : std_logic;
  signal channels_gen_n4_lowpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n541_o : std_logic;
  signal n543_o : std_logic_vector (17 downto 0);
  signal channels_gen_n4_osc_inst_data_o : std_logic_vector (17 downto 0);
  constant n546_o : std_logic_vector (4 downto 0) := "00101";
  signal channels_gen_n5_bandpass_inst_ready_o : std_logic;
  signal channels_gen_n5_bandpass_inst_valid_o : std_logic;
  signal channels_gen_n5_bandpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n550_o : std_logic;
  signal n553_o : std_logic_vector (17 downto 0);
  signal n563_o : std_logic;
  signal n574_o : std_logic_vector (18 downto 0);
  signal n575_o : std_logic_vector (18 downto 0);
  signal n591_o : std_logic_vector (17 downto 0);
  signal n592_o : std_logic;
  signal n597_o : std_logic;
  signal n598_o : std_logic;
  signal n601_o : std_logic;
  signal n602_o : std_logic;
  signal n605_o : std_logic;
  signal n606_o : std_logic;
  signal n613_o : std_logic;
  signal n619_o : std_logic;
  signal n620_o : std_logic;
  signal n621_o : std_logic;
  signal n622_o : std_logic;
  signal n623_o : std_logic;
  signal n624_o : std_logic;
  signal n625_o : std_logic;
  signal n626_o : std_logic;
  signal n627_o : std_logic;
  signal n628_o : std_logic;
  signal n629_o : std_logic;
  signal n630_o : std_logic;
  signal n631_o : std_logic;
  signal n632_o : std_logic;
  signal n633_o : std_logic;
  signal n634_o : std_logic;
  signal n635_o : std_logic;
  signal n636_o : std_logic;
  signal n637_o : std_logic_vector (3 downto 0);
  signal n638_o : std_logic_vector (3 downto 0);
  signal n639_o : std_logic_vector (3 downto 0);
  signal n640_o : std_logic_vector (3 downto 0);
  signal n641_o : std_logic_vector (1 downto 0);
  signal n642_o : std_logic_vector (15 downto 0);
  signal n643_o : std_logic_vector (17 downto 0);
  signal n644_o : std_logic_vector (16 downto 0);
  signal n645_o : std_logic_vector (17 downto 0);
  signal n646_o : std_logic_vector (17 downto 0);
  signal n648_o : std_logic_vector (17 downto 0);
  signal channels_gen_n5_lowpass_inst_ready_o : std_logic;
  signal channels_gen_n5_lowpass_inst_valid_o : std_logic;
  signal channels_gen_n5_lowpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n650_o : std_logic;
  signal n652_o : std_logic_vector (17 downto 0);
  signal channels_gen_n5_osc_inst_data_o : std_logic_vector (17 downto 0);
  constant n655_o : std_logic_vector (4 downto 0) := "00110";
  signal channels_gen_n6_bandpass_inst_ready_o : std_logic;
  signal channels_gen_n6_bandpass_inst_valid_o : std_logic;
  signal channels_gen_n6_bandpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n659_o : std_logic;
  signal n662_o : std_logic_vector (17 downto 0);
  signal n672_o : std_logic;
  signal n683_o : std_logic_vector (18 downto 0);
  signal n684_o : std_logic_vector (18 downto 0);
  signal n700_o : std_logic_vector (17 downto 0);
  signal n701_o : std_logic;
  signal n706_o : std_logic;
  signal n707_o : std_logic;
  signal n710_o : std_logic;
  signal n711_o : std_logic;
  signal n714_o : std_logic;
  signal n715_o : std_logic;
  signal n722_o : std_logic;
  signal n728_o : std_logic;
  signal n729_o : std_logic;
  signal n730_o : std_logic;
  signal n731_o : std_logic;
  signal n732_o : std_logic;
  signal n733_o : std_logic;
  signal n734_o : std_logic;
  signal n735_o : std_logic;
  signal n736_o : std_logic;
  signal n737_o : std_logic;
  signal n738_o : std_logic;
  signal n739_o : std_logic;
  signal n740_o : std_logic;
  signal n741_o : std_logic;
  signal n742_o : std_logic;
  signal n743_o : std_logic;
  signal n744_o : std_logic;
  signal n745_o : std_logic;
  signal n746_o : std_logic_vector (3 downto 0);
  signal n747_o : std_logic_vector (3 downto 0);
  signal n748_o : std_logic_vector (3 downto 0);
  signal n749_o : std_logic_vector (3 downto 0);
  signal n750_o : std_logic_vector (1 downto 0);
  signal n751_o : std_logic_vector (15 downto 0);
  signal n752_o : std_logic_vector (17 downto 0);
  signal n753_o : std_logic_vector (16 downto 0);
  signal n754_o : std_logic_vector (17 downto 0);
  signal n755_o : std_logic_vector (17 downto 0);
  signal n757_o : std_logic_vector (17 downto 0);
  signal channels_gen_n6_lowpass_inst_ready_o : std_logic;
  signal channels_gen_n6_lowpass_inst_valid_o : std_logic;
  signal channels_gen_n6_lowpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n759_o : std_logic;
  signal n761_o : std_logic_vector (17 downto 0);
  signal channels_gen_n6_osc_inst_data_o : std_logic_vector (17 downto 0);
  constant n764_o : std_logic_vector (4 downto 0) := "00111";
  signal channels_gen_n7_bandpass_inst_ready_o : std_logic;
  signal channels_gen_n7_bandpass_inst_valid_o : std_logic;
  signal channels_gen_n7_bandpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n768_o : std_logic;
  signal n771_o : std_logic_vector (17 downto 0);
  signal n781_o : std_logic;
  signal n792_o : std_logic_vector (18 downto 0);
  signal n793_o : std_logic_vector (18 downto 0);
  signal n809_o : std_logic_vector (17 downto 0);
  signal n810_o : std_logic;
  signal n815_o : std_logic;
  signal n816_o : std_logic;
  signal n819_o : std_logic;
  signal n820_o : std_logic;
  signal n823_o : std_logic;
  signal n824_o : std_logic;
  signal n831_o : std_logic;
  signal n837_o : std_logic;
  signal n838_o : std_logic;
  signal n839_o : std_logic;
  signal n840_o : std_logic;
  signal n841_o : std_logic;
  signal n842_o : std_logic;
  signal n843_o : std_logic;
  signal n844_o : std_logic;
  signal n845_o : std_logic;
  signal n846_o : std_logic;
  signal n847_o : std_logic;
  signal n848_o : std_logic;
  signal n849_o : std_logic;
  signal n850_o : std_logic;
  signal n851_o : std_logic;
  signal n852_o : std_logic;
  signal n853_o : std_logic;
  signal n854_o : std_logic;
  signal n855_o : std_logic_vector (3 downto 0);
  signal n856_o : std_logic_vector (3 downto 0);
  signal n857_o : std_logic_vector (3 downto 0);
  signal n858_o : std_logic_vector (3 downto 0);
  signal n859_o : std_logic_vector (1 downto 0);
  signal n860_o : std_logic_vector (15 downto 0);
  signal n861_o : std_logic_vector (17 downto 0);
  signal n862_o : std_logic_vector (16 downto 0);
  signal n863_o : std_logic_vector (17 downto 0);
  signal n864_o : std_logic_vector (17 downto 0);
  signal n866_o : std_logic_vector (17 downto 0);
  signal channels_gen_n7_lowpass_inst_ready_o : std_logic;
  signal channels_gen_n7_lowpass_inst_valid_o : std_logic;
  signal channels_gen_n7_lowpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n868_o : std_logic;
  signal n870_o : std_logic_vector (17 downto 0);
  signal channels_gen_n7_osc_inst_data_o : std_logic_vector (17 downto 0);
  constant n873_o : std_logic_vector (4 downto 0) := "01000";
  signal channels_gen_n8_bandpass_inst_ready_o : std_logic;
  signal channels_gen_n8_bandpass_inst_valid_o : std_logic;
  signal channels_gen_n8_bandpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n877_o : std_logic;
  signal n880_o : std_logic_vector (17 downto 0);
  signal n890_o : std_logic;
  signal n901_o : std_logic_vector (18 downto 0);
  signal n902_o : std_logic_vector (18 downto 0);
  signal n918_o : std_logic_vector (17 downto 0);
  signal n919_o : std_logic;
  signal n924_o : std_logic;
  signal n925_o : std_logic;
  signal n928_o : std_logic;
  signal n929_o : std_logic;
  signal n932_o : std_logic;
  signal n933_o : std_logic;
  signal n940_o : std_logic;
  signal n946_o : std_logic;
  signal n947_o : std_logic;
  signal n948_o : std_logic;
  signal n949_o : std_logic;
  signal n950_o : std_logic;
  signal n951_o : std_logic;
  signal n952_o : std_logic;
  signal n953_o : std_logic;
  signal n954_o : std_logic;
  signal n955_o : std_logic;
  signal n956_o : std_logic;
  signal n957_o : std_logic;
  signal n958_o : std_logic;
  signal n959_o : std_logic;
  signal n960_o : std_logic;
  signal n961_o : std_logic;
  signal n962_o : std_logic;
  signal n963_o : std_logic;
  signal n964_o : std_logic_vector (3 downto 0);
  signal n965_o : std_logic_vector (3 downto 0);
  signal n966_o : std_logic_vector (3 downto 0);
  signal n967_o : std_logic_vector (3 downto 0);
  signal n968_o : std_logic_vector (1 downto 0);
  signal n969_o : std_logic_vector (15 downto 0);
  signal n970_o : std_logic_vector (17 downto 0);
  signal n971_o : std_logic_vector (16 downto 0);
  signal n972_o : std_logic_vector (17 downto 0);
  signal n973_o : std_logic_vector (17 downto 0);
  signal n975_o : std_logic_vector (17 downto 0);
  signal channels_gen_n8_lowpass_inst_ready_o : std_logic;
  signal channels_gen_n8_lowpass_inst_valid_o : std_logic;
  signal channels_gen_n8_lowpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n977_o : std_logic;
  signal n979_o : std_logic_vector (17 downto 0);
  signal channels_gen_n8_osc_inst_data_o : std_logic_vector (17 downto 0);
  constant n982_o : std_logic_vector (4 downto 0) := "01001";
  signal channels_gen_n9_bandpass_inst_ready_o : std_logic;
  signal channels_gen_n9_bandpass_inst_valid_o : std_logic;
  signal channels_gen_n9_bandpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n986_o : std_logic;
  signal n989_o : std_logic_vector (17 downto 0);
  signal n999_o : std_logic;
  signal n1010_o : std_logic_vector (18 downto 0);
  signal n1011_o : std_logic_vector (18 downto 0);
  signal n1027_o : std_logic_vector (17 downto 0);
  signal n1028_o : std_logic;
  signal n1033_o : std_logic;
  signal n1034_o : std_logic;
  signal n1037_o : std_logic;
  signal n1038_o : std_logic;
  signal n1041_o : std_logic;
  signal n1042_o : std_logic;
  signal n1049_o : std_logic;
  signal n1055_o : std_logic;
  signal n1056_o : std_logic;
  signal n1057_o : std_logic;
  signal n1058_o : std_logic;
  signal n1059_o : std_logic;
  signal n1060_o : std_logic;
  signal n1061_o : std_logic;
  signal n1062_o : std_logic;
  signal n1063_o : std_logic;
  signal n1064_o : std_logic;
  signal n1065_o : std_logic;
  signal n1066_o : std_logic;
  signal n1067_o : std_logic;
  signal n1068_o : std_logic;
  signal n1069_o : std_logic;
  signal n1070_o : std_logic;
  signal n1071_o : std_logic;
  signal n1072_o : std_logic;
  signal n1073_o : std_logic_vector (3 downto 0);
  signal n1074_o : std_logic_vector (3 downto 0);
  signal n1075_o : std_logic_vector (3 downto 0);
  signal n1076_o : std_logic_vector (3 downto 0);
  signal n1077_o : std_logic_vector (1 downto 0);
  signal n1078_o : std_logic_vector (15 downto 0);
  signal n1079_o : std_logic_vector (17 downto 0);
  signal n1080_o : std_logic_vector (16 downto 0);
  signal n1081_o : std_logic_vector (17 downto 0);
  signal n1082_o : std_logic_vector (17 downto 0);
  signal n1084_o : std_logic_vector (17 downto 0);
  signal channels_gen_n9_lowpass_inst_ready_o : std_logic;
  signal channels_gen_n9_lowpass_inst_valid_o : std_logic;
  signal channels_gen_n9_lowpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n1086_o : std_logic;
  signal n1088_o : std_logic_vector (17 downto 0);
  signal channels_gen_n9_osc_inst_data_o : std_logic_vector (17 downto 0);
  constant n1091_o : std_logic_vector (4 downto 0) := "01010";
  signal channels_gen_n10_bandpass_inst_ready_o : std_logic;
  signal channels_gen_n10_bandpass_inst_valid_o : std_logic;
  signal channels_gen_n10_bandpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n1095_o : std_logic;
  signal n1098_o : std_logic_vector (17 downto 0);
  signal n1108_o : std_logic;
  signal n1119_o : std_logic_vector (18 downto 0);
  signal n1120_o : std_logic_vector (18 downto 0);
  signal n1136_o : std_logic_vector (17 downto 0);
  signal n1137_o : std_logic;
  signal n1142_o : std_logic;
  signal n1143_o : std_logic;
  signal n1146_o : std_logic;
  signal n1147_o : std_logic;
  signal n1150_o : std_logic;
  signal n1151_o : std_logic;
  signal n1158_o : std_logic;
  signal n1164_o : std_logic;
  signal n1165_o : std_logic;
  signal n1166_o : std_logic;
  signal n1167_o : std_logic;
  signal n1168_o : std_logic;
  signal n1169_o : std_logic;
  signal n1170_o : std_logic;
  signal n1171_o : std_logic;
  signal n1172_o : std_logic;
  signal n1173_o : std_logic;
  signal n1174_o : std_logic;
  signal n1175_o : std_logic;
  signal n1176_o : std_logic;
  signal n1177_o : std_logic;
  signal n1178_o : std_logic;
  signal n1179_o : std_logic;
  signal n1180_o : std_logic;
  signal n1181_o : std_logic;
  signal n1182_o : std_logic_vector (3 downto 0);
  signal n1183_o : std_logic_vector (3 downto 0);
  signal n1184_o : std_logic_vector (3 downto 0);
  signal n1185_o : std_logic_vector (3 downto 0);
  signal n1186_o : std_logic_vector (1 downto 0);
  signal n1187_o : std_logic_vector (15 downto 0);
  signal n1188_o : std_logic_vector (17 downto 0);
  signal n1189_o : std_logic_vector (16 downto 0);
  signal n1190_o : std_logic_vector (17 downto 0);
  signal n1191_o : std_logic_vector (17 downto 0);
  signal n1193_o : std_logic_vector (17 downto 0);
  signal channels_gen_n10_lowpass_inst_ready_o : std_logic;
  signal channels_gen_n10_lowpass_inst_valid_o : std_logic;
  signal channels_gen_n10_lowpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n1195_o : std_logic;
  signal n1197_o : std_logic_vector (17 downto 0);
  signal channels_gen_n10_osc_inst_data_o : std_logic_vector (17 downto 0);
  constant n1200_o : std_logic_vector (4 downto 0) := "01011";
  signal channels_gen_n11_bandpass_inst_ready_o : std_logic;
  signal channels_gen_n11_bandpass_inst_valid_o : std_logic;
  signal channels_gen_n11_bandpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n1204_o : std_logic;
  signal n1207_o : std_logic_vector (17 downto 0);
  signal n1217_o : std_logic;
  signal n1228_o : std_logic_vector (18 downto 0);
  signal n1229_o : std_logic_vector (18 downto 0);
  signal n1245_o : std_logic_vector (17 downto 0);
  signal n1246_o : std_logic;
  signal n1251_o : std_logic;
  signal n1252_o : std_logic;
  signal n1255_o : std_logic;
  signal n1256_o : std_logic;
  signal n1259_o : std_logic;
  signal n1260_o : std_logic;
  signal n1267_o : std_logic;
  signal n1273_o : std_logic;
  signal n1274_o : std_logic;
  signal n1275_o : std_logic;
  signal n1276_o : std_logic;
  signal n1277_o : std_logic;
  signal n1278_o : std_logic;
  signal n1279_o : std_logic;
  signal n1280_o : std_logic;
  signal n1281_o : std_logic;
  signal n1282_o : std_logic;
  signal n1283_o : std_logic;
  signal n1284_o : std_logic;
  signal n1285_o : std_logic;
  signal n1286_o : std_logic;
  signal n1287_o : std_logic;
  signal n1288_o : std_logic;
  signal n1289_o : std_logic;
  signal n1290_o : std_logic;
  signal n1291_o : std_logic_vector (3 downto 0);
  signal n1292_o : std_logic_vector (3 downto 0);
  signal n1293_o : std_logic_vector (3 downto 0);
  signal n1294_o : std_logic_vector (3 downto 0);
  signal n1295_o : std_logic_vector (1 downto 0);
  signal n1296_o : std_logic_vector (15 downto 0);
  signal n1297_o : std_logic_vector (17 downto 0);
  signal n1298_o : std_logic_vector (16 downto 0);
  signal n1299_o : std_logic_vector (17 downto 0);
  signal n1300_o : std_logic_vector (17 downto 0);
  signal n1302_o : std_logic_vector (17 downto 0);
  signal channels_gen_n11_lowpass_inst_ready_o : std_logic;
  signal channels_gen_n11_lowpass_inst_valid_o : std_logic;
  signal channels_gen_n11_lowpass_inst_data_o : std_logic_vector (17 downto 0);
  signal n1304_o : std_logic;
  signal n1306_o : std_logic_vector (17 downto 0);
  signal channels_gen_n11_osc_inst_data_o : std_logic_vector (17 downto 0);
  constant n1309_o : std_logic_vector (4 downto 0) := "01100";
  signal mixer_inst_ready_o : std_logic;
  signal mixer_inst_valid_o : std_logic;
  signal mixer_inst_data_o : std_logic_vector (17 downto 0);
  signal n1316_o : std_logic;
  signal n1317_o : std_logic;
  signal n1321_o : std_logic;
  signal n1322_o : std_logic;
  signal n1324_o : std_logic_vector (11 downto 0);
  signal n1325_o : std_logic_vector (11 downto 0);
  signal n1326_o : std_logic_vector (11 downto 0);
  signal n1327_o : std_logic_vector (11 downto 0);
  signal n1328_o : std_logic_vector (215 downto 0);
  signal n1329_o : std_logic_vector (215 downto 0);
  signal n1330_o : std_logic_vector (215 downto 0);
  signal n1331_o : std_logic_vector (215 downto 0);
begin
  wrap_clk_i <= clk_i;
  wrap_reset_i <= reset_i;
  wrap_valid_i <= valid_i;
  wrap_data_i <= typwrap_data_i(data_i);
  wrap_ready_i <= ready_i;
  ready_o <= wrap_ready_o;
  valid_o <= wrap_valid_o;
  data_o <= sfixed(wrap_data_o);
  wrap_ready_o <= n1322_o;
  wrap_valid_o <= mixer_inst_valid_o;
  wrap_data_o <= mixer_inst_data_o;
  -- Vocoder.vhd:23:12
  bandpass_ready <= n1324_o; -- (signal)
  -- Vocoder.vhd:23:28
  bandpass_valid <= n1325_o; -- (signal)
  -- Vocoder.vhd:24:12
  lowpass_ready <= n1326_o; -- (signal)
  -- Vocoder.vhd:24:27
  lowpass_valid <= n1327_o; -- (signal)
  -- Vocoder.vhd:25:12
  bandpass_data <= n1328_o; -- (signal)
  -- Vocoder.vhd:25:27
  abs_data <= n1329_o; -- (signal)
  -- Vocoder.vhd:25:37
  lowpass_data <= n1330_o; -- (signal)
  -- Vocoder.vhd:26:12
  osc_data <= n1331_o; -- (signal)
  -- Vocoder.vhd:27:12
  all_lowpass_valid <= n1317_o; -- (signal)
  -- Vocoder.vhd:27:31
  mixer_ready <= mixer_inst_ready_o; -- (signal)
  -- Vocoder.vhd:30:9
  channels_gen_n0_bandpass_inst : entity work.biquadfilter_b8edb8c1ddb8ce49b98343d308dc8c4d73c37c7f port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => wrap_valid_i,
    data_i => wrap_data_i,
    ready_i => n5_o,
    ready_o => channels_gen_n0_bandpass_inst_ready_o,
    valid_o => channels_gen_n0_bandpass_inst_valid_o,
    data_o => channels_gen_n0_bandpass_inst_data_o);
  -- Vocoder.vhd:45:41
  n5_o <= lowpass_ready (11);
  -- Vocoder.vhd:49:41
  n8_o <= bandpass_data (215 downto 198);
  -- ../fixed_pkg.vhd:216:26
  n18_o <= n8_o (17);
  -- ../fixed_pkg.vhd:229:32
  n29_o <= std_logic_vector (resize (signed (n8_o), 19));  --  sext
  -- ../fixed_pkg.vhd:230:68
  n30_o <= std_logic_vector(-signed (n29_o));
  -- ../fixed_pkg.vhd:168:39
  n46_o <= n30_o (17 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n47_o <= n30_o (18);
  -- ../fixed_pkg.vhd:173:9
  n52_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n53_o <= n52_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n54: postponed assert n53_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n56_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n57_o <= n56_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n58: postponed assert n57_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n60_o <= n30_o (17);
  -- ../fixed_pkg.vhd:183:27
  n61_o <= '1' when n60_o /= n47_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n68_o <= '0' when n61_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n74_o <= not n47_o;
  -- ../fixed_pkg.vhd:194:31
  n75_o <= not n47_o;
  -- ../fixed_pkg.vhd:194:31
  n76_o <= not n47_o;
  -- ../fixed_pkg.vhd:194:31
  n77_o <= not n47_o;
  -- ../fixed_pkg.vhd:194:31
  n78_o <= not n47_o;
  -- ../fixed_pkg.vhd:194:31
  n79_o <= not n47_o;
  -- ../fixed_pkg.vhd:194:31
  n80_o <= not n47_o;
  -- ../fixed_pkg.vhd:194:31
  n81_o <= not n47_o;
  -- ../fixed_pkg.vhd:194:31
  n82_o <= not n47_o;
  -- ../fixed_pkg.vhd:194:31
  n83_o <= not n47_o;
  -- ../fixed_pkg.vhd:194:31
  n84_o <= not n47_o;
  -- ../fixed_pkg.vhd:194:31
  n85_o <= not n47_o;
  -- ../fixed_pkg.vhd:194:31
  n86_o <= not n47_o;
  -- ../fixed_pkg.vhd:194:31
  n87_o <= not n47_o;
  -- ../fixed_pkg.vhd:194:31
  n88_o <= not n47_o;
  -- ../fixed_pkg.vhd:194:31
  n89_o <= not n47_o;
  -- ../fixed_pkg.vhd:194:31
  n90_o <= not n47_o;
  -- ../fixed_pkg.vhd:194:31
  n91_o <= not n47_o;
  n92_o <= n74_o & n75_o & n76_o & n77_o;
  n93_o <= n78_o & n79_o & n80_o & n81_o;
  n94_o <= n82_o & n83_o & n84_o & n85_o;
  n95_o <= n86_o & n87_o & n88_o & n89_o;
  n96_o <= n90_o & n91_o;
  n97_o <= n92_o & n93_o & n94_o & n95_o;
  n98_o <= n97_o & n96_o;
  n99_o <= n98_o (16 downto 0);
  n100_o <= n47_o & n99_o;
  -- ../fixed_pkg.vhd:193:9
  n101_o <= n46_o when n68_o = '0' else n100_o;
  -- ../fixed_pkg.vhd:221:9
  n103_o <= n8_o when n18_o = '0' else n101_o;
  -- Vocoder.vhd:51:9
  channels_gen_n0_lowpass_inst : entity work.biquadfilter_97b779b18cb8cdee50a9e62c5c999787ca4e4f2b port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => n105_o,
    data_i => n107_o,
    ready_i => mixer_ready,
    ready_o => channels_gen_n0_lowpass_inst_ready_o,
    valid_o => channels_gen_n0_lowpass_inst_valid_o,
    data_o => channels_gen_n0_lowpass_inst_data_o);
  -- Vocoder.vhd:62:42
  n105_o <= bandpass_valid (11);
  -- Vocoder.vhd:64:36
  n107_o <= abs_data (215 downto 198);
  -- Vocoder.vhd:70:9
  channels_gen_n0_osc_inst : entity work.oscillator port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    step_i => n110_o,
    ready_i => mixer_ready,
    data_o => channels_gen_n0_osc_inst_data_o);
  -- Vocoder.vhd:30:9
  channels_gen_n1_bandpass_inst : entity work.biquadfilter_a8d8a4d0d0a0f8df06960275d213b2bd370e1dd4 port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => wrap_valid_i,
    data_i => wrap_data_i,
    ready_i => n114_o,
    ready_o => channels_gen_n1_bandpass_inst_ready_o,
    valid_o => channels_gen_n1_bandpass_inst_valid_o,
    data_o => channels_gen_n1_bandpass_inst_data_o);
  -- Vocoder.vhd:45:41
  n114_o <= lowpass_ready (10);
  -- Vocoder.vhd:49:41
  n117_o <= bandpass_data (197 downto 180);
  -- ../fixed_pkg.vhd:216:26
  n127_o <= n117_o (17);
  -- ../fixed_pkg.vhd:229:32
  n138_o <= std_logic_vector (resize (signed (n117_o), 19));  --  sext
  -- ../fixed_pkg.vhd:230:68
  n139_o <= std_logic_vector(-signed (n138_o));
  -- ../fixed_pkg.vhd:168:39
  n155_o <= n139_o (17 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n156_o <= n139_o (18);
  -- ../fixed_pkg.vhd:173:9
  n161_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n162_o <= n161_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n163: postponed assert n162_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n165_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n166_o <= n165_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n167: postponed assert n166_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n169_o <= n139_o (17);
  -- ../fixed_pkg.vhd:183:27
  n170_o <= '1' when n169_o /= n156_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n177_o <= '0' when n170_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n183_o <= not n156_o;
  -- ../fixed_pkg.vhd:194:31
  n184_o <= not n156_o;
  -- ../fixed_pkg.vhd:194:31
  n185_o <= not n156_o;
  -- ../fixed_pkg.vhd:194:31
  n186_o <= not n156_o;
  -- ../fixed_pkg.vhd:194:31
  n187_o <= not n156_o;
  -- ../fixed_pkg.vhd:194:31
  n188_o <= not n156_o;
  -- ../fixed_pkg.vhd:194:31
  n189_o <= not n156_o;
  -- ../fixed_pkg.vhd:194:31
  n190_o <= not n156_o;
  -- ../fixed_pkg.vhd:194:31
  n191_o <= not n156_o;
  -- ../fixed_pkg.vhd:194:31
  n192_o <= not n156_o;
  -- ../fixed_pkg.vhd:194:31
  n193_o <= not n156_o;
  -- ../fixed_pkg.vhd:194:31
  n194_o <= not n156_o;
  -- ../fixed_pkg.vhd:194:31
  n195_o <= not n156_o;
  -- ../fixed_pkg.vhd:194:31
  n196_o <= not n156_o;
  -- ../fixed_pkg.vhd:194:31
  n197_o <= not n156_o;
  -- ../fixed_pkg.vhd:194:31
  n198_o <= not n156_o;
  -- ../fixed_pkg.vhd:194:31
  n199_o <= not n156_o;
  -- ../fixed_pkg.vhd:194:31
  n200_o <= not n156_o;
  n201_o <= n183_o & n184_o & n185_o & n186_o;
  n202_o <= n187_o & n188_o & n189_o & n190_o;
  n203_o <= n191_o & n192_o & n193_o & n194_o;
  n204_o <= n195_o & n196_o & n197_o & n198_o;
  n205_o <= n199_o & n200_o;
  n206_o <= n201_o & n202_o & n203_o & n204_o;
  n207_o <= n206_o & n205_o;
  n208_o <= n207_o (16 downto 0);
  n209_o <= n156_o & n208_o;
  -- ../fixed_pkg.vhd:193:9
  n210_o <= n155_o when n177_o = '0' else n209_o;
  -- ../fixed_pkg.vhd:221:9
  n212_o <= n117_o when n127_o = '0' else n210_o;
  -- Vocoder.vhd:51:9
  channels_gen_n1_lowpass_inst : entity work.biquadfilter_97b779b18cb8cdee50a9e62c5c999787ca4e4f2b port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => n214_o,
    data_i => n216_o,
    ready_i => mixer_ready,
    ready_o => channels_gen_n1_lowpass_inst_ready_o,
    valid_o => channels_gen_n1_lowpass_inst_valid_o,
    data_o => channels_gen_n1_lowpass_inst_data_o);
  -- Vocoder.vhd:62:42
  n214_o <= bandpass_valid (10);
  -- Vocoder.vhd:64:36
  n216_o <= abs_data (197 downto 180);
  -- Vocoder.vhd:70:9
  channels_gen_n1_osc_inst : entity work.oscillator port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    step_i => n219_o,
    ready_i => mixer_ready,
    data_o => channels_gen_n1_osc_inst_data_o);
  -- Vocoder.vhd:30:9
  channels_gen_n2_bandpass_inst : entity work.biquadfilter_7219f090b8e97a5f56406d3102d0d9a2fe57c6ac port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => wrap_valid_i,
    data_i => wrap_data_i,
    ready_i => n223_o,
    ready_o => channels_gen_n2_bandpass_inst_ready_o,
    valid_o => channels_gen_n2_bandpass_inst_valid_o,
    data_o => channels_gen_n2_bandpass_inst_data_o);
  -- Vocoder.vhd:45:41
  n223_o <= lowpass_ready (9);
  -- Vocoder.vhd:49:41
  n226_o <= bandpass_data (179 downto 162);
  -- ../fixed_pkg.vhd:216:26
  n236_o <= n226_o (17);
  -- ../fixed_pkg.vhd:229:32
  n247_o <= std_logic_vector (resize (signed (n226_o), 19));  --  sext
  -- ../fixed_pkg.vhd:230:68
  n248_o <= std_logic_vector(-signed (n247_o));
  -- ../fixed_pkg.vhd:168:39
  n264_o <= n248_o (17 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n265_o <= n248_o (18);
  -- ../fixed_pkg.vhd:173:9
  n270_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n271_o <= n270_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n272: postponed assert n271_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n274_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n275_o <= n274_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n276: postponed assert n275_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n278_o <= n248_o (17);
  -- ../fixed_pkg.vhd:183:27
  n279_o <= '1' when n278_o /= n265_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n286_o <= '0' when n279_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n292_o <= not n265_o;
  -- ../fixed_pkg.vhd:194:31
  n293_o <= not n265_o;
  -- ../fixed_pkg.vhd:194:31
  n294_o <= not n265_o;
  -- ../fixed_pkg.vhd:194:31
  n295_o <= not n265_o;
  -- ../fixed_pkg.vhd:194:31
  n296_o <= not n265_o;
  -- ../fixed_pkg.vhd:194:31
  n297_o <= not n265_o;
  -- ../fixed_pkg.vhd:194:31
  n298_o <= not n265_o;
  -- ../fixed_pkg.vhd:194:31
  n299_o <= not n265_o;
  -- ../fixed_pkg.vhd:194:31
  n300_o <= not n265_o;
  -- ../fixed_pkg.vhd:194:31
  n301_o <= not n265_o;
  -- ../fixed_pkg.vhd:194:31
  n302_o <= not n265_o;
  -- ../fixed_pkg.vhd:194:31
  n303_o <= not n265_o;
  -- ../fixed_pkg.vhd:194:31
  n304_o <= not n265_o;
  -- ../fixed_pkg.vhd:194:31
  n305_o <= not n265_o;
  -- ../fixed_pkg.vhd:194:31
  n306_o <= not n265_o;
  -- ../fixed_pkg.vhd:194:31
  n307_o <= not n265_o;
  -- ../fixed_pkg.vhd:194:31
  n308_o <= not n265_o;
  -- ../fixed_pkg.vhd:194:31
  n309_o <= not n265_o;
  n310_o <= n292_o & n293_o & n294_o & n295_o;
  n311_o <= n296_o & n297_o & n298_o & n299_o;
  n312_o <= n300_o & n301_o & n302_o & n303_o;
  n313_o <= n304_o & n305_o & n306_o & n307_o;
  n314_o <= n308_o & n309_o;
  n315_o <= n310_o & n311_o & n312_o & n313_o;
  n316_o <= n315_o & n314_o;
  n317_o <= n316_o (16 downto 0);
  n318_o <= n265_o & n317_o;
  -- ../fixed_pkg.vhd:193:9
  n319_o <= n264_o when n286_o = '0' else n318_o;
  -- ../fixed_pkg.vhd:221:9
  n321_o <= n226_o when n236_o = '0' else n319_o;
  -- Vocoder.vhd:51:9
  channels_gen_n2_lowpass_inst : entity work.biquadfilter_97b779b18cb8cdee50a9e62c5c999787ca4e4f2b port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => n323_o,
    data_i => n325_o,
    ready_i => mixer_ready,
    ready_o => channels_gen_n2_lowpass_inst_ready_o,
    valid_o => channels_gen_n2_lowpass_inst_valid_o,
    data_o => channels_gen_n2_lowpass_inst_data_o);
  -- Vocoder.vhd:62:42
  n323_o <= bandpass_valid (9);
  -- Vocoder.vhd:64:36
  n325_o <= abs_data (179 downto 162);
  -- Vocoder.vhd:70:9
  channels_gen_n2_osc_inst : entity work.oscillator port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    step_i => n328_o,
    ready_i => mixer_ready,
    data_o => channels_gen_n2_osc_inst_data_o);
  -- Vocoder.vhd:30:9
  channels_gen_n3_bandpass_inst : entity work.biquadfilter_1c66bf3a8e40435213527cf7b156d31cf673b516 port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => wrap_valid_i,
    data_i => wrap_data_i,
    ready_i => n332_o,
    ready_o => channels_gen_n3_bandpass_inst_ready_o,
    valid_o => channels_gen_n3_bandpass_inst_valid_o,
    data_o => channels_gen_n3_bandpass_inst_data_o);
  -- Vocoder.vhd:45:41
  n332_o <= lowpass_ready (8);
  -- Vocoder.vhd:49:41
  n335_o <= bandpass_data (161 downto 144);
  -- ../fixed_pkg.vhd:216:26
  n345_o <= n335_o (17);
  -- ../fixed_pkg.vhd:229:32
  n356_o <= std_logic_vector (resize (signed (n335_o), 19));  --  sext
  -- ../fixed_pkg.vhd:230:68
  n357_o <= std_logic_vector(-signed (n356_o));
  -- ../fixed_pkg.vhd:168:39
  n373_o <= n357_o (17 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n374_o <= n357_o (18);
  -- ../fixed_pkg.vhd:173:9
  n379_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n380_o <= n379_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n381: postponed assert n380_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n383_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n384_o <= n383_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n385: postponed assert n384_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n387_o <= n357_o (17);
  -- ../fixed_pkg.vhd:183:27
  n388_o <= '1' when n387_o /= n374_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n395_o <= '0' when n388_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n401_o <= not n374_o;
  -- ../fixed_pkg.vhd:194:31
  n402_o <= not n374_o;
  -- ../fixed_pkg.vhd:194:31
  n403_o <= not n374_o;
  -- ../fixed_pkg.vhd:194:31
  n404_o <= not n374_o;
  -- ../fixed_pkg.vhd:194:31
  n405_o <= not n374_o;
  -- ../fixed_pkg.vhd:194:31
  n406_o <= not n374_o;
  -- ../fixed_pkg.vhd:194:31
  n407_o <= not n374_o;
  -- ../fixed_pkg.vhd:194:31
  n408_o <= not n374_o;
  -- ../fixed_pkg.vhd:194:31
  n409_o <= not n374_o;
  -- ../fixed_pkg.vhd:194:31
  n410_o <= not n374_o;
  -- ../fixed_pkg.vhd:194:31
  n411_o <= not n374_o;
  -- ../fixed_pkg.vhd:194:31
  n412_o <= not n374_o;
  -- ../fixed_pkg.vhd:194:31
  n413_o <= not n374_o;
  -- ../fixed_pkg.vhd:194:31
  n414_o <= not n374_o;
  -- ../fixed_pkg.vhd:194:31
  n415_o <= not n374_o;
  -- ../fixed_pkg.vhd:194:31
  n416_o <= not n374_o;
  -- ../fixed_pkg.vhd:194:31
  n417_o <= not n374_o;
  -- ../fixed_pkg.vhd:194:31
  n418_o <= not n374_o;
  n419_o <= n401_o & n402_o & n403_o & n404_o;
  n420_o <= n405_o & n406_o & n407_o & n408_o;
  n421_o <= n409_o & n410_o & n411_o & n412_o;
  n422_o <= n413_o & n414_o & n415_o & n416_o;
  n423_o <= n417_o & n418_o;
  n424_o <= n419_o & n420_o & n421_o & n422_o;
  n425_o <= n424_o & n423_o;
  n426_o <= n425_o (16 downto 0);
  n427_o <= n374_o & n426_o;
  -- ../fixed_pkg.vhd:193:9
  n428_o <= n373_o when n395_o = '0' else n427_o;
  -- ../fixed_pkg.vhd:221:9
  n430_o <= n335_o when n345_o = '0' else n428_o;
  -- Vocoder.vhd:51:9
  channels_gen_n3_lowpass_inst : entity work.biquadfilter_97b779b18cb8cdee50a9e62c5c999787ca4e4f2b port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => n432_o,
    data_i => n434_o,
    ready_i => mixer_ready,
    ready_o => channels_gen_n3_lowpass_inst_ready_o,
    valid_o => channels_gen_n3_lowpass_inst_valid_o,
    data_o => channels_gen_n3_lowpass_inst_data_o);
  -- Vocoder.vhd:62:42
  n432_o <= bandpass_valid (8);
  -- Vocoder.vhd:64:36
  n434_o <= abs_data (161 downto 144);
  -- Vocoder.vhd:70:9
  channels_gen_n3_osc_inst : entity work.oscillator port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    step_i => n437_o,
    ready_i => mixer_ready,
    data_o => channels_gen_n3_osc_inst_data_o);
  -- Vocoder.vhd:30:9
  channels_gen_n4_bandpass_inst : entity work.biquadfilter_fe6dfdc304e908e186d08440fe9f1574ff586857 port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => wrap_valid_i,
    data_i => wrap_data_i,
    ready_i => n441_o,
    ready_o => channels_gen_n4_bandpass_inst_ready_o,
    valid_o => channels_gen_n4_bandpass_inst_valid_o,
    data_o => channels_gen_n4_bandpass_inst_data_o);
  -- Vocoder.vhd:45:41
  n441_o <= lowpass_ready (7);
  -- Vocoder.vhd:49:41
  n444_o <= bandpass_data (143 downto 126);
  -- ../fixed_pkg.vhd:216:26
  n454_o <= n444_o (17);
  -- ../fixed_pkg.vhd:229:32
  n465_o <= std_logic_vector (resize (signed (n444_o), 19));  --  sext
  -- ../fixed_pkg.vhd:230:68
  n466_o <= std_logic_vector(-signed (n465_o));
  -- ../fixed_pkg.vhd:168:39
  n482_o <= n466_o (17 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n483_o <= n466_o (18);
  -- ../fixed_pkg.vhd:173:9
  n488_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n489_o <= n488_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n490: postponed assert n489_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n492_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n493_o <= n492_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n494: postponed assert n493_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n496_o <= n466_o (17);
  -- ../fixed_pkg.vhd:183:27
  n497_o <= '1' when n496_o /= n483_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n504_o <= '0' when n497_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n510_o <= not n483_o;
  -- ../fixed_pkg.vhd:194:31
  n511_o <= not n483_o;
  -- ../fixed_pkg.vhd:194:31
  n512_o <= not n483_o;
  -- ../fixed_pkg.vhd:194:31
  n513_o <= not n483_o;
  -- ../fixed_pkg.vhd:194:31
  n514_o <= not n483_o;
  -- ../fixed_pkg.vhd:194:31
  n515_o <= not n483_o;
  -- ../fixed_pkg.vhd:194:31
  n516_o <= not n483_o;
  -- ../fixed_pkg.vhd:194:31
  n517_o <= not n483_o;
  -- ../fixed_pkg.vhd:194:31
  n518_o <= not n483_o;
  -- ../fixed_pkg.vhd:194:31
  n519_o <= not n483_o;
  -- ../fixed_pkg.vhd:194:31
  n520_o <= not n483_o;
  -- ../fixed_pkg.vhd:194:31
  n521_o <= not n483_o;
  -- ../fixed_pkg.vhd:194:31
  n522_o <= not n483_o;
  -- ../fixed_pkg.vhd:194:31
  n523_o <= not n483_o;
  -- ../fixed_pkg.vhd:194:31
  n524_o <= not n483_o;
  -- ../fixed_pkg.vhd:194:31
  n525_o <= not n483_o;
  -- ../fixed_pkg.vhd:194:31
  n526_o <= not n483_o;
  -- ../fixed_pkg.vhd:194:31
  n527_o <= not n483_o;
  n528_o <= n510_o & n511_o & n512_o & n513_o;
  n529_o <= n514_o & n515_o & n516_o & n517_o;
  n530_o <= n518_o & n519_o & n520_o & n521_o;
  n531_o <= n522_o & n523_o & n524_o & n525_o;
  n532_o <= n526_o & n527_o;
  n533_o <= n528_o & n529_o & n530_o & n531_o;
  n534_o <= n533_o & n532_o;
  n535_o <= n534_o (16 downto 0);
  n536_o <= n483_o & n535_o;
  -- ../fixed_pkg.vhd:193:9
  n537_o <= n482_o when n504_o = '0' else n536_o;
  -- ../fixed_pkg.vhd:221:9
  n539_o <= n444_o when n454_o = '0' else n537_o;
  -- Vocoder.vhd:51:9
  channels_gen_n4_lowpass_inst : entity work.biquadfilter_97b779b18cb8cdee50a9e62c5c999787ca4e4f2b port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => n541_o,
    data_i => n543_o,
    ready_i => mixer_ready,
    ready_o => channels_gen_n4_lowpass_inst_ready_o,
    valid_o => channels_gen_n4_lowpass_inst_valid_o,
    data_o => channels_gen_n4_lowpass_inst_data_o);
  -- Vocoder.vhd:62:42
  n541_o <= bandpass_valid (7);
  -- Vocoder.vhd:64:36
  n543_o <= abs_data (143 downto 126);
  -- Vocoder.vhd:70:9
  channels_gen_n4_osc_inst : entity work.oscillator port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    step_i => n546_o,
    ready_i => mixer_ready,
    data_o => channels_gen_n4_osc_inst_data_o);
  -- Vocoder.vhd:30:9
  channels_gen_n5_bandpass_inst : entity work.biquadfilter_7b2580a4b712e4b7d247f86df16ab6a0b5823514 port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => wrap_valid_i,
    data_i => wrap_data_i,
    ready_i => n550_o,
    ready_o => channels_gen_n5_bandpass_inst_ready_o,
    valid_o => channels_gen_n5_bandpass_inst_valid_o,
    data_o => channels_gen_n5_bandpass_inst_data_o);
  -- Vocoder.vhd:45:41
  n550_o <= lowpass_ready (6);
  -- Vocoder.vhd:49:41
  n553_o <= bandpass_data (125 downto 108);
  -- ../fixed_pkg.vhd:216:26
  n563_o <= n553_o (17);
  -- ../fixed_pkg.vhd:229:32
  n574_o <= std_logic_vector (resize (signed (n553_o), 19));  --  sext
  -- ../fixed_pkg.vhd:230:68
  n575_o <= std_logic_vector(-signed (n574_o));
  -- ../fixed_pkg.vhd:168:39
  n591_o <= n575_o (17 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n592_o <= n575_o (18);
  -- ../fixed_pkg.vhd:173:9
  n597_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n598_o <= n597_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n599: postponed assert n598_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n601_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n602_o <= n601_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n603: postponed assert n602_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n605_o <= n575_o (17);
  -- ../fixed_pkg.vhd:183:27
  n606_o <= '1' when n605_o /= n592_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n613_o <= '0' when n606_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n619_o <= not n592_o;
  -- ../fixed_pkg.vhd:194:31
  n620_o <= not n592_o;
  -- ../fixed_pkg.vhd:194:31
  n621_o <= not n592_o;
  -- ../fixed_pkg.vhd:194:31
  n622_o <= not n592_o;
  -- ../fixed_pkg.vhd:194:31
  n623_o <= not n592_o;
  -- ../fixed_pkg.vhd:194:31
  n624_o <= not n592_o;
  -- ../fixed_pkg.vhd:194:31
  n625_o <= not n592_o;
  -- ../fixed_pkg.vhd:194:31
  n626_o <= not n592_o;
  -- ../fixed_pkg.vhd:194:31
  n627_o <= not n592_o;
  -- ../fixed_pkg.vhd:194:31
  n628_o <= not n592_o;
  -- ../fixed_pkg.vhd:194:31
  n629_o <= not n592_o;
  -- ../fixed_pkg.vhd:194:31
  n630_o <= not n592_o;
  -- ../fixed_pkg.vhd:194:31
  n631_o <= not n592_o;
  -- ../fixed_pkg.vhd:194:31
  n632_o <= not n592_o;
  -- ../fixed_pkg.vhd:194:31
  n633_o <= not n592_o;
  -- ../fixed_pkg.vhd:194:31
  n634_o <= not n592_o;
  -- ../fixed_pkg.vhd:194:31
  n635_o <= not n592_o;
  -- ../fixed_pkg.vhd:194:31
  n636_o <= not n592_o;
  n637_o <= n619_o & n620_o & n621_o & n622_o;
  n638_o <= n623_o & n624_o & n625_o & n626_o;
  n639_o <= n627_o & n628_o & n629_o & n630_o;
  n640_o <= n631_o & n632_o & n633_o & n634_o;
  n641_o <= n635_o & n636_o;
  n642_o <= n637_o & n638_o & n639_o & n640_o;
  n643_o <= n642_o & n641_o;
  n644_o <= n643_o (16 downto 0);
  n645_o <= n592_o & n644_o;
  -- ../fixed_pkg.vhd:193:9
  n646_o <= n591_o when n613_o = '0' else n645_o;
  -- ../fixed_pkg.vhd:221:9
  n648_o <= n553_o when n563_o = '0' else n646_o;
  -- Vocoder.vhd:51:9
  channels_gen_n5_lowpass_inst : entity work.biquadfilter_97b779b18cb8cdee50a9e62c5c999787ca4e4f2b port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => n650_o,
    data_i => n652_o,
    ready_i => mixer_ready,
    ready_o => channels_gen_n5_lowpass_inst_ready_o,
    valid_o => channels_gen_n5_lowpass_inst_valid_o,
    data_o => channels_gen_n5_lowpass_inst_data_o);
  -- Vocoder.vhd:62:42
  n650_o <= bandpass_valid (6);
  -- Vocoder.vhd:64:36
  n652_o <= abs_data (125 downto 108);
  -- Vocoder.vhd:70:9
  channels_gen_n5_osc_inst : entity work.oscillator port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    step_i => n655_o,
    ready_i => mixer_ready,
    data_o => channels_gen_n5_osc_inst_data_o);
  -- Vocoder.vhd:30:9
  channels_gen_n6_bandpass_inst : entity work.biquadfilter_a12ffe86a0a36f7b398f45b49289aca300d75514 port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => wrap_valid_i,
    data_i => wrap_data_i,
    ready_i => n659_o,
    ready_o => channels_gen_n6_bandpass_inst_ready_o,
    valid_o => channels_gen_n6_bandpass_inst_valid_o,
    data_o => channels_gen_n6_bandpass_inst_data_o);
  -- Vocoder.vhd:45:41
  n659_o <= lowpass_ready (5);
  -- Vocoder.vhd:49:41
  n662_o <= bandpass_data (107 downto 90);
  -- ../fixed_pkg.vhd:216:26
  n672_o <= n662_o (17);
  -- ../fixed_pkg.vhd:229:32
  n683_o <= std_logic_vector (resize (signed (n662_o), 19));  --  sext
  -- ../fixed_pkg.vhd:230:68
  n684_o <= std_logic_vector(-signed (n683_o));
  -- ../fixed_pkg.vhd:168:39
  n700_o <= n684_o (17 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n701_o <= n684_o (18);
  -- ../fixed_pkg.vhd:173:9
  n706_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n707_o <= n706_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n708: postponed assert n707_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n710_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n711_o <= n710_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n712: postponed assert n711_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n714_o <= n684_o (17);
  -- ../fixed_pkg.vhd:183:27
  n715_o <= '1' when n714_o /= n701_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n722_o <= '0' when n715_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n728_o <= not n701_o;
  -- ../fixed_pkg.vhd:194:31
  n729_o <= not n701_o;
  -- ../fixed_pkg.vhd:194:31
  n730_o <= not n701_o;
  -- ../fixed_pkg.vhd:194:31
  n731_o <= not n701_o;
  -- ../fixed_pkg.vhd:194:31
  n732_o <= not n701_o;
  -- ../fixed_pkg.vhd:194:31
  n733_o <= not n701_o;
  -- ../fixed_pkg.vhd:194:31
  n734_o <= not n701_o;
  -- ../fixed_pkg.vhd:194:31
  n735_o <= not n701_o;
  -- ../fixed_pkg.vhd:194:31
  n736_o <= not n701_o;
  -- ../fixed_pkg.vhd:194:31
  n737_o <= not n701_o;
  -- ../fixed_pkg.vhd:194:31
  n738_o <= not n701_o;
  -- ../fixed_pkg.vhd:194:31
  n739_o <= not n701_o;
  -- ../fixed_pkg.vhd:194:31
  n740_o <= not n701_o;
  -- ../fixed_pkg.vhd:194:31
  n741_o <= not n701_o;
  -- ../fixed_pkg.vhd:194:31
  n742_o <= not n701_o;
  -- ../fixed_pkg.vhd:194:31
  n743_o <= not n701_o;
  -- ../fixed_pkg.vhd:194:31
  n744_o <= not n701_o;
  -- ../fixed_pkg.vhd:194:31
  n745_o <= not n701_o;
  n746_o <= n728_o & n729_o & n730_o & n731_o;
  n747_o <= n732_o & n733_o & n734_o & n735_o;
  n748_o <= n736_o & n737_o & n738_o & n739_o;
  n749_o <= n740_o & n741_o & n742_o & n743_o;
  n750_o <= n744_o & n745_o;
  n751_o <= n746_o & n747_o & n748_o & n749_o;
  n752_o <= n751_o & n750_o;
  n753_o <= n752_o (16 downto 0);
  n754_o <= n701_o & n753_o;
  -- ../fixed_pkg.vhd:193:9
  n755_o <= n700_o when n722_o = '0' else n754_o;
  -- ../fixed_pkg.vhd:221:9
  n757_o <= n662_o when n672_o = '0' else n755_o;
  -- Vocoder.vhd:51:9
  channels_gen_n6_lowpass_inst : entity work.biquadfilter_97b779b18cb8cdee50a9e62c5c999787ca4e4f2b port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => n759_o,
    data_i => n761_o,
    ready_i => mixer_ready,
    ready_o => channels_gen_n6_lowpass_inst_ready_o,
    valid_o => channels_gen_n6_lowpass_inst_valid_o,
    data_o => channels_gen_n6_lowpass_inst_data_o);
  -- Vocoder.vhd:62:42
  n759_o <= bandpass_valid (5);
  -- Vocoder.vhd:64:36
  n761_o <= abs_data (107 downto 90);
  -- Vocoder.vhd:70:9
  channels_gen_n6_osc_inst : entity work.oscillator port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    step_i => n764_o,
    ready_i => mixer_ready,
    data_o => channels_gen_n6_osc_inst_data_o);
  -- Vocoder.vhd:30:9
  channels_gen_n7_bandpass_inst : entity work.biquadfilter_ec985945a1ffc882d4b5d12ff1518d1a793a38b9 port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => wrap_valid_i,
    data_i => wrap_data_i,
    ready_i => n768_o,
    ready_o => channels_gen_n7_bandpass_inst_ready_o,
    valid_o => channels_gen_n7_bandpass_inst_valid_o,
    data_o => channels_gen_n7_bandpass_inst_data_o);
  -- Vocoder.vhd:45:41
  n768_o <= lowpass_ready (4);
  -- Vocoder.vhd:49:41
  n771_o <= bandpass_data (89 downto 72);
  -- ../fixed_pkg.vhd:216:26
  n781_o <= n771_o (17);
  -- ../fixed_pkg.vhd:229:32
  n792_o <= std_logic_vector (resize (signed (n771_o), 19));  --  sext
  -- ../fixed_pkg.vhd:230:68
  n793_o <= std_logic_vector(-signed (n792_o));
  -- ../fixed_pkg.vhd:168:39
  n809_o <= n793_o (17 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n810_o <= n793_o (18);
  -- ../fixed_pkg.vhd:173:9
  n815_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n816_o <= n815_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n817: postponed assert n816_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n819_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n820_o <= n819_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n821: postponed assert n820_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n823_o <= n793_o (17);
  -- ../fixed_pkg.vhd:183:27
  n824_o <= '1' when n823_o /= n810_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n831_o <= '0' when n824_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n837_o <= not n810_o;
  -- ../fixed_pkg.vhd:194:31
  n838_o <= not n810_o;
  -- ../fixed_pkg.vhd:194:31
  n839_o <= not n810_o;
  -- ../fixed_pkg.vhd:194:31
  n840_o <= not n810_o;
  -- ../fixed_pkg.vhd:194:31
  n841_o <= not n810_o;
  -- ../fixed_pkg.vhd:194:31
  n842_o <= not n810_o;
  -- ../fixed_pkg.vhd:194:31
  n843_o <= not n810_o;
  -- ../fixed_pkg.vhd:194:31
  n844_o <= not n810_o;
  -- ../fixed_pkg.vhd:194:31
  n845_o <= not n810_o;
  -- ../fixed_pkg.vhd:194:31
  n846_o <= not n810_o;
  -- ../fixed_pkg.vhd:194:31
  n847_o <= not n810_o;
  -- ../fixed_pkg.vhd:194:31
  n848_o <= not n810_o;
  -- ../fixed_pkg.vhd:194:31
  n849_o <= not n810_o;
  -- ../fixed_pkg.vhd:194:31
  n850_o <= not n810_o;
  -- ../fixed_pkg.vhd:194:31
  n851_o <= not n810_o;
  -- ../fixed_pkg.vhd:194:31
  n852_o <= not n810_o;
  -- ../fixed_pkg.vhd:194:31
  n853_o <= not n810_o;
  -- ../fixed_pkg.vhd:194:31
  n854_o <= not n810_o;
  n855_o <= n837_o & n838_o & n839_o & n840_o;
  n856_o <= n841_o & n842_o & n843_o & n844_o;
  n857_o <= n845_o & n846_o & n847_o & n848_o;
  n858_o <= n849_o & n850_o & n851_o & n852_o;
  n859_o <= n853_o & n854_o;
  n860_o <= n855_o & n856_o & n857_o & n858_o;
  n861_o <= n860_o & n859_o;
  n862_o <= n861_o (16 downto 0);
  n863_o <= n810_o & n862_o;
  -- ../fixed_pkg.vhd:193:9
  n864_o <= n809_o when n831_o = '0' else n863_o;
  -- ../fixed_pkg.vhd:221:9
  n866_o <= n771_o when n781_o = '0' else n864_o;
  -- Vocoder.vhd:51:9
  channels_gen_n7_lowpass_inst : entity work.biquadfilter_97b779b18cb8cdee50a9e62c5c999787ca4e4f2b port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => n868_o,
    data_i => n870_o,
    ready_i => mixer_ready,
    ready_o => channels_gen_n7_lowpass_inst_ready_o,
    valid_o => channels_gen_n7_lowpass_inst_valid_o,
    data_o => channels_gen_n7_lowpass_inst_data_o);
  -- Vocoder.vhd:62:42
  n868_o <= bandpass_valid (4);
  -- Vocoder.vhd:64:36
  n870_o <= abs_data (89 downto 72);
  -- Vocoder.vhd:70:9
  channels_gen_n7_osc_inst : entity work.oscillator port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    step_i => n873_o,
    ready_i => mixer_ready,
    data_o => channels_gen_n7_osc_inst_data_o);
  -- Vocoder.vhd:30:9
  channels_gen_n8_bandpass_inst : entity work.biquadfilter_6b9c8d91c4218fd4ae537b4bb7758bc18f168a30 port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => wrap_valid_i,
    data_i => wrap_data_i,
    ready_i => n877_o,
    ready_o => channels_gen_n8_bandpass_inst_ready_o,
    valid_o => channels_gen_n8_bandpass_inst_valid_o,
    data_o => channels_gen_n8_bandpass_inst_data_o);
  -- Vocoder.vhd:45:41
  n877_o <= lowpass_ready (3);
  -- Vocoder.vhd:49:41
  n880_o <= bandpass_data (71 downto 54);
  -- ../fixed_pkg.vhd:216:26
  n890_o <= n880_o (17);
  -- ../fixed_pkg.vhd:229:32
  n901_o <= std_logic_vector (resize (signed (n880_o), 19));  --  sext
  -- ../fixed_pkg.vhd:230:68
  n902_o <= std_logic_vector(-signed (n901_o));
  -- ../fixed_pkg.vhd:168:39
  n918_o <= n902_o (17 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n919_o <= n902_o (18);
  -- ../fixed_pkg.vhd:173:9
  n924_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n925_o <= n924_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n926: postponed assert n925_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n928_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n929_o <= n928_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n930: postponed assert n929_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n932_o <= n902_o (17);
  -- ../fixed_pkg.vhd:183:27
  n933_o <= '1' when n932_o /= n919_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n940_o <= '0' when n933_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n946_o <= not n919_o;
  -- ../fixed_pkg.vhd:194:31
  n947_o <= not n919_o;
  -- ../fixed_pkg.vhd:194:31
  n948_o <= not n919_o;
  -- ../fixed_pkg.vhd:194:31
  n949_o <= not n919_o;
  -- ../fixed_pkg.vhd:194:31
  n950_o <= not n919_o;
  -- ../fixed_pkg.vhd:194:31
  n951_o <= not n919_o;
  -- ../fixed_pkg.vhd:194:31
  n952_o <= not n919_o;
  -- ../fixed_pkg.vhd:194:31
  n953_o <= not n919_o;
  -- ../fixed_pkg.vhd:194:31
  n954_o <= not n919_o;
  -- ../fixed_pkg.vhd:194:31
  n955_o <= not n919_o;
  -- ../fixed_pkg.vhd:194:31
  n956_o <= not n919_o;
  -- ../fixed_pkg.vhd:194:31
  n957_o <= not n919_o;
  -- ../fixed_pkg.vhd:194:31
  n958_o <= not n919_o;
  -- ../fixed_pkg.vhd:194:31
  n959_o <= not n919_o;
  -- ../fixed_pkg.vhd:194:31
  n960_o <= not n919_o;
  -- ../fixed_pkg.vhd:194:31
  n961_o <= not n919_o;
  -- ../fixed_pkg.vhd:194:31
  n962_o <= not n919_o;
  -- ../fixed_pkg.vhd:194:31
  n963_o <= not n919_o;
  n964_o <= n946_o & n947_o & n948_o & n949_o;
  n965_o <= n950_o & n951_o & n952_o & n953_o;
  n966_o <= n954_o & n955_o & n956_o & n957_o;
  n967_o <= n958_o & n959_o & n960_o & n961_o;
  n968_o <= n962_o & n963_o;
  n969_o <= n964_o & n965_o & n966_o & n967_o;
  n970_o <= n969_o & n968_o;
  n971_o <= n970_o (16 downto 0);
  n972_o <= n919_o & n971_o;
  -- ../fixed_pkg.vhd:193:9
  n973_o <= n918_o when n940_o = '0' else n972_o;
  -- ../fixed_pkg.vhd:221:9
  n975_o <= n880_o when n890_o = '0' else n973_o;
  -- Vocoder.vhd:51:9
  channels_gen_n8_lowpass_inst : entity work.biquadfilter_97b779b18cb8cdee50a9e62c5c999787ca4e4f2b port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => n977_o,
    data_i => n979_o,
    ready_i => mixer_ready,
    ready_o => channels_gen_n8_lowpass_inst_ready_o,
    valid_o => channels_gen_n8_lowpass_inst_valid_o,
    data_o => channels_gen_n8_lowpass_inst_data_o);
  -- Vocoder.vhd:62:42
  n977_o <= bandpass_valid (3);
  -- Vocoder.vhd:64:36
  n979_o <= abs_data (71 downto 54);
  -- Vocoder.vhd:70:9
  channels_gen_n8_osc_inst : entity work.oscillator port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    step_i => n982_o,
    ready_i => mixer_ready,
    data_o => channels_gen_n8_osc_inst_data_o);
  -- Vocoder.vhd:30:9
  channels_gen_n9_bandpass_inst : entity work.biquadfilter_7ee7919464c974e1ea4a8e43f5092f05f8be8f05 port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => wrap_valid_i,
    data_i => wrap_data_i,
    ready_i => n986_o,
    ready_o => channels_gen_n9_bandpass_inst_ready_o,
    valid_o => channels_gen_n9_bandpass_inst_valid_o,
    data_o => channels_gen_n9_bandpass_inst_data_o);
  -- Vocoder.vhd:45:41
  n986_o <= lowpass_ready (2);
  -- Vocoder.vhd:49:41
  n989_o <= bandpass_data (53 downto 36);
  -- ../fixed_pkg.vhd:216:26
  n999_o <= n989_o (17);
  -- ../fixed_pkg.vhd:229:32
  n1010_o <= std_logic_vector (resize (signed (n989_o), 19));  --  sext
  -- ../fixed_pkg.vhd:230:68
  n1011_o <= std_logic_vector(-signed (n1010_o));
  -- ../fixed_pkg.vhd:168:39
  n1027_o <= n1011_o (17 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n1028_o <= n1011_o (18);
  -- ../fixed_pkg.vhd:173:9
  n1033_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n1034_o <= n1033_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n1035: postponed assert n1034_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n1037_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n1038_o <= n1037_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n1039: postponed assert n1038_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n1041_o <= n1011_o (17);
  -- ../fixed_pkg.vhd:183:27
  n1042_o <= '1' when n1041_o /= n1028_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n1049_o <= '0' when n1042_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n1055_o <= not n1028_o;
  -- ../fixed_pkg.vhd:194:31
  n1056_o <= not n1028_o;
  -- ../fixed_pkg.vhd:194:31
  n1057_o <= not n1028_o;
  -- ../fixed_pkg.vhd:194:31
  n1058_o <= not n1028_o;
  -- ../fixed_pkg.vhd:194:31
  n1059_o <= not n1028_o;
  -- ../fixed_pkg.vhd:194:31
  n1060_o <= not n1028_o;
  -- ../fixed_pkg.vhd:194:31
  n1061_o <= not n1028_o;
  -- ../fixed_pkg.vhd:194:31
  n1062_o <= not n1028_o;
  -- ../fixed_pkg.vhd:194:31
  n1063_o <= not n1028_o;
  -- ../fixed_pkg.vhd:194:31
  n1064_o <= not n1028_o;
  -- ../fixed_pkg.vhd:194:31
  n1065_o <= not n1028_o;
  -- ../fixed_pkg.vhd:194:31
  n1066_o <= not n1028_o;
  -- ../fixed_pkg.vhd:194:31
  n1067_o <= not n1028_o;
  -- ../fixed_pkg.vhd:194:31
  n1068_o <= not n1028_o;
  -- ../fixed_pkg.vhd:194:31
  n1069_o <= not n1028_o;
  -- ../fixed_pkg.vhd:194:31
  n1070_o <= not n1028_o;
  -- ../fixed_pkg.vhd:194:31
  n1071_o <= not n1028_o;
  -- ../fixed_pkg.vhd:194:31
  n1072_o <= not n1028_o;
  n1073_o <= n1055_o & n1056_o & n1057_o & n1058_o;
  n1074_o <= n1059_o & n1060_o & n1061_o & n1062_o;
  n1075_o <= n1063_o & n1064_o & n1065_o & n1066_o;
  n1076_o <= n1067_o & n1068_o & n1069_o & n1070_o;
  n1077_o <= n1071_o & n1072_o;
  n1078_o <= n1073_o & n1074_o & n1075_o & n1076_o;
  n1079_o <= n1078_o & n1077_o;
  n1080_o <= n1079_o (16 downto 0);
  n1081_o <= n1028_o & n1080_o;
  -- ../fixed_pkg.vhd:193:9
  n1082_o <= n1027_o when n1049_o = '0' else n1081_o;
  -- ../fixed_pkg.vhd:221:9
  n1084_o <= n989_o when n999_o = '0' else n1082_o;
  -- Vocoder.vhd:51:9
  channels_gen_n9_lowpass_inst : entity work.biquadfilter_97b779b18cb8cdee50a9e62c5c999787ca4e4f2b port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => n1086_o,
    data_i => n1088_o,
    ready_i => mixer_ready,
    ready_o => channels_gen_n9_lowpass_inst_ready_o,
    valid_o => channels_gen_n9_lowpass_inst_valid_o,
    data_o => channels_gen_n9_lowpass_inst_data_o);
  -- Vocoder.vhd:62:42
  n1086_o <= bandpass_valid (2);
  -- Vocoder.vhd:64:36
  n1088_o <= abs_data (53 downto 36);
  -- Vocoder.vhd:70:9
  channels_gen_n9_osc_inst : entity work.oscillator port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    step_i => n1091_o,
    ready_i => mixer_ready,
    data_o => channels_gen_n9_osc_inst_data_o);
  -- Vocoder.vhd:30:9
  channels_gen_n10_bandpass_inst : entity work.biquadfilter_58287565aee2fcf069d75b2ada116df2a3195e1e port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => wrap_valid_i,
    data_i => wrap_data_i,
    ready_i => n1095_o,
    ready_o => channels_gen_n10_bandpass_inst_ready_o,
    valid_o => channels_gen_n10_bandpass_inst_valid_o,
    data_o => channels_gen_n10_bandpass_inst_data_o);
  -- Vocoder.vhd:45:41
  n1095_o <= lowpass_ready (1);
  -- Vocoder.vhd:49:41
  n1098_o <= bandpass_data (35 downto 18);
  -- ../fixed_pkg.vhd:216:26
  n1108_o <= n1098_o (17);
  -- ../fixed_pkg.vhd:229:32
  n1119_o <= std_logic_vector (resize (signed (n1098_o), 19));  --  sext
  -- ../fixed_pkg.vhd:230:68
  n1120_o <= std_logic_vector(-signed (n1119_o));
  -- ../fixed_pkg.vhd:168:39
  n1136_o <= n1120_o (17 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n1137_o <= n1120_o (18);
  -- ../fixed_pkg.vhd:173:9
  n1142_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n1143_o <= n1142_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n1144: postponed assert n1143_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n1146_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n1147_o <= n1146_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n1148: postponed assert n1147_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n1150_o <= n1120_o (17);
  -- ../fixed_pkg.vhd:183:27
  n1151_o <= '1' when n1150_o /= n1137_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n1158_o <= '0' when n1151_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n1164_o <= not n1137_o;
  -- ../fixed_pkg.vhd:194:31
  n1165_o <= not n1137_o;
  -- ../fixed_pkg.vhd:194:31
  n1166_o <= not n1137_o;
  -- ../fixed_pkg.vhd:194:31
  n1167_o <= not n1137_o;
  -- ../fixed_pkg.vhd:194:31
  n1168_o <= not n1137_o;
  -- ../fixed_pkg.vhd:194:31
  n1169_o <= not n1137_o;
  -- ../fixed_pkg.vhd:194:31
  n1170_o <= not n1137_o;
  -- ../fixed_pkg.vhd:194:31
  n1171_o <= not n1137_o;
  -- ../fixed_pkg.vhd:194:31
  n1172_o <= not n1137_o;
  -- ../fixed_pkg.vhd:194:31
  n1173_o <= not n1137_o;
  -- ../fixed_pkg.vhd:194:31
  n1174_o <= not n1137_o;
  -- ../fixed_pkg.vhd:194:31
  n1175_o <= not n1137_o;
  -- ../fixed_pkg.vhd:194:31
  n1176_o <= not n1137_o;
  -- ../fixed_pkg.vhd:194:31
  n1177_o <= not n1137_o;
  -- ../fixed_pkg.vhd:194:31
  n1178_o <= not n1137_o;
  -- ../fixed_pkg.vhd:194:31
  n1179_o <= not n1137_o;
  -- ../fixed_pkg.vhd:194:31
  n1180_o <= not n1137_o;
  -- ../fixed_pkg.vhd:194:31
  n1181_o <= not n1137_o;
  n1182_o <= n1164_o & n1165_o & n1166_o & n1167_o;
  n1183_o <= n1168_o & n1169_o & n1170_o & n1171_o;
  n1184_o <= n1172_o & n1173_o & n1174_o & n1175_o;
  n1185_o <= n1176_o & n1177_o & n1178_o & n1179_o;
  n1186_o <= n1180_o & n1181_o;
  n1187_o <= n1182_o & n1183_o & n1184_o & n1185_o;
  n1188_o <= n1187_o & n1186_o;
  n1189_o <= n1188_o (16 downto 0);
  n1190_o <= n1137_o & n1189_o;
  -- ../fixed_pkg.vhd:193:9
  n1191_o <= n1136_o when n1158_o = '0' else n1190_o;
  -- ../fixed_pkg.vhd:221:9
  n1193_o <= n1098_o when n1108_o = '0' else n1191_o;
  -- Vocoder.vhd:51:9
  channels_gen_n10_lowpass_inst : entity work.biquadfilter_97b779b18cb8cdee50a9e62c5c999787ca4e4f2b port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => n1195_o,
    data_i => n1197_o,
    ready_i => mixer_ready,
    ready_o => channels_gen_n10_lowpass_inst_ready_o,
    valid_o => channels_gen_n10_lowpass_inst_valid_o,
    data_o => channels_gen_n10_lowpass_inst_data_o);
  -- Vocoder.vhd:62:42
  n1195_o <= bandpass_valid (1);
  -- Vocoder.vhd:64:36
  n1197_o <= abs_data (35 downto 18);
  -- Vocoder.vhd:70:9
  channels_gen_n10_osc_inst : entity work.oscillator port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    step_i => n1200_o,
    ready_i => mixer_ready,
    data_o => channels_gen_n10_osc_inst_data_o);
  -- Vocoder.vhd:30:9
  channels_gen_n11_bandpass_inst : entity work.biquadfilter_123a8c06fd239d8db9e24de2ddc3cf87b860aaca port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => wrap_valid_i,
    data_i => wrap_data_i,
    ready_i => n1204_o,
    ready_o => channels_gen_n11_bandpass_inst_ready_o,
    valid_o => channels_gen_n11_bandpass_inst_valid_o,
    data_o => channels_gen_n11_bandpass_inst_data_o);
  -- Vocoder.vhd:45:41
  n1204_o <= lowpass_ready (0);
  -- Vocoder.vhd:49:41
  n1207_o <= bandpass_data (17 downto 0);
  -- ../fixed_pkg.vhd:216:26
  n1217_o <= n1207_o (17);
  -- ../fixed_pkg.vhd:229:32
  n1228_o <= std_logic_vector (resize (signed (n1207_o), 19));  --  sext
  -- ../fixed_pkg.vhd:230:68
  n1229_o <= std_logic_vector(-signed (n1228_o));
  -- ../fixed_pkg.vhd:168:39
  n1245_o <= n1229_o (17 downto 0);  --  trunc
  -- ../fixed_pkg.vhd:169:40
  n1246_o <= n1229_o (18);
  -- ../fixed_pkg.vhd:173:9
  n1251_o <= not '0';
  -- ../fixed_pkg.vhd:173:9
  n1252_o <= n1251_o or '1';
  -- ../fixed_pkg.vhd:173:9
  n1253: postponed assert n1252_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:177:9
  n1255_o <= not '0';
  -- ../fixed_pkg.vhd:177:9
  n1256_o <= n1255_o or '1';
  -- ../fixed_pkg.vhd:177:9
  n1257: postponed assert n1256_o = '1' severity error; --  assert
  -- ../fixed_pkg.vhd:183:23
  n1259_o <= n1229_o (17);
  -- ../fixed_pkg.vhd:183:27
  n1260_o <= '1' when n1259_o /= n1246_o else '0';
  -- ../fixed_pkg.vhd:183:17
  n1267_o <= '0' when n1260_o = '0' else '1';
  -- ../fixed_pkg.vhd:194:31
  n1273_o <= not n1246_o;
  -- ../fixed_pkg.vhd:194:31
  n1274_o <= not n1246_o;
  -- ../fixed_pkg.vhd:194:31
  n1275_o <= not n1246_o;
  -- ../fixed_pkg.vhd:194:31
  n1276_o <= not n1246_o;
  -- ../fixed_pkg.vhd:194:31
  n1277_o <= not n1246_o;
  -- ../fixed_pkg.vhd:194:31
  n1278_o <= not n1246_o;
  -- ../fixed_pkg.vhd:194:31
  n1279_o <= not n1246_o;
  -- ../fixed_pkg.vhd:194:31
  n1280_o <= not n1246_o;
  -- ../fixed_pkg.vhd:194:31
  n1281_o <= not n1246_o;
  -- ../fixed_pkg.vhd:194:31
  n1282_o <= not n1246_o;
  -- ../fixed_pkg.vhd:194:31
  n1283_o <= not n1246_o;
  -- ../fixed_pkg.vhd:194:31
  n1284_o <= not n1246_o;
  -- ../fixed_pkg.vhd:194:31
  n1285_o <= not n1246_o;
  -- ../fixed_pkg.vhd:194:31
  n1286_o <= not n1246_o;
  -- ../fixed_pkg.vhd:194:31
  n1287_o <= not n1246_o;
  -- ../fixed_pkg.vhd:194:31
  n1288_o <= not n1246_o;
  -- ../fixed_pkg.vhd:194:31
  n1289_o <= not n1246_o;
  -- ../fixed_pkg.vhd:194:31
  n1290_o <= not n1246_o;
  n1291_o <= n1273_o & n1274_o & n1275_o & n1276_o;
  n1292_o <= n1277_o & n1278_o & n1279_o & n1280_o;
  n1293_o <= n1281_o & n1282_o & n1283_o & n1284_o;
  n1294_o <= n1285_o & n1286_o & n1287_o & n1288_o;
  n1295_o <= n1289_o & n1290_o;
  n1296_o <= n1291_o & n1292_o & n1293_o & n1294_o;
  n1297_o <= n1296_o & n1295_o;
  n1298_o <= n1297_o (16 downto 0);
  n1299_o <= n1246_o & n1298_o;
  -- ../fixed_pkg.vhd:193:9
  n1300_o <= n1245_o when n1267_o = '0' else n1299_o;
  -- ../fixed_pkg.vhd:221:9
  n1302_o <= n1207_o when n1217_o = '0' else n1300_o;
  -- Vocoder.vhd:51:9
  channels_gen_n11_lowpass_inst : entity work.biquadfilter_97b779b18cb8cdee50a9e62c5c999787ca4e4f2b port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => n1304_o,
    data_i => n1306_o,
    ready_i => mixer_ready,
    ready_o => channels_gen_n11_lowpass_inst_ready_o,
    valid_o => channels_gen_n11_lowpass_inst_valid_o,
    data_o => channels_gen_n11_lowpass_inst_data_o);
  -- Vocoder.vhd:62:42
  n1304_o <= bandpass_valid (0);
  -- Vocoder.vhd:64:36
  n1306_o <= abs_data (17 downto 0);
  -- Vocoder.vhd:70:9
  channels_gen_n11_osc_inst : entity work.oscillator port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    step_i => n1309_o,
    ready_i => mixer_ready,
    data_o => channels_gen_n11_osc_inst_data_o);
  -- Vocoder.vhd:80:5
  mixer_inst : entity work.mixer port map (
    clk_i => wrap_clk_i,
    reset_i => wrap_reset_i,
    valid_i => all_lowpass_valid,
    env_data_i => lowpass_data,
    carrier_data_i => osc_data,
    ready_i => wrap_ready_i,
    ready_o => mixer_inst_ready_o,
    valid_o => mixer_inst_valid_o,
    data_o => mixer_inst_data_o);
  -- Vocoder.vhd:93:50
  n1316_o <= '1' when lowpass_valid = "111111111111" else '0';
  -- Vocoder.vhd:93:30
  n1317_o <= '0' when n1316_o = '0' else '1';
  -- Vocoder.vhd:94:50
  n1321_o <= '1' when bandpass_ready = "111111111111" else '0';
  -- Vocoder.vhd:94:30
  n1322_o <= '0' when n1321_o = '0' else '1';
  n1324_o <= channels_gen_n0_bandpass_inst_ready_o & channels_gen_n1_bandpass_inst_ready_o & channels_gen_n2_bandpass_inst_ready_o & channels_gen_n3_bandpass_inst_ready_o & channels_gen_n4_bandpass_inst_ready_o & channels_gen_n5_bandpass_inst_ready_o & channels_gen_n6_bandpass_inst_ready_o & channels_gen_n7_bandpass_inst_ready_o & channels_gen_n8_bandpass_inst_ready_o & channels_gen_n9_bandpass_inst_ready_o & channels_gen_n10_bandpass_inst_ready_o & channels_gen_n11_bandpass_inst_ready_o;
  n1325_o <= channels_gen_n0_bandpass_inst_valid_o & channels_gen_n1_bandpass_inst_valid_o & channels_gen_n2_bandpass_inst_valid_o & channels_gen_n3_bandpass_inst_valid_o & channels_gen_n4_bandpass_inst_valid_o & channels_gen_n5_bandpass_inst_valid_o & channels_gen_n6_bandpass_inst_valid_o & channels_gen_n7_bandpass_inst_valid_o & channels_gen_n8_bandpass_inst_valid_o & channels_gen_n9_bandpass_inst_valid_o & channels_gen_n10_bandpass_inst_valid_o & channels_gen_n11_bandpass_inst_valid_o;
  n1326_o <= channels_gen_n0_lowpass_inst_ready_o & channels_gen_n1_lowpass_inst_ready_o & channels_gen_n2_lowpass_inst_ready_o & channels_gen_n3_lowpass_inst_ready_o & channels_gen_n4_lowpass_inst_ready_o & channels_gen_n5_lowpass_inst_ready_o & channels_gen_n6_lowpass_inst_ready_o & channels_gen_n7_lowpass_inst_ready_o & channels_gen_n8_lowpass_inst_ready_o & channels_gen_n9_lowpass_inst_ready_o & channels_gen_n10_lowpass_inst_ready_o & channels_gen_n11_lowpass_inst_ready_o;
  n1327_o <= channels_gen_n0_lowpass_inst_valid_o & channels_gen_n1_lowpass_inst_valid_o & channels_gen_n2_lowpass_inst_valid_o & channels_gen_n3_lowpass_inst_valid_o & channels_gen_n4_lowpass_inst_valid_o & channels_gen_n5_lowpass_inst_valid_o & channels_gen_n6_lowpass_inst_valid_o & channels_gen_n7_lowpass_inst_valid_o & channels_gen_n8_lowpass_inst_valid_o & channels_gen_n9_lowpass_inst_valid_o & channels_gen_n10_lowpass_inst_valid_o & channels_gen_n11_lowpass_inst_valid_o;
  n1328_o <= channels_gen_n0_bandpass_inst_data_o & channels_gen_n1_bandpass_inst_data_o & channels_gen_n2_bandpass_inst_data_o & channels_gen_n3_bandpass_inst_data_o & channels_gen_n4_bandpass_inst_data_o & channels_gen_n5_bandpass_inst_data_o & channels_gen_n6_bandpass_inst_data_o & channels_gen_n7_bandpass_inst_data_o & channels_gen_n8_bandpass_inst_data_o & channels_gen_n9_bandpass_inst_data_o & channels_gen_n10_bandpass_inst_data_o & channels_gen_n11_bandpass_inst_data_o;
  n1329_o <= n103_o & n212_o & n321_o & n430_o & n539_o & n648_o & n757_o & n866_o & n975_o & n1084_o & n1193_o & n1302_o;
  n1330_o <= channels_gen_n0_lowpass_inst_data_o & channels_gen_n1_lowpass_inst_data_o & channels_gen_n2_lowpass_inst_data_o & channels_gen_n3_lowpass_inst_data_o & channels_gen_n4_lowpass_inst_data_o & channels_gen_n5_lowpass_inst_data_o & channels_gen_n6_lowpass_inst_data_o & channels_gen_n7_lowpass_inst_data_o & channels_gen_n8_lowpass_inst_data_o & channels_gen_n9_lowpass_inst_data_o & channels_gen_n10_lowpass_inst_data_o & channels_gen_n11_lowpass_inst_data_o;
  n1331_o <= channels_gen_n0_osc_inst_data_o & channels_gen_n1_osc_inst_data_o & channels_gen_n2_osc_inst_data_o & channels_gen_n3_osc_inst_data_o & channels_gen_n4_osc_inst_data_o & channels_gen_n5_osc_inst_data_o & channels_gen_n6_osc_inst_data_o & channels_gen_n7_osc_inst_data_o & channels_gen_n8_osc_inst_data_o & channels_gen_n9_osc_inst_data_o & channels_gen_n10_osc_inst_data_o & channels_gen_n11_osc_inst_data_o;
end rtl;
