library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture structural of player_graphics is

    component player_one_graphics is
        port(
            clk : in std_logic;
            reset : in std_logic;

            switch : in std_logic_vector(3 downto 0);
            address : in std_logic_vector(4 downto 0);
            enable_pass : in std_logic;

            color_out : out std_logic_vector(11 downto 0)
        );
    end component player_one_graphics;

    component player_two_graphics is
        port(
            clk : in std_logic;
            reset : in std_logic;

            switch : in std_logic_vector(3 downto 0);
            address : in std_logic_vector(4 downto 0);
            enable_pass : in std_logic;

            color_out : out std_logic_vector(11 downto 0)
        );
    end component player_two_graphics;

begin
    
    player_one: player_one_graphics port map(
        clk => clk,
        reset => reset,
        switch => switch_player_one,
        address => address_player_one,
        enable_pass => enable_pass_player_one,
        color_out => color_player_one
    );

    player_two: player_two_graphics port map(
        clk => clk,
        reset => reset,
        switch => switch_player_two,
        address => address_player_two,
        enable_pass => enable_pass_player_two,
        color_out => color_player_two
    );

end architecture structural;