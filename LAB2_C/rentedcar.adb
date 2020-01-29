with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;
--with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;

procedure rentedCar is
   
   function fDivide(X: in Float; Y: in Float) return Float is
      begin
	 return X / Y;
      end fDivide;
      
   function fCalculateT0(X: in Float; Y: in Float; Z: in Float) return Float is
      begin
	 return X - Y * Z;
      end fCalculateT0;
      
   K, S1, S2, S3, T0, T1, T2: Float;
   
   begin
   
      Put("Först kör vi sträckan S1 (i mil): ");
      Get(S1);
      Put("Vi tankar nu full tank, T1 (i liter): ");
      Get(T1);
      Put("Nu kör vi sträckan S2 (i mil): ");
      Get(S2);
      Put("Vi tankar nu full tank igen, T2 (i liter): ");
      Get(T2);
      
      K := fDivide(T2, S2);
      T0 := fCalculateT0(T1, S1, K);
      S3 := fDivide(T0, K);
     
      Put("Bilen drar ");
      Put(K, 0, 2, 0);
      Put(" liter / mil.");
      New_Line;
      Put("Ur tanken saknades det från början ");
      Put(T0, 0, 2, 0);
      Put(" liter.");
      New_Line;
      Put("Vi kör sedan exakt ");
      Put(S3, 0, 2, 0);
      Put(" mil och lämnar bilen där!");
 
   end rentedCar;
