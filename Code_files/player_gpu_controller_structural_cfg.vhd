configuration player_gpu_controller_structural_cfg of player_gpu_controller is
   for structural
      for all: player_graphic_controller use configuration work.player_graphic_controller_structural_cfg;
      end for;
   end for;
end player_gpu_controller_structural_cfg;
