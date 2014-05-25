Program Gaussism;
const Safronix = 99999;
      nline = 16;
      nchlen - 16;

type Tlin = record
  zn4fn: real;
  koef: array [1..nchlen] of real;  //Коэффициенты
  otvet: array [1..nchlen] of real; //otvet - массив со значениями всех членов
 end;                                                //без коэффициентов

var f: file of Tlin;
    Lineage,Reza: array [1..nline] of Tlin;
    i1,i2,i3: longint;
    rez,KoefKoefa: real;
    sub,finLin: TLin;
    sese: set of [1..255];


Begin
  Writeln;
  Writeln('Я... делаю...');
  Writeln('В общем, загружаю типовой файл, в нём Н-ное количество членов');
  writeln('системы линейного алгебраического уравнения.');
  writeln('А потом нахожу значение каждого члена.');

  Assign(f,'data.dat');
  {$I-}
   Reset(f);
  {$I+}
  if IOresult<>0 then begin
//Заполнение файла всякой фигнёй
    rewrite(f);
    for i2:=1 to nline do begin
      for i1:=1 to nchlen do
        write(f.koef[i1],random(nchlen*2)-nchlen);
      write(f.zn4fn, random(nchlen*10)-nchlen*5);
   end;
 end;
  Close(f);
  Reset(f);
  i1:=1;
  Repeat
    Read(F,Lineage[i1]);
    i1:=i1+1;
 Until EoF(F);


 for i3:=1 to nline do
   For i1:=1 to nline do
     if Lineage[i1].koef[1]<Lineage[i1+1].koef[1] then begin
       sub:=Lineage[i1];
       Lineage[i1]:=Lineage[i2];
       Lineage[i2]:=sub;
    end;

 include(seSe,1..255);
 finLin:=Lineage[1];
 for i1:=1 to 255 do if FinLin[i1]=0 then exclude(seSe,[i1]);

//Ну наконец-то начинаем считать!
  i4:=0;
  i3:=2;
  For i2:=1 to nchlen-1 do begin
    i4:=i4+1;
    if (Lineage[i1].chi[i2]<>0) and
        ([Lineage[i1]]*seSe=[Lineage[i1]]) then begin
      KoefKoefa:=Lineage[i1].chi[i2]/finLin.chi[i2];
      for i3:=1 to nchlen do FinLin.chi[i3]:=FinLin.chi[i3]*KoefKoefa;
      FinLin.zn4Fn:=FinLin.zn4Fn*KoefKoefa;
      For i3:=1 to nchlen do FinLin.chi[i3]:=FinLin.chi[i3]-Lineage[i1].chi[i3];
      FinLin.zn4Fn:=FinLin.zn4Fn-Lineage[i1].zn4Fn;
      exclude(seSe,[i2]);
      Rez[i4]:=FinLin;
    end else Поменять местами, короче с таким, у которого есть такой член
    i3:=i3+1;
 end;
end.