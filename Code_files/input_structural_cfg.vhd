configuration input_structural_cfg of input is
   for structural
      for all: dataclockcontrol use configuration work.dataclockcontrol_behaviour_cfg;
      end for;
      for all: datalatchcontrol use configuration work.datalatchcontrol_behaviour_cfg;
      end for;
   end for;
end input_structural_cfg;
