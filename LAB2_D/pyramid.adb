with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;     
with Ada.Numerics.Discrete_Random; 

procedure pyramid is
   
   function fRandomize return Integer is
      subtype subtypeRange is
	 -- Alfabetet enligt ASCII.
	 Integer range 65..90;
   
      package packageName is
	 new Ada.Numerics.Discrete_Random(subtypeRange);
	 
      use packageName;
      
      G: Generator;
	 
      begin
         Reset(G);
	 return Random(G);	 
      end fRandomize;
      
   procedure pPrintSpace(Item: in Integer; bNewLine: in Boolean) is
      begin
         if bNewLine = true then
	     New_Line;
	 end if;	    
	 for I in -1..Item loop
	    Put(' ');
	 end loop;
      end pPrintSpace;   
      
   procedure pPrintSymbol(iSymbolSpaceCount: in Integer) is
      begin
         pPrintSpace(iSymbolSpaceCount, true);
	 Put("   -_  |  _-");
	 pPrintSpace(iSymbolSpaceCount, true);  
	 Put("_ _ // . \\ _ _");
	 pPrintSpace(iSymbolSpaceCount, true);   
	 Put("   _\\ "" //_   ");
	 pPrintSpace(iSymbolSpaceCount, true);
	 Put("    -  |  -");
	 pPrintSpace(iSymbolSpaceCount, true);
	 Put("   _________");
	 New_Line;
      end pPrintSymbol;   
      
      procedure pPrint(iRowCount: in Integer; iRowSize: in Integer) is
	 IRowSpaceCount, iRowSizeTmp: Integer;
         begin
	 -- Tilldela ny variabel från gammal
	 IRowSizeTmp := iRowSize;
	 -- Antal rader genom for loop	    
	 for i in 1..iRowCount loop -- Antal rader
	    -- För varje loop, gör spacecount minus numret i loopen (i), t.ex. -1, -2, ..
	    iRowSpaceCount := iRowCount - i;
	    
	    pPrintSpace(iRowSpaceCount, false);
	    Put('/');
	    for i in 1..iRowSizeTmp loop -- Hur många bokstäver det ska vara I EN RAD
	       Put(Character'Val(fRandomize));
	    end loop;
	    -- Lägg till två bokstäver efter att en rad har skrivits ut
	    iRowSizeTmp := iRowSizeTmp + 2;
	    -- Avsluta raden
	    Put('\');
	    New_Line;
      	 end loop;
      end pPrint;
     
   iRowCount, iRowSize, iSymbolSpaceCount: Integer;
   
begin
   Put("Ange pyramidens storlek: ");
   Get(iRowCount);

   iSymbolSpaceCount := iRowCount - 3; -- Definiera antal mellanrum före symbolen på pyramidens topp.
   iRowSize := 9; -- Definiera default bokstavsmängd per rad.
   
   pPrintSymbol(iSymbolSpaceCount);
   pPrint(iRowCount, iRowSize);
end pyramid;
