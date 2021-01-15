library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture rtl of bullet_two_sprite_rom is

	type rom_type is array (0 to 3) of std_logic_vector(31 downto 0);

	constant rom : rom_type := (
		0 => "11000000000000000000000000000011",
		1 => "00101010101010101010101010101000",
		2 => "00010101010101010101010101010100",
		3 => "11000000000000000000000000000011");
    
    signal color_out : std_logic_vector(31 downto 0);

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
                pixel_9 <= (others => '0');
                pixel_10 <= (others => '0');
                pixel_11 <= (others => '0');
                pixel_12 <= (others => '0');
                pixel_13 <= (others => '0');
                pixel_14 <= (others => '0');
                pixel_15 <= (others => '0');
                pixel_16 <= (others => '0');
            else
                color_out <= rom (to_integer(unsigned(address)));

                pixel_1(1) <= color_out(31);
                pixel_1(0) <= color_out(30);
        
                pixel_2(1) <= color_out(29);
                pixel_2(0) <= color_out(28);
        
                pixel_3(1) <= color_out(27);
                pixel_3(0) <= color_out(26);
        
                pixel_4(1) <= color_out(25);
                pixel_4(0) <= color_out(24);
        
                pixel_5(1) <= color_out(23);
                pixel_5(0) <= color_out(22);
        
                pixel_6(1) <= color_out(21);
                pixel_6(0) <= color_out(20);
        
                pixel_7(1) <= color_out(19);
                pixel_7(0) <= color_out(18);
        
                pixel_8(1) <= color_out(17);
                pixel_8(0) <= color_out(16);
        
                pixel_9(1) <= color_out(15);
                pixel_9(0) <= color_out(14);
        
                pixel_10(1) <= color_out(13);
                pixel_10(0) <= color_out(12);
        
                pixel_11(1) <= color_out(11);
                pixel_11(0) <= color_out(10);
        
                pixel_12(1) <= color_out(9);
                pixel_12(0) <= color_out(8);
        
                pixel_13(1) <= color_out(7);
                pixel_13(0) <= color_out(6);
        
                pixel_14(1) <= color_out(5);
                pixel_14(0) <= color_out(4);
        
                pixel_15(1) <= color_out(3);
                pixel_15(0) <= color_out(2);
        
                pixel_16(1) <= color_out(1);
                pixel_16(0) <= color_out(0);
            end if;
        end if;
    end process;

end architecture rtl;