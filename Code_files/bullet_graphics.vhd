library IEEE;
use IEEE.std_logic_1164.all;

entity bullet_graphics is
    port(
        clk : in std_logic;
        reset : in std_logic;

        switch_bullet_one : in std_logic_vector(3 downto 0);
        address_bullet_one : in std_logic_vector(1 downto 0);
        enable_pass_bullet_one : in std_logic;

        switch_bullet_two : in std_logic_vector(3 downto 0);
        address_bullet_two : in std_logic_vector(1 downto 0);
        enable_pass_bullet_two : in std_logic;

        color_bullet_one : out std_logic_vector(11 downto 0);
        color_bullet_two : out std_logic_vector(11 downto 0)
    );
end entity bullet_graphics;