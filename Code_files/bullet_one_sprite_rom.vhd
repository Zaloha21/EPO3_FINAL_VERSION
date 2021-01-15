library IEEE;
use IEEE.std_logic_1164.all;

entity bullet_one_sprite_rom is
    port(
        clk : in std_logic;
        reset : in std_logic;

        address : in std_logic_vector(1 downto 0);

        pixel_1: out std_logic_vector(1 downto 0);
        pixel_2: out std_logic_vector(1 downto 0);
        pixel_3: out std_logic_vector(1 downto 0);
        pixel_4: out std_logic_vector(1 downto 0);
        pixel_5: out std_logic_vector(1 downto 0);
        pixel_6: out std_logic_vector(1 downto 0);
        pixel_7: out std_logic_vector(1 downto 0);
        pixel_8: out std_logic_vector(1 downto 0);
        pixel_9: out std_logic_vector(1 downto 0);
        pixel_10: out std_logic_vector(1 downto 0);
        pixel_11: out std_logic_vector(1 downto 0);
        pixel_12: out std_logic_vector(1 downto 0);
        pixel_13: out std_logic_vector(1 downto 0);
        pixel_14: out std_logic_vector(1 downto 0);
        pixel_15: out std_logic_vector(1 downto 0);
        pixel_16: out std_logic_vector(1 downto 0)
    );
end entity bullet_one_sprite_rom;