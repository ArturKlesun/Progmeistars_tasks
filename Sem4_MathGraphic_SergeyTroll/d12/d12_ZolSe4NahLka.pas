Program ZolSe4NahLka;
Uses CRT,Graph,winCRT;
Const Safronix = 99999;
      Eps = 0.001;
Function f(x: real): real;
  Begin
    f:=20*sqr(x)-600*x+700;
  end;
Var h,i1,i2: longint;
   x,a,b,c,d,Dmia,fa,fb,fc,fd,fx: real;
   gm,gd: Integer;
Begin
  gd:=detect;
  Randomize;
  Writeln;
  Writeln('Я, в общем...');
  Writeln;
  Writeln('Я нахожу вершину функции, используя границы и две делилки я же в них.');
  Writeln('f:=sqr(x)+5*x-18');
  h:=1024;
  initgraph(gd,gm, '');

//Считалка-Рисовалка
  SetViewPort(640,512,1280,1024,false);
  For i1:=-64000 to 64000 do begin
   PutPixel((i1+random(round(2000)-1000)) div 300+640,512+round(f(i1+random(round(2000)-1000))/200000000), red);
  end;
  a:=0;
  d:=1280;
  DmiA:=(d-a)*(3-sqrt(5))/2;
  b:=a+DmiA;
  setcolor(cyan);
  line(round(b),0,round(b),h);
  c:=d-DmiA;
  setcolor(magenta);
  line(round(c),0,round(c),h);
  fa:=f(a);
  fb:=f(b);
  fc:=f(c);
  fd:=f(d);
  While (d-a>Eps) do begin
    DmiA:=(d-a)*(3-sqrt(5))/2;
    b:=a+DmiA;
    setcolor(green);
    line(round(b),0,round(b),h);
    c:=d-DmiA;
    setcolor(red);
    line(round(c),0,round(c),h);
    if fb>fc then d:=c else a:=b;



  end;

  readkey;
  closegraph;
End.
