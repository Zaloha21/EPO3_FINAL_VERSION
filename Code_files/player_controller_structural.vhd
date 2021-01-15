library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture structural of player_controller is

    component map_collision_checker is
        port(
            clk : in std_logic;
            reset : in std_logic;

            start : in std_logic;
            done : out std_logic;
            x      : in  unsigned(9 downto 0);
            y      : in  unsigned(9 downto 0);
            row_sel : out unsigned(4 downto 0);
            row_val : in  std_logic_vector(39 downto 0);
            check  : out std_logic
        );
    end component map_collision_checker;

    component player_properties is 
        generic(
            reset_x: integer;
            reset_y: integer
        );
        port(
            clk : in std_logic;
            reset : in std_logic;

            start     : in  std_logic;
            done      : out std_logic;
            left         : in  std_logic;
            right         : in  std_logic;
            jump         : in  std_logic;
            x_pos      : out unsigned(9 downto 0);
            y_pos      : out unsigned(9 downto 0);
            dir       : out std_logic;
            new_x      : out unsigned(9 downto 0);
            new_y      : out unsigned(9 downto 0);
            check     : in  std_logic;
            coll_start : out std_logic;
            coll_done  : in  std_logic;
            reset_pos  : in  std_logic
        );
    end component player_properties;

    signal check, check_one, check_two             : std_logic;
    signal coll_start, coll_start_one, coll_start_two : std_logic;
    signal coll_done, coll_done_one, coll_done_two    : std_logic;
    signal new_x, new_x_one, new_x_two                : unsigned(9 downto 0);
    signal new_y, new_y_one, new_y_two                : unsigned(9 downto 0);
    signal player_start_one, player_start_two        : std_logic;
    signal player_done_one, player_done_two          : std_logic;

    type state_type is (reset_state, prep_one, calc_player_one, prep_two, calc_player_two, finished);
    signal state, new_state: state_type;

begin

    collision: map_collision_checker port map(
        clk, 
        reset, 
        coll_start, 
        coll_done, 
        new_x, 
        new_y,
        row_sel, 
        row_val, 
        check
    );

    player_one: player_properties generic map(
        60,
        416
    )
    port map(
        clk, 
        reset,
        player_start_one, 
        player_done_one, 
        left_one, 
        right_one, 
        jump_one, 
        x_one, 
        y_one, 
        dir_one, 
        new_x_one, 
        new_y_one, 
        check,
        coll_start_one, 
        coll_done, 
        reset_pos
    );

    player_two: player_properties generic map(
        452, 
        416
    ) 
    port map(
        clk, 
        reset, 
        player_start_two, 
        player_done_two, 
        left_two, 
        right_two, 
        jump_two, 
        x_two, 
        y_two, 
        dir_two,
        new_x_two, 
        new_y_two,
        check,
        coll_start_two, 
        coll_done, 
        reset_pos
    );

    statereg: process (clk)
  begin
    if (rising_edge(clk)) then
      if (reset = '1') then
        state <= reset_state;
      else
        state <= new_state;
      end if;
    end if;
  end process;

  combin: process(state, v_pixel, player_done_one, player_done_two, new_x_one, new_x_two, new_y_one, new_y_two, coll_start_one, coll_start_two)
  begin
    case (state) is
      when reset_state =>
        player_start_one <= '0';
        player_start_two <= '0';
        new_x      <= new_x_one;
        new_y      <= new_y_one;
        coll_start <= coll_start_one;
        if (to_integer(unsigned(v_pixel)) = 480) then
          new_state <= prep_one;
        else
          new_state <= reset_state;
        end if;
     
      when prep_one =>
        player_start_one <= '1';
        player_start_two <= '0';
        new_x      <= new_x_one;
        new_y      <= new_y_one;
        coll_start <= coll_start_one;
        new_state <= calc_player_one;
        
      when calc_player_one =>
        player_start_one <= '0';
        player_start_two <= '0';
        new_x      <= new_x_one;
        new_y      <= new_y_one;
        coll_start <= coll_start_one;
        if (player_done_one = '1') then
          new_state <= prep_two;
        else
          new_state <= calc_player_one;
        end if;

      when prep_two =>
        player_start_one <= '0';
        player_start_two <= '1';
        new_x      <= new_x_two;
        new_y      <= new_y_two;
        coll_start <= coll_start_two;
        new_state <= calc_player_two;
        
      when calc_player_two =>
        player_start_one <= '0';
        player_start_two <= '0';
        new_x      <= new_x_two;
        new_y      <= new_y_two;
        coll_start <= coll_start_two;
        if (player_done_two = '1') then
          new_state <= finished;
        else
          new_state <= calc_player_two;
        end if;
      
      when finished =>
        player_start_one <= '0';
        player_start_two <= '0';
        new_x      <= new_x_two;
        new_y      <= new_y_two;
        coll_start <= coll_start_two;
        if (to_integer(unsigned(v_pixel)) = 0) then
          new_state <= reset_state;
        else
          new_state <= finished;
        end if;

    end case;
  end process;

end architecture structural;
