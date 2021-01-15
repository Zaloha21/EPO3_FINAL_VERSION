library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture rtl of bullet_two_rgb_rom is

	type rom_type is array (0 to 3) of std_logic_vector(11 downto 0);

	constant rom : rom_type := (
		 0 => "000001110000",
		 1 => "000010110000",
		 2 => "000011110000",
		 3 => "111101001000");

begin

    -- Synchronous Outputs
    process (clk) is
    begin
        if rising_edge(clk) then
            if reset = '1' then
                rgb_color <= (others => '0');
            else
                rgb_color <= rom (to_integer(unsigned(address)));
            end if;
        end if;        
    end process;

end architecture rtl;