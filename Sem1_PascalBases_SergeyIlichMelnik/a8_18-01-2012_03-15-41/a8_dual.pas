Program dual;
Uses CRT, U_commands;
Const wa=42;
      wb=42;
      wl=40;
      wh=40;
      hx=20;
var ob6int: integer;
Procedure cellright(i1,i2: integer);
var x0, y0: integer;
Begin
{обе идут направо от первой до последней включительно, попутно печатая}

      GoX(i2);
      write(#2);
      GoX(wl-i2+1);
      write(#1);
      Delay(50);
      x0:=x;
      y0:=y;
      clrscr;
      GoToXY(x0,y0);

End;

Procedure cellleft(d1,i2: integer);
var x0, y0: integer;
Begin

  GoX(hx-i2);
  Write(#2);
  GoX(hx+i2);
  write(#1);
  delay(50);
  x0:=x;
  y0:=y;
  clrscr;
  GoToXY(x0,y0);


end;

Var i1,i2,i3, d1, d2, d3, x1,y1,x2,y2, x0,y0: integer;
Begin
  CLRscr;
  Writeln('Moons by Suns');
  Window(2,2, wa, wb);
  GoToXY(1,1);
  cursoroff;
  d1:=2;
  i1:=1;
  While i1 < wh div 2-1 do begin
   if keypressed then break;
   For i2:=1 to wl div 2-1 do cellright(i1,i2);

   ClrScr;
   GoToXY(wl div 2,i1+1);


   For i2:=1 to wl div 2-1 do cellleft(d1, i2);
   ClrScr;
   GoToXY(1,d1+1);
   x0:=x;
   y0:=y;
   clrscr;
   GoToXY(x0,y0);
   inc(i1,2);
   inc(d1,2);
  end;
End.
