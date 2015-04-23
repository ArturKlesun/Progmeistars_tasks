{}
Program meshalka_ubistryalka;
Uses Dos;
const
RecS = 1024;
Var h,m,s,ss,h2,m2,s2,ss2:word;
Procedure mesh;
var f: file of char;
    i1: longint;
    c:integer;

Begin
  assign(f, 'pure_trash.dat');
  rewrite(f);
  Randomize;
  For i1:=1 to 1000000 do begin
   c:=(random(200)+30);
   write(f,chr(c));
  end;
  close(f);
End;

Procedure copytxt;
var f,f2: text;
    i1: longint;
    a:char;
    st:string;
    h1,m1,s1,ss1: int64;

begin

  assign(f, 'pure_trash.dat');
  reset(f);
  assign(f2, 'pure_trash.txt');
  rewrite(f2);
  writeln('Идёт сохранение в pure_trash.dat...');
  gettime(h,m,s,ss);
  Repeat
   read(f,st);
   write(f2,st);
  until eOf(f);
  gettime(h2,m2,s2,ss2);
  Writeln('Начало обработки:');
  writeln(h,' ',m,' ',s,' ',ss);
  Writeln('Конец обработки:');
  writeln(h2,' ',m2,' ',s2,' ',ss2);
  i1:=(ss2+s2*100+m2*6000+h2*360000-ss-s*100-m*6000-h*360000);
  h1:=i1 div 360000;
  Writeln('h=',h1);
  m1:=(i1-h1*360000) div 6000;
  Writeln('m=',m1);
  s1:=(i1-h1*360000-m1*6000) div 100;
  Writeln('s=',s1);
  ss1:=(i1-h1*360000-m1*6000-s1*100);
  Writeln('ss=',ss1);
  close(f);
  close(f2);
end;

Procedure copytyped;
var f,f2: file of char;
    i1,h1,m1,s1,ss1: int64;
    a:char;
    st:char;

begin

  assign(f, 'pure_trash.dat');
  reset(f);
  assign(f2, 'pure_trashtp.dat');
  rewrite(f2);
  writeln('Идёт сохранение в pure_trashtp.dat...');
  gettime(h,m,s,ss);
  Repeat
   read(f,st);
   write(f2,st);
  until eOf(f);
  gettime(h2,m2,s2,ss2);
  Writeln('Начало обработки:');
  writeln(h,' ',m,' ',s,' ',ss);
  Writeln('Конец обработки:');
  writeln(h2,' ',m2,' ',s2,' ',ss2);
  i1:=(ss2+s2*100+m2*6000+h2*360000-ss-s*100-m*6000-h*360000);
  h1:=i1 div 360000;
  Writeln('h=',h1);
  m1:=(i1-h1*360000) div 6000;
  Writeln('m=',m1);
  s1:=(i1-h1*360000-m1*6000) div 100;
  Writeln('s=',s1);
  ss1:=(i1-h1*360000-m1*6000-s1*100);
  Writeln('ss=',ss1);
  close(f);
  close(f2);

end;

Procedure copyntyped;
var f,f2: file;
    i1: int64;
    st:char;
    buf: array [1..RecS] of byte;
    i: word;
    h1,m1,s1,ss1: int64;

begin

  assign(f, 'pure_trash.dat');
  reset(f);
  assign(f2, 'pure_trashntp.dat');
  rewrite(f2);
  writeln('Идёт сохранение в pure_trashntp.dat...');
  gettime(h,m,s,ss);
  Repeat
   Blockread(f,buf,1,i);
   Blockwrite(f2,buf,1);
  until eOf(f);
  gettime(h2,m2,s2,ss2);
  Writeln('Начало обработки:');
  writeln(h,' ',m,' ',s,' ',ss);
  Writeln('Конец обработки:');
  writeln(h2,' ',m2,' ',s2,' ',ss2);
  i1:=(ss2+s2*100+m2*6000+h2*360000-ss-s*100-m*6000-h*360000);
  h1:=i1 div 360000;
  Writeln('h=',h1);
  m1:=(i1-h1*360000) div 6000;
  Writeln('m=',m1);
  s1:=(i1-h1*360000-m1*6000) div 100;
  Writeln('s=',s1);
  ss1:=(i1-h1*360000-m1*6000-s1*100);
  Writeln('ss=',ss1);
  close(f);
  close(f2);
end;

var i1:int64;
i2: longint;
    f: text;
    a: char;
begin
  writeln('Идёт создание файла...');
  mesh;
  assign(f, 'pure_trash.dat');
  {reset(f);
  for i2:=1 to 1000000 do begin
   read(f,a);
   write(a);
  end;
  close(f);}
 Writeln;
 Writeln;
 Writeln('Текстовым файлом:');
 copytxt;
 writeln;
 Writeln('Типизированным файлом (может занять больше минуты):');
 copytyped;
 Writeln;
 Writeln('Блочным файлом:');
 copyntyped;
 writeln;
end.
