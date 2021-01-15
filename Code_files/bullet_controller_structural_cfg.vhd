configuration bullet_controller_structural_cfg of bullet_controller is
   for structural
      for all: bullet_controller_one use configuration work.bullet_controller_one_rtl_cfg;
      end for;
      for all: bullet_controller_two use configuration work.bullet_controller_two_rtl_cfg;
      end for;
   end for;
end bullet_controller_structural_cfg;
