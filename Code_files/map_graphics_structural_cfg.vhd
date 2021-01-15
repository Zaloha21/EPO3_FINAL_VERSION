configuration map_graphics_structural_cfg of map_graphics is
   for structural
      for all: sprite_rom_map use configuration work.sprite_rom_map_rtl_cfg;
      end for;
      for all: pixel_mux_map use configuration work.pixel_mux_map_rtl_cfg;
      end for;
      for all: rgb_rom_map use configuration work.rgb_rom_map_rtl_cfg;
      end for;
      for all: pass_gate use configuration work.pass_gate_rtl_cfg;
      end for;
   end for;
end map_graphics_structural_cfg;
