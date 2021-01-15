library IEEE;
use IEEE.std_logic_1164.ALL;

entity buttonreg is
   port(clk    : in  std_logic;
        reset  : in  std_logic;
        input  : in  std_logic_vector(11 downto 0);
        output : out std_logic_vector(11 downto 0));
end buttonreg;

