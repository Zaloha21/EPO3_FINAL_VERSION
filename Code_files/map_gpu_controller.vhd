library IEEE;
use IEEE.std_logic_1164.all;

entity map_gpu_controller is
    port(
        clk : in std_logic;
        reset : in std_logic;

        h_pixel : in std_logic_vector(9 downto 0);
        v_pixel : in std_logic_vector(9 downto 0);

        row_of_blocks : in std_logic_vector(39 downto 0);
        
        switch : out std_logic_vector(2 downto 0);
        address : out std_logic_vector(2 downto 0);
        enable_pass_map : out std_logic
    );
end entity map_gpu_controller;