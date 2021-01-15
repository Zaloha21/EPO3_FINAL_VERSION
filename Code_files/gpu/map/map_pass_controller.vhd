library IEEE;
use IEEE.std_logic_1164.all;

entity map_pass_controller is
    port(
        clk : in std_logic;
        reset : in std_logic;

        h_pixel : in std_logic_vector(9 downto 0);
        v_pixel : in std_logic_vector(9 downto 0);

        row_of_blocks : in std_logic_vector(39 downto 0);

        block_value : out std_logic
    );
end entity map_pass_controller;