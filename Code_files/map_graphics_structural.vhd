library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture structural of map_graphics is

    component sprite_ROM_map is
        port(
            clk : in std_logic;
            reset : in std_logic;
    
            address : in std_logic_vector(2 downto 0);
    
            pixel_1 : out std_logic_vector(1 downto 0);
            pixel_2 : out std_logic_vector(1 downto 0);
            pixel_3 : out std_logic_vector(1 downto 0);
            pixel_4 : out std_logic_vector(1 downto 0);
            pixel_5 : out std_logic_vector(1 downto 0);
            pixel_6 : out std_logic_vector(1 downto 0);
            pixel_7 : out std_logic_vector(1 downto 0);
            pixel_8 : out std_logic_vector(1 downto 0)
        );
    end component sprite_ROM_map;

    component pixel_mux_map is
        port(
            clk : in std_logic;
            reset : in std_logic;
    
            pixel_1 : in std_logic_vector(1 downto 0);
            pixel_2 : in std_logic_vector(1 downto 0);
            pixel_3 : in std_logic_vector(1 downto 0);
            pixel_4 : in std_logic_vector(1 downto 0);
            pixel_5 : in std_logic_vector(1 downto 0);
            pixel_6 : in std_logic_vector(1 downto 0);
            pixel_7 : in std_logic_vector(1 downto 0);
            pixel_8 : in std_logic_vector(1 downto 0);
    
            switch : in std_logic_vector(2 downto 0);
    
            color_code : out std_logic_vector(1 downto 0)
        );
    end component pixel_mux_map;

    component rgb_ROM_map is
        port(
            clk : in std_logic;
            reset : in std_logic;
    
            address : in std_logic_vector(1 downto 0);
            rgb_color : out std_logic_vector(11 downto 0)
        );
    end component rgb_ROM_map;

    component pass_gate is
        port(
            clk : in std_logic;
            reset : in std_logic;
    
            enable_pass : in std_logic;
    
            color_in : in std_logic_vector(11 downto 0);
            color_out : out std_logic_vector(11 downto 0)
        );
    end component pass_gate;

    signal pixel_1_signal, pixel_2_signal : std_logic_vector(1 downto 0);
    signal pixel_3_signal, pixel_4_signal : std_logic_vector(1 downto 0);
    signal pixel_5_signal, pixel_6_signal : std_logic_vector(1 downto 0);
    signal pixel_7_signal, pixel_8_signal : std_logic_vector(1 downto 0);

    signal mux_to_rgb : std_logic_vector(1 downto 0);
    signal rgb_to_pass : std_logic_vector(11 downto 0);

begin

    sprite: sprite_ROM_map port map(
        clk => clk,
        reset => reset,
        address => address,
        pixel_1 => pixel_1_signal,
        pixel_2 => pixel_2_signal,
        pixel_3 => pixel_3_signal,
        pixel_4 => pixel_4_signal,
        pixel_5 => pixel_5_signal,
        pixel_6 => pixel_6_signal,
        pixel_7 => pixel_7_signal,
        pixel_8 => pixel_8_signal
    );

    mux: pixel_mux_map port map(
        clk => clk,
        reset => reset,
        pixel_1 => pixel_1_signal,
        pixel_2 => pixel_2_signal,
        pixel_3 => pixel_3_signal,
        pixel_4 => pixel_4_signal,
        pixel_5 => pixel_5_signal,
        pixel_6 => pixel_6_signal,
        pixel_7 => pixel_7_signal,
        pixel_8 => pixel_8_signal,
        switch => switch,
        color_code => mux_to_rgb
    );

    rgb: rgb_ROM_map port map(
        clk => clk,
        reset => reset,
        address => mux_to_rgb,
        rgb_color => rgb_to_pass
    );

    pass: pass_gate port map(
        clk => clk,
        reset => reset,
        enable_pass => enable_pass,
        color_in => rgb_to_pass,
        color_out => rgb_color
    );

end architecture structural;