Program xakalka;
Var i,x:longint;
    chislo: real;
Begin
repeat
Readln(x);
writeln(x+sqrt(x-1));
writeln(1/(x-sqrt(x-1)));
until 1=0;
end.