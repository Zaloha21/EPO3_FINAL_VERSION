library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture rtl of pass_gate is

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
                if enable_pass = '1' then 
                    color_out <= mask_color;
                else 
                    color_out <= color_in;
                end if;
            end if;
        end if;
    end process;

end architecture rtl;
