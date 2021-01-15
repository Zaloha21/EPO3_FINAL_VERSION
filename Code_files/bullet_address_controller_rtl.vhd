library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture rtl of bullet_address_controller is 

	type fsm_type is (reset_state, idle_state, hold_address, incr_address, temp_idle);
    signal state, new_state : fsm_type;
    
    signal address_count : unsigned(1 downto 0);
    signal temp : std_logic;
	
begin 

	-- synchronous state outputs and state register
	process (clk) is 
	begin 
		if rising_edge(clk) then 
			if reset = '1' then 
				state <= reset_state;
                address_count <= (others => '0');
                temp <= '0';
                address_bullet <= (others => '0');
            else 
                address_bullet <= std_logic_vector(address_count);

				state <= new_state;
				
				case state is 
				
					when reset_state =>
                        address_count <= (others => '0');
                        temp <= '0';
                        
                    when idle_state =>
                        address_count <= (others => '0');
                        temp <= '0';

                    when incr_address =>
                        address_count <= address_count + 1;
                        temp <= '0';
                    
                    when hold_address => 
                        address_count <= address_count;
                        temp <= '1';

                    when temp_idle =>
                        address_count <= address_count;
                        temp <= temp;
				
				end case;
			end if;
		end if;
	end process;
	
	-- synchronous state transitions
	process (state, h_pixel, v_pixel, y_bullet, temp) is 
	begin 
		new_state <= state;
		
		case state is 
		
			when reset_state =>
                new_state <= idle_state;

            when idle_state =>
                if to_integer(unsigned(h_pixel)) = 797 and to_integer(unsigned(v_pixel)) = (to_integer(unsigned(y_bullet)) + 1) then
                    new_state <= incr_address;
                end if;

            when incr_address =>
                new_state <= temp_idle;

            when hold_address =>
                new_state <= temp_idle;

            when temp_idle =>
                    if to_integer(unsigned(h_pixel)) = 797 then
                        if to_integer(unsigned(v_pixel)) = (to_integer(unsigned(y_bullet)) + 7) then
                            new_state <= idle_state;
                        elsif temp = '1' then
                            new_state <= incr_address;
                        elsif temp = '0' then
                            new_state <= hold_address;
                        end if;
                    end if;
		
		end case;
	end process;

end architecture rtl;