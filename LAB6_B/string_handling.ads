package String_Handling is
   
   type String_Type is private;
   
   procedure Put(Item: in String_Type);
   procedure Get(Item: out String_Type);
   
private
   
   type Char_Array_Type is array (1..256) of Character;
   type String_Type is
      record
	 Char_Array: Char_Array_Type;
	 Length: Integer;
      end record;
   
end String_Handling;
