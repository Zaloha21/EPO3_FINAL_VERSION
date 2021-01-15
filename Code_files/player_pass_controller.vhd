library IEEE;
use IEEE.std_logic_1164.all;

entity player_pass_controller is
    port(
        clk : in std_logic;
        reset : in std_logic;

        h_pixel : in std_logic_vector(9 downto 0);
        v_pixel : in std_logic_vector(9 downto 0);

        h_player : in std_logic_vector(9 downto 0);
        v_player : in std_logic_vector(9 downto 0);

        enable_pass_player : out std_logic
    );
end entity player_pass_controller;