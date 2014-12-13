{$IFDEF NORMAL}
  {$H-,I+,OBJECTCHECKS-,Q+,R+,S-}
{$ENDIF NORMAL}
{$IFDEF DEBUG}
  {$H-,I+,OBJECTCHECKS+,Q+,R+,S-}
{$ENDIF DEBUG}
{$IFDEF RELEASE}
  {$H-,I-,OBJECTCHECKS-,Q-,R-,S-}
{$ENDIF RELEASE}
Program d3_3gl_Oclock;
Uses Graph,wincrt,crt,Dos;

const VCount = 4;
      ConstScaleRate = 3;
	  a = 1500;
	  h = sqrt(3)/2*a;
type TPoint = record
x,y,z: real;
end;
var xsum,ysum,zsum,ld:real;
Function asin(x:real): real;
begin
 if (x<>1) and (x<>-1) then
 asin:=arctan(x/sqrt(1-sqr(x))) else asin:=x*90;
end;
Function F(z: real): real;
Begin
  F:=30*ld/(30*ld+z);
End;
Procedure scale(var pmd: array of TPoint; value: real; key: char);
var i1: integer;
begin
  if key = '+' then for i1:=0 to 7 do with pmd[i1] do begin
    x:=x*value;
    y:=y*value;
    z:=z*value;
  end;
  if key = '-' then for i1:=0 to 7 do with pmd[i1] do begin
    x:=x/value;
    y:=y/value;
    z:=z/value;
  end;
end;
Procedure rotate(var pmd: array of TPoint; sub: real; xyz:char);
var i1: integer; subsub:real;
r,ugol,fz,fx,fy: real;
begin
  subsub:=sub;

  case xyz of
        'x': xsum:=xsum+sub;
        'y': ysum:=ysum+sub;
        'z': zsum:=zsum+sub;
	end;
  for i1:=1 to vCount do with pmd[i1-1] do begin
    case xyz of
        'x':begin fx:=y; fy:=z end;
        'y':begin fx:=z; fy:=x end;
        'z':begin fx:=x; fy:=y end;
	end;
    sub:=subsub;
    IF (FX=0) and (fy =0) then fx:=0.0001;
    r:=sqrt(sqr(fx)+sqr(fy));
     ugol:=asin(fy/r);
    if (fx<0) then ugol:= Pi-ugol
     else ugol:=2*Pi+ugol;
     if ugol<0 then ugol:=Pi-ugol;
     sub:=(round((sub+ugol)*1000000) mod round(2*Pi*1000000))/1000000;
     fy:=sin(sub)*r;
     fx:=abs(sqrt(sqr(r)-sqr(fy)));
     if (sub>0.5*Pi) and (sub<1.5*pi) then fx:=-fx;
    case xyz of
	'x':begin y:=fx; z:=fy end;
	'y':begin z:=fx; x:=fy end;
	'z':begin x:=fx; y:=fy end;
	end;
   end;
end;

Procedure rotatePoint(var Vector: TPoint);
var i1: integer;
r,ugol,fz,fx,fy,sub: real;
begin
  with Vector do begin
  if xsum>0 then while xsum>4*Pi do
   xsum:=xsum-2*Pi;
  if xsum<0 then while xsum<-4*Pi do
   xsum:=xsum+2*Pi;
  if xsum>Pi then xsum:=Pi-xsum;
  if xsum<-Pi then xsum:=Pi+xsum;
  if ysum>0 then while ysum>4*Pi do
   ysum:=ysum-2*Pi;
  if ysum<0 then while ysum<-4*Pi do
   ysum:=ysum+2*Pi;
  if ysum>Pi then ysum:=Pi-ysum;
  if ysum<-Pi then ysum:=Pi+ysum;
   if zsum>0 then while zsum>4*Pi do
   zsum:=zsum-2*Pi;
  if zsum<0 then while zsum<-4*Pi do
   zsum:=zsum+2*Pi;
  if zsum>Pi then zsum:=Pi-zsum;
  if zsum<-Pi then zsum:=Pi+zsum;

  sub:=xsum; fx:=y; fy:=z;
    IF (FX=0) and (fy =0) then fx:=0.0001;
    r:=sqrt(sqr(fx)+sqr(fy));
     ugol:=asin(fy/r);
    if (fx<0) then ugol:= Pi-ugol
     else ugol:=2*Pi+ugol;
     if ugol<0 then ugol:=Pi-ugol;
     sub:=(round((sub+ugol)*1000000) mod round(2*Pi*1000000))/1000000;
     fy:=sin(sub)*r;
     fx:=abs(sqrt(sqr(r)-sqr(fy)));
     if (sub>0.5*Pi) and (sub<1.5*pi) then fx:=-fx;
     y:=fx; z:=fy;



      sub:=ysum; fx:=z; fy:=x;
    IF (FX=0) and (fy =0) then fx:=0.0001;
    r:=sqrt(sqr(fx)+sqr(fy));
     ugol:=asin(fy/r);
    if (fx<0) then ugol:= Pi-ugol
     else ugol:=2*Pi+ugol;
     if ugol<0 then ugol:=Pi-ugol;
     sub:=(round((sub+ugol)*1000000) mod round(2*Pi*1000000))/1000000;
     fy:=sin(sub)*r;
     fx:=abs(sqrt(sqr(r)-sqr(fy)));
     if (sub>0.5*Pi) and (sub<1.5*pi) then fx:=-fx;
       z:=fx; x:=fy;

      sub:=zsum; fx:=x; fy:=y;
    IF (FX=0) and (fy =0) then fx:=0.0001;
    r:=sqrt(sqr(fx)+sqr(fy));
     ugol:=asin(fy/r);
    if (fx<0) then ugol:= Pi-ugol
     else ugol:=2*Pi+ugol;
     if ugol<0 then ugol:=Pi-ugol;
     sub:=(round((sub+ugol)*1000000) mod round(2*Pi*1000000))/1000000;
     fy:=sin(sub)*r;
     fx:=abs(sqrt(sqr(r)-sqr(fy)));
     if (sub>0.5*Pi) and (sub<1.5*pi) then fx:=-fx;
       x:=fx; y:=fy;

   end;
