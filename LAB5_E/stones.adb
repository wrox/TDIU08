with Ada.Text_IO;		use Ada.Text_IO;
with Ada.Integer_Text_IO;       use Ada.Integer_Text_IO;
				  
procedure stones is
   function Calculate(N: in Natural) return Integer is
      X : Integer;
      begin
         -- För att stoppa den rekursiva loopen, returnera 0 när N nått 0 istället för att fortsätta.
         if N = 0 then
	    return 0;
	 elsif N = 1 then
	    return 1;
	 end if;
	 
	 X := 3 + (N - 2) * 2;
	 return N * X + Calculate(N - 1);
      end Calculate;
      
      iUserInput : Natural;
begin
      Put("Mata in husets höjd (HH = antal stenar i höjdled): ");
      Get(iUserInput);
      Put("Det behövs ");
      Put(Calculate(iUserInput - 1), Width=>0);
      Put(" stenar för att bygga trappan.");
   end stones;
