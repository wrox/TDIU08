with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;

procedure Kamorfs is

	iRedKamorfs, iGreenKamorfs, iBlueKamorfs, iBlackKamorfs, IYears, ICount67, ICount101, ICount199: Integer;

begin

   Get(iYears);
   
   iRedKamorfs := 31;
   iBlueKamorfs := 6;
   iBlackKamorfs := 55;
   iGreenKamorfs := 104;   
   ICount67 := 0;
   ICount101 := 0;
   ICount199 := 0;
   
   for I in 2..iYears loop
      ICount67 := ICount67 + 1;
      ICount101 := ICount101 + 1;
      ICount199 := ICount199 + 1;
      IRedKamorfs := IRedKamorfs + 1;
      IGreenKamorfs := IGreenKamorfs + 1;
      
      if iCount67 = 67 then
         ICount67 := 0;
         IRedKamorfs := IBlueKamorfs;
         IBlueKamorfs := IBlackKamorfs;
         IBlackKamorfs := IGreenKamorfs;
         IGreenKamorfs := 0;
      elsif iCount101 = 101 then
         ICount101 := 0;
         IGreenKamorfs := IBlackKamorfs;
         IBlackKamorfs := IBlueKamorfs;
         IBlueKamorfs := IRedKamorfs;
         IRedKamorfs := 0;
      elsif iCount199 = 199 then
         ICount199 := 0;
         IBlueKamorfs := IRedKamorfs;
         IRedKamorfs := IBlackKamorfs;
	          IBlackKamorfs := IGreenKamorfs;
         IGreenKamorfs := IBlueKamorfs;
      end if;
   end loop;

   Put("År ");
   Put(iYears, 0);
   Put(" finns det ");
   Put(iRedKamorfs, 0);
   Put(" röda, ");
   Put(iBlueKamorfs, 0);
   Put(" blå, ");
   Put(iBlackKamorfs, 0);
   Put(" svarta och ");
   Put(iGreenKamorfs, 0);
   Put(" gröna kamorfer.");

end Kamorfs;

