Program Zams;
Uses CRT;
Type TExams = record
 math: byte;
 latvian: byte;
 latvianG: byte;
 latvianBurts: Char;
 alchemy: byte;
end;
Type TStudent = record
  Surname: string[20];
  FirstName: string[20];
  Klase: string[3];
  Exams: TExams;
  number: longint;
end;

Var f: file of TStudent;
Var Student: Tstudent;
Var AStudents, BStudents, CStudents, DStudents, EStudents, FStudents: array [1..5000] of Tstudent;
      {10}    {9}          {7-8}       {5-6}      {3-4}      {1-2}
Procedure Add;
Var i1,no: longint;
a: tstudent;
Begin
 Assign(f,'studentData.dat');
{$I-}
 Reset(f);
{$I+}
 if IOResult<>0 then begin
  Rewrite(f);
  Close(f);
  Reset(f);
 end;
 With Student do Begin
  Writeln;
  Writeln('�� ��ࠫ�: �������� ����� �� �祭���.');
  Writeln;
  Writeln('���:');
  Readln(FirstName);
  Writeln('�������:');
  Readln(Surname);
  Writeln('�����:');
  Readln(klase);
  With Exams do begin
   Writeln('�������� ������ �� ��⥬�⨪�:');
   Readln(math);
   Writeln('�������� ������ �� ���㤠��⢥����� ���:');
   Readln(Latvian);
   Writeln('�������� ������ �� ��娬��(����⠭�� ��� ���ᨩ 3.0.1 � ���):');
   Readln(Alchemy);
   latvianG:=latvian*10;
   if LatvianG >90 then LatvianBurts:='A';
   if (LatvianG>80) and (LatvianG<91) then LatvianBurts:='B';
   if (LatvianG>70) and (LatvianG<81) then LatvianBurts:='C';
   if (LatvianG>50) and (LatvianG<71) then LatvianBurts:='D';
   if (LatvianG>40) and (LatvianG<51) then LatvianBurts:='E';
   if (LatvianG<41) then LatvianBurts:='F';
  End;
 End;
 Seek(f,filesize(f));
 write(f,Student);
  no:=1;
 for i1:=0 to filesize(f)-1 do begin
   seek(f,i1);
   read(f,a);
   a.number:=no;
   no:=no+1;
   seek(f,i1);
   write(f,a);
  end;
 close(f);
End;

Procedure Show;
Var i1: longint;
Begin
 Assign(f,'studentData.dat');
{$I-}
 Reset(f);
{$I+}
 if IOResult<>0 then begin
  Rewrite(f);
  Close(f);
  Reset(f);
 end;
 seek(f,0);
 clrscr;
 Repeat
  writeln('�':6,'���':20,'�������   ':20,'���cc':5,'���.':4,'���.':4,'���.':4, '���. �ࠦ.':10,'%':3);
  For i1:=1 to 20 do begin
   if not eof(f) then begin
    read(f,student);
    with student do
     with exams do begin
      writeln(number:6,firstname:20,surname:20,klase:5,math:4,alchemy:4,latvian:4, latvianBurts:10,latvianG:3);
     end;
   end;
  end;
  Writeln('������ ���� �������, �⮡� 㢨���� ᫥������ ��࠭���.');
  Readln;
 Until eof(f);
 close(f);
end;

Procedure Pro_Noobs;
var i1: longint;
Begin
 Assign(f,'studentData.dat');
{$I-}
 Reset(f);
{$I+}
 if IOResult<>0 then begin
  Rewrite(f);
  Close(f);
  Reset(f);
 end;
 seek(f,0);
 Writeln('�⫨筨��:');
 Repeat
  writeln('���':20,'�������   ':20,'���cc':5,'���.':3,'���.':3,'���.':3);
  For i1:=1 to 20 do begin
   if not eof(f) then begin
    read(f,student);
    with student do
     with exams do begin
      if ((math>7) and (latvian>7)) or ((latvian>7) and (alchemy>7)) or ((alchemy>7) and (math>7)) then writeln(firstname:20,surname:20,klase:5,math:4,latvian:4,alchemy:4);
     end;
   end;
  end;
  Writeln('������ ���� �������, �⮡� 㢨���� ᫥������ ��࠭���.');
  Readln;
 until eof(f);
 Writeln('���ᯥ���騥:');
 seek(f,0);
 Repeat
  writeln('���':20,'�������   ':20,'���cc':5,'���.':3,'���.':3,'���.':3);
  For i1:=1 to 20 do begin
   if not eof(f) then begin
    read(f,student);
    with student do
     with exams do begin
      if ((math<4) and (latvian<4)) or ((latvian<4) and (alchemy<4)) or ((alchemy<4) and (math>7)) then writeln(firstname:20,surname:20,klase:5,math:4,latvian:4,alchemy:4);
     end;
   end;
  end;
  Writeln('������ ���� �������, �⮡� 㢨���� ᫥������ ��࠭���.');
  Readln;
 until eof(f);
 close(f);
