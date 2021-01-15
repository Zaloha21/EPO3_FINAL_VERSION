library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture rtl of rgb_rom_map is

    type rom_type is array (0 to 3) of std_logic_vector(11 downto 0);

	constant rom : rom_type := (
		0 => "000000100100",
		1 => "000010001111",
		2 => "000011001111",
		3 => "010000101010");

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