Program Gaussism;
const Safronix = 99999;
      nline = 16;
      nchlen = 16;

type Tlin = record
  zn4fn: real;
  koef: array [1..nchlen] of real;  //�����樥���
  discred: boolean;
  ndiscred: byte;
 end;
label skipp;
var f: file of Tlin;
    ff: text;
    Lineage,Reza: array [1..nline] of Tlin;
    i1,i2,i3,i4,i5,i,rand,breaker: longint;
    n1,n2,n3,n: longint;
    rez,KoefKoefa,sumotvet: real;
    sub,finLin,fsub: TLin;
    sotye: array [1..nchlen] of TLin;
	Otvet: array [1..nchlen] of real;
    podhodit: boolean;

Begin
  Writeln;
  Writeln('�... �����...');
  Writeln('� ��饬, ����㦠� ⨯���� 䠩�, � �� �-��� ������⢮ 童���');
  writeln('��⥬� ��������� �����ࠨ�᪮�� �ࠢ�����.');
  writeln('� ��⮬ ��宦� ���祭�� ������� 童��.');

//�࣠����� 䠩���
  Assign(f,'data.dat');
  {$I-}
   Reset(f);
  {$I+}
  if IOresult<>0 then begin
//���������� 䠩�� ��类� 䨣��
    rewrite(f);
    seek(f,0);
    for i2:=1 to nline do begin
      for i1:=1 to nchlen do
        repeat fsub.koef[i1]:=random(nchlen*2)-nchlen; until fsub.koef[i1]<>0;
      fsub.zn4fn:=random(nchlen*10)-nchlen*5;
      write(f,fsub);
    end;
  end;
  Assign(ff,'txt.txt');
  {$I-}
   Reset(ff);
  {$I+}
  if IOresult<>0 then begin
//������ � �⠥�� �ଠ�
    rewrite(ff);
    seek(f,0);
    for i2:=1 to nline do begin
      read(f,fsub);
      writeln(ff);
      for i1:=1 to nchlen do
        write(ff,fsub.koef[i1]:5:0);
      write(ff,fsub.zn4fn:7:0);
   end;
  end;
  close(ff);
  Close(f);
//�뭮� ������ �� 䠩�� � ���ᨢ:
  Reset(f);
  i1:=0;
  seek(f,0);
  Repeat
    i1:=i1+1;
    Read(F,Lineage[i1]);
  Until EoF(F);
  close(f);
  finlin:=lineage[1];
//��६�饭�� 童���, �� �� ������ � ��ࢮ� ������� - ᠬ� ����让, �� ��ࢮ� ����:
 for i2:=1 to nline do
   For i1:=1 to nchlen-1 do
     if Lineage[i1].koef[1]<Lineage[i1+1].koef[1] then begin
       sub:=Lineage[i1];
       Lineage[i1]:=Lineage[i2];
       Lineage[i2]:=sub;
    end;
//�뢮��� ᮤ�ন��� ���ᨢ� �� �࠭
      for i3:=1 to nline do begin
        writeln;
        for i1:=1 to nchlen do
          write(lineage[i3].koef[i1]:5:1);
        write(lineage[i3].zn4fn:7:1);
      end;
      writeln('�� ��� �� ����䨪�権.');

//��稭��� �����
  for i2:=1 to nchlen-1 do begin
    for i4:=1 to nline do begin
      rez:=lineage[i4].koef[i2];
      for i1:=1 to nchlen do lineage[i4].koef[i1]:=lineage[i4].koef[i1]/rez;
      lineage[i4].zn4fn:=lineage[i4].zn4fn/rez;
    end;
    For i1:=1 to nline do   begin
      For i3:=1 to nchlen do  write(Lineage[i1].koef[i3]:7:3);
      write(lineage[i1].zn4fn:9:3);
      writeln;
    end;
    Writeln('�� ⮫쪮 �� ࠧ����� �� �2-� 童� ������ ������� ', i2);
    For i4:=nline-i2 downto 1 do begin
	  for i1:=1 to nchlen do lineage[i4].koef[i1]:=lineage[i4].koef[i1]-lineage[nline-i2+1].koef[i1];
	  lineage[i4].zn4fn:=lineage[i4].zn4fn-lineage[nline-i2+1].zn4fn;
	end;
    For i1:=1 to nline do   begin
      For i3:=1 to nchlen do  write(Lineage[i1].koef[i3]:7:3);
      write(lineage[i1].zn4fn:9:3);
      writeln;
    end;
    Writeln('�� ⮫쪮 �� ��祫 �� ��� ������ ������� ', nline-i2+1);
  end;
  writeln;
  writeln;
  For i1:=1 to nline do   begin
    For i2:=1 to nchlen do  write(Lineage[i1].koef[i2]:6:2);
    write(lineage[i1].zn4fn:8:2);
    writeln;
  end;
  For i2:=1 to nchlen do begin
    sumotvet:=0;
    if i2<>1 then for i1:=1 to i2-1 do sumotvet:=sumotvet+otvet[i1]*lineage[i2].koef[nchlen-i1+1];
	otvet[i2]:=(lineage[i2].zn4fn-sumotvet)/lineage[i2].koef[nchlen-i2+1];
  end;
  For i1:=1 to nchlen do writeln(otvet[i1]);
  Writeln;
  Writeln;
//Proverka
  sumotvet:=0;
  with finlin do For i1:=1 to nchlen do sumotvet:=sumotvet+koef[i1]*otvet[nchlen-i1+1];
  writeln('�஢�ઠ:');
  writeln(sumotvet,'=',finlin.zn4fn);
  writeln('��� ����� ��஭� - ����砫�� �����樥��� ��ࢮ� �������, 㬭������ �� ����祭�� ���祭�� 童���, �');
  writeln('��ࠢ� - ����砫쭮� ���祭�� ࠢ���⢠ � ��ࢮ� �������.');
  readln;

end.
