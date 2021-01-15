configuration player_graphics_structural_cfg of player_graphics is
   for structural
      for all: player_one_graphics use configuration work.player_one_graphics_structural_cfg;
      end for;
      for all: player_two_graphics use configuration work.player_two_graphics_structural_cfg;
      end for;
   end for;
end player_graphics_structural_cfg;
