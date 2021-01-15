library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture rtl of layer_mux is

    signal mask_color : std_logic_vector(11 downto 0);

begin

    mask_color <= "111101001000";

    -- Synchronous Outputs
    process (clk) is
    begin 
        if rising_edge(clk) then
            if reset = '1' then
                color_out <= (others => '0');
            else 
                if to_integer(unsigned(v_pixel)) <= 479 then
                    if to_integer(unsigned(h_pixel)) >= 4 and to_integer(unsigned(h_pixel)) <= 643 then
                        if color_bullet_one /= mask_color then
                            color_out <= color_bullet_one;
                        elsif color_bullet_two /= mask_color then
                            color_out <= color_bullet_two;
                        elsif color_player_one /= mask_color then 
                            color_out <= color_player_one;
                        elsif color_player_two /= mask_color then
                            color_out <= color_player_two;
                        elsif color_map /= mask_color then
                            color_out <= color_map;
                        elsif to_integer(unsigned(v_pixel)) <= 64  then
                            color_out <= (others => '0'); -- black background for score
                        else 
                            color_out <= "000100000100"; -- background color
                        end if;
                    else 
                        color_out <= (others => '0');
                    end if;
                else 
                    color_out <= (others => '0');
                end if;
            end if;
        end if;
    end process;
    
end architecture rtl;
