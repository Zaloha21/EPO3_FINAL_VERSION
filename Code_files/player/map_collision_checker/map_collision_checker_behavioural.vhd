library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behavioural of map_collision_checker is
  type state_type is (reset_state, prep_state, no_collide, collide, check_11, check_11_ye, check_12, check_21, check_22, check_31, check_32, check_31_xe, check_31_ye, check_32_xe);
  signal state, new_state: state_type;
  signal internal_x, internal_y: unsigned(9 downto 0);
  signal block_value: std_logic;
  signal count: unsigned(1 downto 0);
  signal reset_count: std_logic;
begin

  statereg: process (clk)
  begin
    if (rising_edge(clk)) then
      if (reset = '1') then
        state <= reset_state;
      else
        state <= new_state;
      end if;
    end if;
  end process;

  countreg: process (clk)
  begin
    if (rising_edge(clk)) then
      if (reset = '1' or reset_count = '1') then
        count <= (others => '0');
      else
        count <= count + 1;
      end if;
    end if;
  end process;

  combinatorial: process(state, count, start, block_value, x, y)
  begin
    case state is
      when reset_state =>
	internal_x <= x;
	internal_y <= y;
	check     <= '0';
	done      <= '0';
        reset_count<= '1';
	if (start = '1') then
	  new_state <= prep_state;
	else
	  new_state <= reset_state;
	end if;

      when prep_state =>
	internal_x <= x;
	internal_y <= y;
	check     <= '0';
	done      <= '0';
        reset_count<= '1';
      new_state <= check_11;

      when check_11 => -- Upper left
	internal_x  <= x;				   -- X-coordinate +0  to check the left
	internal_y  <= y;				   -- Y-coordinate +0  to check the top
	done       <= '0';
	check      <= '0';
        reset_count <= '0';
        if (count = 3) then
	  if (block_value = '1') then
	    new_state <= collide;
	  else
	    new_state <= check_11_ye;
	  end if;
        else
          new_state <= check_11;
        end if;

      when check_11_ye =>
	internal_x  <= x + 16;				   -- X-coordinate +16 to check the middle
	internal_y  <= y;				   -- Y-coordinate +0  to check the top
	done       <= '0';
	check      <= '0';
        reset_count <= '0';
        if (count = 3) then
	  if (block_value = '1') then
	    new_state <= collide;
	  else
	    new_state <= check_12;
	  end if;
        else
          new_state <= check_11_ye;
        end if;
		
      when check_12 => -- Upper right
	internal_x  <= x + 31;    				   -- X-coordinate +31 to check the right
	internal_y  <= y;				   -- Y-coordinate +0  to check the top
	done       <= '0';
	check      <= '0';
        reset_count <= '0';
        if (count = 3) then
	  if (block_value = '1') then
	    new_state <= collide;
	  else
	      new_state <= check_21;
	  end if;
        else
          new_state <= check_12;
        end if;
		
      when check_21 => -- Middle left
	internal_x  <= x;				   -- X-coordinate +0  to check the left
	internal_y  <= y + 16; 				   -- Y-coordinate +16 to check the upper middle
	done       <= '0';
	check      <= '0';
        reset_count<= '0';
        if (count = 3) then
	  if (block_value = '1') then
	    new_state <= collide;
	  else
	    new_state <= check_22;
	  end if;
        else
          new_state <= check_21;
        end if;
		
      when check_22 => -- Middle right
	internal_x  <= x + 31;     				   -- X-coordinate +31 to check the right
	internal_y  <= y + 16;        	      -- Y-coordinate +16 to check the upper middle
	done       <= '0';
	check      <= '0';
        reset_count <= '0';
        if (count = 3) then
	  if (block_value = '1') then
	    new_state <= collide;
	  else
	    new_state <= check_31;
	  end if;
        else
          new_state <= check_22;
        end if;
		
      when check_31 => -- Lower left
	internal_x  <= x;			 	    -- X-coordinate +0  to check the left
	internal_y  <= y + 32;     				    -- Y-coordinate +32 to check the lower middle
	done       <= '0';
	check      <= '0';
        reset_count <= '0';
        if (count = 3) then
	  if (block_value = '1') then
	    new_state <= collide;
	  else
	    new_state <= check_32;
	  end if;
        else
          new_state <= check_31;
        end if;
		
      when check_32 => -- Lower right
	internal_x  <= x + 31;   				    -- X-coordinate +31 to check the right
	internal_y  <= y + 32;    				    -- Y-coordinate +32 to check the lower middle
	done       <= '0';
	check      <= '0';
        reset_count <= '0';
        if (count = 3) then
	  if (block_value = '1') then
	    new_state <= collide;
	  else
	    new_state <= check_31_xe;
	  end if;
        else
          new_state <= check_32;
        end if;
		
      when check_31_xe => -- Lower right Extended
	internal_x  <= x;				    -- X-coordinate +0  to check the left
	internal_y  <= y + 47;     				    -- Y-coordinate +47 to check the bottom
	done       <= '0';
	check      <= '0';
        reset_count <= '0';
        if (count = 3) then
	  if (block_value = '1') then
	    new_state <= collide;
	  else
	      new_state <= check_31_ye;
	  end if;
        else
          new_state <= check_31_xe;
        end if;

      when check_31_ye => -- Middle bottom
	internal_x  <= x + 16;				   -- X-coordinate +16 to check the middle
	internal_y  <= y + 47;				   -- Y-coordinate +47 to check the bottom
	done       <= '0';
	check      <= '0';
        reset_count <= '0';
        if (count = 3) then
	  if (block_value = '1') then
	    new_state <= collide;
	  else
	    new_state <= check_32_xe;
	  end if;
        else
          new_state <= check_31_ye;
        end if;
		
      when check_32_xe => -- Lower right Extended
	internal_x  <= x + 31;       				    -- X-coordinate +31 to check the right
	internal_y  <= y + 47;    				    -- Y-coordinate +47 to check the bottom
	done       <= '0';
	check      <= '0';
        reset_count <= '0';
        if (count = 3) then
	  if (block_value = '1') then
	    new_state <= collide;
	  else
	    new_state <= no_collide;
	  end if;
        else
          new_state <= check_32_xe;
        end if;

      when no_collide =>
	internal_x  <= x;
	internal_y  <= y;
	check      <= '0';
	done       <= '1';
        reset_count <= '1';
	new_state  <= reset_state;

      when collide =>
	internal_x  <= x;
	internal_y  <= y;
	check      <= '1';
	done       <= '1';
        reset_count <= '1';
	new_state  <= reset_state;

    end case;
  end process;

  row_sel     <= internal_y(8 downto 4);
  block_value <= row_val(row_val'length - 1 - to_integer(internal_x(9 downto 4)));

end behavioural;

