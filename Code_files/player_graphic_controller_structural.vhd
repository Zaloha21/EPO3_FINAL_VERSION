library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture structural of player_graphic_controller is

    component player_address_controller is 
        port(
            clk : in std_logic;
            reset : in std_logic;
    
            h_pixel : in std_logic_vector(9 downto 0);
            v_pixel : in std_logic_vector(9 downto 0);
    
            v_player : in std_logic_vector(9 downto 0);
    
            address_player : out std_logic_vector(4 downto 0)
        );
    end component player_address_controller;

    component player_switch_controller is 
        port(
            clk : in std_logic;
            reset : in std_logic;
    
            h_pixel : in std_logic_vector(9 downto 0);
            v_pixel : in std_logic_vector(9 downto 0);
    
            h_player : in std_logic_vector(9 downto 0);
            v_player : in std_logic_vector(9 downto 0);
            dir_player : in std_logic;
            
            switch_player : out std_logic_vector(3 downto 0)
        );
    end component player_switch_controller;

    component player_pass_controller is 
        port(
            clk : in std_logic;
            reset : in std_logic;

            h_pixel : in std_logic_vector(9 downto 0);
            v_pixel : in std_logic_vector(9 downto 0);

            h_player : in std_logic_vector(9 downto 0);
            v_player : in std_logic_vector(9 downto 0);

            enable_pass_player : out std_logic
        );
    end component player_pass_controller;

begin

    address: player_address_controller port map(
        clk => clk,
        reset => reset,
        h_pixel => h_pixel,
        v_pixel => v_pixel,
        v_player => v_player,
        address_player => address_player
    );

    switch: player_switch_controller port map(
        clk => clk,
        reset => reset,
        h_pixel => h_pixel,
        v_pixel => v_pixel,
        h_player => h_player,
        v_player => v_player,
        dir_player => dir_player,
        switch_player => switch_player
    );

    pass: player_pass_controller port map(
        clk => clk,
        reset => reset,
        h_pixel => h_pixel,
        v_pixel => v_pixel,
        h_player => h_player,
        v_player => v_player,
        enable_pass_player => enable_pass_player
    );

end architecture structural;