{Вот это охуенчик}
{Особенно доставляет как crt работает под линуксами}

Program sqstr;
uses crt;
var wl, wh: integer;

Var spzd: string;
Var xl,yl,i1,i2,i3,i4,i5, x1, y1, y01, z,w,g, T: integer;
Begin
  Writeln('Я - контроллёр Кристапс, отвечаю за логичное движение поезда ху(1,1)-ху(1,1).');
  Writeln('Введите, пожалуйста, слово, которым мы распишем вагоны поезда:');
  Writeln('P.S. Главное, чтобы слово умещалось в одной строке (и, желательно, чтобы ещё десять символов до её конца оставалось.)');
  Readln(spzd);
  {spzd:='Квазар - штука серьёзная'; }
  Writeln('Задайте, пожалуйста темп (мс на один ход):');
  Readln(t);
  wl:=length(spzd)+10;
  wh:=wl;
  clrscr;
  Writeln('Приятного пути. ',(#1));
  Window(2,2,wl+2,wh+2);
  GoToXY(1,1);
  x1:=whereX;
  y1:=wherey;
  g:=0;
  w:=1;
  z:=0;
  CursorOff;
 Repeat
  i4:=0;
  y1:=1;
{Движемся направо но угла}
  For i3:=1 to wl+2 do
   If (y1=1) and (x1+length(spzd)-1<=wl) then begin xl:= wherex; yl:= wherey; clrscr; GoToXY(xl,yl); write(spzd); delay(T); x1:=x1+1;  GoToXY(x1, 1) end;


{Перетаскиваем все буквы на правую сторону по первую включительно}
  If x1+length(spzd)>=wl then for g:=1 to length(spzd) do begin

    if keypressed then break;
    Delay(T);
    xl:=wherex;
    yl:=wherey;
    clrscr;
    GoToXY(xl,yl);


   begin                                                    // Отсюда
    GoToXY(x1+1, 1);
    For i1:=1 to wl+1-x1 do begin write(spzd[i1]); end;
   end;
    i4:=i4+1;

    if x1<=wl then For i3:=1 to (i4) do begin
     GoToXY(wl+1, i3+1);
     write(spzd[i3+(wl-x1)+1]);
     end;
    x1:=x1+1;                                      // До сюда
  end;

{Движемся вниз до угла}
  GoToXY(wl+1,1);
  y1:=1;
  x1:=wherex;
  i4:=0;
  For i3:=1 to wh do begin
  If (y1+length(spzd)-1<=wh) then begin xl:= wherex; yl:= wherey; clrscr; GoToXY(xl,yl); end;
  If (y1+length(spzd)-1<=wh) then begin for i5:=1 to length(spzd) do begin gotoxy(wl+1,i5+i3-1); write(spzd[i5]); end; delay(T); end;
  y1:=y1+1;  GoToXY(wl+1, y1) end;
  If y1+length(spzd)>=wh then begin  begin


{Перетаскиваем все буквы на нижнюю сторону по первую включительно}
    y1:=wh-length(spzd);                                              // Отсюда
     GoToXY(wl+1,y1+1);
     For i5:=1 to length(spzd) do begin
      delay(T);
      y1:=y1+1;
      clrscr;
      GoToXY(wl+1,y1+1);
      For i1:=1 to wh-y1 do begin  write(spzd[i1]); GoToXY(wl+1, y1+i1+1); if wh<>y1 then z:=z+1; end;

     i4:=i4+1;
     if y1<=wh then For i3:=1 to (i4)+3 do begin
      GoToXY(wl-(i3-1), wh);
      write(spzd[i3+(wh-y1)+1]);
     end;

     g:=g+1;
     end;
    end;
    GoToXY(wl+1, wh);
    write(spzd[1]);
    GoToXY(wl+1, wh);
   if (wherex=1) and (wherey=1) then gotoxy(wl+1,wh);
  end;                                             // До сюда

{Движемся влево до угла}
  y1:=wh;
  x1:=wherex;
  i4:=0;
  For i3:=1 to wl do begin
   If (length(spzd)<=wl-i3) then begin delay(T div 2); clrscr; for i5:=1 to length(spzd) do begin gotoxy(wl-(i5+i3-1),wh); write(spzd[i5]); end; delay(T div 2); end;
   x1:=x1-1;  GoToXY(x1,wh)
  end;
   i3:=wl+2;
    i5:=0;
{Перетаскиваем все буквы на левую сторону по первую включительно}
    x1:=length(spzd);
    for x1:=1 to length(spzd)-1 do begin
    clrscr;
    if keypressed then break;                                     // Отсюда
    GoToXY(1, wh);
    i5:=i5+1;
    For i1:=1 to length(spzd)-i5 do begin write(spzd[length(spzd)-i1-i5+1]); end;


    i4:=i4+1;
    z:=0;
    For i3:=1 to (i4) do begin

     GoToXY(1, wh-(i3));
     write(spzd[length(spzd)*2-(i4+length(spzd)-i3)]);
     z:=z+2;
    end;
    Delay(T);

                                                                            // До сюда
   end;


{Движемся вверх до угла}
   GoToXY(1,wh);
   y1:=wh;
   x1:=wherex;
   i4:=0;
   For i3:=1 to wh-length(spzd) do begin
    clrscr;
    If (y1-length(spzd)+1>=1) then begin for i5:=1 to length(spzd) do begin gotoxy(1,wh-i5-i3+1); write(spzd[i5]); end; delay(T); end;
    end;



{Перетаскиваем все буквы на верхнюю сторону по первую включительно}
    y1:=length(spzd);
    begin                                               // Отсюда
     For i5:=1 to length(spzd) do begin
      If keypressed then break;
      delay(T);
      y1:=y1-1;
      clrscr;
      if y1>1 then GoToXY(1,y1-1);
      For i1:=1 to y1 do begin write(spzd[i1-1]); GoToXY(1, y1-i1+1); if 1<>y1 then end;

     i4:=i4+1;
     For i3:=1 to (i4)+3 do begin
      GoToXY(i3, 1);
      write(spzd[i3+(y1)]);
     end;


     end;
    end;
    GoToXY(1, 1);
    write(spzd[1]);
    GoToXY(1, 1);

                                               // До сюда
  Until keypressed;

end.
