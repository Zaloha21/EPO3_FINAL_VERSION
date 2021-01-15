library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture structural of rom_chip is

    component map_rom is
        port(
            clk : in std_logic;
            reset : in std_logic;
    
            address : in std_logic_vector(4 downto 0);
    
            row_of_blocks : out std_logic_vector(39 downto 0)
        );
    end component map_rom;

    component rom_bus is
        port(
            clk : in std_logic;
            reset : in std_logic;
    
            h_pixel : in std_logic_vector(9 downto 0);
            v_pixel : in std_logic_vector(9 downto 0);
    
            address_map : in std_logic_vector(4 downto 0);
            address_player : in std_logic_vector(4 downto 0);
            address_bullet_one : in std_logic_vector(4 downto 0);
            address_bullet_two : in std_logic_vector(4 downto 0);
    
            row_of_blocks_rom : in std_logic_vector(39 downto 0);
    
            row_of_blocks_map : out std_logic_vector(39 downto 0);
            row_of_blocks_player : out std_logic_vector(39 downto 0);
            row_of_blocks_bullet_one : out std_logic_vector(39 downto 0);
            row_of_blocks_bullet_two : out std_logic_vector(39 downto 0);
    
            address_rom : out std_logic_vector(4 downto 0)
        );
    end component rom_bus;

    component rom_controller_gpu is
        port(
            clk : in std_logic;
            reset : in std_logic;
    
            h_pixel : in std_logic_vector(9 downto 0);
            v_pixel : in std_logic_vector(9 downto 0);
    
            address : out std_logic_vector(4 downto 0)
        );
    end component rom_controller_gpu;

    signal rom_address_signal : std_logic_vector(4 downto 0);
    signal rom_row_signal : std_logic_vector(39 downto 0);

    signal gpu_address_signal : std_logic_vector(4 downto 0);

begin

    rom: map_rom port map (
        clk => clk,
        reset => reset,
        address => rom_address_signal,
        row_of_blocks => rom_row_signal
    );

    ACCESS_CTRL: rom_bus port map (
        clk => clk,
        reset => reset,
        h_pixel => h_pixel,
        v_pixel => v_pixel,
        address_map => gpu_address_signal,
        address_player => address_player,
        address_bullet_one => address_bullet_one,
        address_bullet_two => address_bullet_two,
        row_of_blocks_rom => rom_row_signal,
        row_of_blocks_map => row_of_blocks_map,
        row_of_blocks_player => row_of_blocks_player,
        row_of_blocks_bullet_one => row_of_blocks_bullet_one,
        row_of_blocks_bullet_two => row_of_blocks_bullet_two,
        address_rom => rom_address_signal
    );

    gpu_ctrl: rom_controller_gpu port map (
        clk => clk,
        reset => reset,
        h_pixel => h_pixel,
        v_pixel => v_pixel,
        address => gpu_address_signal
    );

end architecture structural;