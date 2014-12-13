Program IntegraloS4italka;
Uses CRT,WinCrt,Dos,Graph,math;
Const Safronix = 99999;
      a = 3;
      b = 121;
      c = 20;
      d = 150;
Function F(x:real): longint;
Begin
 // F:=round(a*x*x*x+b*x*x+c*x+d);
  f:=-round(150*(tanh( power(sin(cos(x)+x)*cos(sin(x)+x),3.0) / power(1.23,x) )+2.0));
End;
Var i1,i2,i3,
    xx,yy : longint;
    gd,gm : integer;
    sub,x,y,s:real;
    st: string;
//y=ax^3+bx^2+cx+d
Begin
  GD:=Detect;
  InitGraph(gd,gm,'');
  SetViewPort(500,500,1000,1000,false);
  OutTextXY(180,920,'0,0');
  setcolor(red);
  line(200,900,200,0);
  line(200,900,1000,900);
  line(1000,0,1000,900);
  s:=0;
  For xx:=-4300 to 1200 do begin
    x:=xx/100;
    y:=f(x);
    y:=y;
    yy:=round(y);
    if abs(yy)<5000 then begin
      if round(x*15+840)=1000 then begin
        str(900-(yy+500),st);
        st:='800,'+st;
        setcolor(green);
        OutTextXY(round(x*15+860),yy+800,st);
      end;
      PutPixel(round(x*15)+840,yy+799,white);
      if (x*15+840>200) and (x*15+840<1000) and (yy+500<900) and (yy+500>0) then line(round(x*15)+840,yy+800,round(x*15)+840,900);
      s:=s+((yy+500)-900)*(1/1000)*15*800;
    end;
  end;
  setcolor(white);
  x:=(1000-840)/15;

  str(s:2:8,st);
  OutTextXY(500,200,st);
  readkey;
  closegraph;
end.
