library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture structural of gpu_controller is

    component map_gpu_controller is
        port(
            clk : in std_logic;
            reset : in std_logic;
    
            h_pixel : in std_logic_vector(9 downto 0);
            v_pixel : in std_logic_vector(9 downto 0);
    
            row_of_blocks : in std_logic_vector(39 downto 0);
            
            switch : out std_logic_vector(2 downto 0);
            address : out std_logic_vector(2 downto 0);
            enable_pass_map : out std_logic
        );
    end component map_gpu_controller;

    component player_gpu_controller is
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
    end component player_gpu_controller;

    component bullet_gpu_controller is
        port(
            clk : in std_logic;
            reset : in std_logic;
    
            h_pixel : in std_logic_vector(9 downto 0);
            v_pixel : in std_logic_vector(9 downto 0);
    
            x_bullet_one : in std_logic_vector(9 downto 0);
            y_bullet_one : in std_logic_vector(9 downto 0);
    
            x_bullet_two : in std_logic_vector(9 downto 0);
            y_bullet_two : in std_logic_vector(9 downto 0);
    
            switch_bullet_one : out std_logic_vector(3 downto 0);
            address_bullet_one : out std_logic_vector(1 downto 0);
            enable_pass_bullet_one : out std_logic;
    
            switch_bullet_two : out std_logic_vector(3 downto 0);
            address_bullet_two : out std_logic_vector( 1 downto 0);
            enable_pass_bullet_two : out std_logic
        );
    end component bullet_gpu_controller;

begin

    map_ctrl: map_gpu_controller port map(
        clk => clk,
        reset => reset,
        h_pixel => h_pixel,
        v_pixel => v_pixel,
        row_of_blocks => row_of_blocks,
        switch => switch_map,
        address => address_map,
        enable_pass_map => enable_pass_map
    );

    player_ctrl: player_gpu_controller port map(
        clk => clk,
        reset => reset,
        h_pixel => h_pixel,
        v_pixel => v_pixel,
        h_player_one => h_player_one,
        v_player_one => v_player_one,
        dir_player_one => dir_player_one,
        h_player_two => h_player_two,
        v_player_two => v_player_two,
        dir_player_two => dir_player_two,
        switch_player_one => switch_player_one,
        address_player_one => address_player_one,
        enable_pass_player_one => enable_pass_player_one,
        switch_player_two => switch_player_two,
        address_player_two => address_player_two,
        enable_pass_player_two => enable_pass_player_two
    );

    bullet_ctrl: bullet_gpu_controller port map(
        clk => clk,
        reset => reset,
        h_pixel => h_pixel,
        v_pixel => v_pixel,
        x_bullet_one => x_bullet_one,
        y_bullet_one => y_bullet_one,
        x_bullet_two => x_bullet_two,
        y_bullet_two => y_bullet_two,
        switch_bullet_one => switch_bullet_one,
        address_bullet_one => address_bullet_one,
        enable_pass_bullet_one => enable_pass_bullet_one,
        switch_bullet_two => switch_bullet_two,
        address_bullet_two => address_bullet_two,
        enable_pass_bullet_two => enable_pass_bullet_two
    );

end architecture structural;