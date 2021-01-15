library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture rtl of bullet_switch_controller is 

	type fsm_type is (reset_state, idle_state, init_pos, hold_switch, incr_switch, reset_switch);
    signal state, new_state : fsm_type;
    
    signal temp : unsigned(4 downto 0);
    signal switch_count : unsigned (3 downto 0);
	
begin 

	-- synchronous state outputs and state register
	process (clk) is 
	begin 
		if rising_edge(clk) then 
			if reset = '1' then 
				state <= reset_state;
                temp <= (others => '0');
                switch_count <= (others => '0');
                switch_bullet <= (others => '0');
            else 
                switch_bullet <= std_logic_vector(switch_count);

				state <= new_state;
				
				case state is 
				
					when reset_state =>
                        temp <= (others => '0');
                        switch_count <= (others => '0');

                    when idle_state =>
                        temp <= (others => '0');
                        switch_count <= (others => '0');

                    when init_pos =>
                        temp <= (others => '0');
                        switch_count <= (others => '0');

                    when hold_switch =>
                        temp <= temp + 1;
                        switch_count <= switch_count;

                    when incr_switch =>
                        temp <= temp + 1;
                        switch_count <= switch_count + 1;

                    when reset_switch =>
                        temp <= (others => '0');
                        switch_count <= (others => '0');

				end case;
			end if;
		end if;
	end process;
	
	-- synchronous state transitions
	process (state, h_pixel, v_pixel, x_bullet, y_bullet, temp) is 
	begin 
		new_state <= state;
		
		case state is 
		
			when reset_state =>
                new_state <= idle_state;

            when idle_state =>
                if to_integer(unsigned(h_pixel)) = (to_integer(unsigned(x_bullet)) - 2) then
                    if to_integer(unsigned(v_pixel)) >= to_integer(unsigned(y_bullet)) and to_integer(unsigned(v_pixel)) <= (to_integer(unsigned(y_bullet)) + 7) then
                        new_state <= init_pos;
                    end if;
                end if;

            when init_pos =>
                new_state <= hold_switch;

            when hold_switch =>
                if to_integer(temp) = 30 then
                    new_state <= reset_switch;
                else 
                    new_state <= incr_switch;
                end if;

            when incr_switch =>
                new_state <= hold_switch;

            when reset_switch =>
                new_state <= idle_state;
		
		end case;
	end process;

end architecture rtl;