with Ada.Text_IO;			use Ada.Text_IO;
with Ada.Integer_Text_IO;		use Ada.Integer_Text_IO;

with Ada.Numerics.Discrete_Random;

procedure Rolldie is
   
   subtype One_To_Six is
     Integer range 1..6;
   
   package My_Random_Package is
      new Ada.Numerics.Discrete_Random(One_To_Six);
   
   use My_Random_Package;
     
   G : Generator;
   N : Integer;
begin
   Reset(G); -- Detta sätter slumptalsfröet som används för att
	     -- ta fram de slumpade talen, skall göras EN gång 
	     -- per programkörning (varken mer eller mindre).
   
   Put_Line("Nu slår jag 10 st tärningar: ");
   for I in 1..10 loop
      N := Random(G);
      Put(N, Width => 5);
   end loop;
   
end Rolldie;