end;

Var h1,m1,s1,MiliSekundi: word; //Ot budilnika
        os,oh,om: longint;
	gd,gm: integer;
	x,y,oro,x0,y0,x1,x2,x3,x4,y1,y2,y3,y4: longint;
        radian: real;
	txt: string;
	osize,msize,hsize,ssize:integer;

var TochkaOtscheta: tpoint;  //Ot 3d vertelki
    i1,i2,i3: integer;
    pmd,vector: array [1..5] of tpoint;
    sub,r,ugol,ynew,xnew:real;
    key: char;
    dalishana: byte;

begin
  xsum:=0;
  ysum:=0;
  zsum:=0;
  ld:=100;
  Writeln('Нажмите Ввод для инициаллизации:');
  readln;
  TochkaOtscheta.x:=500;
  TochkaOtscheta.y:=400;
  TochkaOtscheta.z:=-1;

//Пускай мы имеем число точек, которые надо исказить так, будто они на оси z
  gd:=detect;
  initgraph(gd,gm,'');
  ClearDevice;
  OutTextXY(0,0,'Инструкция:');
  OutTextXY(0,20,'Нажмите Х для вращения относительно оси Х;');
  OutTextXY(0,40,'Нажмите У для вращения относительно оси У;');
  OutTextXY(0,60,'Нажмите Z для вращения относительно оси Z;');
  OutTextXY(0,80,'Для увеличения или уменьшения используйте + и -.');
  setviewport(GetMaxX div 2,GetMaxY div 2, Getmaxx, getmaxy, false);
  for i1:=1 to 4 do with pmd[i1] do begin
    if i1=1 then begin x:=-sqrt(sqr(h/3*2)-sqr(h/3)); y:=0+1; z:=1; end;
    if i1=2 then begin x:=sqrt(sqr(h/3*2)-sqr(h/3)); y:=0+1; z:=1; end;
    if i1=3 then begin x:=+1; y:=-h+1; z:=1;     end;
    if i1=4 then begin x:=+1; y:=-h/3+2; z:=sqrt(a*a-sqr(h/3*2))+1;          end;
  end;
  TochkaOtscheta.x:=(pmd[1].x+pmd[2].x+pmd[3].x+pmd[4].x)/4;
  TochkaOtscheta.y:=(pmd[1].y+pmd[2].y+pmd[3].y+pmd[4].y)/4;
  TochkaOtscheta.z:=(pmd[1].z+pmd[2].z+pmd[3].z+pmd[4].z)/4;
  for i1:=1 to 4 do with pmd[i1] do begin
    x:=x-TochkaOtscheta.x;
    y:=y-TochkaOtscheta.y;
    z:=z-TochkaOtscheta.z;
  end;

  x0:=0;
        y0:=0;
	os:=-1;
	osize:=getmaxy div 2 - 20;
	msize:=osize*75 div 100;
	hsize:=osize*35 div 100;
	ssize:=osize*90 div 100;

  sub:=Pi/60;
  repeat

