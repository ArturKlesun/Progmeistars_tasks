Program Spiral;
Uses CRT, Graph;
Var
i2,i3,gd,gm: integer;
i1: real;
a,nx:real;
boo:boolean;
Begin
  Writeln('');
  gd:=detect;
  InitGraph(gd,gm,'');
  moveto(500,450);
  a:=0;
  i1:=0;
  boo:=false;
  Repeat
    i1:=i1+Pi/360;
    if a>=2*Pi then a:=0;
   // if a>=Pi then boo:=true;
    if a<=0 then boo:=false;
    if (boo= false) then begin a:=a+1/360; end;
   // if (boo= true) then a:=a-1/360;

        if a<=Pi then putpixel(round(a*i1), round(sin(a)*180)+450,red) else
                putpixel(round((a-Pi)*i1), round(sin(a)*180)+450,cyan);
    if keypressed then break;

  until 1=0;
  readkey;
end.
