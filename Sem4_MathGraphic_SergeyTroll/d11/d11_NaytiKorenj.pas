Program Nahodilka;
Const Safronix = 999999;
{y=f(x)}
Function f(x: real): real;
Begin
  f:=25/x;
end;
Var sub,RSub,subsub,l,r,x,Eps,ToPer: real;
Begin
  Eps:=0.001;
  Writeln;
  Writeln('Введите, пожалуйста, число, и вы получите значение функции от него.');
  Readln(x);
  l:=-1000;
  r:=1001;
  ToPer:=f(x);
 Repeat
  subsub:=r;
  r:=(R+L)/2;
  Rsub:=f(r);
  if RSub<ToPer then begin l:=r; r:=subsub; end;
  Writeln(abs(Rsub-ToPer));
 Until abs(RSub-ToPer)<Eps;
 Writeln;
 Writeln(RSub:2:8);
 readln;
End.
