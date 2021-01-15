configuration bullet_graphic_controller_structural_cfg of bullet_graphic_controller is
   for structural
      for all: bullet_address_controller use configuration work.bullet_address_controller_rtl_cfg;
      end for;
      for all: bullet_switch_controller use configuration work.bullet_switch_controller_rtl_cfg;
      end for;
      for all: bullet_pass_controller use configuration work.bullet_pass_controller_rtl_cfg;
      end for;
   end for;
end bullet_graphic_controller_structural_cfg;
