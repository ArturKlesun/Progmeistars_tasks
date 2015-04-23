{Пятнашки}
Program shiki;
Uses CRT;
var x: array [1..4, 1..4] of integer;
    wz,tr,ax,n: integer;
game_end: boolean;
sline,sit: string;

Procedure GoLeft;
var a,b,t: integer;
Begin
  b:=x[((wz-1) mod 4+1),(wz-1) div 4+1];
  GoToXY(((wz-1) mod 4 +2)*3,((wz-1) div 4+1)*2);
  write(b:2);
  GoToXY(((wz-1) mod 4+1)*3,((wz-1) div 4+1)*2);
  write('  ');
  x[((wz-1) mod 4 +2),((wz-1) div 4+1)]:=b;
  x[((wz-1) mod 4+1),((wz-1) div 4+1)]:=0;
 wz:=wz-1;
 n:=n+1;
End;

Procedure GoRight;
var a,b,t: integer;
Begin
  b:=x[((wz) mod 4)+2,(wz) div 4+1];
  GoToXY(((wz) mod 4 +1)*3,((wz) div 4+1)*2);
  write(b:2);
  GoToXY(((wz) mod 4+2)*3,((wz) div 4+1)*2);
  write('  ');
  x[((wz) mod 4 +1),((wz) div 4+1)]:=b;
  x[((wz) mod 4+2),((wz) div 4+1)]:=0;
 wz:=wz+1;
 n:=n+1;
End;

Procedure GoUp;
var a,b,t: integer;
Begin
  b:=x[((wz) mod 4+1),(wz) div 4];
  GoToXY(((wz) mod 4 +1)*3,((wz) div 4+1)*2);
  write(b:2);
  GoToXY(((wz) mod 4+1)*3,((wz) div 4)*2);
  write('  ');
  x[((wz) mod 4 +1),((wz) div 4+1)]:=b;
  x[((wz) mod 4+1),((wz) div 4)]:=0;
  wz:=wz-4;
  n:=n+1;
End;

Procedure GoDown;
var a,b,t: integer;
Begin
  b:=x[((wz) mod 4+1),(wz) div 4+2];
  GoToXY(((wz) mod 4 +1)*3,((wz) div 4+1)*2);
  write(b:2);
  GoToXY(((wz) mod 4+1)*3,((wz) div 4+2)*2);
  write('  ');
  x[((wz) mod 4 +1),((wz) div 4+1)]:=b;
  x[((wz) mod 4+1),((wz) div 4+2)]:=0;
  wz:=wz+4;
  n:=n+1;
end;

Procedure Usloviya_pobedi;
Var i1,i2,i3,x0,y0,n10,n11,it,nl,err: integer;
f: text;
name1,ns: string;
a: array [1..10] of string;
Begin
  nl:=0;
  For i1:=1 to 4 do
   for i2:=1 to 4 do
    if i1*4-4+i2=x[i2,i1] then nl:=nl+1;
    x0:=wherex;
   y0:=wherey;
   GoToXY(9,9);
   write('nl=',nl);
   GoToXY(x0,y0);
  if nl=15 then begin
    textbackground(black);
    clrscr;
    GoToXY(10,15);
    write('Поздравляем, вы победили!');
    gotoxy(1,1);

    assign(f, 'top10.dat');
    reset(f);
    for i3:=1 to 10 do
     readln(f,a[1]);
    a[1]:=copy(a[1],length(a[1])-3, 4);
    val(a[1],n10,err);
    if (n < n10) or (a[1]='') then begin
    Write('Введите своё имя, пожалуйста:');
    Readln(name1);
    str(n,ns);
    while length(ns)<4 do
     ns:='0'+ns;
    it:=0;
    close(f);
    reset(f);
    for i3:= 1 to 10 do begin
     it:=it+1;
     readln(f,a[it]);
     val(copy(a[it],length(a[it])-3,4),n10);
     if n10>n then begin n11:=it; n:=9999; continue; end;
    end;
    a[n11]:=name1+': '+ ns;
    close(f);
    Rewrite(f);
    For i3:=1 to 10 do begin
     writeln(f,a[i3]);
     GoToxy(2,1+i3);
     write(i3,'. место: ', a[i3]);
    end;
    end;
    close(f);

    game_end:=true;
  end;

