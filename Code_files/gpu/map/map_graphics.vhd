library IEEE;
use IEEE.std_logic_1164.all;

entity map_graphics is
    port(
        clk : in std_logic;
        reset : in std_logic;

        address : in std_logic_vector(2 downto 0);
        switch : in std_logic_vector(2 downto 0);
        enable_pass : in std_logic;

        rgb_color : out std_logic_vector(11 downto 0)
    );
end entity map_graphics;