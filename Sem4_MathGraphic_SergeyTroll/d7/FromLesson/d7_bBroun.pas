Program Brounovskaya4astica;
Uses Graph,WinCRT,Dos;

Const
  Safronix = 9999999;
  strcount = 10;
  PC = 5;

Type TPoint=record
  x,y: real;
end;

Type TLine=record
  A,V,Tpr,tprr:TPoint;
end;

Type TMath=record
  a,b,c:real;
end;

Function asin(x:real): real;
begin
 asin:=arctan(x/sqrt(1-sqr(x)));
end;

Function o(x:real):longint;
begin
  o:=round(x);
end;
Var i1,i2,gd,gm: integer;
    x0,y0,a1,a2,a3,a4,b1,b2,b3,b4,x1,y1,x2,y2,sindex:int64;
    Srk,Vector,smm,smmm,SrkF,p,PrPr: TPoint;
    Lineage: array [1..16] of TLine;
    Stolknovenye,bo:boolean;
    r,x,gol,alpha,beta,gamma,l,shortest: real;
    r2: real;
    t: array [1..8] of integer;
    math:tmath;
    key: char;

Procedure move(key: char);
var i1: longint;
    sub,subsub,ugol,fx,fy: real;
Begin
  sub:=Pi/60;
  case key of
      'a':
       for i1:=1 to StrCount-4 do with lineage[i1] do begin
        setcolor(black);
        line(round(a.x),round(a.y),round(v.x),round(v.y));
        A.x:=a.x-PC;
        V.x:=v.x-Pc;
        setcolor(yellow);
        line(round(a.x),round(a.y),round(v.x),round(v.y));
       end;
       's':
       for i1:=1 to StrCount-4 do with lineage[i1] do begin
        setcolor(black);
        line(round(a.x),round(a.y),round(v.x),round(v.y));
        A.y:=a.y+PC;
        V.y:=v.y+PC;
        setcolor(yellow);
        line(round(a.x),round(a.y),round(v.x),round(v.y));
       end;
       'w':
       for i1:=1 to StrCount-4 do with lineage[i1] do begin
        setcolor(black);
        line(round(a.x),round(a.y),round(v.x),round(v.y));
        A.y:=a.y-PC;
        V.y:=v.y-PC;
        setcolor(yellow);
        line(round(a.x),round(a.y),round(v.x),round(v.y));
       end;
       'd':
       for i1:=1 to StrCount-4 do with lineage[i1] do begin
        setcolor(black);
        line(round(a.x),round(a.y),round(v.x),round(v.y));
        A.x:=a.x+PC;
        V.x:=v.x+Pc;
        setcolor(yellow);
        line(round(a.x),round(a.y),round(v.x),round(v.y));
       end;
       'r': begin



         subsub:=sub;
  for i1:=1 to StrCount-4 do with lineage[i1] do begin
  setcolor(black);
        line(round(a.x),round(a.y),round(v.x),round(v.y));
    fx:=A.x; fy:=A.y;

    sub:=subsub;
    r:=sqrt(sqr(fx)+sqr(fy));
	ugol:=asin(fy/r);
    if (fx<0) then ugol:= Pi-ugol
    else ugol:=2*Pi+ugol;
    if ugol<0 then ugol:=90-ugol;
    sub:=(round((sub+ugol)*1000000) mod round(2*Pi*1000000))/1000000;
    fy:=sin(sub)*r;
    fx:=abs(sqrt(sqr(r)-sqr(fy)));
    if (sub>0.5*Pi) and (sub<1.5*pi) then fx:=-fx;
    A.x:=fx; A.y:=fy;



    fx:=v.x; fy:=v.y;

    sub:=subsub;
    r:=sqrt(sqr(fx)+sqr(fy));
	ugol:=asin(fy/r);
    if (fx<0) then ugol:= Pi-ugol
    else ugol:=2*Pi+ugol;
    if ugol<0 then ugol:=90-ugol;
    sub:=(round((sub+ugol)*1000000) mod round(2*Pi*1000000))/1000000;
    fy:=sin(sub)*r;
    fx:=abs(sqrt(sqr(r)-sqr(fy)));
    if (sub>0.5*Pi) and (sub<1.5*pi) then fx:=-fx;
    V.x:=fx; V.y:=fy;
    setcolor(cyan);
        line(round(a.x),round(a.y),round(v.x),round(v.y));
   end;
  end;
  end;

end;

