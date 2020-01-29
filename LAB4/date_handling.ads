with Ada.Integer_Text_IO;		use Ada.Integer_Text_IO;	

package Date_Handling is
   type Time_Type is private;

   procedure Get(Time: out Time_Type);
   procedure Put(Time: in Time_Type);
   function Next_Date(Time: in Time_Type) return Time_Type;
   function Previous_Date(Time: in Time_Type) return Time_Type;
   function "<"(Left, Right: in Time_Type) return Boolean;
   function ">"(Left, Right: in Time_Type) return Boolean;
   function "="(Left, Right: in Time_Type) return Boolean;
   --function "-"(Left, Right: in Time_Type) return Integer;
   
   Format_Error, Format_Error_Day, Format_Error_Month, Format_Error_Year : exception; -- Fånga ev. format_errors från time_handling.adb

   private
      -- Exempel på recordimplementering
      type Time_Type is
	 record
	    Y, M, D: Integer;
	 end record;
      -- Exempel på arrayimplementering
      --type Time_type is
      --	array (1..3) of Integer;
end Date_Handling;
