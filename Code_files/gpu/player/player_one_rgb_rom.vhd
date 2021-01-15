library IEEE;
use IEEE.std_logic_1164.all;

entity player_one_rgb_rom is
    port(
        clk : in std_logic;
        reset : in std_logic;

        address : in std_logic_vector(2 downto 0);
        rgb_color : out std_logic_vector(11 downto 0)
    );
end entity player_one_rgb_rom;