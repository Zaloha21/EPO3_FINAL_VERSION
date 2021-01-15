library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity jumpregister is
   port(clk       : in  std_logic;
        update    : in  std_logic;
        reset     : in  std_logic;
        jump         : in  std_logic;
        reset_vel  : in  std_logic;
        y_velocity : out signed(5 downto 0));
end jumpregister;
