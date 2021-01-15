library IEEE;
use IEEE.std_logic_1164.all;

entity game_state_controller is
    port(
        clk : in std_logic;
        reset : in std_logic;

        player_one_hit : in std_logic;
        player_two_hit : in std_logic;

        score_player_one : out std_logic_vector(1 downto 0);
        score_player_two : out std_logic_vector(1 downto 0);

        location_reset : out std_logic
    );
end entity game_state_controller;