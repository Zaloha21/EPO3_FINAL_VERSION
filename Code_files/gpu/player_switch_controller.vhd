library IEEE;
use IEEE.std_logic_1164.all;

entity player_switch_controller is
    port(
        clk : in std_logic;
        reset : in std_logic;

        h_pixel : in std_logic_vector(9 downto 0);
        v_pixel : in std_logic_vector(9 downto 0);

        h_player : in std_logic_vector(9 downto 0);
        v_player : in std_logic_vector(9 downto 0);
        dir_player : in std_logic;
        
        switch_player : out std_logic_vector(3 downto 0)
    );
end entity player_switch_controller;