configuration mes_chip_structural_cfg of mes_chip is
   for structural
      for all: pixel_counter use configuration work.pixel_counter_rtl_cfg;
      end for;
      for all: rom_chip use configuration work.rom_chip_structural_cfg;
      end for;
      for all: cpu use configuration work.cpu_structural_cfg;
      end for;
      for all: gpu use configuration work.gpu_structural_cfg;
      end for;
   end for;
end mes_chip_structural_cfg;
