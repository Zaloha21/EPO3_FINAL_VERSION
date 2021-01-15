library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of coordregister is
  signal mem: unsigned(9 downto 0);
begin

  regprocess: process (clk, write, reset)
  begin
    if (falling_edge(clk)) then
      if (reset = '1') then
        --mem <= (others => '0');
        mem <= to_unsigned(reset_val, 10);
      else
        if (write = '1') then
          mem <= input;
        end if;
      end if;
    end if;
  end process;

  output <= mem;

end behaviour;
