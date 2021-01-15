library IEEE;
use IEEE.std_logic_1164.all;

entity map_pass_converter is
    port(
        clk : in std_logic;
        reset : in std_logic;

        h_pixel : in std_logic_vector(9 downto 0);
        v_pixel : in std_logic_vector(9 downto 0);

        block_value : in std_logic;

        enable_pass : out std_logic
    );
end entity map_pass_converter;