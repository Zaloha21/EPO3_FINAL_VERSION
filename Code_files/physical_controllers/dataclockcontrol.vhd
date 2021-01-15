library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity dataclockcontrol is
   port(clk        : in  std_logic;
        reset      : in  std_logic;
        enable     : in  std_logic;
        clock      : out std_logic);
end dataclockcontrol;

