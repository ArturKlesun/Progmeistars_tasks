{Как в паскале собирать с внешними либами?
}

Program X_ki_O_liki;
Uses Crt,uSup,dos;
Const kUp   = chr(72);  kDown   = chr(80);
      kLeft = chr(75);  kRight  = chr(77);
      Click = ' ';      Escape = chr(27);
Var sline, turn_s: string;
a,b, turn_player, game_type, side, bre: integer;
Game_End: Boolean;
Procedure GoUp;
Begin
  if wherey<>1 then GoToXY(WhereX, WhereY-1);
End;
Procedure GoDown;
Begin
  if wherey<>3 then GoToXY(WhereX, WhereY+1);
End;
Procedure GoRight;
Begin
  if (wherex<3) and not((wherey=3) and (wherex=3)) then GoToXY(WhereX+1, WhereY);
End;
Procedure GoLeft;
Begin
  if wherex<>1 then GoToXY(WhereX-1, WhereY);
End;

Procedure PClick;
var sx,sy: string;
    rx,ry: integer;
Begin
  rx:=wherex;
  ry:=wherey;
  str(wherex,sx);
  str(wherey,sy);
  If pos(' '+sx+' '+sy+' ',sline)=0 then begin
  write(turn_s);
  If turn_s='X' then turn_s:='O' else turn_s:='X';
  GoToXY(rx,ry);
  sline:=sline+' '+sx+' '+sy+' ';
  a:=1;
  b:=1;
  if turn_player=1 then turn_player:=2 else turn_player:=1;
  end;
end;

Procedure CPU_monkey;
var h, m, s, sec: word;
    x,y,sline2,rez,rez1,rez2: string;
    i2,z: integer;
Begin
  {sline2:=' 1 1  1 2  1 3  2 1  2 2  2 3  3 1  3 2  3 3             ';
  For i2:=1 to 9 do begin
   rez:=copy(sline,(5*i2-4),5);
   if pos(rez,sline)<>0 then delete(sline,5*i2-4,5);
  end;
  for i2:=1 to 45 do begin
   rez:=copy(sline,i2,1);
   if rez= ' ' then begin delete(sline, i2,1); rez:=copy(sline,(5*i2-4),5);
   if pos(rez,sline)<>0 then delete(sline,5*i2-4,5);
  end;
  for i2:=1 to 45 do begin
   rez:=copy(sline,i2,1);
   if rez= ' ' then begin delete(sline, i2,1);  end; end;
  end; }

  if a=0 then while a=0 do begin
  GetTime(h,m,s,sec);
   sec:=sec+z;
   s:=s+z;
   GoToXY(random(sec mod 3+1)+1,random(sec*sec mod 3+2)+1);
   str(wherex,x);
   str(wherey,y);
   PClick;
   z:=z+1;
  End;
  a:=0;
End;

Procedure CPU_normal;
Begin
End;

Procedure CPU_Hard;
Begin
End;

Procedure Usloviya_Pobedi;
var ix, iy, a1,a2,a3,a4, rx,ry:integer;
    qx, qy, qz1, qz2: array [1..3] of byte;
    sx,sy: string;
