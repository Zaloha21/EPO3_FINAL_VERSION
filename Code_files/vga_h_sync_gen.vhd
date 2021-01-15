library IEEE;
use IEEE.std_logic_1164.all;

entity vga_h_sync_gen is
    port(
        clk : in std_logic;
        reset : in std_logic;

        h_pixel : in std_logic_vector(9 downto 0);

        h_sync : out std_logic
    );
end entity vga_h_sync_gen;