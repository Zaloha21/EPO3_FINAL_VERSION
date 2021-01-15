library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture structural of cpu is

    component gpu_controller is
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
    end component gpu_controller;

    component player_controller is
        port(
            clk : in std_logic;
            reset : in std_logic;

            v_pixel : in std_logic_vector(9 downto 0);

            row_val : in std_logic_vector(39 downto 0);

            reset_pos : in std_logic;

            left_one : in std_logic;
            right_one : in std_logic;
            jump_one : in std_logic;
            left_two : in std_logic;
            right_two : in std_logic;
            jump_two : in std_logic;

            x_one : out unsigned(9 downto 0);
            y_one : out unsigned(9 downto 0);
            x_two : out unsigned(9 downto 0);
            y_two : out unsigned(9 downto 0);

            dir_one : out std_logic;
            dir_two : out std_logic;

            row_sel : out unsigned(4 downto 0)
        );
    end component player_controller;

    component bullet_controller is 
        port(
            clk		: in std_logic;	
            reset		: in std_logic;
    
            Xplayer1   	: in unsigned(9 downto 0);
            Yplayer1   	: in unsigned(9 downto 0);
            Shoot1     	: in std_logic;
            Dir1       	: in std_logic;
            h_pixel 	: in std_logic_vector(9 downto 0);
            v_pixel 	: in std_logic_vector(9 downto 0);
            rowVal1		: in  std_logic_vector(39 downto 0);
            rowSel1 		: out std_logic_vector(4 downto 0);
    
            rowVal2 		: in  std_logic_vector(39 downto 0);
            rowSel2 		: out std_logic_vector(4 downto 0);
    
    
            Xplayer2   	: in unsigned(9 downto 0);
            Yplayer2   	: in unsigned(9 downto 0);
            Shoot2     	: in std_logic;
            Dir2       	: in std_logic;
       
            Xbullet1	: out unsigned(9 downto 0);
            Xbullet2	: out unsigned(9 downto 0);
            Ybullet1	: out unsigned(9 downto 0);
            Ybullet2	: out unsigned(9 downto 0);
    
            Collisionplayer1 : out std_logic;
            Collisionplayer2 : out std_logic
        );
    end component bullet_controller;

    component game_state_controller is
        port(
            clk : in std_logic;
            reset : in std_logic;
    
            player_one_hit : in std_logic;
            player_two_hit : in std_logic;
    
            score_player_one : out std_logic_vector(1 downto 0);
            score_player_two : out std_logic_vector(1 downto 0);
    
            location_reset : out std_logic
        );
    end component game_state_controller;

    signal location_reset_signal : std_logic;

    signal h_player_one_signal, v_player_one_signal : std_logic_vector(9 downto 0);
    signal dir_player_one_signal : std_logic;
    signal h_player_two_signal, v_player_two_signal : std_logic_vector(9 downto 0);
    signal dir_player_two_signal : std_logic;

    signal x_bullet_one_signal, y_bullet_one_signal : std_logic_vector(9 downto 0);
    signal x_bullet_two_signal, y_bullet_two_signal : std_logic_vector(9 downto 0);

    signal one_hit_signal, two_hit_signal : std_logic;
    signal score_one_signal, score_two_signal : std_logic_vector(1 downto 0);

begin

    gpu_ctrl: gpu_controller port map(
        clk => clk,
        reset => reset,
        h_pixel => h_pixel,
        v_pixel => v_pixel,
        row_of_blocks => row_of_blocks_map,
        h_player_one => h_player_one_signal,
        v_player_one => v_player_one_signal,
        dir_player_one => dir_player_one_signal,
        h_player_two => h_player_two_signal,
        v_player_two => v_player_two_signal,
        dir_player_two => dir_player_two_signal,
        x_bullet_one => x_bullet_one_signal,
        y_bullet_one => y_bullet_one_signal,
        x_bullet_two => x_bullet_two_signal,
        y_bullet_two => y_bullet_two_signal,
        switch_map => switch_map,
        address_map => gpu_address_map,
        enable_pass_map => enable_pass_map,
        switch_player_one => switch_player_one,
        address_player_one => address_player_one,
        enable_pass_player_one => enable_pass_player_one,
        switch_player_two => switch_player_two,
        address_player_two => address_player_two,
        enable_pass_player_two => enable_pass_player_two,
        switch_bullet_one => switch_bullet_one,
        address_bullet_one => address_bullet_one,
        enable_pass_bullet_one => enable_pass_bullet_one,
        switch_bullet_two => switch_bullet_two,
        address_bullet_two => address_bullet_two,
        enable_pass_bullet_two => enable_pass_bullet_two
    );

    player_ctrl: player_controller port map(
        clk => clk,
        reset => reset,
        v_pixel => v_pixel,
        row_val => row_of_blocks_player,
        reset_pos => location_reset_signal,
        left_one => left_player_one,
        right_one => right_player_one,
        jump_one => jump_player_one,
        left_two => left_player_two,
        right_two => right_player_two,
        jump_two => jump_player_two,
        std_logic_vector(x_one) => h_player_one_signal,
        std_logic_vector(y_one) => v_player_one_signal,
        std_logic_vector(x_two) => h_player_two_signal,
        std_logic_vector( y_two) => v_player_two_signal,
        dir_one => dir_player_one_signal,
        dir_two => dir_player_two_signal,
        std_logic_vector(row_sel) => address_player
    );

    bullet_ctrl: bullet_controller port map(
        clk => clk,
        reset => reset,
        Xplayer1 => unsigned(h_player_one_signal),
        Yplayer1 => unsigned(v_player_one_signal),
        Shoot1 => shoot_player_one,
        Dir1 => dir_player_one_signal,
        h_pixel => h_pixel,
        v_pixel => v_pixel,
        rowVal1 => row_of_blocks_bullet_one,
        rowSel1 => address_bullet_one_rom,
        rowVal2 => row_of_blocks_bullet_two,
        rowSel2 => address_bullet_two_rom,
        Xplayer2 => unsigned(h_player_two_signal),
        Yplayer2 => unsigned(v_player_two_signal),
        Shoot2 => shoot_player_two,
        Dir2 => dir_player_two_signal,
        std_logic_vector(Xbullet1) => x_bullet_one_signal,
        std_logic_vector(Xbullet2) => x_bullet_two_signal,
        std_logic_vector(Ybullet1) => y_bullet_one_signal,
        std_logic_vector(Ybullet2) => y_bullet_two_signal,
        Collisionplayer1 => one_hit_signal,
        Collisionplayer2 => two_hit_signal
    );

    state_ctrl: game_state_controller port map(
        clk => clk,
        reset => reset,
        player_one_hit => one_hit_signal,
        player_two_hit => two_hit_signal,
        score_player_one => score_one_signal,
        score_player_two => score_two_signal,
        location_reset => location_reset_signal
    );

end architecture structural;