Program diagonal;

Procedure Print(h: LongInt; symb: char; var f: text);
          var e, c, t, k: integer;
Begin
  h:=h-2;
  for e:=1 to h+2 do write(f, 'x');
  writeln(f);
  t:=0;
  for e:=1 to h do begin
   t:=t+1;
   write(f, 'x');
   For k:=1 to t-1 do write(f, ' ');
   write(f, 'x');
   if t<h then
    For k:=1 to h-t do write(f, ' ');
   write(f, 'x');
   writeln(f);
  end;
  write(f, 'x');
  for c:=1 to h do
    write(f, 'x');
   write(f, 'x');

end;

var h, a, i, g, v, q, z: integer;
    f: text;
    m: LongInt;

Begin
  Assign(f, 'diagonal.dat');
  Writeln('Введите высоту прямоугольника, пожалуйста:');
  Readln(h);
  Rewrite (f);
  Print(h, '*', f);
  Close(f);
End.
