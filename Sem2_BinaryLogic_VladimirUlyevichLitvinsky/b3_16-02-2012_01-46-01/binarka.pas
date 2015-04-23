{c) Вводится целое положительно число меньше 300,
записать его римскими цифрами}
{неправильно складывает придурок!
11100100
00101101
---
11110010
схуя блядь?!
}
Unit binarka;
Interface
Function tobi(var i: integer; k: integer): string;
Function tode(s: string): integer;
Implementation
Uses CRT;
Function tobi(var i: integer; k: integer): string;
Var i1,i2, a1,a2, err: integer;
  rez: string;
  Begin
  tobi:='';
  i2:=0;
  While i<>0 do begin
   str(i mod k, rez);
   tobi:=tobi+rez;
   i:=i div k;
   i2:=i2+1;
  end;
  rez:='';
  For i1:=1 to i2 do begin
   rez:=rez+copy(tobi, length(tobi)-i1+1,1);
  end;
  Tobi:=rez;
  end;

Function tode(s: string): integer;
var a: string;
    l,err,b,rez,i1,bi,i2: integer;
    s1: string[1];
Begin
  b:=0;
  rez:=0;
  l:=length(s);
  for i1:=1 to l do begin
   bi:=1;
   s1:=copy(s,i1,1);
   val(s1,b,err);
    for i2:=1 to l-i1 do
    bi:=bi*2;
   if b<>0 then if l<>i1 then rez:=b*bi+rez else rez:=rez+1;
  end;
  tode:=rez;
end;

Function Roma(i: integer): string;
begin
  While i>100 do begin
   i:=i-100;
   Roma:=roma+'C';
  end;
  if i>=90 then begin
   i:=i-90;
   Roma:=roma+'XC';
  end;
  if i>=50 then begin
   i:=i-50;
   Roma:=Roma+'L';
  end;
  If i>=40 then begin
   i:=i-40;
   Roma:=Roma+'XL';
  End;
  While i>10 do begin
   i:=i-10;
   Roma:=Roma+'X';
  end;
  if i>=9 then begin
   i:=i-9;
   Roma:=roma+'IX';
  end;
  if i>=5 then begin
   i:=i-5;
   Roma:=Roma+'V';
  end;
  If i>=4 then begin
   i:=i-4;
   Roma:=Roma+'IV';
  End;
  While i>0 do begin
   i:=i-1;
   Roma:=Roma+'I';
  end;
end;

var a: string;
    l,err,b,rez,i1,bi,r1,k: integer;
    s1,b2: string;
Begin
 { Writeln('Число от 0 до 32767:');
  Readln(b);
  Writeln('Во сколько-ичную систему, Число от 2 до 10:');
  Readln(k);
  if b=0 then write('0');
  a:=tobi(b,k);
  writeln(a);
  writeln;
  b2:='';
  Writeln('Строка, которую перевести в 10-ричную систему:');
  Readln(b2);
  writeln(tode(b2));
  Writeln;
  Writeln('Число, которое желаете увидеть в римских цифрах (до 300-т):');
  Readln(R1);
  writeln(Roma(r1));  }
End.
