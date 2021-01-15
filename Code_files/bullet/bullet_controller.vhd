library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity bullet_controller is
    port(
        clk		: in std_logic;	
        reset		: in std_logic;

        Xplayer1   	: in unsigned(9 downto 0);
        Yplayer1   	: in unsigned(9 downto 0);
        Shoot1     	: in std_logic;
        Dir1       	: in std_logic;
        h_pixel 	: in std_logic_vector(9 downto 0);
        v_pixel 	: in std_logic_vector(9 downto 0);
        rowVal1		: in  std_logic_vector(39 downto 0);
        rowSel1 		: out std_logic_vector(4 downto 0);

        rowVal2 		: in  std_logic_vector(39 downto 0);
        rowSel2 		: out std_logic_vector(4 downto 0);


        Xplayer2   	: in unsigned(9 downto 0);
        Yplayer2   	: in unsigned(9 downto 0);
        Shoot2     	: in std_logic;
        Dir2       	: in std_logic;
   
        Xbullet1	: out unsigned(9 downto 0);
        Xbullet2	: out unsigned(9 downto 0);
        Ybullet1	: out unsigned(9 downto 0);
        Ybullet2	: out unsigned(9 downto 0);

        Collisionplayer1 : out std_logic;
        Collisionplayer2 : out std_logic
    );
end entity bullet_controller;