configuration player_one_graphics_structural_cfg of player_one_graphics is
   for structural
      for all: player_one_sprite_rom use configuration work.player_one_sprite_rom_rtl_cfg;
      end for;
      for all: player_pixel_mux use configuration work.player_pixel_mux_rtl_cfg;
      end for;
      for all: player_one_rgb_rom use configuration work.player_one_rgb_rom_rtl_cfg;
      end for;
      for all: pass_gate use configuration work.pass_gate_rtl_cfg;
      end for;
   end for;
end player_one_graphics_structural_cfg;
