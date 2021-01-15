configuration gpu_structural_cfg of gpu is
   for structural
      for all: map_graphics use configuration work.map_graphics_structural_cfg;
      end for;
      for all: player_graphics use configuration work.player_graphics_structural_cfg;
      end for;
      for all: bullet_graphics use configuration work.bullet_graphics_structural_cfg;
      end for;
      for all: layer_mux use configuration work.layer_mux_rtl_cfg;
      end for;
      for all: vga_driver use configuration work.vga_driver_structural_cfg;
      end for;
   end for;
end gpu_structural_cfg;
