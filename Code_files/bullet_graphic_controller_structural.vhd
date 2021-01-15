library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture structural of bullet_graphic_controller is

    component bullet_address_controller is 
        port(
            clk : in std_logic;
            reset : in std_logic;

            h_pixel : in std_logic_vector(9 downto 0);
            v_pixel : in std_logic_vector(9 downto 0);

            y_bullet : in std_logic_vector(9 downto 0);

            address_bullet : out std_logic_vector(1 downto 0)
        );
    end component bullet_address_controller;

    component bullet_switch_controller is
        port(
            clk : in std_logic;
            reset : in std_logic;
    
            h_pixel : in std_logic_vector(9 downto 0);
            v_pixel : in std_logic_vector(9 downto 0);
    
            x_bullet: in std_logic_vector(9 downto 0);
            y_bullet : in std_logic_vector(9 downto 0);
            
            switch_bullet : out std_logic_vector(3 downto 0)
        );
    end component bullet_switch_controller;

    component bullet_pass_controller is 
        port(
            clk : in std_logic;
            reset : in std_logic;

            h_pixel : in std_logic_vector(9 downto 0);
            v_pixel : in std_logic_vector(9 downto 0);

            x_bullet : in std_logic_vector(9 downto 0);
            y_bullet : in std_logic_vector(9 downto 0);

            enable_pass_bullet : out std_logic
        );
    end component bullet_pass_controller;

begin

    address: bullet_address_controller port map(
        clk => clk,
        reset => reset,
        h_pixel => h_pixel,
        v_pixel => v_pixel,
        y_bullet => y_bullet,
        address_bullet => address_bullet
    );

    switch: bullet_switch_controller port map(
        clk => clk,
        reset => reset,
        h_pixel => h_pixel,
        v_pixel => v_pixel,
        x_bullet => x_bullet,
        y_bullet => y_bullet,
        switch_bullet => switch_bullet
    );

    pass: bullet_pass_controller port map(
        clk => clk,
        reset => reset,
        h_pixel => h_pixel,
        v_pixel => v_pixel,
        x_bullet => x_bullet,
        y_bullet => y_bullet,
        enable_pass_bullet => enable_pass_bullet
    );

end architecture structural;