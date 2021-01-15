library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of controllbull1 is
type state_type is (RESET_STATE, PLAYER_XCHECK, PLAYER_YCHECK, WALLCHECK11, WALLCHECK12, WALLCHECK21, WALLCHECK22, COLLISION, NOCOLLISION, POSITION, SHOOTSTATE, LEFTSTATE, RIGHTSTATE, COLLISIONPLAYER2STATE, POSITIONRIGHT, POSITIONLEFT);
  signal state : state_type;
  signal h_pixel_value, v_pixel_value, temp : integer;
  signal X, Y, internalX, internalY : unsigned(9 downto 0);
  signal blockValue, initialDir : std_logic;


  begin

h_pixel_value 	<= to_integer(unsigned(Hpixel));
v_pixel_value 	<= to_integer(unsigned(Vpixel));

statereg: process (clk)
begin
  if (rising_edge(clk)) then
    if (reset = '1') then
		Xbullet1 		<= "0000000000";
		Ybullet1 		<= "0000000000";
		Collisionplayer2 	<= '0';
		X 			<= "0000000000";
		Y 			<= "0000000000";
		internalX		<= "0000000000";
		internalY		<= "0000000000";
		temp			<= 0;
		
	
        	state <= RESET_STATE;
    else

	case state is 
	
	--FSM goes to Reset State when RESET signal is high or bullet has collision.
	when RESET_STATE =>
		Xbullet1 		<= "0000000000";
		Ybullet1 		<= "0000000000";
		Collisionplayer2 	<= '0';
		X 			<= "0000000000";
		Y 			<= "0000000000";
		internalX		<= "0000000000";
		internalY		<= "0000000000";
		temp			<= 0;
		

		if(Shoot1 = '1') then
			state <= SHOOTSTATE;
		else
			state <= RESET_STATE;
		end if;
			
      	--The DIRECTION input signal decides the direction of the bullet.		
	when SHOOTSTATE=> 
		if(Dir1 = '0') then
			
			state <= LEFTSTATE;
		else
			
			state <= RIGHTSTATE;

		end if;
			
	--The bullet is shifted to its starting position on the left of the player.
	when LEFTSTATE=> 
		initialDir <= Dir1;
		X <= to_unsigned((to_integer(Xplayer1) - 16), 10);
		Y <= to_unsigned((to_integer(Yplayer1) + 16), 10);

		state <= PLAYER_XCHECK;

	--The bullet is shifted to its starting position on the right of the player.
	when RIGHTSTATE=>
		initialDir <= Dir1;
		X <= to_unsigned((to_integer(Xplayer1) + 16), 10);
		Y <= to_unsigned((to_integer(Yplayer1) + 16), 10);

		state <= PLAYER_XCHECK;
	
	--The X-position of the bullet is compared with the X-position of the enemy. 
	when PLAYER_XCHECK =>
		if(v_pixel_value = 504) and (h_pixel_value = 798) then
			if(X > Xplayer2) then
				if(X - Xplayer2 < 32) then
					state <= PLAYER_YCHECK;
				else
					state <= WALLCHECK11;
				end if;
			elsif(Xplayer2 - X < 32) then
				state <= PLAYER_YCHECK;
			else
				state <= WALLCHECK11;
			end if;
		end if;

	--The Y-position of the bullet is compared with the Y-position of the enemy. 
	when PLAYER_YCHECK =>
		if(Y < Yplayer2 + 44) then
			if(Y + 12 > Yplayer2) then
				state <= COLLISIONPLAYER2STATE;
			else
				state <= WALLCHECK11;
			end if;
		else
			state <= WALLCHECK11;
		end if;
		 
	--If the bullet has hit the enemy, a COLLISION signal is sent.
	when COLLISIONPLAYER2STATE =>
		Collisionplayer2 <= '1';

		state<= RESET_STATE;

	--The following states check for collision between bullet and wall.
	--With the value of internaly, the row needed from the map ROM is calculated.
	--The map ROM sends the blockvalues.
	
	--The top-left corner of the bullet is checked for wall collision. 
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

	--The top-right corner of the bullet is checked for wall collision.
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

	--The bottom-left corner of the bullet is checked for wall collision.
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

	--The bottom-right corner of the bullet is checked for wall collision.
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

		state <= RESET_STATE;

	--If bullet did not have collision, the new position is calculated
	when POSITION =>
		if(initialDir = '0') then
			state <= POSITIONLEFT;
		else
			state <= POSITIONRIGHT;
		end if;
		
	--The bullet moves at 16 pixels per frame	
	when POSITIONLEFT=>
		Xbullet1 <= to_unsigned((to_integer(internalX) - 16), 10); 
		Ybullet1 <= internalY;
		X 	 <= to_unsigned((to_integer(internalX) - 16), 10); 
		Y 	 <= internalY;

		state <= PLAYER_XCHECK;
	

	when POSITIONRIGHT=>
		Xbullet1 <= to_unsigned((to_integer(internalX) + 16), 10); 
		Ybullet1 <= internalY;
		X 	 <= to_unsigned((to_integer(internalX) + 16), 10); 
		Y 	 <= internalY;

		state <= PLAYER_XCHECK;
	
	end case;
     end if;
  end if;
end process;

rowSel 		<= std_logic_vector(internalY(8 downto 4));
blockValue 	<= rowVal(rowVal'length - 1 - to_integer(internalX(9 downto 4)));

end behaviour;

