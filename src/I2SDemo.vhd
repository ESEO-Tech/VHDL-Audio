library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity I2SDemo is
	port (
		clk_i                : in  std_logic;
        btn_center_i         : in  std_logic;
		i2s_master_clk_o     : out std_logic;
        i2s_left_right_clk_o : out std_logic;
        i2s_serial_clk_o     : out std_logic;
        i2s_serial_data_o    : out std_logic
	);
end entity I2SDemo;

architecture Structural of I2SDemo is
	constant CLK_FREQUENCY_HZ                    : positive := 100e6;
	constant I2S_SAMPLE_RATE_HZ                  : positive := 22_050;
	constant I2S_MASTER_FREQUENCY_HZ             : positive := 256 * I2S_SAMPLE_RATE_HZ;
	constant I2S_BITS_PER_SAMPLE                 : positive := 16;
	constant ROM_BITS_PER_SAMPLE                 : positive := 8;
	constant DURATION_SEC                        : positive := 4;
    constant GAIN                                : positive := 64;

    constant ROM_ADDRESS_MAX                     : integer  := DURATION_SEC * I2S_SAMPLE_RATE_HZ - 1;
    signal rom_address_reg                       : integer range 0 to ROM_ADDRESS_MAX;

	constant ROM_ADDRESS_WIDTH                   : positive := 17;
    signal rom_address_slv                       : std_logic_vector(ROM_ADDRESS_WIDTH - 1 downto 0);

	signal i2s_ready                             : std_logic;
    signal i2s_left_data_slv, i2s_right_data_slv : std_logic_vector(ROM_BITS_PER_SAMPLE - 1 downto 0);
	signal i2s_left_data, i2s_right_data         : signed(I2S_BITS_PER_SAMPLE - 1 downto 0);

	component LeftRom
		port (
			clka  : in  std_logic;
			addra : in  std_logic_vector(ROM_ADDRESS_WIDTH - 1 downto 0);
			douta : out std_logic_vector(ROM_BITS_PER_SAMPLE - 1 downto 0)
		);
	end component;

	component RightRom
		port (
			clka  : in  std_logic;
			addra : in  std_logic_vector(ROM_ADDRESS_WIDTH - 1 downto 0);
			douta : out std_logic_vector(ROM_BITS_PER_SAMPLE - 1 downto 0)
		);
	end component;
begin
	transmitter_inst : entity work.I2STransmitter
		generic map(
			CLK_FREQUENCY_HZ    => CLK_FREQUENCY_HZ,
			MASTER_FREQUENCY_HZ => I2S_MASTER_FREQUENCY_HZ,
			SAMPLE_RATE_HZ      => I2S_SAMPLE_RATE_HZ,
			BITS_PER_SAMPLE     => I2S_BITS_PER_SAMPLE
		)
		port map(
			clk_i            => clk_i,
			left_data_i      => i2s_left_data,
			right_data_i     => i2s_right_data,
			ready_o          => i2s_ready,
			master_clk_o     => i2s_master_clk_o,
			serial_clk_o     => i2s_serial_clk_o,
			left_right_clk_o => i2s_left_right_clk_o,
			serial_data_o    => i2s_serial_data_o
		);

	p_rom_address_reg : process(clk_i)
	begin
		if rising_edge(clk_i) then
			if i2s_ready = '1' then
				if rom_address_reg = ROM_ADDRESS_MAX then
					rom_address_reg <= 0;
				else
					rom_address_reg <= rom_address_reg + 1;
				end if;
			end if;
		end if;
	end process p_rom_address_reg;

    rom_address_slv <= std_logic_vector(to_unsigned(rom_address_reg, rom_address_slv'length));

	-- Single-port ROM with native interface
	-- Always enabled.
	-- Width: 8 bits, depth: 88200
	-- Initial content: data/weekend.coe
	left_rom_inst : LeftRom
		port map(
			clka  => clk_i,
			addra => rom_address_slv,
			douta => i2s_left_data_slv
		);

	-- Single-port ROM with native interface
	-- Always enabled.
	-- Width: 8 bits, depth: 88200
	-- Initial content: data/boccherini.coe
	right_rom_inst : RightRom
		port map(
			clka  => clk_i,
			addra => rom_address_slv,
			douta => i2s_right_data_slv
		);

	i2s_left_data  <= resize(signed(i2s_left_data_slv)  * GAIN, I2S_BITS_PER_SAMPLE);
	i2s_right_data <= resize(signed(i2s_right_data_slv) * GAIN, I2S_BITS_PER_SAMPLE);
end Structural;
