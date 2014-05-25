Program MozgoKuryevo;
Uses graph,dos,crt;

type TPoint = record
  x:real;
  y:real;
end;
type TLine = record
  p:tpoint;
  v:tpoint;
end;

var l1,l2:Tline;
    ToPer:TPoint;
    gm,gd: integer;
    r,k,b,x,c:real;
    i1,i2,i3,i4: longint;
	xxx,yyy: string;
Begin
Writeln;
Writeln('Даны две прямые - найти точку пересечения.');
  randomize;
  gd:=detect;
  initgraph(gd,gm,'');
  setviewport(getmaxx div 2, getmaxy div 2,getmaxx,getmaxy,false);
  circle(0,0,15);
  with l1 do begin
   p.x:=Random(100)-100;
   p.y:=Random(100)-100;
   v.x:=Random(100)-100;
   v.y:=Random(100)-100;
  end;
  with l2 do begin
   p.x:=Random(100)-100;
   p.y:=Random(100)-100;
   v.x:=Random(100)-100;
   v.y:=Random(100)-100;
  end;
  setcolor(random(15)+1);
  with l1 do with p do circle(round(x),round(y),5);
  with l1 do with v do circle(round(x),round(y),5);
  with l2 do with p do circle(round(x),round(y),5);
  with l2 do with v do circle(round(x),round(y),5);
  Repeat
    r:=(random-0.5)*100;
    with l1 do putpixel(round((p.x-v.x)*r+round(p.x)),round((p.y-v.y)*r+round(p.y)),random(15)+1);
    with l2 do putpixel(round((p.x-v.x)*r+round(p.x)),round((p.y-v.y)*r+round(p.y)),random(15)+1);

  Until keypressed;
  b:=p.y;
  
  str(ToPer.x,xxx);
  str(Toper.y,yyy);
  xxx:='x='+xxx;
  yyy:='y='+yyy;
  OutTextxy(0,0,xxx);
  OutTextxy(0,0,yyy);
  ToPer.y:=readkey;
  closegraph;
enl2.v.
