library IEEE;
use IEEE.std_logic_1164.all;

entity mes_chip is
    port(
        clk : in std_logic;
        reset : in std_logic;

        serialdata_one : in std_logic;
        datalatch_one : out std_logic;
        dataclock_one : out std_logic;

        serialdata_two : in std_logic;
        datalatch_two : out std_logic;
        dataclock_two : out std_logic;

        h_sync : out std_logic;
        v_sync : out std_logic;

        red_channel : out std_logic_vector(3 downto 0);
        green_channel : out std_logic_vector(3 downto 0);
        blue_channel : out std_logic_vector(3 downto 0)
    );
end entity mes_chip;
