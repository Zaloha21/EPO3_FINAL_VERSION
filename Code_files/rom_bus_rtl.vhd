library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture rtl of rom_bus is 

	type fsm_type is (reset_state, assign_gpu, assign_player, assign_bullet_one, assign_bullet_two);
	signal state, new_state : fsm_type;
	
begin 

	-- Synchronous State Outputs and State Register
	process (clk) is 
	begin 
		if rising_edge(clk) then 
			if reset = '1' then 
				state <= reset_state;
                row_of_blocks_map <= (others => '0');
                row_of_blocks_player <= (others => '0');
                row_of_blocks_bullet_one <= (others => '0');
                row_of_blocks_bullet_two <= (others => '0');
                address_rom <= (others => '0');
			else 
				state <= new_state;
				
				case state is 
				
					when reset_state =>
                        row_of_blocks_map <= (others => '0');
                        row_of_blocks_player <= (others => '0');
                        row_of_blocks_bullet_one <= (others => '0');
                        row_of_blocks_bullet_two <= (others => '0');
                        address_rom <= (others => '0');

                    when assign_gpu =>
                        row_of_blocks_map <= row_of_blocks_rom;
                        row_of_blocks_player <= (others => '0');
                        row_of_blocks_bullet_one <= (others => '0');
                        row_of_blocks_bullet_two <= (others => '0');
                        address_rom <= address_map;
                    
                    when assign_player =>
                        row_of_blocks_map <= (others => '0');
                        row_of_blocks_player <= row_of_blocks_rom;
                        row_of_blocks_bullet_one <= (others => '0');
                        row_of_blocks_bullet_two <= (others => '0');
                        address_rom <= address_player;

                    when assign_bullet_one =>
                        row_of_blocks_map <= (others => '0');
                        row_of_blocks_player <= (others => '0');
                        row_of_blocks_bullet_one <= row_of_blocks_rom;
                        row_of_blocks_bullet_two <= (others => '0');
                        address_rom <= address_bullet_one;

                    when assign_bullet_two =>
                        row_of_blocks_map <= (others => '0');
                        row_of_blocks_player <= (others => '0');
                        row_of_blocks_bullet_one <= (others => '0');
                        row_of_blocks_bullet_two <= row_of_blocks_rom;
                        address_rom <= address_bullet_two;
				
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
                if to_integer(unsigned(h_pixel)) = 798 then
                    if to_integer(unsigned(v_pixel)) = 524 then
                        new_state <= assign_gpu;
                    end if;
                end if;

            when assign_gpu =>
                if to_integer(unsigned(h_pixel)) = 798 then
                    if to_integer(unsigned(v_pixel)) = 479 then
                        new_state <= assign_player;
                    end if;
                end if;

            when assign_player =>
                if to_integer(unsigned(h_pixel)) = 798 then
                    if to_integer(unsigned(v_pixel)) = 503 then
                        new_state <= assign_bullet_one;
                    end if;
                end if;

            when assign_bullet_one =>
                if to_integer(unsigned(h_pixel)) = 798 then
                    if to_integer(unsigned(v_pixel)) = 509 then
                        new_state <= assign_bullet_two;
                    end if;
                end if;

            when assign_bullet_two =>
            if to_integer(unsigned(h_pixel)) = 798 then
                if to_integer(unsigned(v_pixel)) = 524 then
                    new_state <= assign_gpu;
                end if;
            end if;
		
		end case;
	end process;

end architecture rtl;