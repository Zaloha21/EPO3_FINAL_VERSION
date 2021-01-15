library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture rtl of sprite_rom_map is

    type rom_type is array (0 to 7) of std_logic_vector(15 downto 0);

	constant rom : rom_type := (
		0 => "1010010101010101",
		1 => "1001010000000000",
		2 => "0101000011111111",
		3 => "0100001111111111",
		4 => "0100111111111111",
		5 => "0100111111111111",
		6 => "0100111111111111",
		7 => "0100111111111111");
    
    signal color_out : std_logic_vector(15 downto 0);

begin

    -- Synchronous Outputs
    process (clk) is 
    begin 
        if rising_edge(clk) then
            if reset = '1' then
                color_out <= (others => '0');

                pixel_1 <= (others => '0');
                pixel_2 <= (others => '0');
                pixel_3 <= (others => '0');
                pixel_4 <= (others => '0');
                pixel_5 <= (others => '0');
                pixel_6 <= (others => '0');
                pixel_7 <= (others => '0');
                pixel_8 <= (others => '0');
            else
                color_out <= rom (to_integer(unsigned(address)));
                pixel_1(1) <= color_out(15);
	            pixel_1(0) <= color_out(14);

	            pixel_2(1) <= color_out(13);
	            pixel_2(0) <= color_out(12);

	            pixel_3(1) <= color_out(11);
	            pixel_3(0) <= color_out(10);

	            pixel_4(1) <= color_out(9);
	            pixel_4(0) <= color_out(8);

	            pixel_5(1) <= color_out(7);
	            pixel_5(0) <= color_out(6);

	            pixel_6(1) <= color_out(5);
	            pixel_6(0) <= color_out(4);

	            pixel_7(1) <= color_out(3);
	            pixel_7(0) <= color_out(2);

	            pixel_8(1) <= color_out(1);
	            pixel_8(0) <= color_out(0);
            end if;
        end if;
    end process;

end architecture rtl;