Program Vangles;
Uses graph,crt;

Var x,y,i,u,v:longint;
        z,rr:real;
        gd,gm: smallint;
    a,b: byte;
    fp: FillPatternType;
    bitmap: pointer;

    Function r:real;
    Begin
    r:=rr;
    rr:=rr*1.01;

    end;

Begin
        rr:=1;
    randomize;
    gd:=detect;
    initgraph(gd,gm,'');
    setviewport(getmaxx div 2,getmaxy div 2,getmaxx,getmaxy,false);
    repeat
    for x:=1 to 100 do begin
      z:=x*rr;
      putpixel(round(z),round(sqrt(sqr(r)-sqr(z))),random(15)+1);
    end;
    for x:=1 to 100 do begin
      z:=x*rr;
      putpixel(-round(z),round(sqrt(sqr(r)-sqr(z))),random(15)+1);
    end;
    for x:=1 to 100 do begin
      z:=x*rr;
      putpixel(-round(z),-round(sqrt(sqr(r)-sqr(z))),random(15)+1);
    end;
    for x:=1 to 100 do begin
      z:=x;
      putpixel(round(z),-round(sqrt(sqr(r)-sqr(z))),random(15)+1);
    end;
    until rr>getmaxx;
    readln;

   { GetImage(1,1,getmaxx,getmaxy,bitmap);
    x:=1;
    for i:=1 to 8 do begin
      fp[i]:=256-x;
      x:=x*2;
    end;
    setfillpattern(fp,random(15)+1);
    floodfill(3,2,random(15)+1);
    PutImage(1,1,bitmap,xorPut);
    readln;  }
end.
