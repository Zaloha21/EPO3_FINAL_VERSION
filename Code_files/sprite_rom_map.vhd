library IEEE;
use IEEE.std_logic_1164.all;

-- I/O ports of the entity tile_col_rom
entity sprite_rom_map is
    port(
        clk : in std_logic;
        reset : in std_logic;

        address : in std_logic_vector(2 downto 0);

        pixel_1 : out std_logic_vector(1 downto 0);
        pixel_2 : out std_logic_vector(1 downto 0);
        pixel_3 : out std_logic_vector(1 downto 0);
        pixel_4 : out std_logic_vector(1 downto 0);
        pixel_5 : out std_logic_vector(1 downto 0);
        pixel_6 : out std_logic_vector(1 downto 0);
        pixel_7 : out std_logic_vector(1 downto 0);
        pixel_8 : out std_logic_vector(1 downto 0)
    );
end entity sprite_rom_map;