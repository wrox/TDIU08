with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;

procedure g01 is
   
   iCounter : Integer := 1;
   Space : Character := ' ';
   
   begin
      Put_Line("For loop: ");
      for I in 1..10 loop
	 Put(I, Width=>0);
	 Put(Space);
      end loop;
      New_Line;
      Put_Line("While loop:");
      while iCounter <= 10 loop
	 Put(iCounter, Width=>0);
	 iCounter := iCounter + 1;
	 Put(Space);
      end loop;
      New_Line;
      iCounter := 1;
      Put_Line("Loop:");
      loop
	 Put(iCounter, Width=>0);
	 iCounter := iCounter +1;
	 Put(Space);
	 exit when iCounter = 11;
      end loop;
   end g01;
