with Ada.Text_IO;		use Ada.Text_IO;
with Ada.Integer_Text_IO;       use Ada.Integer_Text_IO;
with Date_Handling;             use Date_Handling;

procedure getDate is
   
   procedure checkOutput(Item: out Time_Type; sString: in String) is         
      begin
	 loop
	    begin   
	       Put(sString);
	       Get(Item);
	       exit;
	    exception
	       when Constraint_Error =>
		  Put_Line("Felaktig inmatning. Datum måste anges i formatet: ÅÅÅÅ-MM-DD");
	       when Format_Error =>
		  Put_Line("Felaktig inmatning. Datum måste anges i formatet: ÅÅÅÅ-MM-DD");
		  Skip_Line; -- Rensa input så bufferten är tom när man callar Get() igen
	       when Format_Error_Day =>
		  Put_Line("Felaktig inmatning. Dag måste vara i rätt intervall för månaden som angetts.");
		  Skip_Line; 
	       when Format_Error_Month =>
		  Put_Line("Felaktig inmatning. Månad måste vara i intervallet 01-12.");
		  Skip_Line;
	       when Format_Error_Year =>
		  Put_Line("Felaktig inmatning. År måste börja på minst 1.");
		  Skip_Line;	  
	    end;    
	 end loop;  	    
      end checkOutput;
      
   -- Variabler
   Date, SecondaryDate : Time_Type;       
   iCounter : Integer := 0;
      
   begin
       
      
      checkOutput(Date, "Mata in dagens datum (ÅÅÅÅ-MM-DD): ");
      
      Put("  Inslaget datum: ");
      Put(Date);
      Put_Line(".");
      Put("  Nästa datum: ");
      Put(Next_Date(Date));
      Put_Line(".");
      Put("  Föregående datum: ");
      Put(Previous_Date(Date));
      Put_Line(".");
      
      Skip_Line;
      New_Line;
      checkOutput(SecondaryDate, "Mata in ett annat datum (ÅÅÅÅ-MM-DD): ");      
      Put("  Är ");
      Put(Date);
      Put(" mindre än ");
      Put(SecondaryDate);
      Put("? ");      
      if Date < SecondaryDate then
	 Put_Line("Ja.");
      else
	 Put_Line("Nej.");
      end if;
      Put("  Är ");
      Put(Date);
      Put(" större än ");
      Put(SecondaryDate);
      Put("? ");
      if Date > SecondaryDate then
	 Put_Line("Ja.");
      else
	 Put_Line("Nej.");
      end if;    
      Put("  Är ");
      Put(Date);
      Put(" lika med ");
      Put(SecondaryDate);
      Put("? ");
      if Date = SecondaryDate then
	 Put("Ja.");
      else
	 Put("Nej.");
      end if;          
      
      New_Line(2);
      
      Put("Det andra datumet är ");  
      while Date < SecondaryDate loop
	 Date := Next_Date(Date);
	 iCounter := iCounter + 1;
      end loop;
      
      Put(iCounter, Width=>0);
      Put(" dag");
      if iCounter /= 1 then
	 Put("ar");
      end if;
      if Date < SecondaryDate then
	 Put(" efter ");
      else
	 Put(" innan ");
      end if;         
      Put("det första.");
      
      
   end getDate;
