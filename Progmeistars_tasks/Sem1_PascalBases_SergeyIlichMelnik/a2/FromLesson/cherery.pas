Program bodcher;

Procedure Print(n: LongInt; symb: char; var f: text; q: Longint);
          var e, z, c: integer;
Begin
    For z:=q downto 1 do begin
     write(f, ' ');
    end;
  For e:=1 to n do begin
   write(f, symb);
  end;
  For e:=1 to n-1 do begin
   write(f, symb);
  end;
  writeln(f);

end;

var h, n, i, g, v, q: integer;
    f: text;
    m: LongInt;

Begin
  Assign(f, 'chree.dat');
  Writeln('Введите высоту ёлки, пожалуйста:');
  Readln(h);
  Writeln('Введите число треугольников в ёлке, пожалуйста:');
  Readln(n);
  v:= h;
  h:=1;
  q:=v-1;
  Rewrite (f);
  For g:=1 to n do begin
   For i:=1 to v do begin
    Print(h, '*', f, q);
    h:=h+1;
    dec(q);
   end;
   q:=v-1;
   h:=1;
  end;
  Close(f) ;
End.
