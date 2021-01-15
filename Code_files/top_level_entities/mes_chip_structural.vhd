library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture structural of mes_chip is

    component input is
        port(clk           : in  std_logic;
             reset         : in  std_logic;
             start         : in  std_logic;
             serialdata    : in  std_logic;
             dataclock     : out std_logic;
             datalatch     : out std_logic;
             left_button   : out std_logic;
             right_button  : out std_logic;
             up_button     : out std_logic;
             down_button   : out std_logic;
             a_button      : out std_logic;
             b_button      : out std_logic;
             x_button      : out std_logic;
             y_button      : out std_logic;
             l_button      : out std_logic;
             r_button      : out std_logic;
             start_button  : out std_logic;
             select_button : out std_logic);
    end component;

    component pixel_counter is
        port(
            clk : in std_logic;
            reset : in std_logic;
    
            h_pixel : out std_logic_vector(9 downto 0);
            v_pixel : out std_logic_vector(9 downto 0)
        );
    end component pixel_counter;

    component rom_chip is
        port(
            clk : in std_logic;
            reset : in std_logic;
            
            h_pixel : in std_logic_vector(9 downto 0);
            v_pixel : in std_logic_vector(9 downto 0);
    
            address_player : in std_logic_vector(4 downto 0);
            address_bullet_one : in std_logic_vector(4 downto 0);
            address_bullet_two : in std_logic_vector(4 downto 0);
    
            row_of_blocks_map : out std_logic_vector(39 downto 0);
            row_of_blocks_player : out std_logic_vector(39 downto 0);
            row_of_blocks_bullet_one : out std_logic_vector(39 downto 0);
            row_of_blocks_bullet_two : out std_logic_vector(39 downto 0)
        );
    end component rom_chip;

    component cpu is
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
    end component cpu;

    component gpu is
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
    end component gpu;

    -- pixel counter signals
    signal h_pixel_signal, v_pixel_signal : std_logic_vector(9 downto 0);

    -- map rom output signals
    signal row_of_blocks_map_signal : std_logic_vector(39 downto 0);
    signal row_of_blocks_player_signal : std_logic_vector(39 downto 0);
    signal row_of_blocks_bullet_one_signal : std_logic_vector(39 downto 0);
    signal row_of_blocks_bullet_two_signal : std_logic_vector(39 downto 0);

    -- map rom input signals
    signal address_player_signal : std_logic_vector(4 downto 0);
    signal address_bullet_one_signal : std_logic_vector(4 downto 0);
    signal address_bullet_two_signal : std_logic_vector(4 downto 0);

    -- gpu control signals for map
    signal gpu_address_map_signal : std_logic_vector(2 downto 0);
    signal switch_map_signal : std_logic_vector(2 downto 0);
    signal enable_pass_map_signal : std_logic;

    -- gpu control signals for players
    signal address_p_one_s, address_p_two_s : std_logic_vector(4 downto 0);
    signal switch_p_one_s, switch_p_two_s : std_logic_vector(3 downto 0);
    signal enable_pass_p_one_s, enable_pass_p_two_s : std_logic;
    
    -- gpu control signals for bullets
    signal address_b_one_s, address_b_two_s : std_logic_vector(1 downto 0);
    signal switch_b_one_s, switch_b_two_s : std_logic_vector(3 downto 0);
    signal enable_pass_b_one_s, enable_pass_b_two_s : std_logic;

    -- input signals from controllers
    signal a_player_one, b_player_one, x_player_one, y_player_one : std_logic;
    signal l_player_one, r_player_one, start_player_one, select_player_one : std_logic;
    signal up_player_one, down_player_one, left_player_one, right_player_one : std_logic;

    signal a_player_two, b_player_two, x_player_two, y_player_two : std_logic;
    signal l_player_two, r_player_two, start_player_two, select_player_two : std_logic;
    signal up_player_two, down_player_two, left_player_two, right_player_two : std_logic;

