library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture rtl of map_address_controller is 

	type fsm_type is (reset_state, incr_address, idle_state, hold_address, decr_address);
    signal state, new_state : fsm_type;
    
    signal address_count : unsigned(2 downto 0);
    signal temp : unsigned(3 downto 0);
	
begin 

	-- Synchronous State Outputs and State Register
	process (clk) is 
	begin 
		if rising_edge(clk) then 
			if reset = '1' then 
				state <= reset_state;
                address_count <= (others => '0');
                temp <= (others => '0');
                address <= (others => '0');
            else 
                address <= std_logic_vector(address_count);

				state <= new_state;
				
				case state is 
				
					when reset_state =>
                        address_count <= (others => '0');
                        temp <= (others => '0');
                    
                    when incr_address =>
                        address_count <= address_count + 1;
                        temp <= temp + 1;

                    when idle_state =>
                        address_count <= address_count;
                        temp <= temp;

                    when hold_address =>
                        address_count <= address_count;
                        temp <= temp + 1;

                    when decr_address =>
                        address_count <= address_count - 1;
                        temp <= temp + 1;
				
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
                if to_integer(unsigned(h_pixel)) = 797 then
                    if to_integer(unsigned(v_pixel)) = 0 then
                        new_state <= incr_address;
                    end if;
                end if;

            when incr_address =>
                new_state <= idle_state;

            when idle_state =>
                if to_integer(unsigned(h_pixel)) = 797 then
                    if to_integer(unsigned(v_pixel)) = 479 then
                        new_state <= reset_state;
                    elsif to_integer(temp) <= 6 then
                        new_state <= incr_address;
                    elsif to_integer(temp) >= 8 and to_integer(temp) <= 14 then
                        new_state <= decr_address;
                    else
                        new_state <= hold_address;
                    end if;
                end if;

            when hold_address =>
                new_state <= idle_state;
            
            when decr_address =>
                new_state <= idle_state;
                
		end case;
	end process;

end architecture rtl;