with Ada.Text_IO;               use Ada.Text_IO;
with Ada.Integer_Text_IO;       use Ada.Integer_Text_IO;
with String_Handling;           use String_Handling;
with Hero_Handling;             use Hero_Handling;

package body Sorted_Hero_List is
   
   function Empty(Item: in Node_Pointer) return Boolean is
      begin
	 return Item = null;
      end Empty;
      
   procedure Insert(Item: in out Node_Pointer; Hero: in Hero_Type; Age: in Integer) is
      procedure InsertFirst(Item: in out Node_Pointer; Hero: in Hero_Type) is
	 Tmp : Node_Pointer;
         begin
  	    if Empty(Item) then
	       Tmp := new Node_Type;
	       Tmp.Data := Hero;
	       Tmp.Next := Item;
	       Item := Tmp;
  	    end if;
         end InsertFirst;	 
      begin
  	 if Empty(Item) then
  	    InsertFirst(Item, Hero);
	 elsif Age < GetAge(Item.Data) then
	    InsertFirst(Item, Hero);
	 else
	    Insert(Item.Next, Hero, Age);
  	 end if;
      end Insert;
      
   procedure Put(Item: in Node_Pointer) is
      begin
         if not Empty(Item) then
  	    Put(Item.Data);
  	    New_Line;
  	    Put(Item.Next);
	 else
	    New_Line;
	    Put_Line("Det finns inga fler hjältar.");
  	 end if;
      end Put;     

   function Length(Item: in Node_Pointer) return Integer is
      begin
  	 if Empty(Item) then
  	    return 0;
  	 end if;
  	 return 1 + Length(Item.Next);
      end Length;
      
   function Member(Item: in Node_Pointer; Age: in Integer) return Boolean is
      begin
  	 if Empty(Item) then
  	    return False;
  	 elsif Age = GetAge(Item.Data) then
  	    return True;
  	 end if;
  	 return Member(Item.Next, Age);
      end Member;
      
   procedure Free is new Ada.Unchecked_Deallocation(Node_Type, Node_Pointer);
      
   procedure Remove(Item: in out Node_Pointer; Age: in Integer) is
      Tmp : Node_Pointer;
      begin
  	 if not Empty(Item) then
  	    if Age = GetAge(Item.Data) then
  	       Tmp := Item.Next;
  	       Free(Item);
  	       Item := Tmp;
  	    else
  	       Remove(Item.Next, Age);
  	    end if;
  	 end if;
      end Remove;
      
   procedure Delete(Item: in out Node_Pointer) is
      begin
  	 if not Empty(Item) then
  	    Delete(Item.Next);
  	    Free(Item);
  	 end if; 
      end Delete;
      
   function Find(Item: in Node_Pointer; Age: in Integer) return Hero_Type is
      begin
   	 if not Empty(Item) then
  	    if Age = GetAge(Item.Data) then
  	       return Item.Data;
  	    else
  	       return Find(Item.Next, Age);
  	    end if;
   	 end if;
  	 raise Constraint_Error;
      end Find;
       
   procedure Find(Item: in Node_Pointer; Age: in Integer; Result : out Hero_Type) is	 
      begin
      	 Result := Find(Item, Age);
      end Find;

end Sorted_Hero_List;
