configuration player_properties_structural_cfg of player_properties is
   for structural
      for all: movecontroller use configuration work.movecontroller_behaviour_cfg;
      end for;
      for all: coordregister use configuration work.coordregister_behaviour_cfg;
      end for;
      for all: dirregister use configuration work.dirregister_behaviour_cfg;
      end for;
      for all: jumpregister use configuration work.jumpregister_behaviour_cfg;
      end for;
   end for;
end player_properties_structural_cfg;
