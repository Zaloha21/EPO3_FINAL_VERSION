library IEEE;
use IEEE.std_logic_1164.all;

entity bullet_address_controller is
    port(
        clk : in std_logic;
        reset : in std_logic;

        h_pixel : in std_logic_vector(9 downto 0);
        v_pixel : in std_logic_vector(9 downto 0);

        y_bullet : in std_logic_vector(9 downto 0);

        address_bullet : out std_logic_vector(1 downto 0)
    );
end entity bullet_address_controller;