End;

Procedure ChangeGra;
Var aname, afame: string[20];
    svariable: tstudent;
    fp: longint;
Begin
  writeln('�� ��ࠫ�: �������� ��⥣��� �ࠦ����⢠.');
   Assign(f,'studentData.dat');
{$I-}
 Reset(f);
{$I+}
 if IOResult=0 then begin
  Writeln('������ ��� ��㤥��, �ࠦ����⢮ ���ண� ������ ��������:');
  Readln(aname);
  Writeln('������ 䠬���� ��㤥��:');
  Readln(afame);
  While not eof(f) do begin
   fp:=filepos(f);
   read(f,svariable);
   if (svariable.firstname=aname) and (svariable.surname=afame) then begin
    writeln('�祭�� ������ � ���� ������');
    writeln('���':20,'�������   ':20,'���cc':5,'���.':4,'���.':4,'���.':4, '���. �ࠦ.':10,'%':3);
    with svariable do with exams do writeln(firstname:20,surname:20,klase:5,math:4,alchemy:4,latvian:4, latvianBurts:10,latvianG:3);
    Writeln('������ ����� ���祭�� १���⮢ ������ �� ���㤠��⢥����� ��� (�� ������ �� ��):');
    Readln(svariable.exams.latvianG);
    svariable.exams.latvian:=svariable.exams.latvianG div 10;
    with svariable do with exams do begin
     if LatvianG >90 then LatvianBurts:='A';
     if (LatvianG>80) and (LatvianG<91) then LatvianBurts:='B';
     if (LatvianG>70) and (LatvianG<81) then LatvianBurts:='C';
     if (LatvianG>50) and (LatvianG<71) then LatvianBurts:='D';
     if (LatvianG>40) and (LatvianG<51) then LatvianBurts:='E';
     if (LatvianG<41) then LatvianBurts:='F';
    end;
    seek(f,fp);
    write(f,svariable);
    close(f);
    exit
   end;
  end;
  close(f);
  writeln('�祭�� �� ������ � ���� ������.');
 end else writeln('���� �� ������.');
End;

Procedure ShowGPerc;
var na,nb,nc,nd,ne,nf,n1: longint;
tmp: tstudent;
Begin
na:=0;
nb:=0;
nc:=0;
nd:=0;
ne:=0;
nf:=0;
n1:=0;
Assign(f,'studentData.dat');
writeln;
{$I-}
 Reset(f);
{$I+}
 if IOResult=0 then begin
  Repeat
   read(f,tmp);
   if tmp.exams.latvianBurts='A' then na:=na+1;
   if tmp.exams.latvianBurts='B' then nb:=nb+1;
   if tmp.exams.latvianBurts='C' then nc:=nc+1;
   if tmp.exams.latvianBurts='D' then nd:=nd+1;
   if tmp.exams.latvianBurts='E' then ne:=ne+1;
   if tmp.exams.latvianBurts='F' then nf:=nf+1;
   n1:=n1+1;
  Until eof(f);
  na:=na*100 div n1;
  nb:=nb*100 div n1;
  nc:=nc*100 div n1;
  nd:=nd*100 div n1;
  ne:=ne*100 div n1;

  nf:=100-na-nb-nc-nd-ne;
  Writeln(na,'% �祭���� ����稫� ��⥣��� �ࠦ����⢠ A');
  Writeln(nb,'% �祭���� ����稫� ��⥣��� �ࠦ����⢠ B');
  Writeln(nc,'% �祭���� ����稫� ��⥣��� �ࠦ����⢠ C');
  Writeln(nd,'% �祭���� ����稫� ��⥣��� �ࠦ����⢠ D');
  Writeln(ne,'% �祭���� ����稫� ��⥣��� �ࠦ����⢠ E');
  Writeln(nf,'% �祭���� ����稫� ��⥣��� �ࠦ����⢠ F');
 end else writeln('���� �� ������.');
 close(f);
End;

Procedure DeleteStudent;
Var tempo,tempo2: Tstudent;
key: char;
n: longint;
aname,famane: string[30];
pose:longint;
Begin
  Assign(f,'studentData.dat');
