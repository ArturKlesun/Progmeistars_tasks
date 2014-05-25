Program Prazdnik_Prazdnik_Prazdnik;
Var a1,b1,k1,n,a,b,c,k,i1: longint;
   p,p1,o,u,v: longint;
   Nod,Nod2:integer;
Begin
  Writeln('A Prazdnikov: ');
  Read(a);
  Writeln('B Mordobojov: ');
  Read(b);
  Writeln('K Pozarov: ');
  Read(k);
  Writeln('N Dnej: ');
  Read(n);
  a1:=a;
  b1:=b;
  k1:=k;
  Nod:=0;
      while a mod b <> 0 do begin
       Write(a:3,' ',b:3);
       writeln;
       c:=a;
       a:=b;
       b:=(c mod b);
      end;
    Nod:=b;
  Writeln('Nod= ',nod,' ');
  P:=n div (a1*b1 div Nod);
  O:=n div a1 + n div b1 - (n div (a1*b1 div Nod))*2;
  {
  Prazdnik s pozarom
  Otmecajemij s pozarom
  Budnij s pozarom
    }
  Writeln('Prazdniki: ',(P), ' Otmecaemije: ',(O), ' Budni: ', n-(O)-(P));
  p1:=p;
  p:=Nod;
 { Nod2:=0;
      while p mod k <> 0 do begin
       Write(p:3,' ',k:3);
       writeln;
       c:=p;
       p:=k;
       k:=(c mod k);
      end;
    Nod2:=k;  }
  Writeln('Nod2= ',nod2,' ');
  U:=p1 div k1;
  Writeln('Prazdniki s pozarom: ',U,' Otmecajemije c pozarom: ',V);
  Readln;

end.
