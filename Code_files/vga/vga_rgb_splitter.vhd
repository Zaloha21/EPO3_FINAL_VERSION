library IEEE;
use IEEE.std_logic_1164.all;

entity vga_rgb_splitter is
    port(
        clk : in std_logic;
        reset : in std_logic;

        color_in : in std_logic_vector(11 downto 0);

        red_channel : out std_logic_vector(3 downto 0);
        green_channel : out std_logic_vector(3 downto 0);
        blue_channel : out std_logic_vector(3 downto 0)
    );
end entity vga_rgb_splitter;