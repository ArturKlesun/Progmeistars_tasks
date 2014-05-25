{
Программа, которая находит наибольший элемент в каждой тройке и заменяет на него второй элемент;
}
Program massive_triviallity;
const length=50;
Var n: array [1..length] of byte;
    tr: array [1..3] of byte;
    i: integer;
    sub: array [0..2] of byte;
    k: byte;
    z: byte;
    w: byte;
Begin
  randomize;
  Writeln('Cipari pirms izmainas');
 For i:=1 to length do begin
   n[i]:= random(10);
   write(n[i]);
 end;
  k:=n[length-4];
  w:=n[length-3];
  Writeln('Cipari pec izmainas');
 For i:=0 to length-3 do begin
   if i>1 then n[i]:=sub[(i) mod 2];
   tr[1]:=n[i+1];
   tr[2]:=n[i+2];
   tr[3]:=n[i+3];
   if (tr[1]>tr[2]) and (tr[1]>=tr[3]) then sub[i mod 2]:=tr[1];
   if (tr[3]>tr[2]) and (tr[3]>=tr[1]) then sub[i mod 2]:=tr[3];
   if (tr[2]>=tr[3]) and (tr[2]>=tr[1]) then sub[i mod 2]:=tr[2];

 end;
  z:=n[length-2];
  if w<k then sub[2]:=k else sub[2]:=w;
  if w<n[length-2] then sub[2]:=n[length-2];
  if n[length-2]<w then z:=w;
  if (n[length-2]<n[length-1]) and (n[length-1]>z) then z:=n[length-1];
  if n[length-2]>n[length-1] then n[length-1]:=n[length-2];
  if n[length]>n[length-1] then n[length-1]:=n[length];
  n[length-2]:=z;
 For i:=1 to length do
  write(n[i]);
  readln;
End.
