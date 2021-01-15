library IEEE;
use IEEE.std_logic_1164.all;

entity layer_mux is
    port(
        clk : in std_logic;
        reset : in std_logic;

        h_pixel : in std_logic_vector(9 downto 0);
        v_pixel : in std_logic_vector(9 downto 0);

        color_map : in std_logic_vector(11 downto 0);
        color_player_one : in std_logic_vector(11 downto 0);
        color_player_two : in std_logic_vector(11 downto 0);
        color_bullet_one : in std_logic_vector(11 downto 0);
        color_bullet_two : in std_logic_vector(11 downto 0);

        color_out : out std_logic_vector(11 downto 0)
    );
end entity layer_mux;