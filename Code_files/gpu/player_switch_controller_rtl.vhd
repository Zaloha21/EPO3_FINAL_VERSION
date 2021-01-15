library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture rtl of player_switch_controller is 

	type fsm_type is (reset_state, idle_state, init_pos_dir, init_neg_dir, decr_switch, hold_switch, incr_switch, reset_switch);
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
                switch_player <= (others => '0');
            else 
                switch_player <= std_logic_vector(switch_count);

				state <= new_state;
				
				case state is 
				
					when reset_state =>
                        temp <= (others => '0');
                        switch_count <= (others => '0');

                    when idle_state =>
                        temp <= (others => '0');
                        switch_count <= (others => '0');

                    when init_pos_dir =>
                        temp <= (others => '0');
                        switch_count <= (others => '0');

                    when init_neg_dir =>
                        temp <= (others => '0');
                        switch_count <= to_unsigned(15, 4);

                    when hold_switch =>
                        temp <= temp + 1;
                        switch_count <= switch_count;

                    when incr_switch =>
                        temp <= temp + 1;
                        switch_count <= switch_count + 1;
                        
                    when decr_switch =>
                        temp <= temp + 1;
                        switch_count <= switch_count - 1;

                    when reset_switch =>
                        temp <= (others => '0');
                        switch_count <= (others => '0');

				end case;
			end if;
		end if;
	end process;
	
	-- synchronous state transitions
	process (state, h_pixel, v_pixel, h_player, v_player, temp, dir_player) is 
	begin 
		new_state <= state;
		
		case state is 
		
			when reset_state =>
                new_state <= idle_state;

            when idle_state =>
                if to_integer(unsigned(h_pixel)) = (to_integer(unsigned(h_player)) - 2) then
                    if to_integer(unsigned(v_pixel)) >= to_integer(unsigned(v_player)) and to_integer(unsigned(v_pixel)) <= (to_integer(unsigned(v_player)) + 47) then
                        if dir_player = '1' then
                            new_state <= init_pos_dir;
                        elsif dir_player = '0' then
                            new_state <= init_neg_dir;
                        end if;
                    end if;
                end if;

            when init_pos_dir =>
                new_state <= hold_switch;

            when init_neg_dir =>
                new_state <= hold_switch;

            when hold_switch =>
                if to_integer(temp) = 30 then
                    new_state <= reset_switch;
                else 
                    if dir_player = '1' then
                        new_state <= incr_switch;
                    elsif dir_player = '0' then
                        new_state <= decr_switch;
                    end if;
                end if;

            when incr_switch =>
                new_state <= hold_switch;

            when decr_switch =>
                new_state <= hold_switch;

            when reset_switch =>
                new_state <= idle_state;
		
		end case;
	end process;

end architecture rtl;