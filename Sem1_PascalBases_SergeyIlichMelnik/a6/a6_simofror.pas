Program Simofor;
Uses CRT;

Var x,z,y,d:integer;

Begin
  ClrScr;
  Window(5,5,30,30);
  TextColor(Magenta);
  z:=0;
  d:=0;
  CursorOff;
  While (1=1) and (z<>1) do begin
   d:=0;
   x:=wherex;
   y:=wherey;
   GotoXY(windmaxx div 2, windmaxy div 2 + 1);
   TextBackground(0);
   Write(' ');
   TextBackground(0);
   GoToXY(x,y);
   While whereX<>25 do begin
    d:=d+1;
    Write('Z');
    Delay(50);
    x:=wherex;
    gotoxy(1,wherey);
    ClrEol;
    GotoXY(x,wherey);

    if d<100 div 3 then begin
     x:=wherex;
     y:=wherey;
     GotoXY(windmaxx div 2, windmaxy div 2 - 1);
     TextBackground(red);
     Write(' ');
     TextBackground(0);
     GoToXY(x,y);
    end else begin
     x:=wherex;
     y:=wherey;
     GotoXY(windmaxx div 2, windmaxy div 2 - 1);
     TextBackground(0);
     Write(' ');
     GoToXY(x,y);
    end;

   End;
   While wherey<>25 do begin
    d:=d+1;
    Write('z');
    Delay(50);
    x:=wherex;
    gotoxy(wherex-2, wherey);
    ClrEol;
    GotoXY(x-1,wherey+1);
    x:=wherex;
    y:=wherey;

    if (d<100 div 3) then begin
     x:=wherex;
     y:=wherey;
     GotoXY(windmaxx div 2, windmaxy div 2 - 1);
     TextBackground(red);
     Write(' ');
     TextBackground(0);
     GoToXY(x,y);
    end else if (d<100*45 div 60) then begin
     x:=wherex;
     y:=wherey;
     GotoXY(windmaxx div 2, windmaxy div 2 - 1);
     TextBackground(0);
     Write(' ');
     GotoXY(windmaxx div 2, windmaxy div 2);
     TextBackground(yellow);
     Write(' ');
     TextBackground(0);
     GoToXY(x,y);
    end;


    if (d>100 * 25 div 60) and (d<100 * 50 div 60) then begin
     x:=wherex;
     y:=wherey;
     GotoXY(windmaxx div 2, windmaxy div 2 + 1);
     TextBackground(green);
     Write(' ');
     GotoXY(windmaxx div 2, windmaxy div 2);
     TextBackground(0);
     Write(' ');
     TextBackground(0);
     GoToXY(x,y);
    end;


   End;
   While whereX<>1 do begin
    d:=d+1;
    Write('z');
    Delay(50);
    GotoXY(wherex-2,wherey);
    ClrEol;
    x:=wherex;
    y:=wherey;

    if (d>100 * 50 div 60) and (d<100 * 60 div 60) then begin
     if z=0 then begin
      z:=2;
      x:=wherex;
      y:=wherey;
      GotoXY(windmaxx div 2, windmaxy div 2 + 1);
      TextBackground(0);
      Write(' ');
      TextBackground(0);
      GoToXY(x,y);
     end else begin
      z:=0;
      x:=wherex;
      y:=wherey;
      GotoXY(windmaxx div 2, windmaxy div 2 + 1);
      TextBackground(green);
      Write(' ');
      TextBackground(0);
      GoToXY(x,y);
     end;
    end;

   End;
   While wherey<>1 do begin
    d:=d+1;
    Write('Z');
    Delay(50);
    x:=wherex;
    gotoxy(wherex-1, wherey);
    write(' ');
    ClrEol;
    GotoXY(x-1,wherey-1);
    x:=wherex;
    y:=wherey;

    if (d>100 * 50 div 60) and (d<100 * 55 div 60) then begin
     if z=0 then begin
      z:=2;
      x:=wherex;
      y:=wherey;
      GotoXY(windmaxx div 2, windmaxy div 2 + 1);
      TextBackground(0);
      Write(' ');
      TextBackground(0);
      GoToXY(x,y);
     end else begin
      z:=0;
      x:=wherex;
      y:=wherey;
      GotoXY(windmaxx div 2, windmaxy div 2 + 1);
      TextBackground(green);
      Write(' ');
      TextBackground(0);
      GoToXY(x,y);
     end;
    end;

   End;
  End;
End.
