library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of datalatchcontrol is
  type statetype is (RESET_STATE, LATCHHIGH, LATCHLOW);
  signal state, new_state: statetype;
  signal count: unsigned(12 downto 0);
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
        count <= "0000000000000";
      else
        count <= count + 1;
      end if;
    end if;
  end process;

  combinat: process(state, start, count)
  begin
    case(state) is
      when RESET_STATE =>
        datalatch       <= '0';
        enabledataclock <= '0';
        countreset      <= '1';
        if (start = '1') then
          new_state <= LATCHHIGH;
        else
          new_state <= RESET_STATE;
        end if;

      when LATCHHIGH =>
        datalatch       <= '1';
        enabledataclock <= '0';
        countreset      <= '0';
        if (count = 299) then
          new_state <= LATCHLOW;
        else
          new_state <= LATCHHIGH;
        end if;

      when LATCHLOW =>
        datalatch       <= '0';
        enabledataclock <= '1';
        countreset      <= '0';
        if (count = 4800) then
          new_state <= RESET_STATE;
        else
          new_state <= LATCHLOW;
        end if;

    end case;
  end process;

  counter <= count;

end behaviour;

