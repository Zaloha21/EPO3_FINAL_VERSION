library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity player_properties is 
generic(
    reset_x: integer;
    reset_y: integer
);
port(
    clk : in std_logic;
    reset : in std_logic;

    start     : in  std_logic;
    done      : out std_logic;
    left         : in  std_logic;
    right         : in  std_logic;
    jump         : in  std_logic;
    x_pos      : out unsigned(9 downto 0);
    y_pos      : out unsigned(9 downto 0);
    dir       : out std_logic;
    new_x      : out unsigned(9 downto 0);
    new_y      : out unsigned(9 downto 0);
    check     : in  std_logic;
    coll_start : out std_logic;
    coll_done  : in  std_logic;
    reset_pos  : in  std_logic
);
end entity player_properties;
