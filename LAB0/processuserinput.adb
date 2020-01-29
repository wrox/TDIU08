with Ada.Text_IO;						use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;

procedure processUserInput is

   I: Integer;
   F: Float;
   C: Character;
   S: String(1..5);

begin
   
   Put("Skriv in ett heltal: ");
   Get(I);
   Put("Du skrev in talet: ");
   Put(I, Width=>0);
   
   Skip_Line; -- Rensa input. 
   New_Line(2);
   
   Put("Skriv in fem heltal: ");
   Get(I);
   Put("Du skrev in talen: ");
   for ILoop in 1..4 loop
      Put(I, Width=>0);
      Get(I);
      Put(' ');
   end loop;   
   Put(I, Width=>0);
   
   Skip_Line; -- Rensa input.
   New_Line(2);
   
   Put("Skriv in ett flyttal: ");
   Get(F);
   Put("Du skrev in flyttalet: ");
   Put(F, Fore=>0,Aft=>3,Exp=>0);
   
   Skip_Line; -- Rensa input.
   New_Line(2);
   
   Put("Skriv in ett heltal och ett flyttal: ");
   Get(I);
   Get(F);
   Put("Du skrev in heltalet: ");
   Put(I, Width=>10);
   New_Line;
   Put("Du skrev in flyttalet: ");
   Put(F, Fore=>4,Aft=>4,Exp=>0);
   
   Skip_Line; -- Rensa input.
   New_Line(2);
   
   Put("Skriv in ett tecken: ");
   Get(C);
   Put("Du skrev in tecknet: ");
   Put(C);
   
   New_Line(2);
   
   Put("Skriv in en sträng med 5 tecken: ");
   Get(S);
   Put("Du skrev in strängen: ");
   Put(S);
   
   Skip_Line; -- Rensa input.
   New_Line(2);
   
   Put("Skriv in en sträng med 3 tecken: ");
   Get(S(1..3)); -- Definiera index/antal tecken som ska sparas
   Put("Du skrev in strängen: ");
   Put(S(1..3)); -- Samma, fast put
   
   Skip_Line; -- Rensa input.
   New_Line(2);
   
   Put("Skriv in ett heltal och en sträng med 5 tecken: ");
   Get(I); -- Heltalet
   Get(C); -- Mellanrummet
   Get(S); -- Strängen
   Put("Du skrev in talet |");
   Put(I, Width=>0);
   Put("| och strängen |");
   Put(S);
   Put("|.");
   
   Skip_Line; -- Rensa Input
   New_Line(2);
   
   Put("Skriv in sträng med 3 tecken och ett flyttal: ");
   Get(S(1..3));
   Get(F);
   Put("Du skrev in """);
   Put(F, Fore=>0,Aft=>3,Exp=>0);
   Put(""" och """);
   Put(S(1..3));
   Put(""".");
   
end processUserInput;
