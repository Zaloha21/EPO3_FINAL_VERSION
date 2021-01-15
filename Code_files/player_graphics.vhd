library IEEE;
use IEEE.std_logic_1164.all;

entity player_graphics is
    port(
        clk : in std_logic;
        reset : in std_logic;

        switch_player_one : in std_logic_vector(3 downto 0);
        address_player_one : in std_logic_vector(4 downto 0);
        enable_pass_player_one : in std_logic;

        switch_player_two : in std_logic_vector(3 downto 0);
        address_player_two : in std_logic_vector(4 downto 0);
        enable_pass_player_two : in std_logic;

        color_player_one : out std_logic_vector(11 downto 0);
        color_player_two : out std_logic_vector(11 downto 0)
    );
end entity player_graphics;