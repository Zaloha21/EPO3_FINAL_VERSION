library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture rtl of player_one_sprite_rom is

    type rom_type is array (0 to 23) of std_logic_vector(47 downto 0);

	constant rom : rom_type := (
		0 => "101101101101101101101110110110110101101101101101",
		1 => "101101101101101101110000000000000110101101101101",
		2 => "101101101101101110000000100000100000110101101101",
		3 => "101101101101101110000000100000100000110101101101",
		4 => "101101101101101110000000100000100000110101101101",
		5 => "101101101101101110000000000000000000110101101101",
		6 => "101101101101101101110000000000000110101101101101",
		7 => "101101101101101101101110110110110101101010010010",
		8 => "101101101101101101110110101101101101101010100100",
		9 => "101101101101101110101110110101101101101010100100",
		10 => "101101101101110101101110101110101101101010100100",
		11 => "101101101101110101101110101101110110110010100100",
		12 => "101101101101101110101110101010010010010010100100",
		13 => "101101101101101101110110110010101101101010100100",
		14 => "101101101101101101101110101101101101101010100100",
		15 => "101101101101101101101110110101101101101010100100",
		16 => "101101101101101101101110101110101101101010010010",
		17 => "101101101101101101110101101101110101101101101101",
		18 => "100101101101101110101101101101110101101101101101",
		19 => "011100101101110101101101101101110101101101101101",
		20 => "100011001110001001001001001001110001001101101101",
		21 => "011100001001001001001001001001001001001101101101",
		22 => "100011101001001101101101101101001001101101101101",
		23 => "011101101100100101101101101101100100101101101101");
    
    signal color_out : std_logic_vector(47 downto 0);

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

                pixel_1(2) <= color_out(47);
		        pixel_1(1) <= color_out(46);
		        pixel_1(0) <= color_out(45);

		        pixel_2(2) <= color_out(44);
		        pixel_2(1) <= color_out(43);
		        pixel_2(0) <= color_out(42);

		        pixel_3(2) <= color_out(41);
		        pixel_3(1) <= color_out(40);
		        pixel_3(0) <= color_out(39);

		        pixel_4(2) <= color_out(38);
		        pixel_4(1) <= color_out(37);
		        pixel_4(0) <= color_out(36);

		        pixel_5(2) <= color_out(35);
		        pixel_5(1) <= color_out(34);
		        pixel_5(0) <= color_out(33);

		        pixel_6(2) <= color_out(32);
		        pixel_6(1) <= color_out(31);
		        pixel_6(0) <= color_out(30);

		        pixel_7(2) <= color_out(29);
		        pixel_7(1) <= color_out(28);
		        pixel_7(0) <= color_out(27);

		        pixel_8(2) <= color_out(26);
		        pixel_8(1) <= color_out(25);
		        pixel_8(0) <= color_out(24);

		        pixel_9(2) <= color_out(23);
		        pixel_9(1) <= color_out(22);
		        pixel_9(0) <= color_out(21);

		        pixel_10(2) <= color_out(20);
		        pixel_10(1) <= color_out(19);
		        pixel_10(0) <= color_out(18);

		        pixel_11(2) <= color_out(17);
		        pixel_11(1) <= color_out(16);
		        pixel_11(0) <= color_out(15);

		        pixel_12(2) <= color_out(14);
		        pixel_12(1) <= color_out(13);
		        pixel_12(0) <= color_out(12);

		        pixel_13(2) <= color_out(11);
		        pixel_13(1) <= color_out(10);
		        pixel_13(0) <= color_out(9);

		        pixel_14(2) <= color_out(8);
		        pixel_14(1) <= color_out(7);
		        pixel_14(0) <= color_out(6);

		        pixel_15(2) <= color_out(5);
		        pixel_15(1) <= color_out(4);
		        pixel_15(0) <= color_out(3);

		        pixel_16(2) <= color_out(2);
		        pixel_16(1) <= color_out(1);
		        pixel_16(0) <= color_out(0);
            end if;
        end if;
    end process;

end architecture rtl;