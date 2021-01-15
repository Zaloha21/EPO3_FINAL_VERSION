library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture structural of vga_driver is

    component vga_rgb_splitter is
        port(
            clk : in std_logic;
            reset : in std_logic;
    
            color_in : in std_logic_vector(11 downto 0);
    
            red_channel : out std_logic_vector(3 downto 0);
            green_channel : out std_logic_vector(3 downto 0);
            blue_channel : out std_logic_vector(3 downto 0)
        );
    end component vga_rgb_splitter;

    component vga_h_sync_gen is
        port(
            clk : in std_logic;
            reset : in std_logic;
    
            h_pixel : in std_logic_vector(9 downto 0);
    
            h_sync : out std_logic
        );
    end component vga_h_sync_gen;

    component vga_v_sync_gen is
        port(
            clk : in std_logic;
            reset : in std_logic;
    
            h_pixel : in std_logic_vector(9 downto 0);
            v_pixel : in std_logic_vector(9 downto 0);
    
            v_sync : out std_logic
        );
    end component vga_v_sync_gen;

    

begin

    rgb: vga_rgb_splitter port map(
        clk => clk,
        reset => reset,
        color_in => color_in,
        red_channel => red_channel,
        green_channel => green_channel,
        blue_channel => blue_channel
    );

    h_gen: vga_h_sync_gen port map(
        clk => clk,
        reset => reset,
        h_pixel => h_pixel,
        h_sync => h_sync
    );

    v_gen: vga_v_sync_gen port map(
        clk => clk,
        reset => reset,
        h_pixel => h_pixel,
        v_pixel => v_pixel,
        v_sync => v_sync
    );

end architecture structural;