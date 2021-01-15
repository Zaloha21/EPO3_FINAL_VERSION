library IEEE;
use IEEE.std_logic_1164.all;

entity pass_gate is
    port(
        clk : in std_logic;
        reset : in std_logic;

        enable_pass : in std_logic;

        color_in : in std_logic_vector(11 downto 0);
        color_out : out std_logic_vector(11 downto 0)
    );
end entity pass_gate;