Begin
  a1:=0;
  a2:=0;
  a3:=0;
  a4:=0;
  qx[1]:=0;

  qz1[1]:=0;
  qz2[1]:=0;
 if b=1 then begin
  For ix:=1 to 3 do begin
  qy[1]:=0;
  str(ix,sx);
   For iy:=1 to 3 do begin
    qx[iy]:=0;
    qy[iy]:=0;
    str(iy,sy);
    if pos(' '+sx+' '+sy+' ',sline)<>0 then qy[iy]:=(pos(' '+sx+' '+sy+' ',sline) mod 2)+1; {Если 1, значит х, иначе - 0}
    if pos(' '+sy+' '+sx+' ',sline)<>0 then qx[iy]:=(pos(' '+sy+' '+sx+' ',sline) mod 2)+1;
    if ix=iy then if pos(' '+sy+' '+sx+' ',sline)<>0  then qz1[iy]:=(pos(' '+sy+' '+sx+' ',sline) mod 2)+1;
    if 4-ix=iy then if pos(' '+sy+' '+sx+' ',sline)<>0  then qz2[iy]:=(pos(' '+sy+' '+sx+' ',sline) mod 2)+1;
   end;
   rx:=wherex;
   ry:=wherey;
   GoToXY(7,4);
   write('sline: ', sline);
   GoToXY(7,5);
   write('qx[1]=',qx[1],' qx[2]=',qx[2], ' qx[3]=',qx[3]);
   GoToXY(7,6);
   write(pos(' '+'3'+' '+'1'+' ',sline));
   GoToXY(7,7);
   write(pos(' '+'3'+' '+'1'+' ', ' 1 1  1 2  1 3  2 2  3 3  3 1 '));
   GoToXY(rx,ry);
   if ((qy[1]=qy[2]) and (qy[2] = qy[3])) and (qy[1]<>0) then begin pobeda(turn_s); game_end:=true end;
   if ((qx[1]=qx[2]) and (qx[2] = qx[3])) and (qx[1]<>0) then begin pobeda(turn_s); game_end:=true end;
   if ((qz1[1]=qz1[2]) and (qz1[2] = qz1[3])) and (qz1[1]<>0) then begin pobeda(turn_s); game_end:=true end;
   if ((qz2[1]=qz2[2]) and (qz2[2] = qz2[3])) and (qz2[1]<>0) then begin pobeda(turn_s); game_end:=true end;
  end;
 end;
  a:=0;
  b:=0;
End;
Var i1: longint;
     key: char;
Begin
  bre:=0;

  Writeln('Это игра крестики нолики. Пожалуйста, выберите оппонента:');
  Writeln('1 - человек');
  Writeln('2 - компьютер-обезьянка');
  {Writeln('3 - компьютер-средний');
  Writeln('4 - ничейная смерть');}
  Repeat
   Readln(game_type);
  Until (game_type>0) and (game_type<3);
  If game_type>1 then begin
   {Writeln('Выберите, какой стороной будете играть, пожалуйста:');
   Writeln('1 - крестиками');
   Writeln('2 - ноликами');
   Repeat
    Readln(Side);
   Until (side>0) and (side<3); }
   side:=1;
  end;
  game_end:=false;
  a:=0;
  sline:='';
  ClrScr;
  window(5,5,157,58);
  textBackground(cyan);
  GoToXY(7,1);
  if game_type =1 then Write('Human X Human') else write('Human X CPU');
  GoToXY(2,1);
  write(' ');
  GoToXY(3,2);
  write(' ');
  GoToXY(2,3);
  write(' ');
  GoToXY(1,2);
  write(' ');
  GoToXY(8,8);
  Write('Стрелками выбирайте, куда поставить крестик, пробел - поставить, Esc - выход.');
  GoToXY(1,2);
  textBackground(lightblue);
  turn_s:='X';
  turn_player:=side;
  if side = 1 then
  a:=0;
  If game_type=1 then Repeat

   if bre = 1 then break;
    If KeyPressed then
     Case ReadKey of
      kUp: Goup;
      kLeft: Goleft;
      kRight: Goright;
      kDown: GoDown;
      click: PClick;
      escape: break;
     end;
  Usloviya_Pobedi;
   if (length(sline)=45) and (wherex<4) then begin
   GoToXY(7,2);
   write('Ничья.');
  end;
  Until 1=0;
  a:=0;

  if game_type>1 then Repeat
  if bre=1 then break;
  if game_end = true then if keypressed then begin
    case readkey of escape: break;
    end;
   end;

  if (turn_player=1) then If KeyPressed then begin


     Case readKey of
      kUp: Goup;
      kLeft: Goleft;
      kRight: Goright;
      kDown: GoDown;
      click: PClick;
      escape: break;
     end;
     case key of
      click: begin PClick; end;
      escape: break;
     end;
    end;

    if a=1 then begin
    Usloviya_Pobedi;
   if (length(sline)=45) and (wherex<4) then begin
   GoToXY(7,2);
   write('Ничья.');
   Case ReadKey of
      escape: bre:=1;
     end;
  end;

    if (game_end=False) {and (turn_player=2)} then begin
    if game_type=2 then CPU_Monkey;
    if game_type=3 then CPU_Normal;
    if game_type=4 then CPU_Hard;
   end
   else If KeyPressed then
     Case ReadKey of
      escape: bre:=1;
     end;



  Usloviya_Pobedi;
   if (length(sline)=45) and (wherex<4) then begin
   GoToXY(7,2);
   write('Ничья.');
   end;
   end;
  Until 1=0;

End.
