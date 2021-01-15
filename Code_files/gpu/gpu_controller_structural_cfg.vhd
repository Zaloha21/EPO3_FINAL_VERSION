configuration gpu_controller_structural_cfg of gpu_controller is
   for structural
      for all: map_gpu_controller use configuration work.map_gpu_controller_structural_cfg;
      end for;
      for all: player_gpu_controller use configuration work.player_gpu_controller_structural_cfg;
      end for;
      for all: bullet_gpu_controller use configuration work.bullet_gpu_controller_structural_cfg;
      end for;
   end for;
end gpu_controller_structural_cfg;
