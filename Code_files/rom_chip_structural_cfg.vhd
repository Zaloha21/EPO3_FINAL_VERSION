configuration rom_chip_structural_cfg of rom_chip is
   for structural
      for all: map_rom use configuration work.map_rom_rtl_cfg;
      end for;
      for all: rom_bus use configuration work.rom_bus_rtl_cfg;
      end for;
      for all: rom_controller_gpu use configuration work.rom_controller_gpu_rtl_cfg;
      end for;
   end for;
end rom_chip_structural_cfg;
