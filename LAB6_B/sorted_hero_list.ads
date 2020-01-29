with Hero_Handling;            use Hero_Handling;
with Ada.Unchecked_Deallocation;

package Sorted_Hero_List is
   type Node_Pointer is private;

   function Empty(Item: in Node_Pointer) return Boolean;
   procedure Insert(Item: in out Node_Pointer; Hero: in Hero_Type; Age: in Integer);
   procedure Put(Item: in Node_Pointer);
   function Length(Item: in Node_Pointer) return Integer;
   function Member(Item: in Node_Pointer; Age: in Integer) return Boolean; 
   procedure Remove(Item: in out Node_Pointer; Age: in Integer);
   procedure Delete(Item: in out Node_Pointer);
   function Find(Item: in Node_Pointer; Age: in Integer) return Hero_Type;
   procedure Find(Item: in Node_Pointer; Age: in Integer; Result: out Hero_Type); 
  

   --Format_Error : exception;

private
   type Node_Type;
   type Node_Pointer is access Node_Type;
   type Node_Type is
      record
	 Data: Hero_Type;
	 Next: Node_Pointer;
      end record;

end Sorted_Hero_List;
