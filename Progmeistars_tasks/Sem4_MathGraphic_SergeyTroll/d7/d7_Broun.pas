{
Здесь задание, что вы давали на прошлом занятии: шарик, отскакивающий от прямых.
}
Program Brounovskaya4astica;
Uses Graph,WinCRT,Dos;

Const
  Safronix = 9999999;

Type TPoint=record
  x,y: real;
end;

Type TLine=record
  A,V,Tpr,tprr:TPoint;
end;

Type TMath=record
  a,b,c:real;
end;

Function o(x:real):longint;
begin
  o:=round(x);
end;
Var i1,i2,gd,gm,x0,y0,a1,a2,a3,a4,b1,b2,b3,b4,x1,y1,x2,y2,sindex:integer;
    Srk,Vector,smm,smmm,SrkF,p,PrPr: TPoint;
    Lineage: array [1..8] of TLine;
    Stolknovenye,bo:boolean;
    r,x,gol,alpha,beta,gamma,l,shortest: real;
    r2: real;
    t: array [1..8] of integer;
    math:tmath;

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
    V.x:=0;
    V.y:=-333;
    line(round(a.x),round(a.y),round(v.x),round(v.y));
  end;
  With Lineage[3] do begin
    A.x:=-300;
    A.y:=166;
    V.x:=0;
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
  Vector.x:=9;
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

  for i1:=1 to 6 do
   With Lineage[i1] do begin
    TPr.x:=(A.x*sqr(V.y-A.y)+p.x*sqr(V.x-A.x)+(V.x-A.x)*(V.y-A.y)*(p.y-A.y)) / (sqr(V.y-A.y)+sqr(V.x-A.x));
    TPr.y:=(V.y-A.y)*(TPr.x-A.x)/(V.x-A.x)+A.y;
    tprr.x:=(A.x*sqr(V.y-A.y)+srk.x*sqr(V.x-A.x)+(V.x-A.x)*(V.y-A.y)*(srk.y-A.y)) / (sqr(V.y-A.y)+sqr(V.x-A.x));
    tprr.y:=(V.y-A.y)*(TPrr.x-A.x)/(V.x-A.x)+A.y;

//(Esli s ot sharika o to4ki perpendikulyara < dlinni vektora) i  (rasstoyaniye do etoy per. tochki menbshe, chem do drugih liniy)
    if (sqrt(sqr(srk.y-tpr.y)+sqr(srk.x-tpr.x))<sqrt(sqr(vector.x)+sqr(vector.y))) and (Shortest>sqrt(sqr(srk.y-tpr.y)+sqr(srk.x-tpr.x))) then begin
    shortest:=sqrt(sqr(srk.y-tpr.y)+sqr(srk.x-tpr.x));
    sindex:=i1;
    bo:=true end


//Inache, esli dva korotkih per.-lara ravni
else if (shortest=sqrt(sqr(srk.y-tpr.y)+sqr(srk.x-tpr.x))) then begin
    cleardevice;
    delay(2000);
    vector.x:=-vector.x;
    vector.y:=-vector.y;
   end;

   if sqrt(sqr(srk.y-tpr.y)+sqr(srk.x-tpr.x))=sqrt(sqr(vector.x)+sqr(vector.y)) then cleardevice;


   end;

   for i1:=1 to 6 do
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
    Delay(20);
    SetColor(Black);
    Circle(O(x),O(y),5);
    SetColor(yellow);
    if keypressed then if readkey=chr(27) then Stolknovenye:=true;
  Until Stolknovenye;
end.
