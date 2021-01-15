library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity map_collision_checker is
    port(
        clk : in std_logic;
        reset : in std_logic;

        start : in std_logic;
        done : out std_logic;
        x      : in  unsigned(9 downto 0);
        y      : in  unsigned(9 downto 0);
        row_sel : out unsigned(4 downto 0);
        row_val : in  std_logic_vector(39 downto 0);
        check  : out std_logic
    );
end entity map_collision_checker;
