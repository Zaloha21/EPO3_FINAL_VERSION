configuration vga_driver_structural_cfg of vga_driver is
   for structural
      for all: vga_rgb_splitter use configuration work.vga_rgb_splitter_rtl_cfg;
      end for;
      for all: vga_h_sync_gen use configuration work.vga_h_sync_gen_rtl_cfg;
      end for;
      for all: vga_v_sync_gen use configuration work.vga_v_sync_gen_rtl_cfg;
      end for;
   end for;
end vga_driver_structural_cfg;
