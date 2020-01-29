with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;

-------------------------------------------------------
   
procedure uppgift2 is  
   
   SpaceInt : constant Integer := 1;
   SpikeInt : constant Integer := 2;
   
   Spikes : constant Integer := 70;
   Rows : constant Integer := 20;
   Columns : constant Integer := 19;
   Spike : constant Character := '.';
   Space : constant Character := ' ';
   Edge : constant Character := '|';
   
   type RandomInt_Memory_Type is array (1..10) of Integer;
   subtype Dot_or_Space is Integer range 1..2;
   
   package Random_Package is
      new Ada.Numerics.Discrete_Random(Dot_Or_Space);
   
   use Random_Package;
   
   procedure DrawSpace(I : in Integer; RandomInt_Memory: out RandomInt_Memory_Type) is
      begin
	 Put(Space); -- Ajdå, det var en spik förra gången. Lägg en space.
	 RandomInt_Memory(I) := SpaceInt; -- Sätt ett space på plats I i minnesarrayen	 
      end DrawSpace;
      
   procedure DrawSpike(I : in Integer; RandomInt_Memory: out RandomInt_Memory_Type; SpikeCount, TotalSpikeCount : in out Integer) is
      begin
      	 if SpikeCount >= 5 or TotalSpikeCount >= (Spikes) then
	    DrawSpace(I, RandomInt_Memory);
	    SpikeCount := 0;
	 else
	    Put(Spike);
	    RandomInt_Memory(I) := SpikeInt; -- Sätt en spik på plats I i minnesarrayen
	    SpikeCount := SpikeCount + 1; -- Spikräknare
	    TotalSpikeCount := TotalSpikeCount + 1; -- Spikräknare
	 end if;
      end DrawSpike;
      
   
   G : Random_Package.Generator;
   OldRandomInt, RandomInt, TotalSpikeCount, SpikeCount : Integer := 0;
   RandomInt_Memory : RandomInt_Memory_Type;
begin
   
   for I in 1..Rows loop
      
      Put(Edge);
      Reset(G);
      
      -- VL
      for I in RandomInt_Memory'First..RandomInt_Memory'Last loop -- 1 till 10 (arrayens sista värde)
	 RandomInt := Random(G);
	 
	 if RandomInt = SpaceInt then -- Om 1
	    DrawSpace(I, RandomInt_Memory);
	 else -- Om 2
	    if RandomInt = OldRandomInt then -- Om nuvarande värde matchar förra värdet
	       DrawSpace(I, RandomInt_Memory);
	    else -- Om nuvarande värde INTE matchar förra värdet
	       DrawSpike(I, RandomInt_Memory, SpikeCount, TotalSpikeCount);
	    end if;
	 end if;
	 
	 OldRandomInt := RandomInt;
      end loop;
      
      -- HL
      for I in reverse RandomInt_Memory'First..(RandomInt_Memory'Last - 1) loop -- 1 till 9
	 RandomInt := RandomInt_Memory(I);
	 
	 if RandomInt = SpaceInt then -- Om 1
	    Put(Space);
	 else -- Om 2
	    Put(Spike);
	    SpikeCount := SpikeCount + 1; -- Spikräknare
	    TotalSpikeCount := TotalSpikeCount + 1; -- Spikräknare 
	 end if;
	 
	 OldRandomInt := RandomInt; 
      end loop;
      
      Put(Edge);
      New_Line;
      
   end loop;
   
   Put_Line("|   |WIN|   |WIN|   |");
   Put_Line("|___|___|___|___|___|");
   
   Put("Total spikes:" & Integer'Image(TotalSpikeCount));
   
end uppgift2;

