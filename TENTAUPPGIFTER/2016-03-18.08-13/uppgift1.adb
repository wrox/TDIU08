with Ada.Text_IO;			use Ada.Text_IO;
with Ada.Integer_Text_IO;		use Ada.Integer_Text_IO;

procedure Split_Word is
  
  procedure Write_Splitted_Word(Word : in String) is
    
  begin
    New_Line;
    if Word'Length < 2 then
      Put_Line("Detta ord går inte att särskriva!");
    else
      Put_Line("Så här kan du särskriva " & Word & ":");
      for I in 1..(Word'Last - 1) loop
	Put_Line(Word(Word'First..I) & " " & Word(I+1..Word'Last));
      end loop;
    end if;
    New_Line;
  end Write_Splitted_Word;

  Word   : String(1 .. 20);
  Answer : String(1 .. 4);
  Len    : Integer;
  Quit   : Boolean;
  
begin
  loop
    Put("Mata in ett ord: ");
    Get_Line(Word, Len);
    --Get(Word);    

    Write_Splitted_Word(Word(1..Len));
    
    loop
      Put("Vill du köra igen (ja/nej): ");
      Get_Line(Answer, Len);
      
      Quit := Len = 3 and then Answer(1 .. 3) = "nej";
      
      exit when Quit or else (Len = 2 and then Answer(1 .. 2) = "ja");
      
      if Len = Answer'Last then
        Skip_Line;
      end if;
    end loop;
    
    exit when Quit;
  end loop;
end Split_Word;
