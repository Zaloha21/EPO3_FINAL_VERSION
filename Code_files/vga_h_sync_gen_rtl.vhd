library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture rtl of vga_h_sync_gen is 

	type fsm_type is (reset_state, disable_sync, enable_sync);
	signal state, new_state : fsm_type;
	
begin 

	-- Synchronous State Outputs and State Register
	process (clk) is 
	begin 
		if rising_edge(clk) then 
			if reset = '1' then 
				state <= reset_state;
				h_sync <= '0';
			else 
				state <= new_state;
				
				case state is 
				
					when reset_state =>
                        h_sync <= '0';
                        
                    when disable_sync =>
                        h_sync <= '0';

                    when enable_sync =>
                        h_sync <= '1';
				
				end case;
			end if;
		end if;
	end process;
	
	-- Synchronous State Transitions
	process (state, h_pixel) is 
	begin 
		new_state <= state;
		
		case state is 
		
			when reset_state =>
                new_state <= disable_sync;

            when disable_sync =>
                if to_integer(unsigned(h_pixel)) = 756 then
                    new_state <= enable_sync;
                end if;

            when enable_sync =>
                if to_integer(unsigned(h_pixel)) = 660 then
                    new_state <= disable_sync;
                end if;
		
		end case;
	end process;

end architecture rtl;