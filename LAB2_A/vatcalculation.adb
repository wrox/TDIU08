with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;

procedure vatCalculation is
   
   -- Globala konstanter. Pga kan inte ändras.
   FirstPrice : constant Integer := 1;
   LastPrice : constant Integer := 2;
   Steps : constant Integer := 3;
   VatPercentage : constant Integer := 4;
   
   -- Array declaration. Det enda som får vara globalt.
   type Arr5_Type is array (1..5) of Float;
   
   -- Procedurer
   procedure pIn(sDataType: in String; Item: out Arr5_Type; iPos: in Integer) is

     begin
	 loop
	    
	    begin
	       -- Loopa vår datatyp
	       loop
		  -- "Första pris" (string från huvudprogrammet)
		  Put(sDataType);
		  -- Ta output, spara enl. index i array Item
		  Get(Item(iPos));
		  -- Kolla om värdet är mer än 0 eller mindre än 100
		  case iPos is
		     -- Sista pris
		     when LastPrice => 
			exit when Item(LastPrice) > 0.0 and Item(LastPrice) >= Item(FirstPrice);
			   Put("Sista priset måste vara minst 0.0, och större än första priset. Försök igen.");
		     -- Steg
		     when Steps =>
			exit when Item(Steps) > 0.0 and Item(Steps) <= (Item(LastPrice)-Item(FirstPrice));
			   Put("Steget måste vara minst 0.0, och får inte vara större än ");
			   Put(Item(LastPrice)-Item(FirstPrice), Fore=>0, Aft=>0, Exp=>0);
			   Put(". Försök igen.");
		     -- Momsprocent
		     when VatPercentage =>
			exit when Item(VatPercentage) >= 0.0 and Item(VatPercentage) <= 100.0;
			   Put("Momsprocent måste vara i intervallet 0.0-100.0");
		     when others =>
			exit when Item(iPos) > 0.0;
			   Put("Värdet måste vara minst 0.0. Försök igen.");		
		     end case;
		  New_Line;
	    
	       end loop;
	       exit; -- (Break) exit, då vi är i en loop (pga exception)
	       
	    exception
	       when Data_Error => -- När Data_Error fås
				  -- Return...
	       Put("Det blev fel. Skrev du in det som efterfrågades? Försök igen.");
	       Skip_Line; -- Rensa input så att bufferten är tom när man kommer tillbaka till Get()
	       New_Line;
	       
	    end;	    
	 end loop;

   end pIn;
      
   procedure pOut(Item: in out Arr5_Type) is
      fVatDecimal, fRows: Float;
      iRows: Integer;
      
      procedure pPrint(Item: in out Arr5_Type) is
	 
         begin
	    -- Momsmängd = Decimal * första pris
	    Item(5) := fVatDecimal * Item(FirstPrice);
	    
	    New_Line;
	    Put(Item(FirstPrice), Fore=>5, Aft=>2, Exp=>0);
	    Put(Item(5), Fore=>8, Aft=>2, Exp=>0);
	    Put(Item(FirstPrice) + Item(5), Fore=>7, Aft=>2, Exp=>0);
	    
	    -- Sätt nytt första pris. Första pris + steg
	    Item(FirstPrice) := Item(FirstPrice) + Item(Steps);	
	 end pPrint;
	 
      begin   
	 -- Få decimal från momsprocent en gång genom att dela samma med 100.0 för framtida beräkningar
	 fVatDecimal := Item(VatPercentage) / 100.0;
	 -- Titelheader
	 New_Line;
	 Put("=== Momstabell ===");
	 New_Line;
	 Put("Pris utan moms Moms Pris med moms");
	 
	 -- (Första pris - Sista pris) / Steg
	 fRows := ((Item(LastPrice) - Item(FirstPrice)) / Item(Steps));
	 -- Avrunda till närmsta floor (finns ceiling, rounding)
	 iRows := Integer(Float'Floor(fRows));
      	 for I in 1..iRows loop
	    pPrint(Item);
	 end loop;
	 
   end pOut;   
      
   -- Variabler
   -- Deklarera arraytypen, i variabelform
   iSumArray: Arr5_Type;
   
begin
   
   -- String, arraynamn, index, (rimlighetsvärde)
   pIn("Första pris: ", iSumArray, FirstPrice);
   pIn("Sista pris: ", iSumArray, LastPrice);
   pIn("Steg: ", iSumArray, Steps);
   pIn("Momsprocent: ", iSumArray, VatPercentage);
   
   pOut(iSumArray);

end vatCalculation;
