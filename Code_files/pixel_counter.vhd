library IEEE;
use IEEE.std_logic_1164.all;

entity pixel_counter is
    port(
        clk : in std_logic;
        reset : in std_logic;

        h_pixel : out std_logic_vector(9 downto 0);
        v_pixel : out std_logic_vector(9 downto 0)
    );
end entity pixel_counter;