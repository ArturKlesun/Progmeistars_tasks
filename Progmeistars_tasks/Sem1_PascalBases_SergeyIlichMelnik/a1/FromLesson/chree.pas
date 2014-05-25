Program chree;

Procedure Print(n: LongInt; symb: char; var f: text);
          var e: integer;
Begin
  For e:=1 to n do begin
    write(f, symb);
  end;
  writeln(f);


end;

var h, i, v: integer;
    f: text;
    m: LongInt;

Begin
  Assign(f, 'chree.dat');
  Writeln('Введите высоту ёлки, пожалуйста:');
  Readln(h);
  v:= h;
  h:=1;
  Rewrite (f);
  For i:=1 to v do begin
   Print(h, '*', f);
   h:=h+1;
  end;
  Close(f) ;
End.
