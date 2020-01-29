with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;

procedure Heltal is
   
   function fFactorial(N: in Integer) return Integer is
      begin
	 if N = 0 then
	   return 1;
	 end if;
	 return N * fFactorial(N - 1);
      end fFactorial;
   
   iUserInput : Integer;
   Space : Character := ' ';
   
   begin
      Put("Mata in N: ");
      Get(iUserInput);
      
      Put(iUserInput, Width=>0);
      Put("! = ");
      Put(fFactorial(iUserInput), Width=>0);
      
   end Heltal;
