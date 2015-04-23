{
программа, которая из ряда введённых чисел высчитывает кол-во чётных и выводит два наибольших.
}
Program lineage;
Const MaxSize=1000;
Type TDataArray = Array [1..MaxSize] of Longint;

Var a: array[1..MaxSize] of integer;
    n, g, t, i, s, e, w, o, cet : integer;
    smti: integer;
    smax, sminmax, sminmax2: Longint;
    sred: real;
    sim, sin, ku, v: integer;
    does: integer;
Begin  {âáî¤ }
  Writeln;
  write('à®£à ¬¬  ¤¥« ¥â ®ç¥­ì ¬­®£® ç¥£® ¨­â¥à¥á­®£® á «¨­¥©ª®© ç¨á¥«. ¢¥¤¨â¥, áª®«ìª® ¨å, ¯®¦ «ã©áâ : ');
  readln(n);
  for i:=1 to n do begin
   write('¢¥¤¨â¥ ', (i), '-¥ ç¨á«®, ¯®¦ «ã©áâ :');
   Readln(a[i]);
  end;   {®ª  ¢áñ ¯à ¢¨«ì­®}

{ ªá. ç¨á«o}
  smax:=0;
  smti:=1;
  For i:=1 to n do begin
   if a[i] > smax then begin
    smax:=a[i];
    smti:=1;
    end;
   end;
  writeln;
  writeln(' ¬®¥ ¡®«ìè®¥ ç¨á«® ¢ «¨­¥©ª¥: ', smax);

{ª®«ìª® ¨å}
  o:=0;
  For i:=1 to n do
   if a[i] = smax then o:=o+1;
  writeln;
  writeln(' ¯à®£à¥áá¨¨ ', o, ' â ª¨å ç¨á¥«.');

{à¥¤­¥¥  à¨ä¬¥â¨ç¥áª®¥}
  sred:=0;
  for s:=1 to n do sred:=sred+a[s];
  sred:=sred/n;
  writeln;
  writeln('à¥¤­¥¥  à¨ä¬¥â¨ç¥áª®¥:', sred:8:4);


{¨¬¬¥âà¨ç¥­ «¨?}
  v:=0;
  sin:=n div 2;
  if n mod 2 = 0 then sim:=n div 2 +1 else begin sim:=n div 2 +2;
                                                 v:=1
                                                 end;
  for i:=1 to n div 2 do begin
   if a[(sin)] = a[sim] then v:=v+2;
   sin:=sin-1;
   sim:=sim+1;
  end;
  writeln;
  if n = v then writeln('à®£à¥áá¨ï á¨¬¬¥âà¨ç­ ') else writeln('à®£à¥áá¨ï ­¥ á¨¬¬¥âà¨ç­ ');
  writeln;

{ª®«ìª® çñâ­ëå ç¨á¥«}
  cet:=0;
  for t:=1 to n do
   if a[t] mod 2 = 0 then cet:=cet+1;
  writeln(' ¯à®£à¥áá¨¨ ', cet, ' çñâ­ëå ç¨á¥«(-« )');

{¢  ­ ¨¡®«ìè¨å}
  Sminmax:=-1000;
  Sminmax2:=-1000;
  For e:=1 to n do begin
   if a[e] > sminmax then if a[e] mod 2 = 0 then begin
    sminmax:=a[e];
    w:=e;
   end
  end;
  For e:=1 to n do begin
   if a[e] mod 2 = 0 then if a[e] > sminmax2 then if a[e] <> a[w] then sminmax2:=a[e];


  end;
  if sminmax2 <> -1000 then  writeln('§ ­¨å ¤¢  ­ ¨¡®«ìè¨å ç¨á« : ', sminmax, ' ¨ ', sminmax2) else writeln(' «¨­¥©ª¥ ¬¥­ìè¥ ¤¢ãå çñâ­ëå ç¨á¥«.');

{áâì «¨ ¯®¢â®à¥­¨ï}
  o:=0;
  writeln;
  for i:=1 to n do begin
    for g:=1 to n do begin
     if a[g]=a[i] then o:=o+1;
    end;
  end;
  if o = n then writeln('®¢â®à®¢ ­¥â') else writeln('®¢â®àë ¥áâì');

End.
