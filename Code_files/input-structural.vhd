library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture structural of input is
  component dataclockcontrol is
    port(clk        : in  std_logic;
         reset      : in  std_logic;
         enable     : in  std_logic;
         clock      : out std_logic);
  end component;

  component datalatchcontrol is
    port(clk             : in  std_logic;
         reset           : in  std_logic;
         start           : in  std_logic;
         enabledataclock : out std_logic;
         counter         : out unsigned(12 downto 0);
         datalatch       : out std_logic);
  end component;

  component buttonreg is
    port(clk      : in  std_logic;
         reset    : in  std_logic;
         input    : in  std_logic_vector(11 downto 0);
         output   : out std_logic_vector(11 downto 0));
  end component;

  signal enabledataclock   : std_logic;
  signal clockcount        : unsigned(12 downto 0);

  signal data     : std_logic_vector(11 downto 0);
  signal newdata  : std_logic_vector(11 downto 0);

  type statetype is (READB, READY, READSELECT, READSTART, READUP, READDOWN, READLEFT, READRIGHT, READA, READX, READL, READR, IDLE);
  signal state, new_state: statetype;
begin

  dataclk:    dataclockcontrol    port map (clk, reset, enabledataclock, dataclock);
  datalch:    datalatchcontrol    port map (clk, reset, start, enabledataclock, clockcount, datalatch);
  buttons:    buttonreg           port map (clk, reset, newdata, data);

  
  statereg: process(clk)
  begin
    if (rising_edge(clk)) then
      if (reset = '1') then
        state <= IDLE;
      else
        state <= new_state;
      end if;
    end if;
  end process;

  registercombinatorial: process(state, serialdata, clockcount, data)
  begin
    case(state) is
      when READB =>
        newdata      <= data;
        newdata(0)   <= serialdata;
        new_state <= IDLE;

      when READY =>
        newdata      <= data;
        newdata(1)   <= serialdata;
        new_state <= IDLE;

      when READSELECT =>
        newdata      <= data;
        newdata(2)   <= serialdata;
        new_state <= IDLE;

      when READSTART =>
        newdata      <= data;
        newdata(3)   <= serialdata;
        new_state <= IDLE;

      when READUP =>
        newdata      <= data;
        newdata(4)   <= serialdata;
        new_state <= IDLE;

      when READDOWN =>
        newdata      <= data;
        newdata(5)   <= serialdata;
        new_state <= IDLE;

      when READLEFT =>
        newdata      <= data;
        newdata(6)   <= serialdata;
        new_state <= IDLE;

      when READRIGHT =>
        newdata      <= data;
        newdata(7)   <= serialdata;
        new_state <= IDLE;

      when READA =>
        newdata      <= data;
        newdata(8)   <= serialdata;
        new_state <= IDLE;

      when READX =>
        newdata      <= data;
        newdata(9)   <= serialdata;
        new_state <= IDLE;

      when READL =>
        newdata       <= data;
        newdata(10)   <= serialdata;
        new_state <= IDLE;

      when READR =>
        newdata       <= data;
        newdata(11)   <= serialdata;
        new_state <= IDLE;

      when IDLE =>
        newdata <= data;
        if (clockcount = 448) then
          new_state <= READB;
        elsif (clockcount = 748) then
          new_state <= READY;
        elsif (clockcount = 1048) then
          new_state <= READSELECT;
        elsif (clockcount = 1348) then
          new_state <= READSTART;
        elsif (clockcount = 1648) then
          new_state <= READUP;
        elsif (clockcount = 1948) then
          new_state <= READDOWN;
        elsif (clockcount = 2248) then
          new_state <= READLEFT;
        elsif (clockcount = 2548) then
          new_state <= READRIGHT;
        elsif (clockcount = 2848) then
          new_state <= READA;
        elsif (clockcount = 3148) then
          new_state <= READX;
        elsif (clockcount = 3448) then
          new_state <= READL;
        elsif (clockcount = 3748) then
          new_state <= READR;
        else
          new_state <= IDLE;
        end if;

    end case;
  end process;

  b_button      <= not data(0);
  y_button      <= not data(1);
  select_button <= not data(2);
  start_button  <= not data(3);
  up_button     <= not data(4);
  down_button   <= not data(5);
  left_button   <= not data(6);
  right_button  <= not data(7);
  a_button      <= not data(8);
  x_button      <= not data(9);
  l_button      <= not data(10);
  r_button      <= not data(11);

end structural;

