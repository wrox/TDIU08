with Ada.Text_IO;		use Ada.Text_IO;
with Ada.Integer_Text_IO;	use Ada.Integer_Text_IO;

-- http://www.adahome.com/rm95/
-- S. 32 i Ada-boken för LAB3C

procedure records is
   type Char_Array_Type is array (1..256) of Character;
   
   type String_Type is
      record
	 Char_Array: Char_Array_Type;
	 Length: Integer;
      end record;
   
   procedure Get(Item: out String_Type; bAsked: in out Boolean) is
      iLoopCounter : Integer := 0;
      begin
	 Put("Vänligen mata in en ");
	 -- Om vi redan frågat användaren
	 if bAsked then
	    Put("till ");
	 end if;
	 Put("sträng som är högst 256 tecken: ");
	 -- Då vi frågat, sätt till True
	 bAsked := True;
	 -- Om användaren trycker ENTER
         if End_Of_Line then
	    Skip_Line;
	 end if;
	 loop
	    -- Medan användaren inte trycker enter
	    while not End_Of_Line loop -- = False loop
	       -- Ifall input hade fler än 256 tecken.
	       if iLoopCounter >= 256 then
		  -- Exita loopen
		  exit;
	       else
		  -- Annars, lägg till 1 till vår counter och Get:a till array
		  iLoopCounter := iLoopCounter + 1;
		  Get(Item.Char_Array(iLoopCounter));
	       end if;
	    end loop;
	    exit;
	 end loop;
	 Item.Length := iLoopCounter;
      end Get;
      
   procedure Put(Item: in String_Type) is
      iLoopCounter : Integer;
      begin
	 iLoopCounter := Item.Length;
	 -- Skriv ut värden från arrayen, från 1 till .Length (iLoopCounter)
	 for I in 1..iLoopCounter loop
	    Put(Item.Char_Array(I));
	 end loop;
      end Put;
	
      function "="(sInput1, sInput2: in String_Type) return Boolean is
	 -- Tillfällig array inom och för denna funktion
	 type Integer_Type is array (1..sInput1.Length) of Integer;
	 
	 sInput1TmpArray, sInput2TmpArray : Integer_Type;
      begin
	 -- Om längden inte är samma
 	 if sInput1.Length /= sInput2.Length then
	     -- Då är det inte samma. False
	    return False;
	 end if;
	 -- Flytta till tillfällig int'array för att använda i jmf. senare
	 for I in 1..sInput1.Length loop
	    sInput1TmpArray(I) := Character'Pos(sInput1.Char_Array(I));
	 end loop;
	 -- Flytta till tillfällig int'array för att använda i jmf. senare
	 for I in 1..sInput2.Length loop
	    sInput2TmpArray(I) := Character'Pos(sInput2.Char_Array(I));
	 end loop;
	 -- Loopa och kolla genom sInput1:s längd
	 for I in 1..sInput1.Length loop	    
	    -- Om fält x i array 1 inte matchar fält x i array 2
	    if sInput1TmpArray(I) /= sInput2TmpArray(I) then
	       -- Då är det inte samma. False
	       return False;
	    end if;
	 end loop;
	   
	   -- Om vi kommer ner hit (om ovan inte matchade), returna True
	 return True;
	end "=";
	
      sInput1, sInput2: String_Type;
      bAsked: Boolean := False;
      
   begin
      -- Få vår första input. Passera bool ifall för att se om vi frågat anv.
      Get(sInput1, bAsked);
      -- Få vår andra input
      Get(sInput2, bAsked);    
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
