library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture rtl of bullet_pass_controller is 

	type fsm_type is (reset_state, en_pass, dis_pass);
	signal state, new_state : fsm_type;
	
begin 

	-- synchronous state outputs and state register
	process (clk) is 
	begin 
		if rising_edge(clk) then 
			if reset = '1' then 
				state <= reset_state;
                enable_pass_bullet <= '1';
			else 
				state <= new_state;
				
				case state is 
				
					when reset_state =>
						enable_pass_bullet <= '1';
                        
                    when en_pass =>
						enable_pass_bullet <= '1';

                    when dis_pass =>
						enable_pass_bullet <= '0';
				
				end case;
			end if;
		end if;
	end process;
	
	-- synchronous state transitions
	process (state, h_pixel, v_pixel, x_bullet, y_bullet) is 
	begin 
		new_state <= state;
		
		case state is 
		
			when reset_state =>
                new_state <= en_pass;

            when en_pass =>
                if to_integer(unsigned(h_pixel)) = (to_integer(unsigned(x_bullet)) + 1) then
                    if to_integer(unsigned(v_pixel)) >= to_integer(unsigned(y_bullet)) and to_integer(unsigned(v_pixel)) <= (to_integer(unsigned(y_bullet)) + 6) then
                        new_state <= dis_pass;
                    end if;
                end if;

            when dis_pass =>
                if to_integer(unsigned(h_pixel)) = (to_integer(unsigned(x_bullet)) + 33) then
                    new_state <= en_pass;
                end if;
		
		end case;
	end process;

end architecture rtl;