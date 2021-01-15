library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture rtl of pixel_mux_map is

begin

    -- Synchronous Outputs
    process (clk) is
    begin 
        if rising_edge(clk) then
            if reset = '1' then
                color_code <= (others => '0');
            else 
                if to_integer(unsigned(switch)) = 0 then
                    color_code <= pixel_1;
                elsif to_integer(unsigned(switch)) = 1 then
                    color_code <= pixel_2;
                elsif to_integer(unsigned(switch)) = 2 then
                    color_code <= pixel_3;
                elsif to_integer(unsigned(switch)) = 3 then
                    color_code <= pixel_4;
                elsif to_integer(unsigned(switch)) = 4 then
                    color_code <= pixel_5;
                elsif to_integer(unsigned(switch)) = 5 then
                    color_code <= pixel_6;
                elsif to_integer(unsigned(switch)) = 6 then
                    color_code <= pixel_7;
                elsif to_integer(unsigned(switch)) = 7 then
                    color_code <= pixel_8;
                end if;
            end if;
        end if;
    end process;

end architecture rtl;