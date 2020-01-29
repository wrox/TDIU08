with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure g09 is

   Counter, PrimeCount, UserInput, Temp : Integer := 0;

begin
   Put("Mata in N: ");
   Get(UserInput);
   
   Put("De första ");
   Put(UserInput, 0);
   Put(" primtalen är: ");
   while PrimeCount < UserInput loop
      Counter := Counter + 1;

      loop
	 Temp := 1;
	 for I in 2..(Counter - 1) loop
	    Temp := (Temp * I) mod Counter;
	 end loop;
	 if Temp = (Counter - 1) then
	    PrimeCount := PrimeCount + 1;
	    Put(Counter, 0);
	    Put(' ');
	    exit;
	 end if;
	 exit;
      end loop;
      
   end loop;   
   
end g09;
