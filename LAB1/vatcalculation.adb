with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;

procedure vatCalculation is
   
   FirstPrice, LastPrice, Steps, VatPercentage, VatDecimal, VatAmount: Float;
   Nollett : Float := 0.1;
   
begin
   Put(Nollett, Aft => 10, Exp => 0);
   New_Line(3);
   -- Loopa tills vi får det vi vill ha.
   loop
      
      -- Isolera undantaget till denna begin/end
      begin
	 
	 -- Första pris, sista pris
	 loop
	    Put("Första pris: ");
	    Get(FirstPrice);
	    Put("Sista pris: ");
	    Get(LastPrice);
	    if LastPrice <= FirstPrice then       
	       Put("Sista priset kan inte vara lägre än första priset. Skriv in ett nytt första eller sista pris: "); 
	       Skip_Line;
	       New_Line;
	    elsif LastPrice >= FirstPrice then
	       exit;
	    end if;
	 end loop;
	 -- Steg
	 loop
	    Put("Steg: ");
	    Get(Steps);
	    if Steps < 0.0 or Steps >= LastPrice then
	       Put("Stegen måste vara minst 0.0 och mindre än sista priset.");
	       Skip_Line;
	       New_Line;
	    elsif Steps > 0.0 then
	       exit;
	    end if;
	 end loop;
	 -- Momsprocent
	 loop
	    Put("Momsprocent: ");
	    Get(VatPercentage);	    
--	    if VatPercentage > 100.0 or VatPercentage <= 0.0 then
	    
	    if VatPercentage < 100.1 then
	       exit;
	    end if;
	    Put("Momsprocenten måste vara i intervallet 0.0-100.0.");
	    Skip_Line;
	    New_Line;
	 end loop;
	 exit; -- (Break) Exit

	 -- Vid exception
      exception   
	 when Data_Error => -- När Data_Error fås
			    -- Return...
	    Put("Det blev fel. Skrev du in det som efterfrågades? Försök igen.");
	    Skip_Line; -- Rensa input så att bufferten är tom när man kommer tillbaka till Get()
	    New_Line;
      end;
      
   end loop; -- Slutför loopen.
   
   New_Line;
   
   -- Få decimal genom att dela momsprocent med 100.0
   VatDecimal := VatPercentage / 100.0;
   
   -- Titelheader
   Put("=== Momstabell ===");
   New_Line;
   Put("Pris utan moms Moms Pris med moms");
   New_Line;
   
   while FirstPrice <= LastPrice loop
      -- Momsmängd * första pris
      VatAmount := VatDecimal * FirstPrice;
      
      -- Flera mellanrum (ny lösning?)
      Put("     ");
      -- Första pris
      Put(FirstPrice, Fore=>0, Aft=>2, Exp=>0);
      -- Flera mellanrum (ny lösning?)
      Put("     ");
      -- Moms
      Put(VatAmount, Fore=>0, Aft=>2, Exp=>0);
      -- Flera mellanrum (ny lösning?)
      Put("     ");
      -- Pris med moms
      Put(FirstPrice + VatAmount, Fore=>0, Aft=>2, Exp=>0);
      
      -- Sätt nytt första pris
      FirstPrice := FirstPrice + Steps;
      -- Ny linje
      New_Line;
   end loop;
end vatCalculation;
