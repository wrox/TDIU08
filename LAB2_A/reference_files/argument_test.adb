with Ada.Text_IO;			use Ada.Text_IO;
with Ada.Command_Line;			use Ada.Command_Line;
with Ada.Integer_Text_IO;		use Ada.Integer_Text_IO;

procedure Argument_Test is
   
begin
   Put("Du startade programmet med ");
   Put(Argument_Count, Width => 0);
   Put_Line(" st argument.");
   New_Line;
   
   if Argument_Count > 0 then
      Put_Line("Argumenten var: ");
      for I in 1..Argument_Count loop
	 Put_Line(Argument(I));
      end loop;
   end if;
end Argument_Test;
