-- in Natural
-- return Positive is
   function fFactorial(iA: in Integer) return Integer is
   begin
      -- Basfall. Här ska inget hända
      if iA = 0 then
   	 return 1;
      else
         -- Rekursiv funktion. Beräknar faktulitet. Stackar (t.ex. 5 * fak(5-1), då loopas det matematiskt tills rätt värde uppnås)
      	 return iA * fFactorial(iA-1);
      end if;
   end fFactorial;
   
-- Iterativt. Same but different
   --  Resultat : Integer := 1;
--      for I in 1..IA loop
--         Resultat := Resultat * IA;
--      end loop;
