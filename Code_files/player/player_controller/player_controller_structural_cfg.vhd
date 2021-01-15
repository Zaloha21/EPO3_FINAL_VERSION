configuration player_controller_structural_cfg of player_controller is
   for structural
      for all: map_collision_checker use configuration work.map_collision_checker_behavioural_cfg;
      end for;
      for all: player_properties use configuration work.player_properties_structural_cfg;
      end for;
   end for;
end player_controller_structural_cfg;
