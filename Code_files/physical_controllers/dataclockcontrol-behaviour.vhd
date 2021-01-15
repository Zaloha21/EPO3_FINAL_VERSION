library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of dataclockcontrol is
  type statetype is (RESET_STATE, LOW, HIGH);
  signal state, new_state: statetype;
  signal count: unsigned(8 downto 0);
  signal countreset: std_logic;
begin

  statereg: process(clk)
  begin
    if (rising_edge(clk)) then
      if (reset = '1') then
        state <= RESET_STATE;
      else
        state <= new_state;
      end if;
    end if;
  end process;
  
  countreg: process(clk)
  begin
    if (rising_edge(clk)) then
      if (reset = '1' or countreset = '1') then
        count <= "000000000";
      else
        count <= count + 1;
      end if;
    end if;
  end process;

  combinat: process(state, count, enable)
  begin
    case(state) is
      when RESET_STATE =>
        clock      <= '1';
        countreset <= '1';
        if (enable = '1') then 
          new_state <= HIGH;
        else
          new_state <= RESET_STATE;
        end if;

      when HIGH =>
        clock      <= '1';
        countreset <= '0';
        if (count = 148) then 
          new_state <= LOW;
        else
          new_state <= HIGH;
        end if;

      when LOW =>
        clock      <= '0';
        countreset <= '0';
        if (count = 298) then 
          new_state <= RESET_STATE;
        else
          new_state <= LOW;
        end if;

    end case;
  end process;
end behaviour;

