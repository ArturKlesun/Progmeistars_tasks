{
программа, которая определяет соответствие одного фрагмента текста в другом с конца и выводит количество соответствий.
}
Program sload;
var i1, i2, a, b: integer;
    load, ad, rez: string;
begin
  Writeln('Откуда считывать:');
  Readln(load);
  Writeln('Что считывать:');
  Readln(ad);
  a:=0;
  b:=0;
  writeln('à®æ¥áá');
  For i1:=1 to length(load) do begin
   rez:= copy(load, length(load)-i1+1, length(ad));

   writeln(rez);
   if rez=ad then begin
    a:=a+1;
    if b=0 then b:=length(load)-i1+1+length(ad)-1;
   end;
  end;
  Writeln('Результат:');
  Writeln('На каком символе начинается соответствие:');
  Writeln(b);
  Writeln('Сколько соответствий:');
  Writeln(a);
end.
