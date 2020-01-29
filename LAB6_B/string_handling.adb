with Ada.Text_IO;		use Ada.Text_IO;

package body String_Handling is
   
   procedure Get(Item: out String_Type) is 
      iLoopCounter : Integer := 0;
      begin
         if End_Of_Line then
	    Skip_Line;
	 end if;
	 loop
	    -- Medan användaren inte trycker enter
	    while not End_Of_Line loop
	       -- Ifall input hade fler än 256 tecken.
	       if iLoopCounter >= Char_Array_Type'Last then
		  -- Exita loopen
		  exit;
	       else
		  -- Annars, lägg till 1 till vår counter och Get:a till array
		  iLoopCounter := iLoopCounter + 1;
		  Get(Item.Char_Array(iLoopCounter));
	       end if;
	    end loop;
	    Item.Length := iLoopCounter;
	    exit;
	 end loop;
      end Get;
      
   procedure Put(Item: in String_Type) is
      iLoopCounter: Integer;
      begin	
	 iLoopCounter := Item.Length;
	 -- Skriv ut värden från arrayen, från 1 till .Length (iLoopCounter)
	 for I in 1..iLoopCounter loop
	    Put(Item.Char_Array(I));
	 end loop;    
      end Put; 
   
   end String_Handling;
