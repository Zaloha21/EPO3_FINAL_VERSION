configuration cpu_structural_cfg of cpu is
   for structural
      for all: gpu_controller use configuration work.gpu_controller_structural_cfg;
      end for;
      for all: player_controller use configuration work.player_controller_structural_cfg;
      end for;
      for all: bullet_controller use configuration work.bullet_controller_structural_cfg;
      end for;
      for all: game_state_controller use configuration work.game_state_controller_rtl_cfg;
      end for;
   end for;
end cpu_structural_cfg;
