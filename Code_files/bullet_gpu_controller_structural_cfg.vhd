configuration bullet_gpu_controller_structural_cfg of bullet_gpu_controller is
   for structural
      for all: bullet_graphic_controller use configuration work.bullet_graphic_controller_structural_cfg;
      end for;
   end for;
end bullet_gpu_controller_structural_cfg;