begin

    counter: pixel_counter port map(
        clk => clk,
        reset => reset,
        h_pixel => h_pixel_signal,
        v_pixel => v_pixel_signal
    );

    rom_ctrl: rom_chip port map(
        clk => clk,
        reset => reset,
        h_pixel => h_pixel_signal,
        v_pixel => v_pixel_signal,
        address_player => address_player_signal,
        address_bullet_one => address_bullet_one_signal,
        address_bullet_two => address_bullet_two_signal,
        row_of_blocks_map => row_of_blocks_map_signal,
        row_of_blocks_player => row_of_blocks_player_signal,
        row_of_blocks_bullet_one => row_of_blocks_bullet_one_signal,
        row_of_blocks_bullet_two => row_of_blocks_bullet_two_signal 
    );

    cpu_ctrl: cpu port map(
        clk => clk,
        reset => reset,
        h_pixel => h_pixel_signal,
        v_pixel => v_pixel_signal,
        left_player_one => left_player_one,
        right_player_one => right_player_one,
        jump_player_one => b_player_one,
        shoot_player_one => a_player_one,
        left_player_two => left_player_two,
        right_player_two => right_player_two,
        jump_player_two => b_player_two,
        shoot_player_two => a_player_two,
        row_of_blocks_map => row_of_blocks_map_signal,
        row_of_blocks_player => row_of_blocks_player_signal,
        row_of_blocks_bullet_one => row_of_blocks_bullet_one_signal,
        row_of_blocks_bullet_two => row_of_blocks_bullet_two_signal,
        address_player => address_player_signal,
        address_bullet_one_rom => address_bullet_one_signal,
        address_bullet_two_rom => address_bullet_two_signal,
        switch_map => switch_map_signal,
        gpu_address_map => gpu_address_map_signal,
        enable_pass_map => enable_pass_map_signal,
        switch_player_one => switch_p_one_s,
        address_player_one => address_p_one_s,
        enable_pass_player_one => enable_pass_p_one_s,
        switch_player_two => switch_p_two_s,
        address_player_two => address_p_two_s,
        enable_pass_player_two => enable_pass_p_two_s,
        switch_bullet_one => switch_b_one_s,
        address_bullet_one => address_b_one_s,
        enable_pass_bullet_one => enable_pass_b_one_s,
        switch_bullet_two => switch_b_two_s,
        address_bullet_two => address_b_two_s,
        enable_pass_bullet_two => enable_pass_b_two_s
    );

    gpu_ctrl: gpu port map(
        clk => clk,
        reset => reset,
        h_pixel => h_pixel_signal,
        v_pixel => v_pixel_signal,
        gpu_address_map => gpu_address_map_signal,
        switch_map => switch_map_signal,
        enable_pass_map => enable_pass_map_signal,
        switch_player_one => switch_p_one_s,
        address_player_one => address_p_one_s,
        enable_pass_player_one => enable_pass_p_one_s,
        switch_player_two => switch_p_two_s,
        address_player_two => address_p_two_s,
        enable_pass_player_two => enable_pass_p_two_s,
        switch_bullet_one => switch_b_one_s,
        address_bullet_one => address_b_one_s,
        enable_pass_bullet_one => enable_pass_b_one_s,
        switch_bullet_two => switch_b_two_s,
        address_bullet_two => address_b_two_s,
        enable_pass_bullet_two => enable_pass_b_two_s,
        h_sync => h_sync,
        v_sync => v_sync,
        red_channel => red_channel,
        green_channel => green_channel,
        blue_channel => blue_channel
    );

    p_one_controller: input port map(
        clk           => clk,
        reset         => reset,
        start         => v_pixel_signal(0),
        serialdata    => serialdata_one,
        dataclock     => dataclock_one,
        datalatch     => datalatch_one,
        left_button   => left_player_one,
        right_button  => right_player_one,
        up_button     => up_player_one,
        down_button   => down_player_one,
        a_button      => a_player_one,
        b_button      => b_player_one,
        x_button      => x_player_one,
        y_button      => y_player_one,
        l_button      => l_player_one,
        r_button      => r_player_one,
        start_button  => start_player_one,
        select_button => select_player_one
    );

    p_two_controller: input port map(
        clk           => clk,
        reset         => reset,
        start         => v_pixel_signal(0),
        serialdata    => serialdata_two,
        dataclock     => dataclock_two,
        datalatch     => datalatch_two,
        left_button   => left_player_two,
        right_button  => right_player_two,
        up_button     => up_player_two,
        down_button   => down_player_two,
        a_button      => a_player_two,
        b_button      => b_player_two,
        x_button      => x_player_two,
        y_button      => y_player_two,
        l_button      => l_player_two,
        r_button      => r_player_two,
        start_button  => start_player_two,
        select_button => select_player_two
    );

end architecture structural;
