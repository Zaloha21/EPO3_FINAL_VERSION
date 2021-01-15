library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity player_controller is
    port(
        clk : in std_logic;
        reset : in std_logic;

        v_pixel : in std_logic_vector(9 downto 0);

        row_val : in std_logic_vector(39 downto 0);

        reset_pos : in std_logic;

        left_one : in std_logic;
        right_one : in std_logic;
        jump_one : in std_logic;
        left_two : in std_logic;
        right_two : in std_logic;
        jump_two : in std_logic;

        x_one : out unsigned(9 downto 0);
        y_one : out unsigned(9 downto 0);
        x_two : out unsigned(9 downto 0);
        y_two : out unsigned(9 downto 0);

        dir_one : out std_logic;
        dir_two : out std_logic;

        row_sel : out unsigned(4 downto 0)
    );
end entity player_controller;