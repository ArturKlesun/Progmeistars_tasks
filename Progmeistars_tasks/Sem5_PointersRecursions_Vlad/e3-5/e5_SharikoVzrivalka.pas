Program SharikoVzrivalka;
Uses Graph,wincrt;
Type PBall = ^TBall;
	 TBall = record
		 prev,next: PBall;
		 color: word;
		 r: word;
		 a: real;
		 vx,vy,x,y: real;
	 end;
Var gd,gm: integer;
	 Start,O,M: PBall;
         key:char;
         tidish:boolean;
         se: set of 0..255;
         i,t1: longint;

Procedure VzorvatjSharik(var vzrivayemij: PBall);
var ox,oy: real;
         i1: longint;
         Iskra,rez: PBall;
Begin
         ox:=vzrivayemij^.x;
         oy:=vzrivayemij^.y;
         rez:=start;
         while rez^.next<>nil do rez:=rez^.next;
         for i1:=1 to 3+random(2) do begin
            new(Iskra);
            with Iskra^ do begin
                  Color:=vzrivayemij^.color+1;
                  prev:=rez;
                  prev^.next:=Iskra;
                  next:=nil;
		  r:=round(random*Vzrivayemij^.r+0.56);
		  a:=1.00000000000000002;
		  VX:=random(15)-7;
		  VY:=-17+random(8)-4;
                  x:=ox;
                  y:=oy;
                  rez:=Iskra;
            end;
         end;
         with vzrivayemij^ do begin
                 if prev<> nil then prev^.next:=next else start:=next;
                 if next<> nil then next^.prev:=prev;
         end;
         dispose(vzrivayemij);

End;

Procedure Stolknovenye;
var rezx,rezy: real;
         a,b: PBall;
Begin
         a:=start;
         b:=start^.next;
         While a^.next<>nil do begin
                 While b^.next<>nil do begin
                         {если расстояние от а до б меньше суммы их радиусов, то обменять их векторами}
                         If a<>b then If sqr(a^.x-b^.x)+sqr(a^.y-b^.y) < sqr(a^.r+b^.r) then begin
                                 putpixel(0,0,red);
                                 Delay(2000);
                                 rezx:=a^.vx;
                                 rezy:=a^.vy;
                                 a^.vx:=b^.vx;
                                 a^.vy:=b^.vy;
                                 b^.vx:=rezx;
                                 b^.vy:=rezy;
                         end;
                         b:=b^.next;
                 end;
         a:=a^.next;
         end;
End;
var bobo: boolean;
Begin
         se:=[];
         tidish:=false;
         key:='w';
	 randomize;
	 InitGraph(gd,gm,'');
	 SetViewPort(Getmaxx div 2, getmaxy div 2, getmaxx,getmaxy, false);
	 New(O);
	 Start:=O;
	 With O^ do begin
                 Color:=random(14)+1;
		 prev:=nil;
                 next:=nil;
		 r:=random(30)+1;
		 a:=1.00000000000000002;
		 VX:=random(30)-15;
		 VY:=-35+random(10)-5;
                 x:=random(250)-125;
		 y:=getmaxy div 2 -1;
	 end;
         New(O);
         With O^ do begin
                 Color:=random(14)+1;
		 prev:=Start;
                 prev^.next:=O;
                 next:=nil;
		 r:=random(30)+1;
		 a:=1.00000000000000002;
		 VX:=random(30)-15;
		 VY:=-35+random(10)-5;
                 x:=random(250)-125;
		 y:=getmaxy div 2 -1;
	 end;
         Repeat

                 if bobo then putpixel(1,1,cyan) else putpixel(1,1,black);
                 Delay(60);
                 O:=Start; //Надо от старта до финиша
                 i:=0;
                 se:=[];
                repeat
                 with O^ do begin   //Стираем шарики
			 setcolor(black);
                         Circle(round(x),round(y),r);
                         if (x>getmaxx div 2) or (x<-getmaxx div 2) or (y>getmaxy div 2) then include(se,i);
		 end;
                 if o^.next=nil then m:=o;
                 o:=O^.next;
                 i:=1+i;
                until O=nil;
                o:=m;
                if random<0.1 then begin
                  new(M);
                 with M^ do begin
                  Color:=1;
                  prev:=O;
                  prev^.next:=M;
                  next:=nil;
		  r:=random(30)+1;
		  a:=1.00000000000000002;
		  VX:=random(30)-15;
		  VY:=-35+random(10)-5;
                  x:=random(250)-125;
		  y:=getmaxy div 2 -1;
                 end;
                end;

               for i in se do begin //dispose
                  o:=start;
                  t1:=0;
                  while t1<i do begin o:=o^.next; inc(t1); end;
                  with o^ do begin
                       if prev<> nil then prev^.next:=next else start:=next;
                       if next<> nil then next^.prev:=prev;
                  end;
                  dispose(O);

                end;

                m:=start;
                i:=0;
                if random<0.05 then begin
                  while m^.next<>nil do begin
                    i:=i+1;
                    m:=m^.next;
                  end;
                  m:=start;
                  t1:=random(i);
                  for i:=0 to t1 do begin
                    if i=0 then continue;
                    m:=m^.next;
                  end;
                  if m^.r>1 then VzorvatjSharik(m);
                end;

                if key = 's' then bobo:=not bobo;
                key:='█';
                //if bobo then if start^.next<>nil then Stolknovenye;

                O:=start;
                repeat
		 with O^ do begin   //Рисуем шарики
		 	 x:=x+vx;
			 y:=y+vy;
			 setcolor(color);
                         Circle(round(x),round(y),r);
			 a:=sqr(a);
			 vy:=vy+a;
		 end;
                o:=O^.next;
                i:=i+1;
                until O=nil;
                 if keypressed then key:=readkey;

         Until (Key=char(27));
end.
