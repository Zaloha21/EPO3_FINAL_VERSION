library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture rtl of rom_controller_gpu is 

	type fsm_type is (reset_state, incr_temp, idle_state, incr_address);
    signal state, new_state : fsm_type;
    
    signal temp : unsigned(3 downto 0);
    signal address_count : unsigned(4 downto 0);

	
begin 

	-- Synchronous State Outputs and State Register
	process (clk) is 
	begin 
		if rising_edge(clk) then 
			if reset = '1' then 
				state <= reset_state;
                temp <= (others => '0');
                address_count <= (others => '0');
                address <= (others => '0');
            else 
                address <= std_logic_vector(address_count);

				state <= new_state;
				
				case state is 
				
					when reset_state =>
                        temp <= (others => '0');
                        address_count <= (others => '0');
                    
                    when incr_temp =>
                        temp <= temp + 1;
                        address_count <= address_count;

                    when idle_state =>
                        temp <= temp;
                        address_count <= address_count;

                    when incr_address =>
                        temp <= (others => '0');
                        address_count <= address_count + 1;
				
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
                if to_integer(unsigned(h_pixel)) = 794 then
                    if to_integer(unsigned(v_pixel)) = 0 then
                        new_state <= incr_temp;
                    end if;
                end if;

            when incr_temp => 
                new_state <= idle_state;

            when idle_state =>
                if to_integer(unsigned(h_pixel)) = 794 then
                    if to_integer(unsigned(v_pixel)) = 479 then
                        new_state <= reset_state;
                    else
                        if to_integer(temp) = 15 then
                            new_state <= incr_address;
                        else
                            new_state <= incr_temp;
                        end if;
                    end if;
                end if;

            when incr_address =>
                new_state <= idle_state;
		
		end case;
	end process;

end architecture rtl;