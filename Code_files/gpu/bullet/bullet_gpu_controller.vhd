library IEEE;
use IEEE.std_logic_1164.all;

entity bullet_gpu_controller is
    port(
        clk : in std_logic;
        reset : in std_logic;

        h_pixel : in std_logic_vector(9 downto 0);
        v_pixel : in std_logic_vector(9 downto 0);

        x_bullet_one : in std_logic_vector(9 downto 0);
        y_bullet_one : in std_logic_vector(9 downto 0);

        x_bullet_two : in std_logic_vector(9 downto 0);
        y_bullet_two : in std_logic_vector(9 downto 0);

        switch_bullet_one : out std_logic_vector(3 downto 0);
        address_bullet_one : out std_logic_vector(1 downto 0);
        enable_pass_bullet_one : out std_logic;

        switch_bullet_two : out std_logic_vector(3 downto 0);
        address_bullet_two : out std_logic_vector(1 downto 0);
        enable_pass_bullet_two : out std_logic
    );
end entity bullet_gpu_controller;