Begin
  gd:=detect;
  InitGraph(gd,gm,'');
  X0:=GetMaxX;
  y0:=GetMaxY;
  SetViewPort(x0 div 2, y0 div 2, x0, y0, False);
  Randomize;

  With Lineage[1] do begin
    A.x:=-300;
    A.y:=166;
    V.x:=300;
    V.y:=166;
    line(round(a.x),round(a.y),round(v.x),round(v.y));
  end;
  With Lineage[2] do begin
    A.x:=300;
    A.y:=166;
    V.x:=1;
    V.y:=-333;
    line(round(a.x),round(a.y),round(v.x),round(v.y));
  end;
  With Lineage[3] do begin
    A.x:=-300;
    A.y:=166;
    V.x:=1;
    V.y:=-333;
    line(round(a.x),round(a.y),round(v.x),round(v.y));
  end;
  With Lineage[4] do begin
    A.x:=-250;
    A.y:=80;
    V.x:=-200;
    V.y:=200;
    line(round(a.x),round(a.y),round(v.x),round(v.y));
  end;
  With Lineage[5] do begin
    A.x:=250;
    A.y:=80;
    V.x:=200;
    V.y:=200;
    line(round(a.x),round(a.y),round(v.x),round(v.y));
  end;
  With Lineage[6] do begin
    A.x:=-100;
    A.y:=-253;
    V.x:=100;
    V.y:=-253;
    line(round(a.x),round(a.y),round(v.x),round(v.y));
  end;
  With Lineage[7] do begin
    A.x:=-Getmaxx div 2+1;
    A.y:=-Getmaxy div 2+1;
    V.x:=getmaxx div 2-1;
    V.y:=-getmaxy div 2+1;
    line(round(a.x),round(a.y),round(v.x),round(v.y));
  end;
  With Lineage[8] do begin
    A.x:=-Getmaxx div 2+1;
    A.y:=Getmaxy div 2-1;
    V.x:=getmaxx div 2-1;
    V.y:=getmaxy div 2-1;
    line(round(a.x),round(a.y),round(v.x),round(v.y));
  end;
  With Lineage[9] do begin
    A.x:=Getmaxx div 2-1;
    A.y:=Getmaxy div 2+1;
    V.x:=getmaxx div 2-1;
    V.y:=-getmaxy div 2-1;
    line(round(a.x),round(a.y),round(v.x),round(v.y));
  end;
  With Lineage[10] do begin
    A.x:=-Getmaxx div 2+1;
    A.y:=-Getmaxy div 2+1;
    V.x:=-getmaxx div 2+1;
    V.y:=getmaxy div 2-1;
    line(round(a.x),round(a.y),round(v.x),round(v.y));
  end;
  Vector.x:=12;
  Vector.y:=14;
  srk.x:=0;
  srk.y:=0;
  With Srk do Repeat
    shortest:=9999;
    x:=x+Vector.x;
    y:=y+Vector.y;
    P.x:=x+Vector.x;
    P.y:=y+Vector.y;

    bo:=false;

  for i1:=1 to 8 do
   With Lineage[i1] do begin

    TPr.x:=(A.x*sqr(V.y-A.y)+p.x*sqr(V.x-A.x)+(V.x-A.x)*(V.y-A.y)*(p.y-A.y)) / (sqr(V.y-A.y)+sqr(V.x-A.x));
    TPr.y:=(V.y-A.y)*(TPr.x-A.x)/(V.x-A.x)+A.y;
    tprr.x:=(A.x*sqr(V.y-A.y)+srk.x*sqr(V.x-A.x)+(V.x-A.x)*(V.y-A.y)*(srk.y-A.y)) / (sqr(V.y-A.y)+sqr(V.x-A.x));
    tprr.y:=(V.y-A.y)*(TPrr.x-A.x)/(V.x-A.x)+A.y;

//(Esli s ot sharika o to4ki perpendikulyara < dlinni vektora) i  (rasstoyaniye do etoy per. tochki menbshe, chem do drugih liniy)
    if (sqrt(sqr(srk.y-tpr.y)+sqr(srk.x-tpr.x))<sqrt(sqr(vector.x)+sqr(vector.y))) and (Shortest>sqrt(sqr(srk.y-tpr.y)+sqr(srk.x-tpr.x))) then begin
    shortest:=sqrt(sqr(srk.y-tpr.y)+sqr(srk.x-tpr.x));
    sindex:=i1;
    bo:=true end;

   end;

   for i1:=1 to strcount do
    with Lineage[i1] do if (sindex=i1) and (bo) then begin

      Smm.x:=2*tpr.x-p.x;
      Smm.y:=2*tpr.y-p.y;
      smmm.x:=2*tprr.x-srk.x;
      smmm.y:=2*tprr.y-srk.y;
      Vector.x:=smm.x-smmm.x;
      Vector.y:=smm.y-smmm.y;
      bo:=false;
   end;
    Circle(O(x),O(y),5);


    delay(50);

    if keypressed then move(readkey);
    SetColor(Black);
    Circle(O(x),O(y),5);
    SetColor(yellow);
    if keypressed then if readkey=chr(27) then Stolknovenye:=true;
  Until Stolknovenye;
end.
