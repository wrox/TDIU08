package Sorted_List is
   type Node_Pointer is private;

   function Empty(List : in Node_Pointer) return Boolean;
   procedure Insert(List : in out Node_Pointer; Input : in Integer);
   procedure Put(List : in Node_Pointer);
   function Length(List : in Node_Pointer) return Integer;
   function Member(List : in Node_Pointer; SearchString : in Integer) return Boolean; 
   procedure Remove(List : in out Node_Pointer; SearchString : in Integer);
   procedure Delete(List : in out Node_Pointer);
   function Find(List : in Node_Pointer; SearchString : in Integer) return Integer;
   procedure Find(List : in Node_Pointer; SearchString : in Integer; Result : out Integer);   

   --Format_Error : exception;

private
   type Node_Type;
   type Node_Pointer is access Node_Type;
   type Node_Type is
      record
	 Data : Integer;
	 Next : Node_Pointer;
      end record;

end Sorted_List;
