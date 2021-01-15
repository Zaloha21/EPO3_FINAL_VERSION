library IEEE;
use IEEE.std_logic_1164.all;

entity map_switch_controller is
    port(
        clk : in std_logic;
        reset : in std_logic;

        h_pixel : in std_logic_vector(9 downto 0);
        v_pixel : in std_logic_vector(9 downto 0);

        switch : out std_logic_vector(2 downto 0)
    );
end entity map_switch_controller;