with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;

procedure g14 is
   Input : String(1..24);
   InputLength : Integer;
   begin
      Put("Mata in N: ");
      Get_Line(Input, InputLength);
      Put_Line(Input(1..InputLength));
      for I in 1..InputLength loop
	 Put_Line(Input(1..InputLength-I));
      end loop;
      Put("Klart!");
   end g14;
