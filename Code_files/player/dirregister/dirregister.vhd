library IEEE;
use IEEE.std_logic_1164.ALL;

entity dirregister is
   generic(reset_val: std_logic);
   port(clk    : in  std_logic;
        reset  : in  std_logic;
        input  : in  std_logic;
        write  : in  std_logic;
        output : out std_logic);
end dirregister;
