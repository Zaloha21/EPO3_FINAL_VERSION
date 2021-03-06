library IEEE;
use IEEE.std_logic_1164.all;

entity player_two_graphics is
    port(
        clk : in std_logic;
        reset : in std_logic;

        switch : in std_logic_vector(3 downto 0);
        address : in std_logic_vector(4 downto 0);
        enable_pass : in std_logic;

        color_out : out std_logic_vector(11 downto 0)
    );
end entity player_two_graphics;