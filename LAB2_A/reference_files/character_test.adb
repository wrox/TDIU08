with Ada.Text_IO;			use Ada.Text_IO;
with Ada.Integer_Text_IO;		use Ada.Integer_Text_IO;

procedure Character_Test is
   
   A    : Character    := 'A';
   Erik : String(1..4) := "Erik";
begin
   
   Put("Ascii-värdet av tecknet 'A' är: ");
   Put(Character'Pos(A), Width => 0);
   New_Line;
   Put("Tecknet som motsvarar värdet 65 är: ");
   Put(Character'Val(65));
   New_Line(2);
   
   Put_Line("Ascii-värderna av tecknena i strängen ""Erik"" är: ");
   for I in 1..4 loop
      Put(Character'Pos(Erik(I)), Width => 4);
   end loop;
   New_Line(2);
   
   Put_Line("Tecknen som ligger mellan värde 50 och 59 är:");
   for I in 50..59 loop
      Put(Character'Val(I));
      Put(' ');
   end loop;
      
end Character_Test;
