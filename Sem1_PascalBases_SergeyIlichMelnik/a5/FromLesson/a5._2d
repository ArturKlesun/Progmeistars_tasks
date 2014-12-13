Program jaut;

Const Black = '1'; White = '0';

Type TField = Array [0..100, 0..100] of char;

Function DrawChess1(f: TField; H:integer; a:integer): char;
var i, j, s, d: integer;

Begin
  i:=1;
  Repeat
   for j:=1 to a do begin
    if j mod 2 = 0 then f[i,j]:='1' else f[i,j]:='0';
   end;
   for j:=1 to a do begin
    if j mod 2 = 1 then f[i+1,j]:='1' else f[i+1,j]:='0';
   end;
  Until i<>h;


End;



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
F: TField of char;
    i1, a2: integer;
Begin
  a:=9;
  h:=5;
  z:=DrawChess(f, a, h);
  for i1:=1 to h do begin
   For i2:=1 to a do
   Write(f[i1, i2]);
   Writeln;
  end;


End.