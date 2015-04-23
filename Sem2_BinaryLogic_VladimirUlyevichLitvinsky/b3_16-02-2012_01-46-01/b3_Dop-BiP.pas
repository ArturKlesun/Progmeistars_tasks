{1. Вводятся 2 двоичных кода (не более 16-ти цифр). Найти их сумму.
2. Вводится отрицательное целое число Х (-128<=x<=-1). Записать
это число в дополнительном двоичном коде.}
Program Dop_Bip;
Uses CRT, binarka;

Function stri(i: integer): string;
var a: string;
Begin
  str(i,a);
  stri:=a;
end;

Procedure secbit(i: integer);
Var i1,i2: integer;
    n: string;
Begin
  If i <> -128 then begin
   i1:=abs(i)-1;
   n:='0'+tobi(i1,2);
   For i2:=1 to 8-length(n) do begin
    {if i2<>1 then} n:='0'+n;
   end;
   For i1:=1 to length(n) do begin
   If n[i1]='1' then n[i1]:='0' else n[i1]:='1';
   end;
  end;
  If i = -128 then n:='10000000';
  writeln(n);

End;

Var b1,b2, rez: integer;
    s1, s2: string;
Begin
  Writeln('Программа находит сумму двух двоичных чисел.');
  Writeln('Первое двоичное число:');
  readln(b1);
  Writeln('Второе двоичное число:');
  readln(b2);
  Writeln;
  rez:=tode(stri(b1))+tode(stri(b2));
  Writeln('Сумма в десятиричной:');
  writeln(rez);
  Writeln('Сумма в двоичной');
  writeln(tobi(rez,2));
  writeln;

  Writeln('Отрицательное число от -128 до -1, которое вы желаете увидеть в двоичном коде:');
  Readln(b1);
  secbit(b1);

  readln;
End.
