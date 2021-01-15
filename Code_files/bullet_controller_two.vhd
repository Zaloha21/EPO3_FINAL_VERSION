library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity bullet_controller_two is
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
end entity bullet_controller_two;