with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Ada.Sequential_IO;

procedure Files is
   
   Space : constant Character := ' ';
   
   -- := (others => ' ')
   type Input_Array is array(1..16) of Integer;
   type Interest_Array is array(1..10) of Integer;
   
   type Tree_Record is 
      record
	 Surname: String(1..20) := (others => ' ');
	 Name: String(1..20) := (others => ' ');
 	 Address: String(1..20) := (others => ' ');
	 Postaddress: String(1..20) := (others => ' ');
	 InterestCount: Integer;
	 Interests: Interest_Array;
      end record;   
   
   package Seq_IO is new Ada.Sequential_IO(Tree_Record);
   
   -- Member funktion för att kontrollera input
   
   function Without_Space(Item: in String) return String is
      function Rev(Item: in String) return String is
         Result: String(Item'Range);
         begin
	    for I in Item'Range loop
	       Result(Result'Last - I+Item'First) := Item(I);
	    end loop;
	    return Result;
         end Rev;
      function Strip_Space(Item: in String) return String is
         begin
            if Item'Length = 0 then
	       return "";
	    elsif Item(Item'First) /= Space then
	       return Item(Item'Range);
	    elsif Item(Item'First) = Space then
	       return Strip_Space(Item(Item'First+1..Item'Last));
	    else
	       return Item(Item'First) & Strip_Space(Item(Item'First+1..Item'Last));
	    end if;
	 end Strip_Space;
      begin
	 return Rev(Strip_Space(Rev(Item(Item'Range))));
      end Without_Space;
      
   function Member(Item: in Input_Array; Tmp_Input: in Integer) return Boolean is
      begin
         for I in 1..16 loop 
	    if Item(I) = Tmp_Input then
	       return False;
	    end if;
	 end loop;
	 return True;
      end Member;

      
   Tree_File : Seq_IO.File_Type;
   Result_File : File_Type;
   Tree_Data : Tree_Record;
   User_Input : Input_Array;
   iInputCount, iLastValue, ISecondLastValue, Tmp_Input : Integer := 0;
   bPrint : Boolean := False;
   
   
begin   
   Put_Line("Ange en följd av intressen 1 till 15, max 10 st. Avsluta med 0: ");
   iInputCount := 2;
   Get(User_Input(1));
   loop
      Get(Tmp_Input);
      if Member(User_Input, Tmp_Input) then
	 User_Input(iInputCount) := Tmp_Input;
	 iInputCount := iInputCount + 1;
      end if;
      exit when Tmp_Input = 0;
   end loop;
   Put("KLART! Resultat på filen RESULT.TXT");
   
   Seq_IO.Open(File=>Tree_File, Mode=>Seq_IO.In_File, Name=>"REG.BIN");
   Open(Result_File, Out_File, "RESULT.TXT");
   
   New_Line;
   
   while not Seq_IO.End_Of_File(Tree_File) loop
      Seq_IO.Read(Tree_File, Tree_Data); -- Read tree data
      
      for A in 1..iInputCount loop
	 for B in 1..Tree_Data.InterestCount loop
	    if User_Input(A) = Tree_Data.Interests(B) then
	       bPrint := True;
	    end if;
	 end loop;
      end loop;
      
      if bPrint then
	 for I in 1..60 loop
	    Put('-');
	    Put(Result_File, '-');
	 end loop;
	 New_Line(Result_File);
	 New_Line; 
         
	 Put(Result_File, Without_Space(Tree_Data.Name));
	 Put(Without_Space(Tree_Data.Name));
	 Put(Result_File, Space);
	 Put(Space);
	 Put(Result_File, Without_Space(Tree_Data.Surname));
	 Put(Without_Space(Tree_Data.Surname));	 
	 Put(Result_File, Space);
	 Put(Space);      
	 Put(Result_File, Without_Space(Tree_Data.Address));
	 Put(Without_Space(Tree_Data.Address));	
	 Put(Result_File, Space);
	 Put(Space);	 
	 Put(Result_File, Without_Space(Tree_Data.Postaddress));
	 Put(Without_Space(Tree_Data.Postaddress));
	 Put(Result_File, Space);
	 Put(Space);
	 Put(Result_File, "***");
	 Put("***");
	 Put(Result_File, " Intressen: ");
	 Put(" Intressen: ");	 
	 for A in 1..iInputCount loop
	    for B in 1..Tree_Data.InterestCount loop
	       if Tree_Data.Interests(B) = User_Input(A) then
		  if Tree_Data.Interests(B) /= iLastValue and Tree_Data.Interests(B) /= iSecondLastValue then
		     Put(Result_File, Tree_Data.Interests(B), 0);
		     Put(Tree_Data.Interests(B), 0);
		     Put(Result_File, Space);
		     Put(Space);
		  end if;
		  iSecondLastValue := iLastValue;
		  iLastValue := Tree_Data.Interests(B);
	       end if;
	    end loop;
	 end loop;
	 
	 iLastValue := 0;
	 iSecondLastValue := 0;  
	 New_Line(Result_File);
	 New_Line;
	 bPrint := False;
      end if;
   end loop;
   
   Close(Result_File);
   Seq_IO.Close(Tree_File); 
    
end Files;
