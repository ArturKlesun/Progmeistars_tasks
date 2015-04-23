{Вырезает лишние пробелы и отступы из введённого файла}

Program spaces;

Var fil, fil2, fil3: String;
    i1, a, b: integer;
    F1, F2: TEXT;
    m, n1: longint;
Begin
  Writeln;
  Write('Введите название файла, с которого пойдёт считывание пробелов (с расширением), пожалуйста:');
  Writeln;
  Readln(fil);
  Assign(f1, fil);
  fil:=copy(fil, 1, length(fil)-4);
  fil:=fil+'(modified).res';
  Assign(f2, fil);
  Reset(f1);
  Rewrite(f2);
  While not EoF(f1) do begin
   Readln(f1, fil);

   {Вырезание лишних пробелов}
   For n1:=1 to length(fil) do begin
    fil2:=copy(fil, 1, 1);
    if fil2=' ' then delete(fil, 1, 1);
   end;
   For n1:=1 to length(fil) do begin
    fil2:=copy(fil, length(fil), 1);
    if fil2=' ' then delete(fil, length(fil), 1);
   end;

    fil3:=fil;
    b:=1;
   while b=1 do begin
    a:=0;
    For n1:=1 to length(fil3) do begin
     fil2:=copy(fil3, n1, 2);
     if fil2='  ' then begin
      delete(fil, n1, 1);
      delete(fil3, n1, 1);
      a:=1;
     end;
    end;
    if a = 1 then b:=1 else b:=0;
   end;
    writeln(fil);
    Writeln(f2, fil);

  End;
  close(f1);
  close(f2);
End.
