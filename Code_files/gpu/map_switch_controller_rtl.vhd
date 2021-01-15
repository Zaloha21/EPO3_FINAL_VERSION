library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture rtl of map_switch_controller is 

	type fsm_type is (reset_state, incr_switch, hold_switch, decr_switch);
    signal state, new_state : fsm_type;
    
    signal switch_count : unsigned(2 downto 0);
	
begin 

	-- Synchronous State Outputs and State Register
	process (clk) is 
	begin 
		if rising_edge(clk) then 
			if reset = '1' then 
				state <= reset_state;
                switch_count <= (others => '0');
                switch <= (others => '0');
            else 
                switch <= std_logic_vector(switch_count);

				state <= new_state;
				
				case state is 
				
					when reset_state =>
						switch_count <= (others => '0');
                
                    when incr_switch =>
                        switch_count <= switch_count + 1;

                    when hold_switch =>
                        switch_count <= switch_count;

                    when decr_switch =>
                        switch_count <= switch_count - 1;

				end case;
			end if;
		end if;
	end process;
	
	-- Synchronous State Transitions
	process (state, h_pixel, v_pixel, switch_count) is 
	begin 
		new_state <= state;
		
		case state is 
		
			when reset_state =>
                if to_integer(unsigned(h_pixel)) = 799 then
                    if to_integer(unsigned(v_pixel)) = 524 then
                        new_state <= incr_switch;
                    end if;
                end if;

            when incr_switch =>
                if to_integer(switch_count) = 6 then
                    new_state <= hold_switch;
                end if;

            when hold_switch =>
                if to_integer(unsigned(h_pixel)) = 799 and to_integer(unsigned(v_pixel)) = 479 then
                    new_state <= reset_state;
                elsif to_integer(switch_count) = 7 then
                    new_state <= decr_switch;
                else
                    new_state <= incr_switch;
                end if;

            when decr_switch =>
                if to_integer(switch_count) = 1 then
                    new_state <= hold_switch;
                end if;
		
		end case;
	end process;

end architecture rtl;