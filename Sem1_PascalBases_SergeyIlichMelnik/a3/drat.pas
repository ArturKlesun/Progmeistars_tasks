Program drat;

Procedure Print(n: LongInt; symb: char; var f: text; q: integer; z: integer);
          var e, c: integer;
Begin
  n:=n-2;
  if z = 1 then begin write(f, '+');
                      for e:=1 to n do write(f, symb);
                      write(f, '+');
                      writeln(f);
                      end;
  if z > 1 then if z < q then begin
   write(f, 'I');
   For c:=1 to n do
    write(f, symb);
   write(f, 'I');
   writeln(f);
  end;
  if q=z then begin
   write(f, '+');
   for c:=1 to n do
    write(f, symb);
   write(f, '+');

end;
end;

var h, a, i, g, v, q, z: integer;
    f: text;
    m: LongInt;

Begin
  Assign(f, 'chree.dat');
  Writeln('Введите высоту прямоугольника, пожалуйста:');
  Readln(h);
  Writeln('Введите ширину прямоугольника, пожалуйста:');
  Readln(a);
  q:=h;
  z:=1;
  Rewrite (f);
  For i:=1 to q do begin
  Print(a, '*', f, q, z);
    z:=z+1;
   end;
  Close(f);
End.
