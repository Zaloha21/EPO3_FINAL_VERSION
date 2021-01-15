library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture rtl of player_one_rgb_rom is

	type rom_type is array (0 to 6) of std_logic_vector(11 downto 0);

	constant rom : rom_type := (
		 0 => "000100000100",
		 1 => "011100000000",
		 2 => "100010001000",
		 3 => "101100000000",
		 4 => "111100000000",
		 5 => "111101001000",
		 6 => "111111111111");

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