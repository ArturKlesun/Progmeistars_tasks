Unit a8_sqSpiral;

interface

Procedure sqsDraw;

Implementation

Uses CRT;

const soul=' ';

Procedure ToRight(sColor: integer);
Var x0, y0: integer;
Begin
  x0:=whereX;
  y0:=whereY;
  TextBackground(sColor);
  write(soul);
  GoToXY(x0,y0);
End;

Procedure sqsDraw;
Var x0, y0: integer;
    i: integer;
    i1, i2, i3, i4, i5: integer;
Begin
  Window(5,5,75, 55);
  ClrScr;
  GoToXY(1,1);
  i:=0;
  For i1:=1 to (WindMaxX - i) do begin
   ToRight(i*8+1);
   i:=i+1;
  end;
End;


Begin
End.
