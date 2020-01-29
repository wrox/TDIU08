with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;

procedure g13 is
   UserInput, LineCount, NewLineCount : Integer := 0;
   Zero : Character := '0';
   begin
      Put("Mata in N: ");
      Get(UserInput);
      NewLineCount := UserInput;
      for I in 1..NewLineCount loop
	 for I in 1..LineCount loop
	    Put(Zero);
	 end loop;
	 LineCount := LineCount + 1;
	 New_Line;
      end loop;
      Put("Klart!");
   end g13;
