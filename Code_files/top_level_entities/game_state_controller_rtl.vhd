library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture rtl of game_state_controller is 

	type fsm_type is (reset_state, idle_state, incr_player_one, incr_player_two);
    signal state, new_state : fsm_type;
    
    signal score_one_count, score_two_count : unsigned(1 downto 0);
	
begin 

	-- Synchronous State Outputs and State Register
	process (clk) is 
	begin 
		if rising_edge(clk) then 
			if reset = '1' then 
				state <= reset_state;
				score_one_count <= (others => '0');
                score_two_count <= (others => '0');
                location_reset <= '0';
                score_player_one <= (others => '0');
                score_player_two <= (others => '0');
            else 
                score_player_one <= std_logic_vector(score_one_count);
                score_player_two <= std_logic_vector(score_two_count);

				state <= new_state;
				
				case state is 
				
					when reset_state =>
                        score_one_count <= (others => '0');
                        score_two_count <= (others => '0');
                        location_reset <= '1';

                    when idle_state =>
                        score_one_count <= score_one_count;
                        score_two_count <= score_two_count;
                        location_reset <= '0';

                    when incr_player_one =>
                        score_one_count <= score_one_count + 1;
                        score_two_count <= score_two_count;
                        location_reset <= '1';

                    when incr_player_two =>
                        score_one_count <= score_one_count;
                        score_two_count <= score_two_count + 1;
                        location_reset <= '1';

				end case;
			end if;
		end if;
	end process;
	
	-- Synchronous State Transitions
	process (state, player_one_hit, player_two_hit, score_one_count, score_two_count) is 
	begin 
		new_state <= state;
		
		case state is 
		
			when reset_state =>
                new_state <= idle_state;

            when idle_state =>
                if player_one_hit = '1' then
                    new_state <= incr_player_two;
                elsif player_two_hit = '1' then
                    new_state <= incr_player_one;
                end if;

            when incr_player_one =>
                if to_integer(score_one_count) = 2 then
                    new_state <= reset_state;
                else 
                    new_state <= idle_state;
                end if;

            when incr_player_two =>
                if to_integer(score_two_count) = 2 then
                    new_state <= reset_state;
                else 
                    new_state <= idle_state;
                end if;
		
		end case;
	end process;

end architecture rtl;