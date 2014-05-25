{
Здесь задание, которое вы дали на прошлом занятии: сделать трёхмерную фигуру и возможность её вращать.
Управление:
"x" - Поворот относительно оси х на 3 градуса
"y" - Поворот относительно оси у на 3 градуса
"z" - Поворот относительно оси z на 3 градуса
}
{$IFDEF NORMAL}
  {$H-,I+,OBJECTCHECKS-,Q+,R+,S-}
{$ENDIF NORMAL}
{$IFDEF DEBUG}
  {$H-,I+,OBJECTCHECKS+,Q+,R+,S-}
{$ENDIF DEBUG}
{$IFDEF RELEASE}
  {$H-,I-,OBJECTCHECKS-,Q-,R-,S-}
{$ENDIF RELEASE}
Program Projekcija;
Uses Graph,crt;

const VCount = 8;
      ld = 100;
      ss = 3;

type TPoint = record
x,y,z: real;
bound: set of 1..VCount;
end;

Function asin(x:real): real;
begin
 asin:=arctan(x/sqrt(1-sqr(x)));
end;

Function F(z: real): real;
Begin
  F:=3000/(3000+z);
End;

Procedure rotate(var sq: array of TPoint; sub: real; xyz:char);
var i1: integer; subsub:real;
r,ugol,fz,fx,fy: real;
begin
  subsub:=sub;
  for i1:=1 to 8 do with sq[i1-1] do begin
   case xyz of
	'x':begin fx:=y; fy:=z end;
	'y':begin fx:=z; fy:=x end;
	'z':begin fx:=x; fy:=y end;
	end;
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
    case xyz of
	'x':begin y:=fx; z:=fy end;
	'y':begin z:=fx; x:=fy end;
	'z':begin x:=fx; y:=fy end;
	end;
   end;
end;

var S: tpoint;//â®, ª®à®ç¥, â ª ï à ­¤®¬­ ï â®çª  ¢ ¯à®áâà ­áâ¢¥
    xx,yy,zz: real; //â®, ¢¥à®ïâ­®, á¯à®¥ªâ¨à®¢ ­­ ï â®çª , â® ¥áâì, â®çª  ­¥ à¥ «ì­ ï,   ­  íªà ­¥
    gd,gm,i1,i2,i3: integer;
    sq: array [1..8] of tpoint;
    sub,r,ugol,ynew,xnew:real;
    key: char;

begin
  readln;
  randomize;
  s.x:=500;
  s.y:=400;
  s.z:=-1;
  xx:=s.x/s.z;
  yy:=-s.y/s.z;

//ãáª © ¬ë ¨¬¥¥¬ ç¨á«® â®ç¥ª, ª®â®àë¥ ­ ¤® ¨áª §¨âì â ª, ¡ã¤â® ®­¨ ­  ®á¨ z
  gd:=detect;
  write(random);
  initgraph(gd,gm,'');
  write(random);
  setviewport(GetMaxX div 2,GetMaxY div 2, Getmaxx, getmaxy, false);
  circle(0,0,10);

  moveto(round(xx),round(yy));
  for i1:=1 to 8 do with sq[i1] do begin
    if i1=1 then begin x:=-500; y:=-300; z:=400; end;
    if i1=2 then begin x:=500; y:=-300; z:=400; end;
    if i1=3 then begin x:=500; y:=300; z:=400;  end;
    if i1=4 then begin x:=-500; y:=300; z:=400; end;
    if i1=5 then begin x:=-500; y:=-300; z:=-200; end;
    if i1=6 then begin x:=500; y:=-300; z:=-200;  end;
    if i1=7 then begin x:=500; y:=300; z:=-200;   end;
    if i1=8 then begin x:=-500; y:=300; z:=-200;  end;
    writeln(i1,': x=',round(x):5,'y= ',round(y):5,'z= ',round(z):5);
  end;

//C¢ï§ë¢ ­¨¥ â®ç¥ª ¯ à ««¥«¥¯¨¯¥¤ 
  for i1:=1 to VCount do with sq[i1] do begin
    for i2:=1 to VCount do begin
          if x=sq[i2].x then
	    if (y=sq[i2].y) or (z=sq[i2].z) then include(bound,i2);
          if y=sq[i2].y then
	    if (x=sq[i2].x) or (z=sq[i2].z) then include(bound,i2);
          if z=sq[i2].z then
	    if (y=sq[i2].y) or (x=sq[i2].x) then include(bound,i2);
    end;
  end;
  sub:=Pi/180;
  repeat
    for i1:=1 to VCount do with sq[i1] do begin
      for i2:=1 to VCount do if i2 in bound then Line((round(x*f(z))) div ss,(round(y*F(z))) div ss,(round(sq[i2].x*f(sq[i2].z))) div ss,(round(sq[i2].y*f(sq[i2].z))) div ss);
    //  for i2:=1 to VCount do if i2 in bound then Line(-360+(round(x*f(z))) div ss,-225+(round(y*F(z))) div ss,-360+(round(sq[i2].x*f(sq[i2].z))) div ss,-225+(round(sq[i2].y*f(sq[i2].z))) div ss);
   //   for i2:=1 to VCount do if i2 in bound then Line(+360+(round(y*f(z))) div ss,-225+(round(z*F(z))) div ss,360+(round(sq[i2].y*f(sq[i2].z))) div ss,-225+(round(sq[i2].z*f(sq[i2].z))) div ss);
  //    for i2:=1 to VCount do if i2 in bound then Line(+360+(round(z*f(z))) div ss,+225+(round(x*F(z))) div ss,+360+(round(sq[i2].z*f(sq[i2].z))) div ss,+225+(round(sq[i2].x*f(sq[i2].z))) div ss);
    end;
    key:=readkey;
    rotate(sq[1..8],sub,key);
    ClearDevice;
  until key=chr(27);
  Readln;
  closegraph;
end.
