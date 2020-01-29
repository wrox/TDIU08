with Ada.Text_IO;		use Ada.Text_IO;
with Ada.Integer_Text_IO;	use Ada.Integer_Text_IO;

-- http://www.adahome.com/rm95/
-- S. 32 i Ada-boken för LAB3C

procedure records is
   type Char_Array_Type is array (1..256) of Character;
   
   type String_Type is
      record
	 -- Töm arrayen så att vi slipper Skip_Line(!)
	 Char_Array: Char_Array_Type := (others => ' ');
	 Length: Integer := 0;
      end record;
  
   procedure Get(Item: out String_Type) is
      procedure processGet(Item: in out String_Type) is
          begin
	     if not End_Of_Line then
		-- Ifall input hade fler än 256 tecken.
		if Item.Length /= 256 then
		   -- Annars, lägg till 1 till vår counter och Get:a till array
		   Item.Length := Item.Length + 1;
		   Get(Item.Char_Array(Item.Length));
		   processGet(Item);
		end if;
	     end if;
         end processGet;
      begin
	 Item.Length := 0;
	 processGet(Item);
      end Get;
      
   procedure Put(Item: in String_Type) is
      procedure processPut(Item: in String_Type; iLoopCounter: in out Integer) is
         begin
	    if iLoopCounter <= Item.Length then
	       iLoopCounter := iLoopCounter + 1;	       
	       Put(Item.Char_Array(iLoopCounter));
	       processPut(Item, ILoopCounter);
	    end if;
	 end ProcessPut;
      iLoopCounter : Integer := 0;
      begin
	 processPut(Item, iLoopCounter);
      end Put;
	
   function "="(sInput1, sInput2: in String_Type) return Boolean is 
      procedure processEqual(sInput1, sInput2: in String_Type; iLoopCounter: in out Integer; bIsEqual: in out Boolean) is
      begin
	 -- Loopa rekursivt tills vi nått längden på sInput1
	 if iLoopCounter <= sInput1.Length then
	    iLoopCounter := ILoopCounter + 1;
	    -- Om längden inte är samma
	    if sInput1.Length /= sInput2.Length then
	       -- Då är det inte samma. False
	       BIsEqual := False;
	    end if;
	    if sInput1.Char_Array(iLoopCounter) /= sInput2.Char_Array(iLoopCounter) then
	       bIsEqual := False;
	    end if;    
	    ProcessEqual(SInput1, SInput2, ILoopCounter, bIsEqual);
	 end if;
      end processEqual;
      
      iLoopCounter : Integer := 1;
      bIsEqual : Boolean;
      
      begin
         bIsEqual := True;
	 processEqual(sInput1, sInput2, ILoopCounter, bIsEqual);
	 if bIsEqual then
	    return True;
	 end if;
	 return False;
      end "=";
	
      sInput1, sInput2: String_Type;
      
   begin
      -- Få vår första input. Passera bool ifall för att se om vi frågat anv.
      Put("Vänligen mata in en sträng som är högst 256 tecken: ");
      Get(sInput1);
      Skip_Line;
      Put("Vänligen mata in en till sträng som är högst 256 tecken: ");
      Get(sInput2);          
      if sInput1 = sInput2 then
	 Put_Line("Första och andra värdet är identiska.");
	 Put("Första värdet: ");
	 Put(sInput1);
	 New_Line;
	 Put("Andra värdet: ");
	 Put(sInput2);
      else
	 Put_Line("/!\ Första och andra värdet överrensstämmer inte.");
	 Put("Första värdet: ");
	 Put(sInput1);
	 New_Line;
	 Put("Andra värdet: ");
	 Put(sInput2);	 
      end if;
   end records;
