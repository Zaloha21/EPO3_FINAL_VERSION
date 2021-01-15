library IEEE;
use IEEE.std_logic_1164.all;

entity map_rom is
    port(
        clk : in std_logic;
        reset : in std_logic;

        address : in std_logic_vector(4 downto 0);

        row_of_blocks : out std_logic_vector(39 downto 0)
    );
end entity map_rom;