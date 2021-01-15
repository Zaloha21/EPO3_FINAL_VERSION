library IEEE;
use IEEE.std_logic_1164.all;

entity rom_bus is
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
end entity rom_bus;