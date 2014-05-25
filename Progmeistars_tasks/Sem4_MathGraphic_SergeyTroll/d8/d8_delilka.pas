Program delilka;
Var i,n:longint;
    chislo: real;
Begin
//Readln(n);
chislo:=1;
n:=10;
repeat
writeln('n=', n);
For i:=1 to n do
 chislo:=chislo + 1 / i;

For i:=1 to n do
 chislo:=chislo - 1 / i;

writeln(chislo);
n:=n*10;
until n>10000         ;
readln;
end.