with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Uppgift1 is
   
   procedure NewEmail(Subject : in String; SubjectLength, ReplyCount, ReplyId : in Integer) is
      begin
         if ReplyId /= 3 then
	    New_Line;
	    Put("Nytt email: ");
	    if ReplyCount > 0 then
	       for I in 1..ReplyCount loop
		  Put("Re: ");
	       end loop;
	    end if;
	    Put_Line(Subject(Subject'First..SubjectLength));
	 end if;
      end NewEmail;
   
   Subject : String(1..32);
   Reply : String(1..3);
   SubjectLength, ReplyLength, ReplyCount, ReplyId : Integer := 0;
   IsReplyAccepted : Boolean := False;
begin
   Put("Mata in ämnesrad: ");
   Get_Line(Subject, SubjectLength);
   New_Line;
   NewEmail(Subject, SubjectLength, ReplyCount, ReplyId);
   loop
      if IsReplyAccepted then
	 NewEmail(Subject, SubjectLength, ReplyCount, ReplyId);
      end if;
      
      if ReplyId = 3 then
	 Skip_Line;
      end if;
      
      loop
	 Put("Vill du svara (ja/nej): ");
	 Get_Line(Reply, ReplyLength);
	 if Reply(1..2) = "ja" then
	    ReplyId := 1;
	 elsif Reply(1..3) = "nej" then
	    ReplyId := 2;
	 else
	    ReplyId := 3;
	 end if;
	 exit when ReplyId = 1 or ReplyId = 2 or ReplyId = 3;
      end loop;
      
      if ReplyId = 1 then
	 IsReplyAccepted := True;
	 ReplyCount := ReplyCount + 2;
      end if;
      
      exit when ReplyId = 2; -- exit when Nej
   end loop;
   
   --  loop
   --     begin
   --  	 if IsReplyAccepted then
   --  	    NewEmail(Subject, SubjectLength, ReplyCount);
   --  	 end if;
   --  	 Put("Vill du svara (ja/nej): ");
   --  	 Get_Line(Reply, ReplyLength);	 
   --  	 exit when Reply = "nej";
   --     end;
   --     if Reply(1..2) = "ja" then
   --  	 IsReplyAccepted := True;
   --  	 ReplyCount := ReplyCount + 2;
   --     end if;
   --  end loop;
end Uppgift1;
