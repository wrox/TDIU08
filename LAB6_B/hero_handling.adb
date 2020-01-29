with Ada.Text_IO;               use Ada.Text_IO;
with Ada.Integer_Text_IO;       use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;         use Ada.Float_Text_IO;
with String_Handling;           use String_Handling;

package body Hero_Handling is

   -- Kalla på Hero_Type här genom en procedur

   -- Gör funktion som returnerar int med hjältens ålder
   
   procedure Get(Item: out Hero_Type) is
      iLoopCounter, iTmpGender : Integer := 0;
      begin
	 Put_Line("##################################");
	 Put_Line("# Välkommen till hjälteskaparen. #");
	 Put_Line("##################################");       	 
	 -- Namn
	 Put("Ange ett namn för hjälten: ");
	 Get(Item.Name);
	 -- Ålder
	 loop
	    begin
	       Put("Hur gammal är individen? Ange ålder: ");
	       Get(Item.Age);
	       -- Gå ut ur loopen endast om vi får som vi vill.
	       exit when Item.Age >= 0;
	       Put_Line("Det blev fel. Hjälten måste minst 0 år gammal. Försök igen.");
	    exception
	       when Data_Error => -- När Data_Error fås
		  Put_Line("Det blev fel. Skrev du in ett nummer? Försök igen.");
		  Skip_Line; -- Rensa input så bufferten är tom när man callar Get() igen
	    end;    
	 end loop;
	 -- Kön
	 loop
	    begin	 
	       Put_Line("Vänligen mata in biologiskt kön: ");
	       Put_Line("  1. Man");
	       Put_Line("  2. Kvinna");
	       Put("Gör ditt val (1-2): ");
	       Get(iTmpGender);
	       exit when iTmpGender = 1 or iTmpGender = 2;
	       Put_Line("Det blev fel. Matade du in 1 eller 2? Försök igen.");
	    exception
	       when Data_Error => -- När Data_Error fås
		  Put_Line("Det blev fel. Matade du in 1 eller 2? Skrev du in ett nummer? Försök igen.");
		  Skip_Line; -- Rensa input så bufferten är tom när man callar Get() igen	       
	    end;    
	 end loop;
	 if iTmpGender = 1 then
	    Item.isBioMale := True;
	    Put_Line("  Du valde alternativ 1: Man.");
	 elsif iTmpGender = 2 then
	    Item.isBioMale := False;
	    Put_Line("  Du valde alternativ 2: Kvinna.");
	 end if;
	 -- Vikt
	 loop
	    begin
	       Put("Vänligen mata in vikt: ");
	       Get(Item.Weight);
	       -- Gå ut ur loopen endast om vi får som vi vill.
	       exit when Item.Weight >= 0.0;
	       Put_Line("Det blev fel. Hjälten måste väga minst 0 kilogram. Försök igen.");
	    exception
	       when Data_Error => -- När Data_Error fås
		  Put_Line("Det blev fel. Skrev du in ett nummer? Försök igen.");
		  Skip_Line; -- Rensa input så bufferten är tom när man callar Get() igen
	    end;    
	 end loop;	 
	 -- Hårfärg
	 Put("Vänligen mata in hårfärg: ");
	 Get(Item.HairColor);
      end Get;
      
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
      
   function GetAge(Item: in Hero_Type) return Integer is
      begin
	 return Item.Age;
      end GetAge;

end Hero_Handling;
