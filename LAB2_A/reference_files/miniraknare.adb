with Ada.Text_IO;			use Ada.Text_IO;
with Ada.Float_Text_IO;			use Ada.Float_Text_IO;
with Ada.Integer_Text_IO;		use Ada.Integer_Text_IO;

procedure Miniraknare is
   
   Choice : Integer;
   A, B   : Integer;
   X, Y   : Float;
begin
   Put_Line("Välkommen till miniräknaren!");
   loop
      Put_Line("1. Beräkna N-fakultet.");
      Put_Line("2. Addera två heltal.");
      Put_Line("3. Addera heltal med flyttal.");
      Put_Line("4. Addera flyttal med heltal.");
      Put_Line("5. Addera två flyttal.");
      Put_Line("6. Avsluta.");
      Put("Välj ett alternativ: ");
      Get(Choice);
      New_Line;
      exit when Choice = 6;
      
      if Choice = 1 then
	 Put("Mata in ett heltal: ");
	 Get(A);

	 Put(A, Width => 0);
	 Put("! = ");
	 ---
	 
      elsif Choice = 2 then
	 Put("Mata in två heltal: ");
	 Get(A);
	 Get(B);
	 
	 Put(A, Width => 0);
	 Put(" + ");
	 Put(B, Width => 0);
	 Put(" = ");
	 ---
	 
      elsif Choice = 3 then
	 Put("Mata in ett heltal och ett flyttal: ");
	 Get(A);
	 Get(X);
	 
	 Put(A, Width => 0);
	 Put(" + ");
	 Put(X, Fore => 0, Aft => 2, Exp => 0);
	 Put(" = ");
	 ---
	 
	 
      elsif Choice = 4 then
	 Put("Mata in ett flyttal och ett heltal: ");
	 Get(X);
	 Get(A);
	 
	 Put(X, Fore => 0, Aft => 2, Exp => 0);
	 Put(" + ");
	 Put(A, Width => 0);
	 Put(" = ");
	 ---
	 
      elsif Choice = 5 then
	 Put("Mata in två flytal: ");
	 Get(X);
	 Get(Y);
	 
	 Put(X, Fore => 0, Aft => 2, Exp => 0);
	 Put(" + ");
	 Put(Y, Fore => 0, Aft => 2, Exp => 0);
	 Put(" = ");
	 ---
      end if;
      New_Line(2);
   end loop;
   Put_Line("Hejdå, vi ses nästa gång!");
      
end Miniraknare;
     
     