//Piramidka
   with pmd[1] do for i2:=2 to 4 do Line((round(x*f(z))) div ConstScaleRate,(round(y*F(z))) div ConstScaleRate,(round(pmd[i2].x*f(pmd[i2].z))) div ConstScaleRate,(round(pmd[i2].y*f(pmd[i2].z))) div ConstScaleRate);
   with pmd[2] do for i2:=3 to 3 do Line((round(x*f(z))) div ConstScaleRate,(round(y*F(z))) div ConstScaleRate,(round(pmd[i2].x*f(pmd[i2].z))) div ConstScaleRate,(round(pmd[i2].y*f(pmd[i2].z))) div ConstScaleRate);
   with pmd[3] do for i2:=4 to 4 do Line((round(x*f(z))) div ConstScaleRate,(round(y*F(z))) div ConstScaleRate,(round(pmd[i2].x*f(pmd[i2].z))) div ConstScaleRate,(round(pmd[i2].y*f(pmd[i2].z))) div ConstScaleRate);
   with pmd[4] do for i2:=2 to 2 do Line((round(x*f(z))) div ConstScaleRate,(round(y*F(z))) div ConstScaleRate,(round(pmd[i2].x*f(pmd[i2].z))) div ConstScaleRate,(round(pmd[i2].y*f(pmd[i2].z))) div ConstScaleRate);
    delay(50);

    if (xsum> 2*Pi) then xsum:=xsum-2*Pi;
    if (xsum< -2*Pi) then xsum:=xsum+2*Pi;
    if (ysum> 2*Pi) then ysum:=ysum-2*Pi;
    if (ysum< -2*Pi) then ysum:=ysum+2*Pi;
    if (zsum> 2*Pi) then zsum:=zsum-2*Pi;
    if (zsum< -2*Pi) then zsum:=zsum+2*Pi;


    if keypressed then begin key:=readkey;
    rotate(pmd[1..Vcount],sub,key);
    scale(pmd[1..8],1.01,key);
    if key='l' then ld:=ld*1.1;
    if key='d' then ld:=ld/1.1;
    for i2:=1 to 60 do begin
    oro:=ssize;
     radian:=i2/30*Pi-Pi/60;
     y3:=-round(cos(radian)*oro);
     x3:=round(sin(radian)*oro);
     with vector[2] do begin
     x:=x3;
     y:=y3;
     z:=0;
      RotatePoint(Vector[2]);
     Line(round((x-round(x) div 20)*f(z)),round((y-round(y) div 20)*f(z)),round((x-round(x) div 3)*f(z)),round((y-round(y) div 3)*f(z)));
     end;
    end;
    for i1:=1 to 4 do with vector[i1] do begin
     if i1=2 then continue;
     z:=0;
      RotatePoint(Vector[1]);
          Line(0,0,round(x*f(z)),round(y*f(z)));
     end;
    end;

//4asiki
 repeat
 gettime(h1,m1,s1,MiliSekundi);
 if keypressed then break;
 until (s1>os) or ((os>50) and (s1<10));
	if (s1>os) or ((os>50) and (s1<10)) then begin
     setcolor(black);
     with vector[1] do Line(0,0,round(x*f(z)),round(y*f(z)));
     with vector[3] do Line(0,0,round(x*f(z)),round(y*f(z)));
     with vector[4] do Line(0,0,round(x*f(z)),round(y*f(z)));

     with vector[3] do begin
     x:=x3;
     y:=y3;
     z:=0;
      RotatePoint(Vector[3]);
          Line(0,0,round(x*f(z)),round(y*f(z)));
     end;
     with vector[4] do begin
     x:=x3;
     y:=y3;
     z:=0;
      RotatePoint(Vector[4]);
          Line(0,0,round(x*f(z)),round(y*f(z)));
     end;
     setcolor(random(15)+1);
     gettime(h1,m1,s1,MiliSekundi);
     oh:=h1;
     om:=m1;
     os:=s1;
	 oro:=hsize;
     radian:=oh*Pi / 6;
     y1:=-round(cos(radian)*oro);
     x1:=round(sin(radian)*oro);
     with vector[3] do begin
      x:=x1;
      if x1=0 then vector[1].x:=vector[1].x+0.0001;
      y:=y1;
      z:=0;
       RotatePoint(Vector[3]);
          Line(0,0,round(x*f(z)),round(y*f(z)));
     end;

	 oro:=msize;
	 radian:=om*Pi / 30;
	 y2:=-round(cos(radian)*oro);
	 x2:=round(sin(radian)*oro);
         with vector[4] do begin
          x:=x1;
          if x2=0 then vector[1].x:=vector[1].x+0.0001;
          y:=y1;
          z:=0;
         RotatePoint(Vector[3]);
         Line(0,0,round(x*f(z)),round(y*f(z)));
     end;

     dalishana:=os mod 20;
     oro:=ssize;
     radian:=os/30*Pi-Pi/60;
     y3:=-round(cos(radian)*oro);
     x3:=round(sin(radian)*oro);
     with vector[2] do begin
     x:=x3;
     y:=y3;
     z:=0;
      RotatePoint(Vector[2]);
     Line(round((x-round(x) div 20)*f(z)),round((y-round(y) div 20)*f(z)),round((x-round(x) div 3)*f(z)),round((y-round(y) div 3)*f(z)));
     end;
     radian:=os/30*Pi;
     y3:=-round(cos(radian)*oro);
     x3:=round(sin(radian)*oro);
     Vector[1].x:=x3;
     if x3=0 then vector[1].x:=vector[1].x+0.0001;
     Vector[1].y:=y3;
     Vector[1].z:=0;
     RotatePoint(Vector[1]);
         Line(0,0,round(Vector[1].x*f(vector[1].z)),round(vector[1].y*f(vector[1].z)));
    end;

  if key<> chr(0) then begin ClearDevice; if key=chr(27) then break;
	key:=chr(0); end;

  until key=chr(27);
  Readln;
  closegraph;
end.
