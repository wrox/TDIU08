with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Sorted_Hero_List;                  use Sorted_Hero_List;
with Hero_Handling;                     use Hero_Handling;

procedure Heroes is
   
   Input: Integer;
   Node: Node_Pointer;
   Hero, Result: Hero_Type;
   
   begin
      Get(Hero);
      Insert(Node, Hero, GetAge(Hero));
      Put_Line("> Put");
      Put_Line("Hela listan i stigande ordning: ");
      Put(Node);
      Put_Line("> Length");
      Put_Line("Antal objekt i listan: ");
      Put(Length(Node), Width=>0);
      New_Line;
      Put_Line("> Member");
      Put("Sök och ta bort en hjälte med ålder: ");
      Get(Input);
      Put("Finns en hjälte med åldern ");
      Put(Input, 0);
      Put(" i listan? ");
      if Member(Node, Input) then
      	 Put_Line("Ja.");
      	 Put_Line("> Remove");
      	 Put_Line("Ajdå, nu togs hjälten med åldern" & Integer'Image(Input) & " bort från listan.");
      	 Remove(Node, Input);
      else
      	 Put_Line("Nej.");
      end if;
      --  --Put_Line("> Delete");
      --  --Delete(Node);
      Put("Returnera en hjälte med åldern: ");
      Get(Input);
      Put_Line("> Find (Funktion)");
      Put(Find(Node, Input));
      New_Line;
      Put_Line("> Find (Procedur)");
      Find(Node, Input, Result);
      Put(Result);
      
   end Heroes;
