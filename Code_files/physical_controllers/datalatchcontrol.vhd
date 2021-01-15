library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity datalatchcontrol is
   port(clk              : in  std_logic;
        reset            : in  std_logic;
        start            : in  std_logic;
        enabledataclock  : out std_logic;
        counter          : out unsigned(12 downto 0);
        datalatch        : out std_logic);
end datalatchcontrol;

