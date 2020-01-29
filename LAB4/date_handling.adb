with Ada.Text_IO;		use Ada.Text_IO;

package body Date_Handling is
   type Month_Arr is
     array(1..12) of Integer;
   
   Days_Per_Month : constant Month_Arr := (31,28,31,30,31,30,31,31,30,31,30,31);
   
   --  function Days_Per_Month(Item : in Integer) return Integer is
   --  begin
      
   --     case Item is
   --  	 when 2 => 
   --  	    return 28;
   --  	 when 4 | 6 | 9 | 11 =>
   --  	    return 30;
   --  	 when others => 
   --  	    return 31;
   --     end case;
   --  end Days_Per_Month;
   
   procedure Get(Time: out Time_Type) is    
      sInput: String(1..10) := (others => ' ');
      bIsDayValid, bIsMonthValid, bIsYearValid: Boolean := False;
      iYear, iMonth, iDay, iDayAmount, iStringLength : Integer := 0;
      begin
	 --Put_Line("> Get");      
	 loop
	    begin
	       Get_Line(sInput, iStringLength);
	       
	       -- Om det finns mindre än 10 karaktärer, eller om det saknas bindesstreck på minst ett ställe
	       if iStringLength <= 9 then
		  raise Constraint_Error;
	       end if;	  	       
	       
	       if Character'Pos(sInput(5)) /= 45 or Character'Pos(sInput(8)) /= 45 then
		  raise Format_Error;
	       end if;

	       iYear := Integer'Value(sInput(1..4));	
	       iMonth := Integer'Value(sInput(6..7));	     		    	
	       iDay := Integer'Value(sInput(9..10));
	       
	       -- År
	       if iYear >= 1 then
		  bIsYearValid := True;
	       end if;	       
	       
	       -- Månad
	       if iMonth >= 1 and iMonth <= 12 then
		  bIsMonthValid := True;
	       end if;
	       
	       -- Dag
