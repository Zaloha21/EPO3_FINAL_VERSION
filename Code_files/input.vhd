library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity input is
   port(clk           : in  std_logic;
        reset         : in  std_logic;
        start         : in  std_logic;
        serialdata    : in  std_logic;
        dataclock     : out std_logic;
        datalatch     : out std_logic;
        left_button   : out std_logic;
        right_button  : out std_logic;
        up_button     : out std_logic;
        down_button   : out std_logic;
        a_button      : out std_logic;
        b_button      : out std_logic;
        x_button      : out std_logic;
        y_button      : out std_logic;
        l_button      : out std_logic;
        r_button      : out std_logic;
        start_button  : out std_logic;
        select_button : out std_logic);
end input;

