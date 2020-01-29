with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;

procedure Heltal is
   
   iCounter : Integer := 10;
   Space : Character := ' ';
   
   begin
      Put_Line("For loop:");
      for I in 1..10 loop
	 Put(iCounter, Width=>0);
	 iCounter := iCounter - 1;
	 Put(Space);
      end loop;
      New_Line; 
      iCounter := 10;
      Put_Line("While loop:");
      while iCounter /= 0 loop
	 Put(iCounter, Width=>0);
	 iCounter := iCounter - 1;
	 Put(Space);
      end loop;
      New_Line;
      iCounter := 10;
      Put_Line("Loop:");
      loop
	 Put(iCounter, Width=>0);
	 iCounter := iCounter - 1;
	 Put(Space);
	 exit when iCounter = 0;
      end loop;
   end Heltal;
