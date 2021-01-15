library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity movecontroller is
   generic(speed: integer);
   port(clk      : in  std_logic;
        reset    : in  std_logic;
        start    : in  std_logic;
        done     : out std_logic;
        left        : in  std_logic;
        right        : in  std_logic;
        x_pos     : in  unsigned(9 downto 0);
        y_pos     : in  unsigned(9 downto 0);
        x_dir     : in  std_logic;
        y_velocity     : in  signed(5 downto 0);
        check    : in  std_logic;
        coll_done : in  std_logic;
        coll_start: out std_logic;
        target_x_o : out unsigned(9 downto 0);
        target_y_o : out unsigned(9 downto 0);
        target_x_i : in  unsigned(9 downto 0);
        target_y_i : in  unsigned(9 downto 0);
        write_target_pos : out std_logic;
        new_x     : out unsigned(9 downto 0);
        new_y     : out unsigned(9 downto 0);
        new_x_dir  : out std_logic;
        write_x   : out std_logic;
        write_y   : out std_logic;
        write_dir : out std_logic;
        update_vel: out std_logic;
        reset_vel : out std_logic);
end movecontroller;

