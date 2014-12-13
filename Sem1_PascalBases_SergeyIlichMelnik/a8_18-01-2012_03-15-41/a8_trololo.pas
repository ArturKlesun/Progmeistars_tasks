Unit a8_Trololo;
interface

Procedure Draw;

implementation
uses CRT, conti;

Procedure GoRight(e: integer; var x0, y0: integer);
begin
 Delay(2);
 if e mod 2<>0 then write(' ') else write(' ');
 if x=windmaxx-e then gotoxy(x0,y0);
 x0:=x;
 y0:=y;

end;

Procedure GoDown(e: integer; var x0, y0: integer);
var i1,i2,i3: integer;
begin
 Delay(2);
 if e mod 2<>0 then write(' ') else write(' ');;
 if y0<windmaxy-e then GoToXy(x0,y0+1) else gotoxy(x0, y0);
 x0:=x;
 y0:=y;
end;


Procedure GoLeft(e: integer; var x0, y0: integer);
begin
 Delay(2);
 if e<>windmaxx div 2 then begin
  x0:=x;
  y0:=y;
  if e mod 2<>0 then write(' ') else write(' ');
  if (x=e+1) and (e<>1) then gotoxy(x0, y0) else gotoxy(x0-1,y0);
 end;
end;

Procedure GoUp(e: integer; var x0, y0: integer);
var i1,i2,i3,z: integer;
begin
 Delay(2);
 x0:=x;
 y0:=y;
 if e mod 2<>0 then write(' ') else write(' ');;
 if y>e+2 then GoToXY(x0,y0-1) else GoToXY(x0,y0);
 x0:=x;
 y0:=y;

end;

Procedure Draw;
var i1,i2,i3,e,x0,y0,s,n: integer;
    c: char;
Begin
 ClrScr;
 window(2,2,42,42);
 GoToXY(1,2);
 TextBackground(cyan);
 TextColor(black);
 n:=0;
  For e:=1 to windmaxx div 2 do begin
   For i1:=1 to windmaxx-e-2 do GoRight(e, x0, y0);
   For i1:=1 to windmaxX-e-2 do GoDown(e, x0, y0);
   For i1:=1 to windmaxX-e-2 do GoLeft(e, x0, y0);
   For i1:=1 to windmaxX-e-2 do GoUp(e, x0, y0);
   n:=n+1;

  end;
end;
begin
end.
