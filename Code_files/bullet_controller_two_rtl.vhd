library IEEE;
use IEEE.std_logic_1164.ALL;

architecture rtl of bullet_controller_two is
type state_type is (reset_state, player_x_check, PLAYER_YCHECK, WALLCHECK11, WALLCHECK12, WALLCHECK21, WALLCHECK22, COLLISION, NOCOLLISION, POSITION,  SHOOTSTATE, LEFTSTATE, RIGHTSTATE, COLLISIONPLAYER1STATE, POSITIONRIGHT, POSITIONLEFT);
  signal state : state_type;
  signal h_pixel_value, v_pixel_value, temp : integer;
  signal X, Y, internalX, internalY : unsigned(9 downto 0);
  signal blockValue : std_logic;

  begin

h_pixel_value 	<= to_integer(unsigned(Hpixel));
v_pixel_value 	<= to_integer(unsigned(Vpixel));

statereg: process (clk)
begin
  if (rising_edge(clk)) then
    if (reset = '1') then
		Xbullet2 		<= "0000000000";
		Ybullet2 		<= "0000000000";
		Collisionplayer1 	<= '0';
		X 			<= "0000000000";
		Y 			<= "0000000000";
		internalX		<= "0000000000";
		internalY		<= "0000000000";
		temp			<= 0;

		state <= reset_state;
    else

	case state is 

	when reset_state =>
		Xbullet2 		<= "0000000000";
		Ybullet2 		<= "0000000000";
		Collisionplayer1 	<= '0';
		X 			<= "0000000000";
		Y 			<= "0000000000";
		internalX		<= "0000000000";
		internalY		<= "0000000000";
		temp			<= 0;

		if(Shoot2 = '1') then
			state <= SHOOTSTATE;
		else
			state <= reset_state;
		end if;

				
	when SHOOTSTATE => 
		if(Dir2 = '0') then
			state <= LEFTSTATE;
		else
			state <= RIGHTSTATE;
		end if;
			

	when LEFTSTATE => 
		X <= to_unsigned((to_integer(Xplayer2) - 16), 10);
		Y <= to_unsigned((to_integer(Yplayer2) + 16), 10);

		state <= player_x_check;


	when RIGHTSTATE =>
		X <= to_unsigned((to_integer(Xplayer2) + 16), 10);
		Y <= to_unsigned((to_integer(Yplayer2) + 16), 10);

		state <= player_x_check;
    

	when player_x_check =>
		if(v_pixel_value = 510) and (h_pixel_value = 798) then
			if(X > Xplayer1) then
				if(X - Xplayer1 < 32) then
					state <= PLAYER_YCHECK;
				else
					state <= WALLCHECK11;
				end if;
			elsif(Xplayer1 - X < 32) then
				state <= PLAYER_YCHECK;
			else
				state <= WALLCHECK11;
			end if;
		end if;


	when PLAYER_YCHECK =>
		if(Y < Yplayer1 + 44) then
			if(Y + 12 > Yplayer1) then
				state <= COLLISIONPLAYER1STATE;
			else
				state <= WALLCHECK11;
			end if;
		else
			state <= WALLCHECK11;
		end if;


	when COLLISIONPLAYER1STATE =>
		Collisionplayer1 <= '1';

		state<= reset_state;


	when WALLCHECK11 =>
		internalX <= X;
		internalY <= Y + 4;

		temp <= temp + 1;

		if(temp = 5) then
			if(blockValue = '1') then		
				state <= COLLISION;
			else
				state <= WALLCHECK12;
			end if;
			temp <= 0;
		else
			state <= WALLCHECK11;
		end if;
		
  
	when WALLCHECK12 =>
		internalX <= X + 31;
		internalY <= Y + 4;

		temp <= temp + 1;

		if(temp = 5) then
			if(blockValue = '1') then		
				state <= COLLISION;
			else
				state <= WALLCHECK21;
			end if;
			temp <= 0;
		else
			state <= WALLCHECK12;
		end if;



	when WALLCHECK21 =>
		internalX <= X;
		internalY <= Y + 11;

		temp <= temp + 1;

		if(temp = 5) then
			if(blockValue = '1') then		
				state <= COLLISION;
			else
				state <= WALLCHECK22;
			end if;
			temp <= 0;
		else
			state <= WALLCHECK21;
		end if;


	when WALLCHECK22 =>
		internalX <= X + 31;
		internalY <= Y + 11;

		temp <= temp + 1;

		if(temp = 5) then
			if(blockValue = '1') then		
				state <= COLLISION;
			else
				state <= NOCOLLISION;
			end if;
			temp <= 0;
		else
			state <= WALLCHECK22;
		end if;


	when NOCOLLISION =>
		internalX <= X;
		internalY <= Y;
		
		state <= POSITION;
		
	when COLLISION =>
		internalX <= X;
		internalY <= Y;

		state <= reset_state;


	when POSITION =>
		if(Dir2 = '0') then
			state <= POSITIONLEFT;
		else
			state <= POSITIONRIGHT;
		end if;
	

	when POSITIONLEFT =>
		Xbullet2 <= to_unsigned((to_integer(internalX) - 16), 10); 
		Ybullet2 <= internalY;
		X 	 <= to_unsigned((to_integer(internalX) - 16), 10); 
		Y 	 <= internalY;

		state <= player_x_check;


	when POSITIONRIGHT =>
		Xbullet2 <= to_unsigned((to_integer(internalX) + 16), 10); 
		Ybullet2 <= internalY;
		X 	 <= to_unsigned((to_integer(internalX) + 16), 10); 
		Y 	 <= internalY;

		state <= player_x_check;
			
	end case;
     end if;
  end if;
end process;

rowSel 		<= std_logic_vector(internalY(8 downto 4));
blockValue 	<= rowVal(rowVal'length - 1 - to_integer(internalX(9 downto 4)));

end rtl;

