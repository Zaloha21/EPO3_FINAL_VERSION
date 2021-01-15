library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture structural of bullet_controller is

    component bullet_controller_one is 
        port(
            clk		: in std_logic;	
            reset		: in std_logic;
            
            Xplayer1   	: in unsigned(9 downto 0);
            Yplayer1   	: in unsigned(9 downto 0);
            Shoot1     	: in std_logic;
            Dir1       	: in std_logic;
        
            Xplayer2   	: in unsigned(9 downto 0);
            Yplayer2   	: in unsigned(9 downto 0);
            
            Hpixel	        : in std_logic_vector(9 downto 0);
            Vpixel	        : in std_logic_vector(9 downto 0);
        
            rowVal 		: in  std_logic_vector(39 downto 0);
        
            rowSel 		: out std_logic_vector(4 downto 0);
        
            Xbullet1	: out unsigned(9 downto 0);
            Ybullet1	: out unsigned(9 downto 0);
        
            Collisionplayer2 : out std_logic
        );
    end component bullet_controller_one;

    component bullet_controller_two is 
        port(
            clk		: in std_logic;	
            reset		: in std_logic;
            
            Xplayer2   	: in unsigned(9 downto 0);
            Yplayer2   	: in unsigned(9 downto 0);
            Shoot2     	: in std_logic;
            Dir2       	: in std_logic;
        
            Xplayer1   	: in unsigned(9 downto 0);
            Yplayer1   	: in unsigned(9 downto 0);
            
            Hpixel	        : in std_logic_vector(9 downto 0);
            Vpixel	        : in std_logic_vector(9 downto 0);
        
            rowVal 		: in  std_logic_vector(39 downto 0);
        
            rowSel 		: out std_logic_vector(4 downto 0);
        
            Xbullet2	: out unsigned(9 downto 0);
            Ybullet2	: out unsigned(9 downto 0);
        
            Collisionplayer1 : out std_logic
        );
    end component bullet_controller_two;

begin

    lb00:  bullet_controller_one	 port map(      clk=>clk,
    reset=>reset,		
    Xplayer1=> Xplayer1,  	
    Yplayer1=>Yplayer1,
    Shoot1=>Shoot1,
    Dir1=>Dir1,
    Xplayer2=>Xplayer2,
    Yplayer2=>Yplayer2,
    Hpixel=>h_pixel,     
    Vpixel=>v_pixel,  
    rowVal=>rowVal1,
    rowSel=>rowSel1,
    Xbullet1=>Xbullet1,
    Ybullet1=>Ybullet1,
    Collisionplayer2 => Collisionplayer2
);

lb01:  bullet_controller_two	 port map(      clk=>clk,
    reset=>reset,
    Xplayer2=>Xplayer2,
    Yplayer2=>Yplayer2,
    Shoot2=>Shoot2,
    Dir2=>Dir2,
    Xplayer1=> Xplayer1,  	
    Yplayer1=>Yplayer1,
    Hpixel=>h_pixel,     
    Vpixel=>v_pixel,  
    rowVal=>rowVal2,
    rowSel=>rowSel2,
    Xbullet2=>Xbullet2,
    Ybullet2=>Ybullet2,
    Collisionplayer1 => Collisionplayer1
);

end architecture structural;