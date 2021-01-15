library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of dirregister is
  signal mem: std_logic;
begin

  regprocess: process (clk, write, reset, input)
  begin
    if (falling_edge(clk)) then
      if (reset = '1') then
        mem <= reset_val;
      else
        if (write = '1') then
          mem <= input;
        end if;
      end if;
    end if;
  end process;

  output <= mem;

end behaviour;

