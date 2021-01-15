library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture rtl of vga_rgb_splitter is 
	
begin 

    -- Synchronous Outputs
    process (clk) is
    begin 
        if rising_edge(clk) then
            if reset = '1' then
                red_channel <= (others => '0');
                green_channel <= (others => '0');
                blue_channel <= (others => '0');
            else 
                red_channel(3) <= color_in(11);
                red_channel(2) <= color_in(10);
                red_channel(1) <= color_in(9);
                red_channel(0) <= color_in(8);

                green_channel(3) <= color_in(7);
                green_channel(2) <= color_in(6);
                green_channel(1) <= color_in(5);
                green_channel(0) <= color_in(4);

                blue_channel(3) <= color_in(3);
                blue_channel(2) <= color_in(2);
                blue_channel(1) <= color_in(1);
                blue_channel(0) <= color_in(0);
            end if;
        end if;
    end process;

end architecture rtl;