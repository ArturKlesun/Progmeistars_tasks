Program c4eti;
Uses CRT;


Var place: array[1..20] of string;
    nx, i, i2, err: integer;
    fr, fw: text;
    tem: string;
    placint: array[1..20] of integer;

Begin
{����� 䠩��}
  Assign(fr, 'numbers.dat');
  Assign(fw, 'diagramma.dat');
  Reset(fr);
{����᫨ � ���ᨢ �᫠}
  nx:=0;
  While not EoF(fr) do begin
   nx:=nx+1;
   Readln(fr, tem);
   if nx<=20 then place[nx]:=tem;
  end;




  for i:=1 to 20 do begin
   val(place[i], placint[i], err);
   if err<>0 then writeln(err);
   for i2:=1 to placint[i] do write('*');
   writeln;
  end;

  ClrScr;
  Window(5,5, 35,35);
  GoToXY(1, 27);
  For i:=1 to 20 do begin
   For i2:=1 to placint[i] do begin
    write('*');
    GotoXY(-1+whereX, -1+whereY);
   end;
   GotoXY(i*2+1, 27);
  end;

end.

