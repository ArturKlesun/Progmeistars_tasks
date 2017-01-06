Program DedMorozzz;
Uses Gaussism,graph,wincrt;
Const Safronix = 99999;
      n=4;
Var i1,i2,i3,err,nraz: longint;
    x,y,P,a: array [0..n] of real;
	f: text;
	zn4:string[32];
    hm,otvet,rez: real;
    gd,gm: integer;

Procedure NarisovatyGraphik;
Begin
  otvet:=0;
    rez:=i1/10000;
    for i2:=0 to n do otvet:=otvet+power(rez,i2)*a[i2];
    if (abs(otvet)<Getmaxy) then PutPixel(round(i1/100),round(otvet),red);
    setcolor(cyan);
    for i3:=0 to n do if (i1+0.5>=x[i3]*10000) and (i1-0.5<=x[i3]*10000) then
      circle(round(x[i3]*100),round(y[i3]),3);
    setcolor(magenta);
    if (i1+0.5>=hm*10000) and (i1-0.5<=hm*10000) then
     begin
      otvet:=0;
      for i2:=0 to n do otvet:=otvet+power(hm,i2)*a[i2];
      circle(round(hm*100),round(otvet),4);
      Line(round(hm*100),round(otvet),round(hm*100),-getmaxy div 2);
      Line(round(hm*100),round(otvet),-getmaxx div 2, round(otvet));
      OutTextXY(round(hm*100),round(otvet),'Vvedennaya vami to4ka');
     end;
end;

Begin
  Writeln;
  Writeln('Эта программа, она...');
  Writeln('Она принимает точки из траектории полёта Деда Мороза на бутылке Кока-Колы...');
  Writeln('И говорит, на какой высоте он будет в произвольный моемент времени.');
  Writeln('Точки берутся из файла "data.txt" в корневой директории программы.');
  Writeln;
//Организация файла:
  Assign(f,'data.txt');
  {$I-}
   Reset(f);
  {$I+}
  if IOresult<>0 then begin
//Заполняем файл ерундой:
    rewrite(f);
    for i2:=0 to n do begin
      if i2<>0 then repeat x[i2]:=30*(random*n*2-n)/n*(i2+1)/(n+1); until (abs(x[i2])<30) and (x[i2]>x[i2-1])
      else repeat x[i2]:=(random-0.5)*(i2+1)*30; until (i2<>0) or (abs(x[i2])<30) and (x[i2]<0);
      y[i2]:=random*n*100-n*50;
      x[i2]:=round(x[i2]*100000)/100000;
      y[i2]:=round(y[i2]*100000)/100000;
      writeln(f,x[i2]:2:8);
      writeln(f,y[i2]:2:8);
    end;
  end;
  Close(f);
//Вытаскиваем значения из файла:
  Reset(f);
  i1:=0;
  Repeat
	readln(f,zn4);
        val(zn4,x[i1],err);
	readln(f,zn4);
	val(zn4,y[i1],err);
	i1:=i1+1;
  Until EoF(F);
  close(f);
//Начинаем творить:

//Выводим содержимое массива на экран
      Writeln('Содержимое файла:');
      for i3:=0 to n do begin
        writeln;
        for i1:=0 to n do
          write(power(x[i3],i1):9:5,' ');
        write(y[i3]:7:5);
      end;
      writeln;

  nraz:=n;
  a:=Mnogo4lenostonogostj(x,y);
//Вводится Х, время. Возвращается У, высота
  writeln;
  For i1:=0 to n do
    writeln('x',i1,'=',x[i1]:7:16,' y',i1,'=',y[i1]:7:8,'a',i1,'=',a[i1]:7:8);
  writeln;
  Writeln('Введите Х - время, пожалуйста: ');
  readln(hm);
  nraz:=1;
  otvet:=0;
  for i1:=0 to n do otvet:=otvet+power(hm,i1)*a[i1];
  gd:=detect;
  initgraph(gd,gm,'');
  setviewport(getmaxx div 2,getmaxy div 2, getmaxx, getmaxy,false);
  setcolor(green);
  line(-getmaxx div 2,0,getmaxx div 2,0);
  setcolor(yellow);
  outtextxy(300,20,'3,0');
  line(300,5,300,-5);
  outtextxy(200,20,'2,0');
  line(200,5,200,-5);
  outtextxy(100,20,'1,0');
  line(100,5,100,-5);
  outtextxy(-300,20,'-3,0');
  line(5,300,-5,300);
  outtextxy(20,300,'300');
  line(5,200,-5,200);
  outtextxy(20,200,'200');
  line(5,100,-5,100);
  outtextxy(20,100,'100');
  outtextxy(20,-300,'-300');
  setcolor(blue);
  line(0,-getmaxy div 2,0,getmaxy div 2);
  setcolor(yellow);
  for i1:= -30000 to 30000 do begin
    NarisovatyGraphik;
  end;
  i1:=30000;
  while (abs(otvet)<Getmaxy) and (i1<Getmaxx*100) do begin
    i1:=i1+1;
    NarisovatyGraphik;
  end;
  i1:=-30000;
  while (abs(otvet)<Getmaxy) and (i1>-Getmaxx*100) do begin
    i1:=i1-1;
    NarisovatyGraphik;
  end;
  readkey;
end.
