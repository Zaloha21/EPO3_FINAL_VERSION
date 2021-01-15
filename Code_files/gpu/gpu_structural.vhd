library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture structural of gpu is

    component map_graphics is
        port(
            clk : in std_logic;
            reset : in std_logic;
    
            address : in std_logic_vector(2 downto 0);
            switch : in std_logic_vector(2 downto 0);
            enable_pass : in std_logic;
    
            rgb_color : out std_logic_vector(11 downto 0)
        );
    end component map_graphics;

    component player_graphics is 
        port(
            clk : in std_logic;
            reset : in std_logic;

            switch_player_one : in std_logic_vector(3 downto 0);
            address_player_one : in std_logic_vector(4 downto 0);
            enable_pass_player_one : in std_logic;

            switch_player_two : in std_logic_vector(3 downto 0);
            address_player_two : in std_logic_vector(4 downto 0);
            enable_pass_player_two : in std_logic;

            color_player_one : out std_logic_vector(11 downto 0);
            color_player_two : out std_logic_vector(11 downto 0)
        );
    end component player_graphics;

    component bullet_graphics is 
        port(
            clk : in std_logic;
            reset : in std_logic;

            switch_bullet_one : in std_logic_vector(3 downto 0);
            address_bullet_one : in std_logic_vector(1 downto 0);
            enable_pass_bullet_one : in std_logic;

            switch_bullet_two : in std_logic_vector(3 downto 0);
            address_bullet_two : in std_logic_vector(1 downto 0);
            enable_pass_bullet_two : in std_logic;

            color_bullet_one : out std_logic_vector(11 downto 0);
            color_bullet_two : out std_logic_vector(11 downto 0)
        );
    end component bullet_graphics;

    component layer_mux is
        port(
            clk : in std_logic;
            reset : in std_logic;
    
            h_pixel : in std_logic_vector(9 downto 0);
            v_pixel : in std_logic_vector(9 downto 0);
    
            color_map : in std_logic_vector(11 downto 0);
            color_player_one : in std_logic_vector(11 downto 0);
            color_player_two : in std_logic_vector(11 downto 0);
            color_bullet_one : in std_logic_vector(11 downto 0);
            color_bullet_two : in std_logic_vector(11 downto 0);
    
            color_out : out std_logic_vector(11 downto 0)
        );
    end component layer_mux;

    component vga_driver is
        port(
            clk : in std_logic;
            reset : in std_logic;
    
            h_pixel : in std_logic_vector(9 downto 0);
            v_pixel : in std_logic_vector(9 downto 0);
    
            color_in : in std_logic_vector(11 downto 0);
    
            h_sync : out std_logic;
            v_sync : out std_logic;
    
            red_channel : out std_logic_vector(3 downto 0);
            green_channel : out std_logic_vector(3 downto 0);
            blue_channel : out std_logic_vector(3 downto 0)
        );
    end component vga_driver;

    -- outputs of the different color systems
    signal rgb_color_map : std_logic_vector(11 downto 0);
    signal rgb_player_one : std_logic_vector(11 downto 0);
    signal rgb_player_two : std_logic_vector(11 downto 0);
    signal rgb_bullet_one : std_logic_vector(11 downto 0);
    signal rgb_bullet_two : std_logic_vector(11 downto 0);

    -- output of the layer system
    signal mux_to_vga : std_logic_vector(11 downto 0);

begin

    map_gfx: map_graphics port map(
        clk => clk,
        reset => reset,
        address => gpu_address_map,
        switch => switch_map,
        enable_pass => enable_pass_map,
        rgb_color => rgb_color_map
    );

    player_gfx: player_graphics port map(
        clk => clk,
        reset => reset,
        switch_player_one => switch_player_one,
        address_player_one => address_player_one,
        enable_pass_player_one => enable_pass_player_one,
        switch_player_two => switch_player_two,
        address_player_two => address_player_two,
        enable_pass_player_two => enable_pass_player_two,
        color_player_one => rgb_player_one,
        color_player_two => rgb_player_two
    );

    bullet_gfx: bullet_graphics port map(
        clk => clk,
        reset => reset,
        switch_bullet_one => switch_bullet_one,
        address_bullet_one => address_bullet_one,
        enable_pass_bullet_one => enable_pass_bullet_one,
        switch_bullet_two => switch_bullet_two,
        address_bullet_two => address_bullet_two,
        enable_pass_bullet_two => enable_pass_bullet_two,
        color_bullet_one => rgb_bullet_one,
        color_bullet_two => rgb_bullet_two
    );

    layers: layer_mux port map(
        clk => clk,
        reset => reset,
        h_pixel => h_pixel,
        v_pixel => v_pixel,
        color_map => rgb_color_map,
        color_player_one => rgb_player_one,
        color_player_two => rgb_player_two,
        color_bullet_one => rgb_bullet_one,
        color_bullet_two => rgb_bullet_two,
        color_out => mux_to_vga
    );

    vga: vga_driver port map(
        clk => clk,
        reset => reset,
        h_pixel => h_pixel,
        v_pixel => v_pixel,
        color_in => mux_to_vga,
        h_sync => h_sync,
        v_sync => v_sync,
        red_channel => red_channel,
        green_channel => green_channel,
        blue_channel => blue_channel
    );

end architecture structural;