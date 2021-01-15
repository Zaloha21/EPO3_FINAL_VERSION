library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity coordregister is
   generic(reset_val: integer);
   port   (clk    : in  std_logic;
           reset  : in  std_logic;
           input  : in  unsigned(9 downto 0);
           write  : in  std_logic;
           output : out unsigned(9 downto 0));
end coordregister;
