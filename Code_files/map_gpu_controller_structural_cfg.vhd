configuration map_gpu_controller_structural_cfg of map_gpu_controller is
   for structural
      for all: map_switch_controller use configuration work.map_switch_controller_rtl_cfg;
      end for;
      for all: map_address_controller use configuration work.map_address_controller_rtl_cfg;
      end for;
      for all: map_pass_controller use configuration work.map_pass_controller_rtl_cfg;
      end for;
      for all: map_pass_converter use configuration work.map_pass_converter_rtl_cfg;
      end for;
   end for;
end map_gpu_controller_structural_cfg;
