with String_Handling;          use String_Handling;

package Hero_Handling is
   
   type Hero_Type is private;
   
   procedure Put(Item: in Hero_Type);
   procedure Get(Item: out Hero_Type);
   function GetAge(Item: in Hero_Type) return Integer;
   
private

--   type Species_Type is (Human, Elf, Orc, Halfling, Ogre, Lizardman);
--   type EyeColor_Type is (Blue, Green, Brown, Gray, Yellow, Red, Black, Crazy);
   type Hero_Type is
      record
	 Name: String_Type;
	 Age: Integer;
	 IsBioMale: Boolean;
	 Weight: Float;
	 HairColor: String_Type;
--	 Species: Species_Type;
--	 EyeColor: EyeColor_Type;
      end record;
   
end Hero_Handling;
