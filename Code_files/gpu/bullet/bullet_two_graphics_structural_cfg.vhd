configuration bullet_two_graphics_structural_cfg of bullet_two_graphics is
   for structural
      for all: bullet_two_sprite_rom use configuration work.bullet_two_sprite_rom_rtl_cfg;
      end for;
      for all: bullet_pixel_mux use configuration work.bullet_pixel_mux_rtl_cfg;
      end for;
      for all: bullet_two_rgb_rom use configuration work.bullet_two_rgb_rom_rtl_cfg;
      end for;
      for all: pass_gate use configuration work.pass_gate_rtl_cfg;
      end for;
   end for;
end bullet_two_graphics_structural_cfg;
