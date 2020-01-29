with Ada.Text_IO;		use Ada.Text_IO;
with Ada.Integer_Text_IO;    use Ada.Integer_Text_IO;

procedure Fibonacci is
   function Fib(N: Integer) return Integer is
      begin
	 if N < 3 then
	    return 1;
	 else 
	    return Fib(N - 1) + Fib(N - 2);
	 end if;
      end Fib;
      
   iLoopCount: Integer := 1; 
   
   begin
      Put("Fibonacci-tal från Fib(");
      Put(ILoopCount, Width=>0);
      Put("): ");
      loop
      	 Put(Fib(iLoopCount), Width=>0);
	 Put(' ');
      	 iLoopCount := iLoopCount + 1;
      	 exit when iLoopCount = 10;
      end loop;
      Put("...");
   end Fibonacci;