--	       if IDay > Days_Per_Month(IMonth) or iDay < 1 then
	       
	       --if iDay >= 1 and iDay <= 31 then
		  case iMonth is
		     when 2 => 
			iDayAmount := 28;
		     when 4 | 6 | 9 | 11 =>
			iDayAmount := 30;
		     when others => 
			iDayAmount := 31;
		  end case;
		  if iDay <= IDayAmount then
		     bIsDayValid := True;
		  end if;
	       --end if;
	       
	       -- Rimlighetskontroll
	       if bIsYearValid then
		  if bIsMonthValid then
		     if bIsDayValid then
			-- Gå ut ur loopen när vi fått som vi vill.
			exit;
		     else
			-- bIsDayValid var inte True
			raise Format_Error_Day;
		     end if;
		  else
		     -- bIsMonthValid var inte True
		     raise Format_Error_Month;
		  end if;
	       else
		  -- bIsYearValid var inte True
		  raise Format_Error_Year;
	       end if;		  

	    end;    
	 end loop;	 
	 Time.Y := iYear;
	 Time.M := iMonth;
	 Time.D := iDay;
      end Get;
   procedure Put(Time: in Time_Type) is
      begin
	 --Put_Line("> Put");
	 Put(Time.Y, Width=>0);
	 Put('-');
	 if Time.M < 10 then
	    Put('0');
	 end if;	 
	 Put(Time.M, Width=>0);
	 Put('-');
	 if Time.D < 10 then
	    Put('0');
	 end if;	 
	 Put(Time.D, Width=>0);
      end Put;    
   function Next_Date(Time: in Time_Type) return Time_Type is
      iDayAmount, iTmpDay, iTmpMonth, iTmpYear : Integer;
      TimeNew : Time_Type;
      begin
         --New_Line;
	 --Put_Line("> Next_Date"); 
	 --  Time.D := Time.D + 1;
	 --  if Time.D > Days_Per_Month(Time.M) then
	 --     Time.D := 1;
	 --     Time.M := Time.M + 1;
	 --     if Time.M = 13 then
	 --        Time.M := 1;
	 --        Time.Y := Time.Y + 1;
	 --     end if;
	 --  end if;
	 case Time.M is
	    when 1 | 3 | 5 | 7 | 8 | 10 | 12 => 
	       iDayAmount := 31;
	    when 2 => -- Feb
	       iDayAmount := 28;
	    when others => -- Dec
	       iDayAmount := 30;
	 end case;
	 
	 iTmpDay := Time.D;
	 iTmpMonth := Time.M;
	 iTmpYear := Time.Y;
	 
	 if Time.D /= iDayAmount then 
	    iTmpDay := iTmpDay + 1;
	 else
	    if Time.M /= 12 then
	       iTmpDay := 1;
	       iTmpMonth := iTmpMonth + 1;
	    else
	       iTmpDay := 1;
	       iTmpMonth := 1;
	       iTmpYear := iTmpYear + 1;
	    end if;
	 end if;
	 
	 TimeNew.D := iTmpDay;
	 TimeNew.M := iTmpMonth;
	 TimeNew.Y := iTmpYear;  
	 
	 return TimeNew;
      end Next_Date;
      function Previous_Date(Time: in Time_Type) return Time_Type is
	 iDayAmount, iTmpDay, iTmpMonth, iTmpYear : Integer;
	 TimeNew: Time_Type;
         begin
         --New_Line;
	 --Put_Line("> Previous_Date");
	 
	 iTmpDay := Time.D;
	 iTmpMonth := Time.M;
	 iTmpYear := Time.Y;
	 
	 if Time.D = 1 then 
	    iTmpMonth := iTmpMonth - 1;
	    case iTmpMonth is
	       when 2 => 
		  iDayAmount := 28;
	       when 4 | 6 | 9 | 11 =>
		  iDayAmount := 30;
	       when others => 
		  iDayAmount := 31;
	    end case;	      
	    iTmpDay := iDayAmount;
	    if Time.M = 1 and Time.D = 1 then
	       iTmpDay := iDayAmount;
	       iTmpMonth := 12;
	       iTmpYear := iTmpYear - 1;
	    end if;
	 else
	    iTmpDay := iTmpDay - 1;
	 end if;
	 
	 TimeNew.D := iTmpDay;
	 TimeNew.M := iTmpMonth;
	 TimeNew.Y := iTmpYear;    
	 
	 return TimeNew;
      end Previous_Date;
   function "<"(Left, Right: in Time_Type) return Boolean is
   begin
      -- L < R
         -- If left year is smaller than right year, pass true
         if Left.Y < Right.Y then
	    return True;
	 -- If left year is bigger than right year, pass false
	 elsif Left.Y > Right.Y then
	    return False;
	 -- In other cases where the year is insignificant
	 else
	    if Left.M = Right.M and Left.D < Right.D then
	       return True;
	    end if;
	    if Left.M < Right.M then
	       return True;
	    end if;	    
	 end if;	 
	 return False;
      end "<";	
   function ">"(Left, Right: in Time_Type) return Boolean is
   begin
      -- L > R
      -- R < L
      -- return R < L;
         -- If left year is smaller than right year, pass true
         if Left.Y > Right.Y then
	    return True;
	 -- If left year is bigger than right year, pass false
	 elsif Left.Y < Right.Y then
	    return False;
	 -- In other cases where the year is insignificant
	 else
	    if Left.M = Right.M and Left.D > Right.D then
	       return True;
	    end if;
	    if Left.M > Right.M then
	       return True;
	    end if;	    
	 end if;	 
	 return False;
      end ">";
   function "="(Left, Right: in Time_Type) return Boolean is
      begin
	 return Left.Y = Right.Y and Left.M = Right.M and Left.D = Right.D;
      end "=";
   --  function "-"(Left, Right: in Time_Type) return Integer is
   --     begin
   --        if Left.D > Right.D then
   --  	    return Left.D - Right.D;
   --  	 else
   --  	    return Right.D - Left.D;
   --  	 end if;
   --     end "-";   
end Date_Handling;
