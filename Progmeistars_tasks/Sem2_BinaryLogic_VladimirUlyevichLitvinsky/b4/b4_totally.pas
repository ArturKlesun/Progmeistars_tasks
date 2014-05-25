{
Здравствуйте, Владимир Юльевич.
Здесь программа, которую вы задали: программа загадывает 6 рандомных чисел от 1 до 50-ти, не повторяющихся, затем пользователь вводит свои 6 чисел и программа говорит, какие числа были угаданы.
                                     Артур Клесун, группа, у которой вы ведёте занятия по пятницам с 17:30. 
}

Program totally;
Function Fstr(a: integer): string;
begin
 str(a,fstr);
end;
Var a: array [1..6] of shortint;
    b: array [1..6] of shortint;
    c: array [1..6] of shortint;
    n: shortint;
    t: shortint;
    i1: shortint;
    s,s1: string;
Begin
  n:=0;
  s1:='';
  For i1:=1 to 6 do begin
   b[i1]:=random(50)+1;
   str(b[i1], s);
   if (pos(' '+s+' ',s1)>0) or ((s=fstr(b[2])) and (i1<>2)) or ((s=fstr(b[1])) and (i1<>1)) then repeat
    b[i1]:=random(50)+1;
    str(b[i1], s);
   until (pos(' '+s+' ',s1)=0) and (s<>fstr(b[1])) and (s<>fstr(b[2]));
   s1:=s1+s+' ';
  end;
  writeln(s1);
  s1:='';
  Writeln('à¨¢¥â, ï â®â «¨§ â®à.  áãé¥áâ¢ãî ¤«ï â®£®, çâ®¡ë ®¡¬ ­ë¢ âì «î¤¥©.  § £ ¤ « 6 ç¨á¥« ®â 1-£® ¤® 50 (­¥ ¯®¢â®àïïáì),   âë ¯®¯à®¡ã© ¨å ®â£ ¤ âì:');
  For i1:=1 to 6 do begin
   write(i1,'-®¥ ç¨á«®:');
   readln(a[i1]);
   str(a[i1], s);
   if (a[i1]>50) or (a[i1]<1) or (pos(' '+s+' ',s1)>0) or (s=fstr(a[2])) and (i1<>2) or ((s=fstr(a[1])) and (i1<>1)) then repeat
    writeln(' ª®¥ ã¦¥ ¡ë«®, «¨¡® ¢ è¥ ç¨á«® ­¥ á®áâ®¨â ¢ ¯à¥¤¥« å ®â 1-£® ¤® 50-â¨.');
    write(i1,'-®¥ ç¨á«®:');
    readln(a[i1]);
    str(a[i1], s);
   until (a[i1]<=50) and (a[i1]>=1) and (pos(' '+s+' ',s1)=0) and (s<>fstr(a[1])) and ((s<>fstr(a[2])) or (i1=2));
  s1:=s1+s+' ';
  end;
  Writeln(' £ ¤ ­­ë¥ ¢ ¬¨ ç¨á« ');
  writeln(s1);
  Writeln;
  Writeln('«¥¤ãîé¨¥ ç¨á«  ¯®¡¥¤¨«¨ ¢ «®â¥à¥¥');
  For i1:=1 to 6 do begin
   Writeln(b[i1]);
   c[i1]:=0;
   if (pos(' '+fstr(b[i1])+' ', s1)<>0) or (fstr(b[i1])=s1[1]) or (fstr(b[i1])=s1[1]+s1[2]) then begin n:=n+1; c[i1]:= b[i1]; end;
  End;
  Writeln(' ¢ è¥¬ ¡¨«¥â¥ á®¢¯ «® ', n, ' ç¨á¥«:');
  For i1:=1 to 6 do begin
   if c[i1]<>0 then writeln(c[i1]);
  end;
  readln;
end.
