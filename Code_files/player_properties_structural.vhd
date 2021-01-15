library IEEE;
use IEEE.std_logic_1164.ALL;

architecture structural of player_properties is
   component movecontroller
      generic(speed:  integer);
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
   end component;
   component coordregister
      generic(reset_val: integer);
      port(clk    : in  std_logic;
           reset  : in  std_logic;
           input  : in  unsigned(9 downto 0);
           write  : in  std_logic;
           output : out unsigned(9 downto 0));
   end component;
   component jumpregister
      port(clk       : in  std_logic;
           update    : in  std_logic;
           reset     : in  std_logic;
           jump         : in  std_logic;
           reset_vel  : in  std_logic;
           y_velocity : out signed(5 downto 0));
   end component;
   component dirregister
      generic(reset_val: std_logic);
      port(clk    : in  std_logic;
           reset  : in  std_logic;
           input  : in  std_logic;
           write  : in  std_logic;
           output : out std_logic);
   end component;

   signal y_velocity           : signed(5 downto 0);
   signal write_x         : std_logic;
   signal write_y         : std_logic;
   signal write_dir       : std_logic;
   signal update_vel      : std_logic;
   signal reset_vel       : std_logic;
   signal internal_x_pos   : unsigned(9 downto 0);
   signal internal_y_pos   : unsigned(9 downto 0);
   signal internal_new_x   : unsigned(9 downto 0);
   signal internal_new_y   : unsigned(9 downto 0);
   signal internal_new_x_dir: std_logic;
   signal internal_x_dir   : std_logic;
   signal new_target_x     : unsigned(9 downto 0);
   signal new_target_y     : unsigned(9 downto 0);
   signal target_x        : unsigned(9 downto 0);
   signal target_y        : unsigned(9 downto 0);
   signal write_target_pos : std_logic;
begin

   movement:  movecontroller     generic map(speed => 3)         port map(clk, reset, start, done, left, right, internal_x_pos, internal_y_pos, internal_x_dir, y_velocity,
                                                                          check, coll_done, coll_start, new_target_x, new_target_y, target_x, target_y, write_target_pos, 
                                                                          internal_new_x, internal_new_y, internal_new_x_dir, write_x, write_y,
                                                                          write_dir, update_vel, reset_vel);
   xram:      coordregister      generic map(reset_val => reset_x) port map(clk, reset or reset_pos, internal_new_x, write_x, internal_x_pos);
   yram:      coordregister      generic map(reset_val => reset_y) port map(clk, reset or reset_pos, internal_new_y, write_y, internal_y_pos);
   dir_ram:    dirregister        generic map(reset_val => '1')    port map(clk, reset or reset_pos, internal_new_x_dir, write_dir, internal_x_dir);
   jump_reg:   jumpregister                                       port map(clk, update_vel, reset or reset_pos, jump, reset_vel, y_velocity);

   tar_x_ram:   coordregister      generic map(reset_val => reset_x) port map(clk, reset or reset_pos, new_target_x, write_target_pos, target_x);
   tar_y_ram:   coordregister      generic map(reset_val => reset_y) port map(clk, reset or reset_pos, new_target_y, write_target_pos, target_y);

   x_pos <= internal_x_pos;
   y_pos <= internal_y_pos;
   dir  <= internal_x_dir;
   new_x <= internal_new_x;
   new_y <= internal_new_y;

end architecture structural;

