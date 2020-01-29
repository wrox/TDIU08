with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;

procedure g04 is
   
   iLoopCount : Integer;
   Space : Character := ' ';
   
   begin
      Put("Mata in N: ");
      Get(iLoopCount);
   
      for I in 1..iLoopCount loop
	 Put(I, Width=>0);
	 if I /= iLoopCount then
	    Put(',');
	 end if;
	 Put(Space);
      end loop;
         
   end g04;
