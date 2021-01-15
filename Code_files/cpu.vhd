library IEEE;
use IEEE.std_logic_1164.all;

entity cpu is
    port(
        clk : in std_logic;
        reset : in std_logic;

        h_pixel : in std_logic_vector(9 downto 0);
        v_pixel : in std_logic_vector(9 downto 0);

        left_player_one : in std_logic;
        right_player_one : in std_logic;
        jump_player_one : in std_logic;
        shoot_player_one : in std_logic;

        left_player_two : in std_logic;
        right_player_two : in std_logic;
        jump_player_two : in std_logic;
        shoot_player_two : in std_logic;
        
        row_of_blocks_map : in std_logic_vector(39 downto 0);
        row_of_blocks_player : in std_logic_vector(39 downto 0);
        row_of_blocks_bullet_one : in std_logic_vector(39 downto 0);
        row_of_blocks_bullet_two : in std_logic_vector(39 downto 0);

        address_player : out std_logic_vector(4 downto 0);
        address_bullet_one_rom : out std_logic_vector(4 downto 0);
        address_bullet_two_rom : out std_logic_vector(4 downto 0);
            
        switch_map : out std_logic_vector(2 downto 0);
        gpu_address_map : out std_logic_vector(2 downto 0);
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
end entity cpu;