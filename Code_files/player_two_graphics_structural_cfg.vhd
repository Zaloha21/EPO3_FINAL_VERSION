configuration player_two_graphics_structural_cfg of player_two_graphics is
   for structural
      for all: player_two_sprite_rom use configuration work.player_two_sprite_rom_rtl_cfg;
      end for;
      for all: player_pixel_mux use configuration work.player_pixel_mux_rtl_cfg;
      end for;
      for all: player_two_rgb_rom use configuration work.player_two_rgb_rom_rtl_cfg;
      end for;
      for all: pass_gate use configuration work.pass_gate_rtl_cfg;
      end for;
   end for;
end player_two_graphics_structural_cfg;
