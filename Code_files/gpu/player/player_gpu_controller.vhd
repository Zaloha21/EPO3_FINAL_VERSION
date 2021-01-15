library IEEE;
use IEEE.std_logic_1164.all;

entity player_gpu_controller is
    port(
        clk : in std_logic;
        reset : in std_logic;

        h_pixel : in std_logic_vector(9 downto 0);
        v_pixel : in std_logic_vector(9 downto 0);

        h_player_one : in std_logic_vector(9 downto 0);
        v_player_one : in std_logic_vector(9 downto 0);
        dir_player_one : in std_logic;

        h_player_two : in std_logic_vector(9 downto 0);
        v_player_two : in std_logic_vector(9 downto 0);
        dir_player_two : in std_logic;

        switch_player_one : out std_logic_vector(3 downto 0);
        address_player_one : out std_logic_vector(4 downto 0);
        enable_pass_player_one : out std_logic;

        switch_player_two : out std_logic_vector(3 downto 0);
        address_player_two : out std_logic_vector(4 downto 0);
        enable_pass_player_two : out std_logic
    );
end entity player_gpu_controller;