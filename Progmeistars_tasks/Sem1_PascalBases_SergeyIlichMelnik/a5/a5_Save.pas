{
программа, которая определяет соответствие одного фрагмента текста в другом с конца и выводит количество соответствий.
}
Program sload;
var i1, i2, a, b: integer;
    load, ad, rez: string;
begin
  Writeln('âªã¤  áç¨âë¢ âì:');
  Readln(load);
  Writeln('â® áç¨âë¢ âì:');
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
  Writeln('¥§ã«ìâ â:');
  Writeln('  ª ª®¬ á¨¬¢®«¥ ­ ç¨­ ¥âáï á®®â¢¥âáâ¢¨¥:');
  Writeln(b);
  Writeln('ª®«ìª® á®®â¢¥âáâ¢¨©:');
  Writeln(a);
end.
