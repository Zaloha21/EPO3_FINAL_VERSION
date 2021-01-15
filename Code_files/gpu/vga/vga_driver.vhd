library IEEE;
use IEEE.std_logic_1164.all;

entity vga_driver is
    port(
        clk : in std_logic;
        reset : in std_logic;

        h_pixel : in std_logic_vector(9 downto 0);
        v_pixel : in std_logic_vector(9 downto 0);

        color_in : in std_logic_vector(11 downto 0);

        h_sync : out std_logic;
        v_sync : out std_logic;

        red_channel : out std_logic_vector(3 downto 0);
        green_channel : out std_logic_vector(3 downto 0);
        blue_channel : out std_logic_vector(3 downto 0)
    );
end entity vga_driver;