writeln;
{$I-}
 Reset(f);
{$I+}
 if IOResult=0 then begin
  n:=-1;
  aname:='tatuped';
  famane:='glaupen';
  Writeln('�� ��ࠫ�: 㤠���� �祭��� �� ���� ������');
  Writeln('������ N �᫨ ��� ����� �祭��� �� ������ ���');
  Writeln('������ V �᫨ ��� ����� �祭��� �� ����� � 䠬����:');
  repeat
   key:=upcase(readkey);
   if key = 'N' then begin
    Writeln('������ ����� �祭��� � ���� ������, ��������:');
    readln(n);
   end;
   if key = 'V' then begin
    Writeln('������ ��� �祭���, ��������:');
    Readln(aname);
    Writeln('������ 䠬���� �祭���, ��������:');
    Readln(famane);
   end;
  until (key='N') or (key='V');
  key:=' ';
  repeat
   read(f,tempo);
   if ((aname=tempo.firstname) and (famane=tempo.surname)) or (n=tempo.number) then begin
    Writeln('�祭�� ������ � ���� ������.');
    Writeln('�� 㢥७�, �� ������ ��� 㤠����? �� ������ ᢮� �ࠦ����⢮ � ᢨ��⥫��⢮ �� ����砭�� 誮��. (y/n)');
    repeat
     key:=upcase(readkey);
    until (key='N') or (key='Y');
    if key='Y' then begin
     pose:=filepos(f);
     seek(f,filesize(f));
     write(f,tempo);
     seek(f,pose);
     repeat
      read(f,tempo);
      seek(f, filepos(f)-2);
      write(f,tempo);
      seek(f,filepos(f)+1);
     until eOf(f);
     seek(f,filesize(f)-2);
     read(f,tempo);
     read(f,tempo2);
     seek(f,filesize(f)-2);
     truncate(f);
     {if (tempo=tempo2) then begin seek(f, filesize-1); write(f,eof); end;   }
     Writeln('�祭�� �ᯥ譮 㤠��');
    end;
    close(f);
    exit
   end;
  until eof(f);
  Writeln('�祭�� �� ������ � ���� ������');
 end else writeln('���� �� ������.');
 close(f);
End;

Procedure SortFama;
Var i1,i2,i3,i4,i5: longint;
    a,b: tstudent;
    e: text;
    nta: integer;
    y,z:integer;
    no:longint;
    tempo: integer;
Begin
  Assign(f,'studentData.dat');
  writeln;
{$I-}
 Reset(f);
{$I+}
 if IOResult=0 then begin
  seek(f,0);
  for i1:= 1 to filesize(f) do begin
     for i2:=0 to filesize(f)-1 do begin

      seek(f,i1-1);
      read(f,a);
      seek(f,i2);
      Read(f,b);
      nta:=0;
       repeat
        nta:=nta+1;
        if (ord(a.surname[nta])>64) and (ord(a.surname[nta])<91) then y:=ord(a.surname[nta])+32 else
        if (ord(a.surname[nta])>127) and (ord(a.surname[nta])<144) then y:=ord(a.surname[nta])+32 else
        if (ord(a.surname[nta])>143) and (ord(a.surname[nta])<160) then y:=ord(a.surname[nta])+80 else
        y:=ord(a.surname[nta]);
        if (ord(b.surname[nta])>64) and (ord(b.surname[nta])<91) then z:=ord(b.surname[nta])+32 else
        if (ord(b.surname[nta])>127) and (ord(b.surname[nta])<144) then z:=ord(b.surname[nta])+32 else
        if (ord(b.surname[nta])>143) and (ord(b.surname[nta])<160) then z:=ord(b.surname[nta])+80 else
        z:=ord(b.surname[nta]);
        if y<>z then begin
         break
        end;
       until (nta=length(a.surname)) or (nta=length(a.surname));
      if z>y then begin seek(f,i1-1); write(f,b); seek(f,i2); write(f,a); end;
     end;
  end;
  no:=1;
  for i1:=0 to filesize(f)-1 do begin
   seek(f,i1);
   read(f,a);
   a.number:=no;
   no:=no+1;
   seek(f,i1);
   write(f,a);
  end;
  Writeln('�����஢���');
 end else writeln('���� �� ������.');
 close(f);
End;

Begin
  repeat
  writeln;
  Writeln('������ �, �⮡� �������� ���ᮭ�; V, �⮡� �������� ᯨ᮪ �祭����;');
  Writeln('P, �⮡� �������� ���ᯥ����� � �⫨筨���;');
  Writeln('�, �⮡� �������� ��⥣��� �ࠦ����⢠; G, 㢨���� ��業��;');
  Writeln('D, �⮡� 㤠���� �祭��� �� ���� ������, S, ����஢��� �� 䠬����.');
  case UpCase(readkey) of
  'A': Add;
  'V': show;
  'P': Pro_noobs;
  'C': ChangeGra;
  '�': Add;
  '�': show;
  '�': Pro_noobs;
  '�': ChangeGra;
  'G': ShowGPerc;
  'D': DeleteStudent;
  'S': SortFama;
  end;
  until readkey=chr(27);
End.
