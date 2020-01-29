with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;

procedure g03 is
   
   iCounter : Integer := 1;
   Space : Character := ' ';
   
   begin
      Put_Line("Jämna heltal:");
      for I in 1..20 loop
	 if I mod 2 = 0 then
	    Put(I, Width=>0);
	    Put(Space);
	 end if;
      end loop;
      
      New_Line;
      
      Put_Line("Udda heltal:");
      for I in 1..20 loop
	 if I mod 2 = 1 then
	    Put(I, Width=>0);
	    Put(Space);
	 end if;	 
      end loop;      
   end g03;
