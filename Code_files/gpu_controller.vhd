library IEEE;
use IEEE.std_logic_1164.all;

entity gpu_controller is
    port(
        clk : in std_logic;
        reset : in std_logic;

        h_pixel : in std_logic_vector(9 downto 0);
        v_pixel : in std_logic_vector(9 downto 0);

        row_of_blocks : in std_logic_vector(39 downto 0);

        h_player_one : in std_logic_vector(9 downto 0);
        v_player_one : in std_logic_vector(9 downto 0);
        dir_player_one : in std_logic;

        h_player_two : in std_logic_vector(9 downto 0);
        v_player_two : in std_logic_vector(9 downto 0);
        dir_player_two : in std_logic;

        x_bullet_one : in std_logic_vector(9 downto 0);
        y_bullet_one : in std_logic_vector(9 downto 0);

        x_bullet_two : in std_logic_vector(9 downto 0);
        y_bullet_two : in std_logic_vector(9 downto 0);
        
        switch_map : out std_logic_vector(2 downto 0);
        address_map : out std_logic_vector(2 downto 0);
        enable_pass_map : out std_logic;

        switch_player_one : out std_logic_vector(3 downto 0);
        address_player_one : out std_logic_vector(4 downto 0);
        enable_pass_player_one : out std_logic;

        switch_player_two : out std_logic_vector(3 downto 0);
        address_player_two : out std_logic_vector(4 downto 0);
        enable_pass_player_two : out std_logic;

        switch_bullet_one : out std_logic_vector(3 downto 0);
        address_bullet_one : out std_logic_vector(1 downto 0);
        enable_pass_bullet_one : out std_logic;

        switch_bullet_two : out std_logic_vector(3 downto 0);
        address_bullet_two : out std_logic_vector(1 downto 0);
        enable_pass_bullet_two : out std_logic
    );
end entity gpu_controller;
