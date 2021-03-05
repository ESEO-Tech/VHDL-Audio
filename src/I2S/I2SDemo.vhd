library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity I2SDemo is
	port (
		clk_i                : in  std_logic;
        btn_center_i         : in  std_logic;
        led_o                : out std_logic;
		i2s_master_clk_o     : out std_logic;
        i2s_left_right_clk_o : out std_logic;
        i2s_serial_clk_o     : out std_logic;
        i2s_serial_data_o    : out std_logic
	);
end entity I2SDemo;

architecture Structural of I2SDemo is
	constant AUDIO_CLK_FREQUENCY_HZ      : positive := 51_200_000;
	constant I2S_SAMPLE_RATE_HZ          : positive := 20_000;
	constant I2S_MASTER_FREQUENCY_HZ     : positive := I2S_SAMPLE_RATE_HZ * 256;
	constant I2S_BITS_PER_SAMPLE         : positive := 16;
	constant ROM_BITS_PER_SAMPLE         : positive := 8;
	constant DURATION_SEC                : positive := 4;
    constant GAIN                        : positive := 64;

    alias reset_i                        : std_logic is btn_center_i;
    signal audio_clk                     : std_logic;

    constant ROM_ADDRESS_MAX             : integer  := DURATION_SEC * I2S_SAMPLE_RATE_HZ - 1;
    signal rom_address_reg               : integer range 0 to ROM_ADDRESS_MAX;

	constant ROM_ADDRESS_WIDTH           : positive := 17;
    signal rom_address_slv               : std_logic_vector(ROM_ADDRESS_WIDTH - 1 downto 0);

    signal rom_left_data, rom_right_data : std_logic_vector(ROM_BITS_PER_SAMPLE - 1 downto 0);

	signal i2s_ready                     : std_logic;
	signal i2s_left_data, i2s_right_data : signed(I2S_BITS_PER_SAMPLE - 1 downto 0);

    -- Clock generator.
    -- Input frequency: 100 MHz.
    -- Output frequency: 51.2 MHz.
    component AudioClock
        port(
            reset    : in  std_logic;
            clk_in1  : in  std_logic;
            clk_out1 : out std_logic;
            locked   : out std_logic
        );
    end component;

    -- Single-port ROM with native interface.
	-- Always enabled.
	-- Width: 8 bits, depth: 80000
	-- Initial content: data/weekend.coe
	component LeftRom
		port (
			clka  : in  std_logic;
			addra : in  std_logic_vector(ROM_ADDRESS_WIDTH - 1 downto 0);
			douta : out std_logic_vector(ROM_BITS_PER_SAMPLE - 1 downto 0)
		);
	end component;

    -- Single-port ROM with native interface.
	-- Always enabled.
	-- Width: 8 bits, depth: 80000
    -- Initial content: data/boccherini.coe
	component RightRom
		port (
			clka  : in  std_logic;
			addra : in  std_logic_vector(ROM_ADDRESS_WIDTH - 1 downto 0);
			douta : out std_logic_vector(ROM_BITS_PER_SAMPLE - 1 downto 0)
		);
	end component;
begin
    audio_clk_inst : AudioClock
        port map(
            reset    => reset_i,
            clk_in1  => clk_i,
            clk_out1 => audio_clk,
            locked   => led_o
        );

	p_rom_address_reg : process(audio_clk)
	begin
		if rising_edge(audio_clk) then
            if reset_i = '1' then
                rom_address_reg <= 0;
			elsif i2s_ready = '1' then
				if rom_address_reg = ROM_ADDRESS_MAX then
					rom_address_reg <= 0;
				else
					rom_address_reg <= rom_address_reg + 1;
				end if;
			end if;
		end if;
	end process p_rom_address_reg;

    rom_address_slv <= std_logic_vector(to_unsigned(rom_address_reg, ROM_ADDRESS_WIDTH));

	left_rom_inst : LeftRom
		port map(
			clka  => audio_clk,
			addra => rom_address_slv,
			douta => rom_left_data
		);

	right_rom_inst : RightRom
		port map(
			clka  => audio_clk,
			addra => rom_address_slv,
			douta => rom_right_data
		);

	i2s_left_data  <= resize(signed(rom_left_data)  * GAIN, I2S_BITS_PER_SAMPLE);
	i2s_right_data <= resize(signed(rom_right_data) * GAIN, I2S_BITS_PER_SAMPLE);

    transmitter_inst : entity work.I2STransmitter
		generic map(
			CLK_FREQUENCY_HZ    => AUDIO_CLK_FREQUENCY_HZ,
			MASTER_FREQUENCY_HZ => I2S_MASTER_FREQUENCY_HZ,
			SAMPLE_RATE_HZ      => I2S_SAMPLE_RATE_HZ,
			BITS_PER_SAMPLE     => I2S_BITS_PER_SAMPLE
		)
		port map(
			clk_i            => audio_clk,
            reset_i          => reset_i,
            valid_i          => '1',
            ready_o          => i2s_ready,
			left_data_i      => i2s_left_data,
			right_data_i     => i2s_right_data,
			master_clk_o     => i2s_master_clk_o,
			serial_clk_o     => i2s_serial_clk_o,
			left_right_clk_o => i2s_left_right_clk_o,
			serial_data_o    => i2s_serial_data_o
		);
end Structural;
