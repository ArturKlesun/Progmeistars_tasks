Program d9_TypiVStroke;
Var i1,i2,i3: longint;
    str,bi,bi2,sub: string;
    Error,PointDetected,brokuj: boolean;
    GdeTo4ka: byte;
    E,bilength,bie:byte;
    To4ka: string[1];
    asd:real;
    integerezation,bisub: longint;



Begin
  E:=0;
  Writeln;
  Writeln('Введите, пожалуйста, число: ');
  Readln(str);
  GdeTo4ka:=length(str)+1;
  To4ka:='.';
  PointDetected:=false;
  Error:=False;
  For i1:=1 to length(str) do begin
  If pos(str[i1],'0123456789.,')=0 then error:=true;
  if (pos(',',str)<>0) or (pos('.',str)<>0) then
   if not PointDetected then begin
    if (pos(',',str)<>0) then begin GdeTo4ka:=pos(',',str); To4ka:=','; end;
    if (pos('.',str)<>0) then begin GdeTo4ka:=pos('.',str); To4ka:='.'; end;
    if (pos(',',str)<>0) and (pos('.',str)<>0) then Error:=true;
   end
   else Error:= true;
  end;
  if GdeTo4ka=1 then error:=true;
  if Error then begin writeln('Некоректная запись.'); Halt; End;

  bi2:='';
  bi:='';
  sub:=copy(str,1,GdeTo4ka-1);
  val(sub,integerezation);
  bisub:=2;
  bie:=1;
  if integerezation=0 then bi:='0';
  if integerezation=1 then bi:='1';
  if integerezation=2 then bi:='10';
  if integerezation=3 then bi:='11';
  repeat bisub:=bisub*2; inc(bie); until bisub>= integerezation;
  if bisub<> integerezation then bisub:=bisub div 2;
  if integerezation>3 then
   if bisub<> integerezation then
    repeat
      if integerezation>bisub then begin Integerezation:=integerezation-bisub; bi:=bi+'1'; end else bi:=bi+'0';
        bisub:=bisub div 2;
    until bisub=0 else begin bi:='1'; for i1:=1 to bie do bi:=bi+'0'; end;
  if bi[length(bi)]='0' then bi[length(bi)]:='1' else bi[length(bi)]:='0';


  writeln(str);
  sub:=copy(str,GdeTo4ka+1,length(str)-gdeto4ka+1);
  val(sub,integerezation);
  writeln(integerezation);
  readln;
  bisub:=2;
  bie:=1;
  if integerezation=0 then bi2:='0';
  if integerezation=1 then bi2:='1';
  if integerezation=2 then bi2:='10';
  if integerezation=3 then bi2:='11';
  repeat bisub:=bisub*2; inc(bie); until bisub>= integerezation;
  if bisub<> integerezation then bisub:=bisub div 2;
  if integerezation>3 then
   if bisub<> integerezation then
    repeat
      if integerezation>bisub then begin Integerezation:=integerezation-bisub; bi2:=bi2+'1'; end else bi2:=bi2+'0';
        bisub:=bisub div 2;
    until bisub=0 else begin bi2:='1'; for i1:=1 to bie do bi2:=bi2+'0'; end;
  if bi2[length(bi2)]='0' then bi2[length(bi2)]:='1' else bi2[length(bi2)]:='0';

  Writeln('Do to4ki: ', bi);
  Writeln(GdeTo4ka);
  E:=length(bi)-1;
 // Delete(str,GdeTo4ka,1);
  Insert(To4ka,bi,2);
  Bi:=bi+bi2;

  Writeln(bi,'E+', E);
  writeln(asd);
  Readln;
end.
