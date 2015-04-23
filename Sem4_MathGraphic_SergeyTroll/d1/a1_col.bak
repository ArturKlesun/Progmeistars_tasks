Program columoni;
uses Graph,crt;
var gd,gm,i1,i2,i3: integer;
error,n: integer;
Begin
gd:=detect;
writeln(gd);
writeln('Число делений, пожалуйста:');
Readln(n);
InitGraph(gd,gm,'');
error:=GraphResult;
if error <> grok then writeln(error);
for i1:=1 to n-1 do begin
  Line(GetMaxX div i1, 0, GetmaxX div i1, GetMaxY);
end;
readkey;
closegraph;
end.
