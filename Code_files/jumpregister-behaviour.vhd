library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of jumpregister is
  signal mem: signed(5 downto 0);
  signal can_jump: std_logic;
begin

  process(clk, update, reset, jump, reset_vel, can_jump)
  begin
    if (falling_edge(clk)) then
      if (reset = '1') then
        mem <= "000000";
        can_jump <= '1';
      elsif (reset_vel = '1') then
        if (mem(mem'left) = '0') then
          mem <= "000000";
          can_jump <= '1';
        else
          mem <= "000000";
          can_jump <= '0';
        end if;
      else
        if (jump = '1' and can_jump = '1') then
          mem <= "110111";
          can_jump <= '0';
        else
          if (update = '1') then
            mem <= mem + 1;
            can_jump <= can_jump;
          else
            mem <= mem;
            can_jump <= can_jump;
          end if;
        end if;
      end if;
    end if;
  end process;

  y_velocity <= mem;

end behaviour;

