Program Oleg;
Uses graph,crt,dos;
Var i1,i2,i3: longint;
	R,x,y,z,u,v,w,n,m,x0,y0: longint;
	boo: boolean;
	gm,gd: integer;
        istr: string[3];
Begin

	{R:=500;
        x:=-500;
	repeat     //y2+x2=r2 y2=sqrt(r2-x2)
                y:=sqrt(-sqr(x)+sqr(R));
                x:=x+1;
	        Writeln(random(255));
	until readkey=chr(27);
}
	Writeln('Razmer kletok:');
	Readln(m);
	Writeln('Chislo Kletok:');
	Readln(n);
        n:=n;
        gd:=detect;
        initgraph(gd,gm,'');
        settextstyle(0,horizDir,m div 12);
        for i1:=1 to n do begin
          str(i1,istr);
         OutTextXY(getmaxx div 2-m*n div 2+i1*m-m,getmaxy div 2+m*n div 2+1,istr);
        end;
        For y0:=1 to n*m-1 do begin
	  For x0:=1 to n*m-1 do begin
                x:=x0+getMaxX div 2 - m*n div 2;
                y:=y0+getMAxy div 2 - m*n div 2;
		if ((x0 mod (m*2) < m) and (y0 mod (m*2) < m)) or ((x0 mod (m*2)>m) and (y0 mod (m*2)>m)) then begin
			PutPixel(x,y,white);

		end;
          end;
          if y mod m = 1 then OutTextXY(x-x0-m,y,chr(64+n-y0 div m));


        end;
readkey;

End.
