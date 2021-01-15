library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture structural of player_gpu_controller is

    component player_graphic_controller is
        port(
            clk : in std_logic;
            reset : in std_logic;
    
            h_pixel : in std_logic_vector(9 downto 0);
            v_pixel : in std_logic_vector(9 downto 0);
    
            h_player : in std_logic_vector(9 downto 0);
            v_player : in std_logic_vector(9 downto 0);
            dir_player : in std_logic;
    
            switch_player : out std_logic_vector(3 downto 0);
            address_player : out std_logic_vector(4 downto 0);
            enable_pass_player : out std_logic
        );
    end component player_graphic_controller;

begin

    player_one: player_graphic_controller port map(
        clk => clk,
        reset => reset,
        h_pixel => h_pixel,
        v_pixel => v_pixel,
        h_player => h_player_one,
        v_player => v_player_one,
        dir_player => dir_player_one,
        switch_player => switch_player_one,
        address_player => address_player_one,
        enable_pass_player => enable_pass_player_one
    );

    player_two: player_graphic_controller port map(
        clk => clk,
        reset => reset,
        h_pixel => h_pixel,
        v_pixel => v_pixel,
        h_player => h_player_two,
        v_player => v_player_two,
        dir_player => dir_player_two,
        switch_player => switch_player_two,
        address_player => address_player_two,
        enable_pass_player => enable_pass_player_two
    );

end architecture structural;