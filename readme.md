# EPO3 : Design a chip
This repository contains the VHD and matlab files needed to synthesise a logic based video game. As of now the repository consists out of multiple folders
containing the modules and submodules needed for the chip. Currently the modules of this project are as follows.
1. VGA
2. GPU (gpu controlls in CPU)
3. Player (all combined in CPU)
   * Collision Checking
   * Movement Calculation
   * Player variable storage (coordinates, direction, velocity)
   * Physics Calculation
4. Bullets
Code references will bring you to this page.


### Additional design specifications
The chip will be delivered approximately 6 months after the design is graded. As such the design will be tested on a FPGA. Additionally there are some boundary conditions.
* The chip has only 16 inputs, including clock and reset.
* The max clock frequency is 25MHz.
* The available chip area is 105625 um^2 of which 60% can be used before routing.
* The core voltage is 1.8V and the I/O voltage is 3.3V.
* Only Moore machines may be used in the design.
* The active screen resolution is 640x480 pixels.

### About this project
Our goal is to create a digital logic-based player versus player arena shooter game. It will be two dimensional and platformer based. It will be playable with a 
NES controller of which the controlls are left, right, up and shoot. Future plans include adding powerups in the form of different weapons and in game music.

