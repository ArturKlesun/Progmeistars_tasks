{
Здесь домашнее задание: сделать часы с помощью модуля graph.
}
Program Pblzhblk;
uses dos,crt,graph;
Var h1,m1,s1,ss: word;
        s,h,m: longint;
	gd,gm: integer;
	x,y,r,x0,y0,x1,x2,x3,x4,y1,y2,y3,y4: longint;
        radian: real;
	txt: string;
	osize,msize,hsize,ssize:integer;
Begin
	gd:=detect;
	Initgraph(gd,gm,'');
	x0:=getmaxx div 2;
	y0:=getmaxy div 2;
	s:=-1;
	osize:=getmaxy div 2 - 20;
	msize:=osize*75 div 100;
	hsize:=osize*35 div 100;
	ssize:=osize*90 div 100;
        circle(x0, y0, osize);
	repeat
		       	gettime(h1,m1,s1,ss);
							if (s1>s) or ((s>50) and (s1<10))then begin
                setcolor(0);
                setcolor(black);
                Line(x0,y0,x0+x1,y0+y1);
                Line(x0,y0,x0+x2,y0+y2);
                Line(x0,y0,x0+x3,y0+y3);
                Line(x0,y0,x0+x4,y0+y4);
                setcolor(random(15)+1);
                settextstyle(1,0,2);
                outtextxy(x0-5,y0-osize+5,'12');
                gettime(h1,m1,s1,ss);
                h:=h1;
                m:=m1;
                s:=s1;
		r:=hsize;
                radian:=h*Pi / 6;
		y1:=-round(cos(radian)*r);
     	x1:=round(sin(radian)*r);
    	Line(x0,y0,x0+x1,y0+y1);
		settextstyle(1,0,5);
				str(h,txt);
                outtextxy(x0+x1+x1 div 5-2-25,y0+y1+y1 div 5-20,txt);
		r:=msize;
		radian:=m*Pi / 30;
		y2:=-round(cos(radian)*r);
		x2:=round(sin(radian)*r);
		settextstyle(1,0,2);
		Line(x0,y0,x0+x2,y0+y2);
                str(m,txt);
                outtextxy(x0+x2+x2 div 30-15,y0+y2+y2 div 30-10,txt);
		r:=ssize;
                 radian:=s/30*Pi-Pi/60;
                 y3:=-round(cos(radian)*r);
                 x3:=round(sin(radian)*r);;
                 Line(x0+x3-x3 div 20,y0+y3-y3 div 20,x0+x3-x3 div 3,y0+y3-y3 div 3);
                radian:=s/30*Pi;
                y3:=-round(cos(radian)*r);
                x3:=round(sin(radian)*r);;
		Line(x0,y0,x0+x3,y0+y3);
                settextstyle(1,0,1);
		str(s,txt);
                outtextxy(x0+x3+x3 div 30-10,y0+y3+y3 div 15,txt);
							end;
	until keypressed;
End.
