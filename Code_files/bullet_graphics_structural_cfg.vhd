configuration bullet_graphics_structural_cfg of bullet_graphics is
   for structural
      for all: bullet_one_graphics use configuration work.bullet_one_graphics_structural_cfg;
      end for;
      for all: bullet_two_graphics use configuration work.bullet_two_graphics_structural_cfg;
      end for;
   end for;
end bullet_graphics_structural_cfg;
