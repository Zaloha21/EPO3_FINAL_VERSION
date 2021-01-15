library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture structural of bullet_gpu_controller is

    component bullet_graphic_controller is 
        port(
            clk : in std_logic;
            reset : in std_logic;
    
            h_pixel : in std_logic_vector(9 downto 0);
            v_pixel : in std_logic_vector(9 downto 0);
    
            x_bullet : in std_logic_vector(9 downto 0);
            y_bullet : in std_logic_vector(9 downto 0);
    
            switch_bullet : out std_logic_vector(3 downto 0);
            address_bullet: out std_logic_vector(1 downto 0);
            enable_pass_bullet : out std_logic
        );
    end component bullet_graphic_controller;


begin

    bullet_one: bullet_graphic_controller port map(
        clk => clk,
        reset => reset,
        h_pixel => h_pixel,
        v_pixel => v_pixel,
        x_bullet => x_bullet_one,
        y_bullet => y_bullet_one,
        switch_bullet => switch_bullet_one,
        address_bullet => address_bullet_one,
        enable_pass_bullet => enable_pass_bullet_one
    );

    bullet_two: bullet_graphic_controller port map(
        clk => clk,
        reset => reset,
        h_pixel => h_pixel,
        v_pixel => v_pixel,
        x_bullet => x_bullet_two,
        y_bullet => y_bullet_two,
        switch_bullet => switch_bullet_two,
        address_bullet => address_bullet_two,
        enable_pass_bullet => enable_pass_bullet_two
    );

end architecture structural;