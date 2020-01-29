with Ada.Text_IO;               use Ada.Text_IO;
with Ada.Integer_Text_IO;       use Ada.Integer_Text_IO;
with Ada.Unchecked_Deallocation;

package body Sorted_List is
   
   function Empty(List : in Node_Pointer) return Boolean is
      begin
	 return List = null;
      end Empty;
      
   procedure Insert(List : in out Node_Pointer; Input : in Integer) is
      procedure InsertProcess(List : in out Node_Pointer; Input : in Integer) is
	 Tmp : Node_Pointer;
         begin
	    Tmp := new Node_Type;
	    Tmp.Data := Input;
	    Tmp.Next := List;
	    List := Tmp; 
	    --List := new Node_Type'(Tmp, Input);
         end InsertProcess;
      begin
	 if Empty(List) then
	    InsertProcess(List, Input);
	 elsif Input < List.Data then
	    InsertProcess(List, Input);
	 elsif Input /= List.Data then
	    Insert(List.Next, Input);
	 end if;
      end Insert;
      
   procedure Put(List : in Node_Pointer) is
      begin
         if not Empty(List) then
	    Put(List.Data, Width=>0);
	    New_Line;
	    Put(List.Next);
	 end if;
      end Put;
      
   function Length(List : in Node_Pointer) return Integer is
      begin
	 if Empty(List) then
	    return 0;
	 end if;
	 return 1 + Length(List.Next);
      end Length;
      
   function Member(List : in Node_Pointer; SearchString : in Integer) return Boolean is
      begin
	 if Empty(List) then
	    return False;
	 elsif List.Data = SearchString then
	    return True;
	 end if;
	 return Member(List.Next, SearchString);
      end Member;
      
   procedure Free is new Ada.Unchecked_Deallocation(Node_Type, Node_Pointer);
      
   procedure Remove(List : in out Node_Pointer; SearchString : in Integer) is
      Tmp : Node_Pointer;
      begin
	 if not Empty(List) then
	    if List.Data = SearchString then
	       Tmp := List.Next;
	       Free(List);
	       List := Tmp;
	    else
	       Remove(Item.Next, Input);
	    end if;
	 end if;
      end Remove;
   
   procedure Delete(List : in out Node_Pointer) is
      begin
	 if not Empty(List) then
	    Delete(List.Next);
	    Free(List);
	 end if; 
      end Delete;
      
   function Find(List : in Node_Pointer; SearchString : in Integer) return Integer is
      begin
   	 if not Empty(List) then
	    if List.Data = SearchString then
	       return List.Data;
	    else
	       return Find(List.Next, SearchString);
	    end if;
   	 end if;
	 raise Constraint_Error;
      end Find;
       
   procedure Find(List : in Node_Pointer; SearchString : in Integer; Result : out Integer) is	 
      begin
      	 Result := Find(List, SearchString);
      end Find;

end Sorted_List;
