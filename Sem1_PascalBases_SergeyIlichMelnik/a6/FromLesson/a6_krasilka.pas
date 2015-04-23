{котики-наркотики}

Program krasilka;
Uses Crt;
Const Up = chr(72);
      Down = chr(80);
      Escape = chr(27);
var key: char;
    x, y, x1, y1, w, z: integer;


Procedure PrintXY (x, y: Integer; s: String);
Begin
  GotoXY (x, y);
  Write (s);
End;

Begin
  z:=1;
  w:=0;
  TextBackground(white);
  TextColor(black);
  ClrScr;
  Cursoroff;
  PrintXY(30, WindMaxY, ' Вверх - <вверх>, вниз - <вниз>. ');
  x:=(WindminX);
  y:=(Windminy);
  Repeat
   Delay(50);
   z:=z+1;
   TextBackground(z);
   TextColor(z+1);
   while x<50 do begin
    delay(1);
    x:=x+1;
    PrintXY(x, y, char(219));
   end;
   y:=y+1;
   z:=z+1;
   TextBackground(z);
   TextColor(z+1);
   while x>1 do begin
    delay(1);
    x:=x-1;
    PrintXY(x, y, char(219));
   End;
   y:=y+1;
   If z>80 then z:=2;

    If keypressed then case readkey of escape: begin write('Armagedon');
    cursorOn;
   Delay(1000);
   w:=w+1;
   end;
   end;
  Until (y=91) or (w=1);

end.

