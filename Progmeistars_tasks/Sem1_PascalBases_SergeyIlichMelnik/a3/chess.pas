Program chess;

Procedure Print(h: LongInt; a: Longint; h2: Longint; a2: LongInt; symb: char; symb2: char; var f: text);
          var e, c, t, k, v, kr: integer;

Begin
  for k:=1 to h div 2 do begin
   for kr:=1 to h2 do begin
    for e:=1 to a div 2 do begin
     for c:=1 to a2 do write(f, symb);
     for c:=1 to a2 do write(f, symb2);
    end;
    if a mod 2 <> 0 then for c:=1 to a2 do write(f, symb);
    writeln(f);
   end;
   for kr:=1 to h2 do begin
    for e:=1 to a div 2 do begin
     for c:=1 to a2 do write(f, symb2);
     for c:=1 to a2 do write(f, symb);
    end;
    if a mod 2 <> 0 then for c:=1 to a2 do write(f, symb2);
    writeln(f);
   end;
  end;
  if h mod 2 <> 0 then begin
  for kr:=1 to h2 do begin
    for e:=1 to a div 2 do begin
     for c:=1 to a2 do write(f, symb);
     for c:=1 to a2 do write(f, symb2);
    end;
    if a mod 2 <> 0 then for c:=1 to a2 do write(f, symb);
    writeln(f);
   end;
  end;
end;


var h, h2, a, a2: integer;
    f: text;
    m: LongInt;

Begin
  Assign(f, 'chess.dat');
  Writeln('������ ������ ���� (� ���⪠�), ��������:');
  Readln(h);
  Writeln('������ �ਭ� ���� (� ���⪠�), ��������:');
  Readln(a);
  Writeln('������ ������ ���⪨, ��������:');
  Readln(h2);
  Writeln('������ �ਭ� ���⪨, ��������:');
  Readln(a2);
  Rewrite (f);
  Print(h, a, h2, a2, '-', '+', f);
  Close(f);
End.
