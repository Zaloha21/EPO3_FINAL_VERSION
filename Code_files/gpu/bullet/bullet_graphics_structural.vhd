library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture structural of bullet_graphics is

    component bullet_one_graphics is
        port(
            clk : in std_logic;
            reset : in std_logic;

            switch : in std_logic_vector(3 downto 0);
            address : in std_logic_vector(1 downto 0);
            enable_pass : in std_logic;

            color_out : out std_logic_vector(11 downto 0)
        );
    end component bullet_one_graphics;

    component bullet_two_graphics is
        port(
            clk : in std_logic;
            reset : in std_logic;

            switch : in std_logic_vector(3 downto 0);
            address : in std_logic_vector(1 downto 0);
            enable_pass : in std_logic;

            color_out : out std_logic_vector(11 downto 0)
        );
    end component bullet_two_graphics;

begin
    
    bullet_one: bullet_one_graphics port map(
        clk => clk,
        reset => reset,
        switch => switch_bullet_one,
        address => address_bullet_one,
        enable_pass => enable_pass_bullet_one,
        color_out => color_bullet_one
    );

    bullet_two: bullet_two_graphics port map(
        clk => clk,
        reset => reset,
        switch => switch_bullet_two,
        address => address_bullet_two,
        enable_pass => enable_pass_bullet_two,
        color_out => color_bullet_two
    );

end architecture structural;