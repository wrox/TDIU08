with Ada.Text_IO;		use Ada.Text_IO;
with Ada.Integer_Text_IO;	use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;	        use Ada.Float_Text_IO;

procedure dataStructures is
   -- Typer
   type Char_Array_Type is array (1..256) of Character;
   type String_Type is
      record
	 Char_Array: Char_Array_Type;
	 Length: Integer;
      end record;
   type Species_Type is (Human, Elf, Orc, Halfling, Ogre, Lizardman);
   type EyeColor_Type is (Blue, Green, Brown, Gray, Yellow, Red, Black, Crazy);
   type Hero_Type is
      record
	 Name: String_Type;
	 Age: Integer;
	 IsBioMale: Boolean;
	 Weight: Float;
	 HairColor: String_Type;
	 Species: Species_Type;
	 EyeColor: EyeColor_Type;
      end record;
   
   -- Extra Get för namn och hårfärg, som använder en Char_Array. Förkortar kod
   procedure Get(Item: out String_Type) is 
      iLoopCounter : Integer := 0;
      begin
         if End_Of_Line then
	    Skip_Line;
	 end if;
	 loop
	    -- Medan användaren inte trycker enter
	    while not End_Of_Line loop
	       -- Ifall input hade fler än 256 tecken.
	       if iLoopCounter >= 256 then
		  -- Exita loopen
		  exit;
	       else
		  -- Annars, lägg till 1 till vår counter och Get:a till array
		  iLoopCounter := iLoopCounter + 1;
		  Get(Item.Char_Array(iLoopCounter));
	       end if;
	    end loop;
	    Item.Length := iLoopCounter;
	    exit;
	 end loop;
      end Get;
   
   -- Underprogram
   procedure Get(Item: out Hero_Type) is
      iLoopCounter, iTmpGender : Integer := 0;
      begin
	 Put_Line("> Get");
	 Put_Line("Hjältedata: ");	 
	 -- Namn
	 Put("  Vänligen mata in ett namn: ");
	 Get(Item.Name);
	 -- Ålder
	 loop
	    begin
	       Put("  Vänligen mata in ålder: ");
	       Get(Item.Age);
	       -- Gå ut ur loopen endast om vi får som vi vill.
	       exit when Item.Age >= 0;
	       Put_Line("  Det blev fel. Hjälten måste minst 0 år gammal. Försök igen.");
	    exception
	       when Data_Error => -- När Data_Error fås
		  Put_Line("  Det blev fel. Skrev du in ett nummer? Försök igen.");
		  Skip_Line; -- Rensa input så bufferten är tom när man callar Get() igen
	    end;    
	 end loop;
	 -- Kön
	 loop
	    begin	 
	       Put_Line("  Vänligen mata in biologiskt kön: ");
	       Put_Line("    1. Man");
	       Put_Line("    2. Kvinna");
	       Put("  Gör ditt val (1-2): ");
	       Get(iTmpGender);
	       exit when iTmpGender = 1 or iTmpGender = 2;
	       Put_Line("  Det blev fel. Matade du in 1 eller 2? Försök igen.");
	    exception
	       when Data_Error => -- När Data_Error fås
		  Put_Line("  Det blev fel. Matade du in 1 eller 2? Skrev du in ett nummer? Försök igen.");
		  Skip_Line; -- Rensa input så bufferten är tom när man callar Get() igen	       
	    end;    
	 end loop;
	 if iTmpGender = 1 then
	    Item.isBioMale := True;
	    Put_Line("    Du valde alternativ 1: Man.");
	 elsif iTmpGender = 2 then
	    Item.isBioMale := False;
	    Put_Line("    Du valde alternativ 2: Kvinna.");
	 end if;
	 -- Vikt
	 loop
	    begin
	       Put("  Vänligen mata in vikt: ");
	       Get(Item.Weight);
	       -- Gå ut ur loopen endast om vi får som vi vill.
	       exit when Item.Weight >= 0.0;
	       Put_Line("  Det blev fel. Hjälten måste väga minst 0 kilogram. Försök igen.");
	    exception
	       when Data_Error => -- När Data_Error fås
		  Put_Line("  Det blev fel. Skrev du in ett nummer? Försök igen.");
		  Skip_Line; -- Rensa input så bufferten är tom när man callar Get() igen
	    end;    
	 end loop;	 
	 -- Hårfärg
	 Put("  Vänligen mata in en hårfärg: ");
	 Get(Item.HairColor);
      end Get;
      
      procedure Put(Item: in String_Type) is
	 iLoopCounter: Integer;
         begin	
	    iLoopCounter := Item.Length;
	    -- Skriv ut värden från arrayen, från 1 till .Length (iLoopCounter)
	    for I in 1..iLoopCounter loop
	       Put(Item.Char_Array(I));
	    end loop;    
	 end Put;
      
      procedure Put(Item: in Hero_Type) is
         begin
	    Put_Line("> Put");
	    -- Skriv ut värden från arrayen, från 1 till .Length (iLoopCounter)
	    Put_Line("Hjältedata: ");
	    Put("  Namn: ");
	    -- Namn
	    Put(Item.Name);
	    New_Line;
	    -- Ålder
	    Put("  Ålder: ");
	    Put(Item.Age, Width=>0);
	    New_Line;
	    -- Kön
	    Put("  Kön: ");
	    if Item.isBioMale then
	       Put("Man");
	    else
	       Put("Kvinna");
	    end if;
	    New_Line;
	    -- Ålder
	    Put("  Vikt: ");
	    Put(Item.Weight, Fore=>0,Aft=>0,Exp=>0);
	    Put("kg");
	    New_Line;	 
	    -- Hårfärg	    
	    Put("  Hårfärg: ");
	    Put(Item.HairColor);
	 end Put;   
	 
   -- Variabler
   Hero: Hero_Type;
   
begin
   
   Get(Hero);
   Put(Hero);
   
end dataStructures;
