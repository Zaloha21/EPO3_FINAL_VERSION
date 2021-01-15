library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture rtl of pixel_counter is 

	type fsm_type is (reset_state, incr_h_count, incr_v_count, restart_count);
    signal state, new_state : fsm_type;
    
    signal h_count, v_count : unsigned(9 downto 0);
	
begin 

	-- Synchronous State Outputs and State Register
	process (clk) is 
	begin 
		if rising_edge(clk) then 
			if reset = '1' then 
                state <= reset_state;
                h_count <= to_unsigned(662, 10);
                v_count <= to_unsigned(490, 10);
                h_pixel <= std_logic_vector(to_unsigned(662, 10));
                v_pixel <= std_logic_vector(to_unsigned(490, 10));
			else 
                h_pixel <= std_logic_vector(h_count);
                v_pixel <= std_logic_vector(v_count);
            
                state <= new_state;
				
				case state is 
				
					when reset_state =>
                        h_count <= to_unsigned(662, 10);
                        v_count <= to_unsigned(490, 10);

                    when incr_h_count =>
                        h_count <= h_count + 1;
                        v_count <= v_count;

                    when incr_v_count =>
                        h_count <= (others => '0');
                        v_count <= v_count + 1;

                    when restart_count =>
                        h_count <= (others => '0');
                        v_count <= (others => '0');
				
				end case;
			end if;
		end if;
	end process;
	
	-- Synchronous State Transitions
	process (state, h_count, v_count) is 
	begin 
		new_state <= state;
		
		case state is 
		
			when reset_state =>
                new_state <= incr_h_count;

            when incr_h_count =>
                if to_integer(h_count) = 798 then
                    if to_integer(v_count) = 524 then
                        new_state <= restart_count;
                    else
                        new_state <= incr_v_count;
                    end if;
                end if;

            when incr_v_count =>
                new_state <= incr_h_count;
            
            when restart_count =>
                new_state <= incr_h_count;
		
		end case;
	end process;

end architecture rtl;