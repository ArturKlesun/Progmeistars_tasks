{
программа, которая из ряда введённых чисел высчитывает кол-во чётных и выводит два наибольших.
}
Program lineage;
Const MaxSize=1000;
Type TDataArray = Array [1..MaxSize] of Longint;

Var a: array[1..MaxSize] of integer;
    n, g, t, i, s, e, w, o, cet : integer;
    smti: integer;
    smax, sminmax, sminmax2: Longint;
    sred: real;
    sim, sin, ku, v: integer;
    does: integer;
Begin  {Отсюда}
  Writeln;
  write('Программа делает очень много чего интересного с линейкой чисел. Введите, сколько их, пожалуйст : ');
  readln(n);
  for i:=1 to n do begin
   write('Введите ', (i), '-е число, пожалуйста:');
   Readln(a[i]);
  end;   {Пока всё правильно}

{Макс. числo}
  smax:=0;
  smti:=1;
  For i:=1 to n do begin
   if a[i] > smax then begin
    smax:=a[i];
    smti:=1;
    end;
   end;
  writeln;
  writeln('Самое большое число в линейке: ', smax);

{Сколько их}
  o:=0;
  For i:=1 to n do
   if a[i] = smax then o:=o+1;
  writeln;
  writeln('В прогрессии ', o, ' таких чисел.');

{Среднее арифметическое}
  sred:=0;
  for s:=1 to n do sred:=sred+a[s];
  sred:=sred/n;
  writeln;
  writeln('Среднее арифметическое:', sred:8:4);


{Симметричен ли?}
  v:=0;
  sin:=n div 2;
  if n mod 2 = 0 then sim:=n div 2 +1 else begin sim:=n div 2 +2;
                                                 v:=1
                                                 end;
  for i:=1 to n div 2 do begin
   if a[(sin)] = a[sim] then v:=v+2;
   sin:=sin-1;
   sim:=sim+1;
  end;
  writeln;
  if n = v then writeln('Прогрессия симметрична') else writeln('Прогрессия не симметрична');
  writeln;

{Сколько чётных чисел}
  cet:=0;
  for t:=1 to n do
   if a[t] mod 2 = 0 then cet:=cet+1;
  writeln('В прогрессии ', cet, 'чётных чисел(-ла)');

{Два наибольших}
  Sminmax:=-1000;
  Sminmax2:=-1000;
  For e:=1 to n do begin
   if a[e] > sminmax then if a[e] mod 2 = 0 then begin
    sminmax:=a[e];
    w:=e;
   end
  end;
  For e:=1 to n do begin
   if a[e] mod 2 = 0 then if a[e] > sminmax2 then if a[e] <> a[w] then sminmax2:=a[e];


  end;
  if sminmax2 <> -1000 then  writeln('Из них два наибольших числа: ', sminmax, 'и ', sminmax2) else writeln('В линейке меньше двух чётных чисел.');

{Есть ли повторения}
  o:=0;
  writeln;
  for i:=1 to n do begin
    for g:=1 to n do begin
     if a[g]=a[i] then o:=o+1;
    end;
  end;
  if o = n then writeln('Повторов нет') else writeln('Повторы есть');

End.