End;

procedure Proverka_Resaemosti;
Var i1,i2,n,i,r: integer;
z: array [1..4,1..4] of integer;
sline,sit: string;
Begin
End;

Procedure Flip;
Var i,r,i1,i2,dwz,ix,iy: integer;
    y: array [1..4,1..4] of integer;
    sline: string;
sit: string;
Begin
  dwz:=0;
  For i1:=1 to 4 do
   For i2:=1 to 4 do begin
    y[5-i2,i1]:=x[i1,i2];
   end;
  textbackground(black);
  clrscr;
  textbackground(cyan);
  For i1:=1 to 4 do begin
   For i2:=1 to 4 do begin
    x[i1,i2]:=y[i1,i2];
    if i1 mod 2=1 then  textbackground(1) else  textbackground(2);
    GoToXY(i1*3,i2*2);
    if y[i1,i2]<>0 then write(y[i1,i2]:2) else write('  ');
   end;
  end;
  For i1:=1 to 4 do begin
   For i2:=1 to 4 do begin
    if x[i1,i2]=0 then wz:=(i2*4-4+(i1-1 mod 4));
   end;
  end;
   GoToxy((wz mod 4 +1)*3+2,(wz div 4+1)*2);
   n:=n+1;
end;

Procedure TOP10;
Var f: text;
a: array [1..11] of string;
i1: integer;
Begin
 assign(f,'TOP10.dat');
 if ax=0 then begin
{$i-}
 reset(f);
 if ioresult<>0 then begin rewrite(f); write('Нежданчик'); close(f);  end;
{$i+}
 end;
 i1:=1;
 reset(f);
 repeat
  readln(f,a[i1]);
  GoToXY(10,11+i1);
  write(i1,'-ое место: ',a[i1]);
  i1:=i1+1;
 until eof(F);
 close(f);
 ax:=1;
end;
Var i1,i2,i,r,x0,y0: integer;
f:text;
s2:string;
Begin
  Randomize;
  n:=0;
  ax:=0;
  game_end:=false;
  clrscr;
  i2:=1;
  sline:='';
  For i1:=1 to 4 do begin
   i2:=0;
   r:=0;
   repeat
    if r=200 then break;
    if (i1=4) and (i2=4) then x[i1,i2]:=0;
    if (i1=4) and (i2=4) then break;
    if keypressed then if readkey = chr(27) then break;
    i:=random(15)+1;
    str(i,sit);
    sit:='#'+sit+' ';
    r:=r+1;
    if (pos(sit, sline)<>0) {and ((i1<>4) and (i2<>4))} then continue;
    sline:=sline+sit;
    writeln(i:2);
    sline:=sline+sit;
    i2:=i2+1;
    writeln(i2);
    x[i2,i1]:=i;
   until i2=4;;
  end;
  tr:=0;
  clrscr;
  window(5,5,100,100);
  cursorOff;
  For i1:=1 to 4 do begin
   For i2:=1 to 4 do begin
    if i1 mod 2=1 then  textbackground(1) else  textbackground(2);
    GoToXY(i1*3,i2*2);
    if x[i1,i2]<>0 then write(x[i1,i2]:2) else write('  ');
   end;
  end;
  wz:=15;
  Proverka_resaemosti;
  repeat
  Case readkey of
   chr(72): if wherey<>8 then goDown;
   chr(77): if wherex<>5 then goleft;
   chr(80): if wherey<>2 then goUp;
   chr(75): if wherex<>14 then goRight;
   ' ': flip;
   chr(27): exit;
  end;
  x0:=wherex;
  y0:=wherey;
  TOP10;
  GoToXY(15, 1);
  Write('x0: ',x0:2,' y0: ',y0:2,' wz: ',wz:2, 'сделано ходов: ', n);
  GoToXY(15, 3);
  write('Если комбинация нерешаема, нажмите пробел.');
  For i1:=1 to 4 do
   for i2:=1 to 4 do begin
   GoToXY(i1*3+15,i2*2+3);
   if x[i1,i2]<>0 then write(x[i1,i2]:2) else write('  ');
  end;
  GoToxy(x0,y0);
  Usloviya_pobedi;
  if game_end=true then break;
  until 1=2;
  readln;
end.

