Program drat;

Procedure Print(n: LongInt; symb: char; var f: text; q: Longint; t: Longint);
          var e, z, c: integer;
Begin

  If n=1 then begin
     write(f, '+');

  For e:=1 to n do begin
   write(f, symb);
  end;
  if c <> 1 then write(f, '+');
  c:=1;
  writeln(f);
  inc(z);
  If t=n then begin
   write(f, '+');
   for e:=1 to t do
    write(symb);
   end;
   write(f, '+');
  end;
end;

var h, a, i, g, v, q, t: integer;
    f: text;
    m: LongInt;

Begin
  Assign(f, 'chree.dat');
  Writeln('Введите высоту прямоугольника, пожалуйста:');
  Readln(h);
  Writeln('Введите ширину прямоугольника, пожалуйста:');
  Readln(a);
  v:= h;
  q:=v-1;
  Rewrite (f);
  For g:=1 to a do begin
   For i:=1 to v do begin
    Print(h, '*', f, q, t);
    h:=h+1;
    dec(q);
   end;
   q:=v-1;
   h:=1;
  end;
  Close(f) ;
End.
