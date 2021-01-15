library IEEE;
use IEEE.std_logic_1164.all;

entity pixel_mux_map is
    port(
        clk : in std_logic;
        reset : in std_logic;

        pixel_1 : in std_logic_vector(1 downto 0);
        pixel_2 : in std_logic_vector(1 downto 0);
        pixel_3 : in std_logic_vector(1 downto 0);
        pixel_4 : in std_logic_vector(1 downto 0);
        pixel_5 : in std_logic_vector(1 downto 0);
        pixel_6 : in std_logic_vector(1 downto 0);
        pixel_7 : in std_logic_vector(1 downto 0);
        pixel_8 : in std_logic_vector(1 downto 0);

        switch : in std_logic_vector(2 downto 0);

        color_code : out std_logic_vector(1 downto 0)
    );
end entity pixel_mux_map;