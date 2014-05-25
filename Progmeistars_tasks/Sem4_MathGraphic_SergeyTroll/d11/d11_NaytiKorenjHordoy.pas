Program Nahodilka;
Const Safronix = 999999;
Var i1,i2,i3 : longint;
{y=f(x)}
Function f(x: real): real;
Begin
  f:=127/x;
end;
Var sub,RSub,subsub,l,r,x,Eps,ToPer,Hx,Hy,a,b,c,cosalpha: real;
Begin
  Eps:=0.001;
  Writeln;
  Writeln('Введите, пожалуйста, число, и вы получите значение функции от него.');
  Readln(x);
  l:=-1000;
  r:=1000;
  ToPer:=f(x);

 Repeat
  a:=f(r);
  b:=f(l);
  subsub:=r;
  cosalpha:=(abs(a)+abs(b))/
    sqrt(sqr(abs(a)+abs(b))+sqr(r-l));
  r:=R-sqrt(sqr(a/cosalpha)-sqr(a));
  Rsub:=f(r);
  if RSub<ToPer then begin l:=r; r:=subsub; end;
  Writeln(Rsub-ToPer);
 Until abs(RSub-ToPer)<Eps;
 Writeln;
 Writeln(RSub:2:8);
 readln;
End.
