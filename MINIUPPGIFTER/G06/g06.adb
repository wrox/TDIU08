with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;

procedure g06 is
   
   function fFactorial(N: in Integer) return Integer is
      begin
	 if N = 0 or N = 1 then
	   return 1;
	 end if;
	 return N * fFactorial(N - 1);
      end fFactorial;
   
   iUserInput : Integer;
   Space : Character := ' ';
   
   begin
      Put("Mata in N: ");
      Get(iUserInput);
      
      Put("De första ");
      Put(iUserInput, Width=>0);
      Put(" fakultetstalen är: ");
      iUserInput := iUserInput - 1;
      for I in 0..iUserInput loop
	 Put(fFactorial(I), Width=>0);
	 Put(Space);
      end loop;
   end g06;
