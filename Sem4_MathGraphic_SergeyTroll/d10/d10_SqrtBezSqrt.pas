Program SqrtBezSqrt;


Function ssqrt(a: real): real;

function f(x:real):real;
begin
  f:=x*x - a;
end;

var l, r, c: real;
begin
  l:=0;
  r:=a+1;
  repeat
    c := (l+r)/2;
    if f(l) * f(c) < 0 then
      r := c
    else
      l := c;
  until (r - l < 0.0000000001);
  ssqrt:=r;

end;

var a:real;
Begin
  readln(a);
  writeln(ssqrt(a):1:16);
  readln;
end.
