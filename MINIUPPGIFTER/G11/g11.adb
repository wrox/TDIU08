with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure g11 is

   Counter, PrimeCount, UserInput, Temp : Integer := 0;
   

begin
   Put("Mata in N: ");
   Get(UserInput);
   
   Put("De första ");
   Put(UserInput, 0);
   Put(" primtalen är: ");

	 for I in 2..(UserInput - 1) loop
	    UserInput := (UserInput * I) mod Counter;
	 end loop;
	 if Temp = (UserInput - 1) then
	    PrimeCount := PrimeCount + 1;
	    Put(UserInput, 0);
	    Put(' ');
	 end if;
     
   
end g11;
