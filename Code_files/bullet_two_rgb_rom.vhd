library IEEE;
use IEEE.std_logic_1164.all;

entity bullet_two_rgb_rom is
    port(
        clk : in std_logic;
        reset : in std_logic;

        address : in std_logic_vector(1 downto 0);
        rgb_color : out std_logic_vector(11 downto 0)
    );
end entity bullet_two_rgb_rom;