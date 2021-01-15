library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture rtl of map_pass_controller is 

	type fsm_type is (reset_state, idle_state, incr_index, wait_for_line);
    signal state, new_state : fsm_type;
    
    signal temp : unsigned(3 downto 0);
    signal index : unsigned(5 downto 0);
	
begin 

	-- Synchronous State Outputs and State Register
	process (clk) is 
	begin 
		if rising_edge(clk) then 
			if reset = '1' then 
				state <= reset_state;
                temp <= (others => '0');
                index <= (others => '0');
                block_value <= '0';
            else
            
                block_value <= row_of_blocks(39 - to_integer(index));

				state <= new_state;
				
				case state is 
				
					when reset_state =>
                        temp <= (others => '0');
                        index <= (others => '0');
                        
                    when idle_state => 
                        temp <= temp + 1;
                        index <= index;

                    when incr_index =>
                        temp <= temp + 1;
                        index <= index + 1;

                    when wait_for_line =>
                        temp <= (others => '0');
                        index <= (others => '0');

				
				end case;
			end if;
		end if;
	end process;
	
	-- Synchronous State Transitions
	process (state, h_pixel, v_pixel, temp) is 
	begin 
		new_state <= state;
		
		case state is 
		
			when reset_state =>
                if to_integer(unsigned(h_pixel)) = 0 and to_integer(unsigned(v_pixel)) = 0 then
                    new_state <= idle_state;
                end if;

            when idle_state =>
                if to_integer(unsigned(h_pixel)) = 638 then
                    if to_integer(unsigned(v_pixel)) = 479 then
                        new_state <= reset_state;
                    else
                        new_state <= wait_for_line;
                    end if;
                elsif to_integer(temp) = 14 then
                    new_state <= incr_index;
                end if;

            when incr_index =>
                new_state <= idle_state;

            when wait_for_line =>
                if to_integer(unsigned(h_pixel)) = 0 then
                    new_state <= idle_state;
                end if;
		
		end case;
	end process;

end architecture rtl;