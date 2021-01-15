library IEEE;
use IEEE.std_logic_1164.all;

entity player_pixel_mux is
    port(
        clk : in std_logic;
        reset : in std_logic;

        pixel_1: in std_logic_vector(2 downto 0);
        pixel_2: in std_logic_vector(2 downto 0);
        pixel_3: in std_logic_vector(2 downto 0);
        pixel_4: in std_logic_vector(2 downto 0);
        pixel_5: in std_logic_vector(2 downto 0);
        pixel_6: in std_logic_vector(2 downto 0);
        pixel_7: in std_logic_vector(2 downto 0);
        pixel_8: in std_logic_vector(2 downto 0);
        pixel_9: in std_logic_vector(2 downto 0);
        pixel_10: in std_logic_vector(2 downto 0);
        pixel_11: in std_logic_vector(2 downto 0);
        pixel_12: in std_logic_vector(2 downto 0);
        pixel_13: in std_logic_vector(2 downto 0);
        pixel_14: in std_logic_vector(2 downto 0);
        pixel_15: in std_logic_vector(2 downto 0);
        pixel_16: in std_logic_vector(2 downto 0);

        switch : in std_logic_vector(3 downto 0);

        color_code : out std_logic_vector(2 downto 0)
    );
end entity player_pixel_mux;