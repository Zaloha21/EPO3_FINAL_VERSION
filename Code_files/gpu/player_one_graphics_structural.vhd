library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture structural of player_one_graphics is

    component player_one_sprite_rom is
        port(
            clk : in std_logic;
            reset : in std_logic;
    
            address : in std_logic_vector(4 downto 0);
    
            pixel_1: out std_logic_vector(2 downto 0);
            pixel_2: out std_logic_vector(2 downto 0);
            pixel_3: out std_logic_vector(2 downto 0);
            pixel_4: out std_logic_vector(2 downto 0);
            pixel_5: out std_logic_vector(2 downto 0);
            pixel_6: out std_logic_vector(2 downto 0);
            pixel_7: out std_logic_vector(2 downto 0);
            pixel_8: out std_logic_vector(2 downto 0);
            pixel_9: out std_logic_vector(2 downto 0);
            pixel_10: out std_logic_vector(2 downto 0);
            pixel_11: out std_logic_vector(2 downto 0);
            pixel_12: out std_logic_vector(2 downto 0);
            pixel_13: out std_logic_vector(2 downto 0);
            pixel_14: out std_logic_vector(2 downto 0);
            pixel_15: out std_logic_vector(2 downto 0);
            pixel_16: out std_logic_vector(2 downto 0)
        );
    end component player_one_sprite_rom;

    component player_pixel_mux is 
        port(
            clk : in std_logic;
            reset : in std_logic;

            pixel_1: in std_logic_vector(2 downto 0);
            pixel_2: in std_logic_vector(2 downto 0);
            pixel_3: in std_logic_vector(2 downto 0);
            pixel_4: in std_logic_vector(2 downto 0);
            pixel_5: in std_logic_vector(2 downto 0);
            pixel_6: in std_logic_vector(2 downto 0);
            pixel_7: in std_logic_vector(2 downto 0);
            pixel_8: in std_logic_vector(2 downto 0);
            pixel_9: in std_logic_vector(2 downto 0);
            pixel_10: in std_logic_vector(2 downto 0);
            pixel_11: in std_logic_vector(2 downto 0);
            pixel_12: in std_logic_vector(2 downto 0);
            pixel_13: in std_logic_vector(2 downto 0);
            pixel_14: in std_logic_vector(2 downto 0);
            pixel_15: in std_logic_vector(2 downto 0);
            pixel_16: in std_logic_vector(2 downto 0);
    
            switch : in std_logic_vector(3 downto 0);
    
            color_code : out std_logic_vector(2 downto 0)
        );
    end component player_pixel_mux;

    component player_one_rgb_rom is 
        port(
            clk : in std_logic;
            reset : in std_logic;
    
            address : in std_logic_vector(2 downto 0);
            rgb_color : out std_logic_vector(11 downto 0)
        );
    end component player_one_rgb_rom;

    component pass_gate is
        port(
            clk : in std_logic;
            reset : in std_logic;
    
            enable_pass : in std_logic;
    
            color_in : in std_logic_vector(11 downto 0);
            color_out : out std_logic_vector(11 downto 0)
        );
    end component pass_gate;

    signal pixel_1_s, pixel_2_s, pixel_3_s, pixel_4_s : std_logic_vector(2 downto 0);
    signal pixel_5_s, pixel_6_s, pixel_7_s, pixel_8_s : std_logic_vector(2 downto 0);
    signal pixel_9_s, pixel_10_s, pixel_11_s, pixel_12_s : std_logic_vector(2 downto 0);
    signal pixel_13_s, pixel_14_s, pixel_15_s, pixel_16_s : std_logic_vector(2 downto 0);
    signal mux_to_rgb : std_logic_vector(2 downto 0);
    signal rgb_to_pass : std_logic_vector(11 downto 0);

begin
    
    sprite: player_one_sprite_rom port map(
        clk => clk,
        reset => reset,
        address => address,
        pixel_1 => pixel_1_s,
        pixel_2 => pixel_2_s,
        pixel_3 => pixel_3_s,
        pixel_4 => pixel_4_s,
        pixel_5 => pixel_5_s,
        pixel_6 => pixel_6_s,
        pixel_7 => pixel_7_s,
        pixel_8 => pixel_8_s,
        pixel_9 => pixel_9_s,
        pixel_10 => pixel_10_s,
        pixel_11 => pixel_11_s,
        pixel_12 => pixel_12_s,
        pixel_13 => pixel_13_s,
        pixel_14 => pixel_14_s,
        pixel_15 => pixel_15_s,
        pixel_16 => pixel_16_s
    );

    mux: player_pixel_mux port map(
        clk => clk,
        reset => reset,
        pixel_1 => pixel_1_s,
        pixel_2 => pixel_2_s,
        pixel_3 => pixel_3_s,
        pixel_4 => pixel_4_s,
        pixel_5 => pixel_5_s,
        pixel_6 => pixel_6_s,
        pixel_7 => pixel_7_s,
        pixel_8 => pixel_8_s,
        pixel_9 => pixel_9_s,
        pixel_10 => pixel_10_s,
        pixel_11 => pixel_11_s,
        pixel_12 => pixel_12_s,
        pixel_13 => pixel_13_s,
        pixel_14 => pixel_14_s,
        pixel_15 => pixel_15_s,
        pixel_16 => pixel_16_s,
        switch => switch,
        color_code => mux_to_rgb
    );

    rgb: player_one_rgb_rom port map(
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
        color_out => color_out
    );

end architecture structural;