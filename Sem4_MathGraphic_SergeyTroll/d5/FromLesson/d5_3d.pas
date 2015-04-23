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
Uses Graph,wincrt,crt;

const VCount = 4;
      ss = 3;

type TPoint = record
x,y,z: real;
bound: set of 1..VCount;
end;

var ld:real;

Function asin(x:real): real;
begin
 asin:=arctan(x/sqrt(1-sqr(x)));
end;

Function F(z: real): real;
Begin
  F:=30*ld/(30*ld+z);
End;

Procedure scale(var sq: array of TPoint; value: real; key: char);
var i1: integer;
begin
  if key = '+' then for i1:=0 to 7 do with sq[i1] do begin
    x:=x*value;
    y:=y*value;
    z:=z*value;
  end;
  if key = '-' then for i1:=0 to 7 do with sq[i1] do begin
    x:=x/value;
    y:=y/value;
    z:=z/value;
  end;
end;
Procedure rotate(var sq: array of TPoint; sub: real; xyz:char);
var i1: integer; subsub:real;
r,ugol,fz,fx,fy: real;
begin
  subsub:=sub;
  for i1:=1 to vCount do with sq[i1-1] do begin
   case xyz of
	'x':begin fx:=y; fy:=z end;
	'y':begin fx:=z; fy:=x end;
	'z':begin fx:=x; fy:=y end;
	end;
    sub:=subsub;
    r:=sqrt(sqr(fx)+sqr(fy));
    if r<>0 then ugol:=asin(fy/r) else ugol:=0;
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

var S: tpoint;//Это, короче, такая рандомная точка в пространстве
    xx,yy,zz: real; //Это, вероятно, спроектированная точка, то есть, точка не реальная, а на экране
    gd,gm,i1,i2,i3: integer;
  //  sq: array [1..8] of tpoint;
    pmd: array [1..8] of tpoint;
    sub,r,ugol,ynew,xnew:real;
    key: char;

begin
  ld:=100;
  Writeln('Нажмите Ввод для инициаллизации:');
  readln;
  s.x:=500;
  s.y:=400;
  s.z:=-1;
  xx:=s.x/s.z;
  yy:=-s.y/s.z;

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

  moveto(round(xx),round(yy));
{  for i1:=1 to 8 do with sq[i1] do begin
    if i1=1 then begin x:=-500; y:=-300; z:=400; end;
    if i1=2 then begin x:=500; y:=-300; z:=400; end;
    if i1=3 then begin x:=500; y:=300; z:=400;  end;
    if i1=4 then begin x:=-500; y:=300; z:=400; end;
    if i1=5 then begin x:=-500; y:=-300; z:=-200; end;
    if i1=6 then begin x:=500; y:=-300; z:=-200;  end;
    if i1=7 then begin x:=500; y:=300; z:=-200;   end;
    if i1=8 then begin x:=-500; y:=300; z:=-200;  end;
    writeln(i1,': x=',round(x):5,'y= ',round(y):5,'z= ',round(z):5);
  end;   }

 for i1:=1 to 4 do with pmd[i1] do begin
    if i1=1 then begin x:=0; y:=225; z:=0; end;
    if i1=2 then begin x:=0; y:=-225; z:=-450; end;
    if i1=3 then begin x:=-300; y:=-225; z:=0;     end;
    if i1=4 then begin x:=300; y:=-225; z:=0;          end;
    if i1=5 then begin x:=300; y:=-225; z:=0;          end;
    if i1=6 then begin x:=300; y:=-225; z:=0;          end;
    if i1=7 then begin x:=300; y:=-225; z:=0;          end;
    if i1=8 then begin x:=300; y:=-225; z:=0;          end;
  end;


//Cвязывание точек параллелепипеда
 { for i1:=1 to VCount do with sq[i1] do begin
    for i2:=1 to VCount do begin
          if x=sq[i2].x then
	    if (y=sq[i2].y) or (z=sq[i2].z) then include(bound,i2);
          if y=sq[i2].y then
	    if (x=sq[i2].x) or (z=sq[i2].z) then include(bound,i2);
          if z=sq[i2].z then
	    if (y=sq[i2].y) or (x=sq[i2].x) then include(bound,i2);
    end;
  end; }
  sub:=Pi/180;
  repeat
   { for i1:=1 to VCount do with sq[i1] do begin
      for i2:=1 to VCount do if i2 in bound then Line((round(x*f(z))) div ss,(round(y*F(z))) div ss,(round(sq[i2].x*f(sq[i2].z))) div ss,(round(sq[i2].y*f(sq[i2].z))) div ss);
    end;  }
    for i1:=1 to 4 do with pmd[i1] do begin
      for i2:=1 to 4 do Line((round(x*f(z))) div ss,(round(y*F(z))) div ss,(round(pmd[i2].x*f(pmd[i2].z))) div ss,(round(pmd[i2].y*f(pmd[i2].z))) div ss);
    end;
    key:=readkey;
 //   rotate(sq[1..8],sub,key);
    rotate(pmd[1..8],sub,key);
  //  scale(sq[1..8],1.01,key);
    scale(pmd[1..8],1.01,key);
    if key='l' then ld:=ld*1.1;
    if key='d' then ld:=ld/1.1;
    ClearDevice;
  until key=chr(27);
  Readln;
  closegraph;
end.
