library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture rtl of map_pass_converter is 

	type fsm_type is (reset_state, constant_pass, variable_pass);
	signal state, new_state : fsm_type;
	
begin 

	-- Synchronous State Outputs and State Register
	process (clk) is 
	begin 
		if rising_edge(clk) then 
			if reset = '1' then 
				state <= reset_state;
				enable_pass <= '1';
			else 
				state <= new_state;
				
				case state is 
				
					when reset_state =>
                        enable_pass <= '1';
                        
                    when constant_pass =>
                        enable_pass <= '1';

                    when variable_pass =>
                        enable_pass <= not block_value;
				
				end case;
			end if;
		end if;
	end process;
	
	-- Synchronous State Transitions
	process (state, h_pixel, v_pixel) is 
	begin 
		new_state <= state;
		
		case state is 
		
            when reset_state =>
                new_state <= constant_pass;

            when constant_pass =>
                if to_integer(unsigned(h_pixel)) = 1 and to_integer(unsigned(v_pixel)) <= 479 then
                    new_state <= variable_pass;
                end if;
            
            when variable_pass =>
                if to_integer(unsigned(h_pixel)) = 641 then
                    new_state <= constant_pass;
                end if;
		
		end case;
	end process;

end architecture rtl;