configuration player_graphic_controller_structural_cfg of player_graphic_controller is
   for structural
      for all: player_address_controller use configuration work.player_address_controller_rtl_cfg;
      end for;
      for all: player_switch_controller use configuration work.player_switch_controller_rtl_cfg;
      end for;
      for all: player_pass_controller use configuration work.player_pass_controller_rtl_cfg;
      end for;
   end for;
end player_graphic_controller_structural_cfg;
