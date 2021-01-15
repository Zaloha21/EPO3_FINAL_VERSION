library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of movecontroller is
  type state_type is (reset_state, y_buff_state, calc_pos_y, calc_neg_y, x_buff_state, write_pos_x, write_neg_x, terminate_x, write_pos_y, write_neg_y, terminate_y, calc_pos_x, calc_neg_x, prep_x, prep_y, set_target_left, set_target_right, set_target_idle, upd_velocity, finished);
  signal state, new_state: state_type;
  signal count, new_count: std_logic;
begin

  statereg: process (clk)
  begin
    if (rising_edge(clk)) then
      if (reset = '1') then
        state <= reset_state;

        new_x            <= x_pos;
        new_y            <= y_pos;
        new_x_dir        <= x_dir;
        write_x          <= '0';
        write_y          <= '0';
        write_dir        <= '0';
        update_vel       <= '0';
        reset_vel        <= '0';
        coll_start       <= '0';
        done             <= '0';
        new_count        <= count;
        target_x_o       <= target_x_i;
        target_y_o       <= target_y_i;
        write_target_pos <= '0';

      else
        state <= new_state;
          case state is
            when reset_state =>
              new_x           <= x_pos;
              new_y           <= y_pos;
              new_x_dir        <= x_dir;
              write_x         <= '0';
              write_y         <= '0';
              write_dir       <= '0';
              update_vel      <= '0';
              reset_vel       <= '0';
              coll_start      <= '0';
              done            <= '0';
              new_count       <= count;
              target_x_o       <= target_x_i;
              target_y_o       <= target_y_i;
              write_target_pos <= '0';

            when upd_velocity =>
              new_x           <= x_pos;
              new_y           <= y_pos;
              new_x_dir        <= x_dir;
              write_x         <= '0';
              write_y         <= '0';
              write_dir       <= '0';
              update_vel      <= '1';
              reset_vel       <= '0';
              coll_start      <= '0';
              done            <= '0';
              new_count       <= count;
              target_x_o       <= target_x_i;
              target_y_o       <= target_y_i;
              write_target_pos <= '0';

            when set_target_idle =>
              new_x           <= x_pos;
              new_y           <= y_pos;
              new_x_dir        <= x_dir;
              write_x         <= '0';
              write_y         <= '0';
              write_dir       <= '0';
              update_vel      <= '0';
              reset_vel       <= '0';
              coll_start      <= '0';
              done            <= '0';
              new_count       <= count;
              target_x_o       <= x_pos;
              target_y_o       <= y_pos + unsigned(resize(y_velocity, 10));
              write_target_pos <= '1';

            when set_target_left =>
              new_x           <= x_pos - speed;
              new_y           <= y_pos;
              new_x_dir        <= '0';
              write_x         <= '0';
              write_y         <= '0';
              write_dir       <= '1';
              update_vel      <= '0';
              reset_vel       <= '0';
              coll_start      <= '0';
              done            <= '0';
              new_count       <= count;
              target_x_o       <= x_pos - speed;
              target_y_o       <= y_pos + unsigned(resize(y_velocity, 10));
              write_target_pos <= '1';

            when set_target_right =>
              new_x           <= x_pos + speed;
              new_y           <= y_pos;
              new_x_dir        <= '1';
              write_x         <= '0';
              write_y         <= '0';
              write_dir       <= '1';
              update_vel      <= '0';
              reset_vel       <= '0';
              coll_start      <= '0';
              done            <= '0';
              new_count       <= count;
              target_x_o       <= x_pos + speed;
              target_y_o       <= y_pos + unsigned(resize(y_velocity, 10));
              write_target_pos <= '1';

            when prep_x =>
              new_x           <= x_pos;
              new_y           <= y_pos;
              new_x_dir        <= x_dir;
              write_x         <= '0';
              write_y         <= '0';
              write_dir       <= '0';
              update_vel      <= '0';
              reset_vel       <= '0';
              coll_start      <= '1';
              done            <= '0';
              new_count       <= count;
              target_x_o       <= target_x_i;
              target_y_o       <= target_y_i;
              write_target_pos <= '0';

            when calc_pos_x =>
              new_x           <= x_pos + 1;
              new_y           <= y_pos;
              new_x_dir        <= '1';
              write_x         <= '0';
              write_y         <= '0';
              write_dir       <= '0';
              update_vel      <= '0';
              reset_vel       <= '0';
              coll_start      <= '0';
              done            <= '0';
              new_count       <= count;
              target_x_o       <= target_x_i;
              target_y_o       <= target_y_i;
              write_target_pos <= '0';

            when calc_neg_x =>
              new_x           <= x_pos - 1;
              new_y           <= y_pos;
              new_x_dir        <= '0';
              write_x         <= '0';
              write_y         <= '0';
              write_dir       <= '0';
              update_vel      <= '0';
              reset_vel       <= '0';
              coll_start      <= '0';
              done            <= '0';
              new_count       <= count;
              target_x_o       <= target_x_i;
              target_y_o       <= target_y_i;
              write_target_pos <= '0';

            when write_pos_x =>
              new_x           <= x_pos + 1;
              new_y           <= y_pos;
              new_x_dir        <= '1';
              write_x         <= '1';
              write_y         <= '0';
              write_dir       <= '1';
              update_vel      <= '0';
              reset_vel       <= '0';
              coll_start      <= '0';
              done            <= '0';
              new_count       <= count;
              target_x_o       <= target_x_i;
              target_y_o       <= target_y_i;
              write_target_pos <= '0';

            when write_neg_x =>
              new_x           <= x_pos - 1;
              new_y           <= y_pos;
              new_x_dir        <= '0';
              write_x         <= '1';
              write_y         <= '0';
              write_dir       <= '1';
              update_vel      <= '0';
              reset_vel       <= '0';
              coll_start      <= '0';
              done            <= '0';
              new_count       <= count;
              target_x_o       <= target_x_i;
              target_y_o       <= target_y_i;
              write_target_pos <= '0';

            when terminate_x =>
              new_x           <= x_pos;
              new_y           <= y_pos;
              new_x_dir        <= x_dir;
              write_x         <= '0';
              write_y         <= '0';
              write_dir       <= '0';
              update_vel      <= '0';
              reset_vel       <= '0';
              coll_start      <= '0';
              done            <= '0';
              new_count       <= count;
              target_x_o       <= x_pos;
              target_y_o       <= target_y_i;
              write_target_pos <= '1';

            when x_buff_state =>
              new_x           <= x_pos;
              new_y           <= y_pos;
              new_x_dir        <= x_dir;
              write_x         <= '0';
              write_y         <= '0';
              write_dir       <= '0';
              update_vel      <= '0';
              reset_vel       <= '0';
              coll_start      <= '0';
              done            <= '0';
              new_count       <= count;
              target_x_o       <= target_x_i;
              target_y_o       <= target_y_i;
              write_target_pos <= '0';

            when prep_y =>
              new_x           <= x_pos;
              new_y           <= y_pos;
              new_x_dir        <= x_dir;
              write_x         <= '0';
              write_y         <= '0';
              write_dir       <= '0';
              update_vel      <= '0';
              reset_vel       <= '0';
              coll_start      <= '1';
              done            <= '0';
              new_count       <= count;
              target_x_o       <= target_x_i;
              target_y_o       <= target_y_i;
              write_target_pos <= '0';

            when calc_pos_y =>
              new_x           <= x_pos;
              new_y           <= y_pos + 1;
              new_x_dir        <= x_dir;
              write_x         <= '0';
              write_y         <= '0';
              write_dir       <= '0';
              update_vel      <= '0';
              reset_vel       <= '0';
              coll_start      <= '0';
              done            <= '0';
              new_count       <= count;
              target_y_o       <= target_y_i;
              target_x_o       <= target_x_i;
              write_target_pos <= '0';
              
            when calc_neg_y =>
              new_x           <= x_pos;
              new_y           <= y_pos - 1;
              new_x_dir        <= x_dir;
              write_x         <= '0';
              write_y         <= '0';
              write_dir       <= '0';
              update_vel      <= '0';
              reset_vel       <= '0';
              coll_start      <= '0';
              done            <= '0';
              new_count       <= count;
              target_y_o       <= target_y_i;
              target_x_o       <= target_x_i;
              write_target_pos <= '0';

            when write_pos_y =>
              new_x           <= x_pos;
              new_y           <= y_pos + 1;
              new_x_dir        <= x_dir;
              write_x         <= '0';
              write_y         <= '1';
              write_dir       <= '0';
              update_vel      <= '0';
              reset_vel       <= '0';
              coll_start      <= '0';
              done            <= '0';
              new_count       <= count;
              target_y_o       <= target_y_i;
              target_x_o       <= target_x_i;
              write_target_pos <= '0';

            when write_neg_y =>
              new_x           <= x_pos;
              new_y           <= y_pos - 1;
              new_x_dir        <= x_dir;
              write_x         <= '0';
              write_y         <= '1';
              write_dir       <= '0';
              update_vel      <= '0';
              reset_vel       <= '0';
              coll_start      <= '0';
              done            <= '0';
              new_count       <= count;
              target_y_o       <= target_y_i;
              target_x_o       <= target_x_i;
              write_target_pos <= '0';

            when terminate_y =>
              new_x           <= x_pos;
              new_y           <= y_pos;
              new_x_dir        <= x_dir;
              write_x         <= '0';
              write_y         <= '0';
              write_dir       <= '0';
              update_vel      <= '0';
              reset_vel       <= '1';
              coll_start      <= '0';
              done            <= '0';
              new_count       <= count;
              target_y_o       <= y_pos;
              target_x_o       <= target_x_i;
              write_target_pos <= '1';

            when y_buff_state =>
              new_x           <= x_pos;
              new_y           <= y_pos;
              new_x_dir        <= x_dir;
              write_x         <= '0';
              write_y         <= '0';
              write_dir       <= '0';
              update_vel      <= '0';
              reset_vel       <= '0';
              coll_start      <= '0';
              done            <= '0';
              new_count       <= count;
              target_x_o       <= target_x_i;
              target_y_o       <= target_y_i;
              write_target_pos <= '0';

            when finished =>
              new_x           <= x_pos;
              new_y           <= y_pos;
              new_x_dir        <= x_dir;
              write_x         <= '0';
              write_y         <= '0';
              write_dir       <= '0';
              update_vel      <= '0';
              reset_vel       <= '0';
              coll_start      <= '0';
              done            <= '1';
              new_count       <= not count;
              target_x_o       <= target_x_i;
              target_y_o       <= target_y_i;
              write_target_pos <= '0';

        end case;
      end if;
    end if;
  end process;

  countreg: process (clk)
  begin
    if (rising_edge(clk)) then
      if (reset = '1' or y_velocity = 0) then
        count <= '0';
      else
        count <= new_count;
      end if;
    end if;
  end process;

  combinatorial: process(state, start, coll_done, check, target_x_i, target_y_i, x_pos, y_pos, x_dir, y_velocity, count, left, right)
  begin
    case (state) is

      when reset_state =>
        if (start = '1') then
          if (count = '1') then
            if (left = '1') then
              new_state <= set_target_left;
            elsif (right = '1') then
              new_state <= set_target_right;
            else
              new_state <= set_target_idle;
            end if;
          else
            new_state <= upd_velocity;
          end if;
        else
          new_state <= reset_state;
        end if;


      when upd_velocity =>
        if (left = '1') then
          new_state <= set_target_left;
        elsif (right = '1') then
          new_state <= set_target_right;
        else
          new_state <= set_target_idle;
        end if;


      when set_target_idle =>
        new_state <= prep_y;


      when set_target_left =>
        new_state <= prep_x;


      when set_target_right =>
        new_state <= prep_x;


      when prep_x =>
        if (left = '1') then
          new_state <= calc_neg_x;
        elsif (right = '1') then
          new_state <= calc_pos_x;
        else
          new_state <= y_buff_state;
        end if;


      when calc_pos_x =>
        if (coll_done = '1') then
          if (check = '1') then
            new_state <= terminate_x;
          else
            new_state <= write_pos_x;
          end if;
        else
          new_state <= calc_pos_x;
        end if;


      when calc_neg_x =>
        if (coll_done = '1') then
          if (check = '1') then
            new_state <= terminate_x;
          else
            new_state <= write_neg_x;
          end if;
        else
          new_state <= calc_neg_x;
        end if;


      when write_pos_x =>
        new_state <= x_buff_state;


      when write_neg_x =>
        new_state <= x_buff_state;


      when terminate_x =>
        new_state <= x_buff_state;


      when x_buff_state =>
        if (x_pos = target_x_i) then
          if (y_velocity = 0) then
            new_state <= finished;
          else
            new_state <= prep_y;
          end if;
        else
          new_state <= prep_x;
        end if;


      when prep_y =>
        if (y_velocity(y_velocity'left) = '1') then
          new_state <= calc_neg_y;
        elsif (y_velocity = 0) then
          new_state <= finished;
        else
          new_state <= calc_pos_y;
        end if;

        
      when calc_pos_y =>
        if (coll_done = '1') then
          if (check = '1') then
            new_state <= terminate_y;
          else
            new_state <= write_pos_y;
          end if;
        else
          new_state <= calc_pos_y;
        end if;


      when calc_neg_y =>
        if (coll_done = '1') then
          if (check = '1') then
            new_state <= terminate_y;
          else
            new_state <= write_neg_y;
          end if;
        else
          new_state <= calc_neg_y;
        end if;


      when write_pos_y =>
        new_state <= y_buff_state;


      when write_neg_y =>
        new_state <= y_buff_state;


      when terminate_y =>
        new_state <= y_buff_state;


      when y_buff_state =>
        if (y_pos = target_y_i) then
          new_state <= finished;
        else
          new_state <= prep_y;
        end if;


      when finished =>
        new_state <= reset_state;

    end case;
  end process;

end behaviour;

