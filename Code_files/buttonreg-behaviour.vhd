library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of buttonreg is
  signal data: std_logic_vector(11 downto 0);
begin

  process(clk)
  begin
    if (falling_edge(clk)) then
      if (reset = '1') then
        data <= "111111111111";
      else
        data <= input;
      end if;
    end if;
  end process;

  output <= data;

end behaviour;

