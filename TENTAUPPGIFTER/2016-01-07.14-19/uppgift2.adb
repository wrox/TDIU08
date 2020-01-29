with Ada.Text_IO;			use Ada.Text_IO;
with Ada.Integer_Text_IO;		use Ada.Integer_Text_IO;

procedure Uppgift2 is
   
   Size_X : constant := 80;
   Size_Y : constant := 24;
   
   X1, Y1, X2, Y2 : Integer;
   Ch             : Character;
   
begin
   Put("Mata in punkt 1 (X,Y): ");
   Get(X1);
   Get(Ch);
   Get(Y1);
   Skip_Line;
   
   Put("Mata in punkt 2 (X,Y): ");
   Get(X2);
   Get(Ch);
   Get(Y2);
   Skip_Line;
   
   
   for Y in reverse -Size_Y / 2 + 1 .. Size_Y / 2 loop
      for X in -Size_X / 2 + 1 .. Size_X / 2 loop
	 if (X = X1 and Y = Y1) or (X = X2 and Y = Y2) then
	    Put('*');
	 elsif Y = Size_Y / 2 and X = 0 then
	    Put('A');
	 elsif Y = 0 and X = Size_X / 2 then
	    Put('>');
	 elsif Y = 0 then
	    if X = 0 then
	       Put('+');
	    else
	       Put('-');
	    end if;
	 else
	    if X = 0 then
	       Put('|');
	    else
	       Put(' ');
	    end if;
	 end if;
      end loop;
      New_Line;
   end loop;
end Uppgift2;

