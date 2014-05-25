Program jaut;

Type TField = Array [0..100, 0..100] of char;

Function DrawChess(f: TField; H:integer; a:integer): TField;
var i, j: integer;

Begin
  i:=1;
  Repeat
   for j:=1 to a do begin
    if j mod 2 <> 0 then f[i,j]:='*' else f[i,j]:='-';
   end;
   for j:=1 to a do begin
    if j mod 2 = 0 then f[i+1,j]:='*' else f[i+1,j]:='-';
   end;
   i:=i+2;
  Until i>=h;
  DrawChess:= f;


End;

Function DrawKirpi4(var f: TField): char;
begin
end;


Var F: TField;
    i1, i2, a2, a, h: integer;
    z: TField;

Begin
  Readln(a);
  Readln(h);

  z:= DrawChess(f, a, h);
  for i1:=1 to a do begin
   For i2:=1 to h do
    Write(z[i1, i2]);
    Writeln
  end;
 { z:=DrawKirpi4(f, a, h);
  for i1:=1 to h do begin
   For i2:=1 to a do
    Write()z[i1, i2];
   Writeln;
  end;      }


End.


{1 x - x - x -
   - x - x - x
   x - x - x -
   - x - x - x

 2 x x x x x x
   x         x
   x         x
   x         x
   x         x
   x x x x x x

 3 xx--xx--
   --xx--xx
   xx--xx--
   --xx--xx

 4 ----------
   -x-x-x-x-x
   ----------
   -x-x-x-x-x
   ----------

 5 ----------
   -xxxxxxxxx
   -x--------
   -x-xxxxxxx
   -x-x------
   -x-x-xxxxx}