library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture structural of map_gpu_controller is

    component map_switch_controller is
        port(
            clk : in std_logic;
            reset : in std_logic;
    
            h_pixel : in std_logic_vector(9 downto 0);
            v_pixel : in std_logic_vector(9 downto 0);
    
            switch : out std_logic_vector(2 downto 0)
        );
    end component map_switch_controller;

    component map_address_controller is
        port(
            clk : in std_logic;
            reset : in std_logic;
    
            h_pixel : in std_logic_vector(9 downto 0);
            v_pixel : in std_logic_vector(9 downto 0);
    
            address : out std_logic_vector(2 downto 0)
        );
    end component map_address_controller;

    component map_pass_controller is
        port(
            clk : in std_logic;
            reset : in std_logic;
    
            h_pixel : in std_logic_vector(9 downto 0);
            v_pixel : in std_logic_vector(9 downto 0);
    
            row_of_blocks : in std_logic_vector(39 downto 0);
    
            block_value : out std_logic
        );
    end component map_pass_controller;

    component map_pass_converter is
        port(
            clk : in std_logic;
            reset : in std_logic;
    
            h_pixel : in std_logic_vector(9 downto 0);
            v_pixel : in std_logic_vector(9 downto 0);
    
            block_value : in std_logic;
    
            enable_pass : out std_logic
        );
    end component map_pass_converter;

    signal block_value_signal : std_logic;

begin

    switch_ctrl: map_switch_controller port map(
        clk => clk,
        reset => reset,
        h_pixel => h_pixel,
        v_pixel => v_pixel,
        switch => switch
    );

    address_ctrl: map_address_controller port map(
        clk => clk,
        reset => reset,
        h_pixel => h_pixel,
        v_pixel => v_pixel,
        address => address
    );

    pass_ctrl : map_pass_controller port map(
        clk => clk,
        reset => reset,
        h_pixel => h_pixel,
        v_pixel => v_pixel,
        row_of_blocks => row_of_blocks,
        block_value => block_value_signal
    );

    pass_conv : map_pass_converter port map(
        clk => clk,
        reset => reset,
        h_pixel => h_pixel,
        v_pixel => v_pixel,
        block_value => block_value_signal,
        enable_pass => enable_pass_map
    );

end architecture structural;