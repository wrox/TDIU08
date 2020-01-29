with Ada.Text_IO;		use Ada.Text_IO;
with Ada.Float_Text_IO;		use Ada.Float_Text_IO;
with Ada.Integer_Text_IO;	use Ada.Integer_Text_IO;

procedure fields is
   
   type Ten_Ints_Array_Type is array (1..10) of Integer;
   
   procedure Get(Ten_Ints_Array: out Ten_Ints_Array_Type) is
      begin
         for I in Ten_Ints_Array'Range loop
	    Put("Integer to save to slot ");
	    Put(I, Width=>0);
	    Put(": ");
	    Get(Ten_Ints_Array(I));
	 end loop;
      end Get;   
      
   procedure Put(Ten_Ints_Array: in Ten_Ints_Array_Type) is
      begin
         for I in Ten_Ints_Array'Range loop
	    Put("Outputting value in slot ");
	    Put(I, Width=>0);
	    Put(": ");	    
	    Put(Ten_Ints_Array(I), Width=>0);
	    New_Line;
	 end loop;
      end Put;
      
   procedure Find_Maximum(Ten_Ints_Array: in Ten_Ints_Array_Type) is
      iBiggestInteger, iBiggestIntegerSlot : Integer;
      begin
         New_Line;
         Put_Line("> Running procedure Find_Maximum...");  
	 iBiggestInteger := Ten_Ints_Array(1);
	 iBiggestIntegerSlot := Ten_Ints_Array'First;
	 for I in Ten_Ints_Array'Range loop
	    if iBiggestInteger < Ten_Ints_Array(I) then
	       iBiggestInteger := Ten_Ints_Array(I);
	       iBiggestIntegerSlot := I; 
	    end if;
	 end loop;
	 Put("The biggest integer in the array is ");
	 Put(iBiggestInteger, 0);
	 Put(". Its index value is ");
	 Put(IBiggestIntegerSlot, 0);
	 Put_Line(".");	 
      end Find_Maximum;

    procedure Reversed(Ten_Ints_Array: in out Ten_Ints_Array_Type) is
      type Tmp_Ten_Ints_Array_Type is array (1..10) of Integer;
      Tmp_Ten_Ints_Array: Tmp_Ten_Ints_Array_Type;
      IndexValue : Integer;
      begin
         New_Line;
         Put_Line("> Running procedure Reversed...");
         -- Börja på last value + 1 för att undvika att vi går till 0
         IndexValue := Ten_Ints_Array'Last + 1;
         for I in Ten_Ints_Array'Range loop
	    -- Börja på 10,
	    IndexValue := IndexValue - 1;	    
	    Tmp_Ten_Ints_Array(I) := Ten_Ints_Array(IndexValue);
	 end loop;	  
	 for I in Ten_Ints_Array'Range loop
	    Put("Outputting value in slot ");
	    Put(I, Width=>0);
	    Put(": ");	    	    
	    Ten_Ints_Array(I) := Tmp_Ten_Ints_Array(I);
	    Put(Ten_Ints_Array(I), Width=>0);
	    New_Line;
	 end loop;
      end Reversed;
      
   Ten_Ints_Array: Ten_Ints_Array_Type;
      
begin
   
   Get(Ten_Ints_Array);
   Put(Ten_Ints_Array);
   Find_Maximum(Ten_Ints_Array);
   Reversed(Ten_Ints_Array);
   
end fields;

