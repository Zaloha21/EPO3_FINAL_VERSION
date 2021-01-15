library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture sim of mes_chip_tb is

    constant clock_freq_hz : integer := 25000000; -- CLK FREQ = 25000000 Hz
    constant clock_period : time := 1000 ms / clock_freq_hz;

    component mes_chip is
        port(
            clk : in std_logic;
            reset : in std_logic;
    
            left_player_one : in std_logic;
            right_player_one : in std_logic;
            jump_player_one : in std_logic;
            shoot_player_one : in std_logic;
    
            left_player_two : in std_logic;
            right_player_two : in std_logic;
            jump_player_two : in std_logic;
            shoot_player_two : in std_logic;
    
            h_sync : out std_logic;
            v_sync : out std_logic;
    
            red_channel : out std_logic_vector(3 downto 0);
            green_channel : out std_logic_vector(3 downto 0);
            blue_channel : out std_logic_vector(3 downto 0)
        );
    end component mes_chip;

    signal clk, reset : std_logic := '1';

    signal left_player_one, right_player_one, jump_player_one, shoot_player_one : std_logic;
    signal left_player_two, right_player_two, jump_player_two, shoot_player_two : std_logic;

    signal h_sync, v_sync : std_logic;
    signal red_channel, green_channel, blue_channel : std_logic_vector(3 downto 0);

begin

    test: mes_chip port map (
        clk => clk,
        reset => reset,
        left_player_one => left_player_one,
        right_player_one => right_player_one,
        jump_player_one => jump_player_one,
        shoot_player_one => shoot_player_one,
        left_player_two => left_player_two,
        right_player_two => right_player_two,
        jump_player_two => jump_player_two,
        shoot_player_two => shoot_player_two,
        h_sync => h_sync,
        v_sync => v_sync,
        red_channel => red_channel,
        green_channel => green_channel,
        blue_channel => blue_channel
    );

    left_player_one <= '0';
    right_player_one <= '1';
    jump_player_one <= '1';
    shoot_player_one <= '0';

    left_player_two <= '0';
    right_player_two <= '0';
    jump_player_two <= '0';
    shoot_player_two <= '0';

    clk <= not clk after clock_period / 2;

    reset <= '0' after 10 ms;

end architecture sim;