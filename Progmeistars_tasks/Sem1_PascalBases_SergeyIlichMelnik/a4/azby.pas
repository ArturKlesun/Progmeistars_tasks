Program azby;
Var sb, se: String;
    i1: integer;
    z: string;
Begin
  Write('������, ��������, ࠭����� ⥪��, � � ᤥ��� ��� ��� ����� ࠭�����: ');
  writeln;
  Readln(sb);
  For i1:=1 to length(sb) div 2 do begin
   z:='';
   z:=copy(sb, length(sb)+1-i1, 1);
   write(z);
   Write(se);
   z:='';
   z:=copy(sb, i1, 1);
   write(z);
  End;
  if length(sb) mod 2 <> 0 then begin
   z:=copy(sb, length(sb) div 2 +1, 1);
   write(z);
  end;
End.
