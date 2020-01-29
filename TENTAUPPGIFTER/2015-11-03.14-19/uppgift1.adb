with Ada.Text_IO;               use Ada.Text_IO;
with Ada.Integer_Text_IO;       use Ada.Integer_Text_IO;

procedure uppgift1 is
   
   type RegNo_Type is
     array (1..5) of String(1..6);
   
   type Weight_Type is
     array (1..5) of Integer;
   
   type Trash_Type is
     array (1..5) of String(1..32);
   
   procedure Get(RegNo : out RegNo_Type; Weight : out Weight_Type; Trash : out Trash_Type) is
      Last : Integer;
      begin
	 for I in 1..RegNo'Last loop
	    Get(RegNo(I));
	    Get(Weight(I));
	    Get_Line(Trash(I), Last);
	    Trash(I)(Last+1 .. Trash(I)'Last) := (others => ' ');
	 end loop;
      end Get;
      
   function CalculateIndex(RegNo : in RegNo_Type; Weight : in Weight_Type) return Integer is
      iCompare : Integer := 0;
      Index : Integer;
      begin
	 for I in 1..RegNo'Last loop
	    if iCompare < Weight(I) then
	       iCompare := Weight(I);
	       Index := I;
	    end if;
	 end loop;
	 return Index;
      end CalculateIndex;   
     
   RegNo : RegNo_Type;
   Weight : Weight_Type;
   Trash : Trash_Type;
   
begin
     
   Put_Line("Mata in fem bilar: ");
   Get(RegNo, Weight, Trash);
   Put("Tyngsta bilen var ");
   Put(RegNo(CalculateIndex(RegNo, Weight)));     
   Put(" som väger ");
   Put(Weight(CalculateIndex(RegNo, Weight)), Width=>0);  
   Put(" kg.");
      
   end uppgift1;
