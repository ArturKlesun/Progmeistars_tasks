Unit Gaussism;

Interface
Function Power(a: real;b: byte): real;


const prrr=4;
type Tlin = record
  zn4fn: real;
  koef: array [1..prrr+1] of real;  //Коэффициенты
  discred: boolean;
  ndiscred: byte;
 end;
type arara = array [0..prrr] of real;
Function Mnogo4lenoStonogostj(x,y: arara): arara;

Implementation

Function Power(a: real;b: byte): real;
var i1: longint;
Begin
  Power:=1;
  if b<>0 then for i1:=1 to b do Power:=Power*a;
End;

Function Mnogo4lenoStonogostj(x,y: arara): arara;
label skipp;
var Otvet: array [1..prrr+1] of real;
    Lineage,Reza,sotye: array [1..prrr+1] of Tlin;
    i1,i2,i3,i4,i5,i,rand,breaker,nline,nchlen: longint;
    n1,n2,n3,n: longint;
    rez,KoefKoefa,sumotvet: real;
    sub,finLin,fsub: TLin;
    tgr:byte;
    podhodit: boolean;

Begin
  nchlen:=prrr+1;
  nline:=nchlen;
//Вынос данных в массив:
  i1:=0;
  Repeat
    i1:=i1+1;
    For i2:=1 to nchlen do Lineage[i1].koef[i2]:=power(x[i1-1],i2-1);
    Lineage[i1].zn4fn:=y[i1-1];
  Until i1=nline;
  finlin:=lineage[1];
//Перемещение членов, тот из которых в первой линейке - самый большой, на первое место:
 for i2:=1 to nline do
   For i1:=1 to nchlen-1 do
     if Lineage[i1].koef[1]<Lineage[i1+1].koef[1] then begin
       sub:=Lineage[i1];
       Lineage[i1]:=Lineage[i2];
       Lineage[i2]:=sub;
    end;
//Выводим содержимое массива на экран
   {   for i3:=1 to nline do begin
        writeln;
        for i1:=1 to nchlen do
          write(lineage[i3].koef[i1]:5:1);
        write(lineage[i3].zn4fn:7:1);
      end;
      writeln('Это ещё до модификаций.');
      }
//Начинаем считать
  for i2:=1 to nchlen-1 do begin
    for i4:=1 to nline do begin
      rez:=lineage[i4].koef[i2];
      for i1:=1 to nchlen do lineage[i4].koef[i1]:=lineage[i4].koef[i1]/rez;
      lineage[i4].zn4fn:=lineage[i4].zn4fn/rez;
    end;

    For i4:=nline-i2 downto 1 do begin
	  for i1:=1 to nchlen do lineage[i4].koef[i1]:=lineage[i4].koef[i1]-lineage[nline-i2+1].koef[i1];
	  lineage[i4].zn4fn:=lineage[i4].zn4fn-lineage[nline-i2+1].zn4fn;
	end;

  end;

  For i2:=1 to nchlen do begin
    sumotvet:=0;
    if i2<>1 then for i1:=1 to i2-1 do sumotvet:=sumotvet+otvet[i1]*lineage[i2].koef[nchlen-i1+1];
    otvet[i2]:=(lineage[i2].zn4fn-sumotvet)/lineage[i2].koef[nchlen-i2+1];
  end;

//Proverka
  sumotvet:=0;
  writeln;
  with finlin do For i1:=1 to nchlen do begin {writeln('Ответ=',sumotvet:8:4,'+',koef[i1]:8:4,'*',otvet[nchlen-i1+1]:8:4); }sumotvet:=sumotvet+koef[i1]*otvet[nchlen-i1+1]; end;
  writeln;
 { writeln('Проверка:');
  writeln(sumotvet,'=',finlin.zn4fn);
  writeln('Где левая сторона - изначальные коэффициенты первой линейки, умноженные на полученные значения членов, а');
  writeln('Справа - изначальное значение равенства в первой линейке.');}
  For i1:=1 to nchlen div 2 do begin
    rez:=otvet[i1];
    otvet[i1]:=otvet[nchlen+1-i1];
    otvet[nchlen+1-i1]:=rez;
  end;
  for i1:=0 to prrr do
    mnogo4lenostonogostj[i1]:=otvet[i1+1];
end;

end.
