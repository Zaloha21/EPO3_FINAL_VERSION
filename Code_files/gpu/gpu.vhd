library IEEE;
use IEEE.std_logic_1164.all;

entity gpu is
    port(
        clk : in std_logic;
        reset : in std_logic;

        h_pixel : in std_logic_vector(9 downto 0);
        v_pixel : in std_logic_vector(9 downto 0);

        gpu_address_map : in std_logic_vector(2 downto 0);
        switch_map : in std_logic_vector(2 downto 0);
        enable_pass_map : in std_logic;

        switch_player_one : in std_logic_vector(3 downto 0);
        address_player_one : in std_logic_vector(4 downto 0);
        enable_pass_player_one : in std_logic;

        switch_player_two : in std_logic_vector(3 downto 0);
        address_player_two : in std_logic_vector(4 downto 0);
        enable_pass_player_two : in std_logic;

        switch_bullet_one : in std_logic_vector(3 downto 0);
        address_bullet_one : in std_logic_vector(1 downto 0);
        enable_pass_bullet_one : in std_logic;

        switch_bullet_two : in std_logic_vector(3 downto 0);
        address_bullet_two : in std_logic_vector(1 downto 0);
        enable_pass_bullet_two : in std_logic;

        h_sync : out std_logic;
        v_sync : out std_logic;

        red_channel : out std_logic_vector(3 downto 0);
        green_channel : out std_logic_vector(3 downto 0);
        blue_channel : out std_logic_vector(3 downto 0)
    );
end entity gpu;