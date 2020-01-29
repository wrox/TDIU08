with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Sorted_List;                       use Sorted_List;

procedure Pointers is


      UserInput, Result : Integer;
      L : Node_Pointer;
   
   begin
      
      Put_Line("> Insert");
      Insert(L, 3);
      Insert(L, 2);
      Insert(L, 1);
      Put_Line("> Put");
      Put_Line("Hela listan i stigande ordning: ");
      Put(L);
      Put_Line("> Length");
      Put_Line("Antal objekt i listan: ");
      Put(Length(L), Width=>0);
      New_Line;
      Put_Line("> Member");
      Put_Line("Hela listan i stigande ordning: ");
      Put(L);
      Put("Sök efter ett värde: ");
      Get(UserInput);
      Put("Finns värdet ");
      Put(UserInput, 0);
      Put(" i listan? ");
      if Member(L, UserInput) then
	 Put_Line("Ja.");
	 Put_Line("> Remove" & Integer'Image(UserInput));
	 Remove(L, UserInput);
      else
	 Put_Line("Nej.");
      end if;
      Put_Line("> Put");
      Put_Line("Hela listan, från äldst till senast: ");
      Put(L);
      Put("Ange ett värde att söka efter i listan (Member/Find): ");
      Get(UserInput);
      --Put_Line("> Delete");
      --Delete(L);
      Put_Line("> Find (Funktion)");
      Put(Find(L, UserInput), 0);
      New_Line;
      Put_Line("> Find (Procedur)");
      Find(L, UserInput, Result);
      Put(Result, 0);
      
   end Pointers;
