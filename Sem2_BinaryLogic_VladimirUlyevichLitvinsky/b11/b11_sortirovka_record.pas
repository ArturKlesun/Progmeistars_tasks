{
Здесь программа, которую вы задали написать: "Сортирует типы данных record по содержащимся в них данным: имени; дате; размеру", результаты выносятся в файлы "(SortBy)Date/Name'Size.dat (типизированные файлы); (Parbaude)Date/Name/Size.txt (текстовые файлы)".
}
Program Date_size_name_is_that_all;
Uses crt;
Type tdate = record
      y: integer;
      d: integer;
      h: byte;
      m: byte;
      s: byte;
     end;
Type tvaleras = record
      date: tdate;
      size: longint;
      aname: string;
     end;
var data: array [1..300] of tvaleras;
mes,princip: integer;
Procedure datagenerator;
var i1: integer;
    v: integer;


Begin
  randomize;

  for i1:=1 to 300 do begin
   with data[i1] do begin
    with date do begin
     y:=random(30)+1983;
     d:=random(365)+1;
     h:=random(23)+1;
     m:=random(59)+1;
     s:=random(59)+1;
    end;
    size:=random(1000000000)+1;
    str(random(5000)+1, aname);
    aname:=chr(random(110)+48)+'Valera'+aname;
   end;
  end;
end;

var f: file of tvaleras;

Procedure sortbyname;
var i1,i2,i3,i4,i5: longint;
    a,b: tvaleras;
    e: text;
    nta: integer;
    y,z:integer;

Begin
Writeln('ë ¢ë¡à «¨ á®àâ¨à®¢ªã ¯® ¨¬¥­¨ ä ©«®¢.');
  assign(f,'SortByName.dat');
  rewrite(f);
  close(f);
  reset(f);
  for i1:=1 to 300 do begin
   write(f, data[i1]);
  end;
  seek(f,0);
  for i1:= 1 to 300 do begin
     for i2:=0 to 299 do begin

      seek(f,i1-1);
      read(f,a);
      seek(f,i2);
      Read(f,b);
      nta:=0;
       repeat
        {if readkey=chr(27) then halt;
        writeln(nta);
        writeln(length(a.aname));
        writeln(length(b.aname));
        writeln;     }
        nta:=nta+1;
        if (ord(a.aname[nta])>64) and (ord(a.aname[nta])<91) then y:=ord(a.aname[nta])+32 else
        if (ord(a.aname[nta])>127) and (ord(a.aname[nta])<144) then y:=ord(a.aname[nta])+32 else
        if (ord(a.aname[nta])>143) and (ord(a.aname[nta])<160) then y:=ord(a.aname[nta])+80 else
        y:=ord(a.aname[nta]);
        if (ord(b.aname[nta])>64) and (ord(b.aname[nta])<91) then z:=ord(b.aname[nta])+32 else
        if (ord(b.aname[nta])>127) and (ord(b.aname[nta])<144) then z:=ord(b.aname[nta])+32 else
        if (ord(b.aname[nta])>143) and (ord(b.aname[nta])<160) then z:=ord(b.aname[nta])+80 else
        z:=ord(b.aname[nta]);
        if y<>z then break
       until (nta=length(a.aname)) or (nta=length(a.aname));
      if princip=1 then begin if z>y then begin seek(f,i1-1); write(f,b); seek(f,i2); write(f,a); end; end else
                         if z<y then begin seek(f,i1-1); write(f,b); seek(f,i2); write(f,a); end;
     end;
  end;
  assign(e,'parbaudeName.txt');
  rewrite(e);
  for i1:=1 to 300 do begin
   seek(f,i1-1);
   read(f,a);
   with a do begin
    with date do begin
    writeln(e,'File''s name: ',aname);
    if y mod 4 = 0 then d:=d+1;
    mes:=1;
{1} if d>31 then begin
     d:=d-31;
     mes:=mes+1;
    end;
{2} if y mod 4 = 0 then if d>29 then begin
     d:=d-29;
     mes:=mes+1;
    end else if d>28 then begin
     d:=d-28;
     mes:=mes+1;
    end;
{3} if d>31 then begin
     d:=d-31;
     mes:=mes+1;
    end;
{4} if d>30 then begin
     d:=d-30;
     mes:=mes+1;
    end;
{5} if d>31 then begin
     d:=d-31;
     mes:=mes+1;
    end;
{6} if d>30 then begin
     d:=d-30;
     mes:=mes+1;
    end;
{7} if d>31 then begin
     d:=d-31;
     mes:=mes+1;
    end;
{8} if d>31 then begin
     d:=d-31;
     mes:=mes+1;
    end;
{9} if d>30 then begin
     d:=d-30;
     mes:=mes+1;
    end;
{10} if d>31 then begin
     d:=d-31;
     mes:=mes+1;
    end;
{11} if d>30 then begin
     d:=d-30;
     mes:=mes+1;
    end;
    Writeln(e,'Date created: ',d,'/',mes,'/',y,' ',h,':',m,':',s);
    writeln(e,'Size: ',size);
    end;
   end;
   writeln(e);
  end;
  close(e);
  close(f);
  writeln(' ¢¥àè¥­®.');
end;

Procedure sortbydate;
var i1,i2,i3,i4,i5: longint;
    a,b: tvaleras;
    e: text;
    ta,tb:int64;
Begin
Writeln('ë ¢ë¡à «¨ á®àâ¨à®¢ªã ¯® ¤ â¥ á®§¤ ­¨ï.');
  assign(f,'SortByDate.dat');
  rewrite(f);
  close(f);
  reset(f);
  for i1:=1 to 300 do
   write(f, data[i1]);
  seek(f,0);
  for i1:= 1 to 300 do begin
     for i2:=0 to 299 do begin
      seek(f,i1-1);
      read(f,a);
      seek(f,i2);
      Read(f,b);
      with a do
       with date do begin
        ta:=(y-1983)*3600*24*365;
        ta:=ta+s+m*60+h*3600+d*3600*24;
       end;
      with b do
       with date do begin
        tb:=s+m*60+h*3600+d*3600*24+(y-1983)*3600*24*365;
       end;
      if princip=1 then begin if tb>ta then begin seek(f,i1-1); write(f,b); seek(f,i2); write(f,a); end; end else
                         if tb<ta then begin seek(f,i1-1); write(f,b); seek(f,i2); write(f,a); end;
      end;
  end;
  assign(e,'parbaudeDate.txt');
  rewrite(e);
  for i1:=1 to 300 do begin
   seek(f,i1-1);
   read(f,a);
   with a do begin
    with date do begin
    writeln(e,'File''s name: ',aname);
    if y mod 4 = 0 then d:=d+1;
    mes:=1;
{1} if d>31 then begin
     d:=d-31;
     mes:=mes+1;
    end;
{2} if y mod 4 = 0 then if d>29 then begin
     d:=d-29;
     mes:=mes+1;
    end else if d>28 then begin
     d:=d-28;
     mes:=mes+1;
    end;
{3} if d>31 then begin
     d:=d-31;
     mes:=mes+1;
    end;
{4} if d>30 then begin
     d:=d-30;
     mes:=mes+1;
    end;
{5} if d>31 then begin
     d:=d-31;
     mes:=mes+1;
    end;
{6} if d>30 then begin
     d:=d-30;
     mes:=mes+1;
    end;
{7} if d>31 then begin
     d:=d-31;
     mes:=mes+1;
    end;
{8} if d>31 then begin
     d:=d-31;
     mes:=mes+1;
    end;
{9} if d>30 then begin
     d:=d-30;
     mes:=mes+1;
    end;
{10} if d>31 then begin
     d:=d-31;
     mes:=mes+1;
    end;
{11} if d>30 then begin
     d:=d-30;
     mes:=mes+1;
    end;
    Writeln(e,'Date created: ',d,'/',mes,'/',y,' ',h,':',m,':',s);
    writeln(e,'Size: ',size);
    end;
   end;
   writeln(e);
  end;
  close(e);
  close(f);
  writeln(' ¢¥àè¥­®.');
end;

Procedure sortbysize;
var i1,i2,i3,i4,i5: longint;
    a,b: tvaleras;
    e: text;
Begin
Writeln('ë ¢ë¡à «¨ á®àâ¨à®¢ªã ¯® à §¬¥àã.');
  assign(f,'SortBySize.dat');
  rewrite(f);
  close(f);
  reset(f);
  for i1:=1 to 300 do
   write(f, data[i1]);
  seek(f,0);
  for i1:= 1 to 300 do begin
     for i2:=0 to 299 do begin
      seek(f,i1-1);
      read(f,a);
      seek(f,i2);
      Read(f,b);
       if princip=1 then begin if b.size>a.size then begin seek(f,i1-1); write(f,b); seek(f,i2); write(f,a); end; end else
                         if b.size<a.size then begin seek(f,i1-1); write(f,b); seek(f,i2); write(f,a); end;
     end;
  end;
  assign(e,'parbaudeSize.txt');
  rewrite(e);
   for i1:=1 to 300 do begin
   seek(f,i1-1);
   read(f,a);
   with a do begin
    with date do begin
    writeln(e,'File''s name: ',aname);
    if y mod 4 = 0 then d:=d+1;
    mes:=1;
{1} if d>31 then begin
     d:=d-31;
     mes:=mes+1;
    end;
{2} if y mod 4 = 0 then if d>29 then begin
     d:=d-29;
     mes:=mes+1;
    end else if d>28 then begin
     d:=d-28;
     mes:=mes+1;
    end;
{3} if d>31 then begin
     d:=d-31;
     mes:=mes+1;
    end;
{4} if d>30 then begin
     d:=d-30;
     mes:=mes+1;
    end;
{5} if d>31 then begin
     d:=d-31;
     mes:=mes+1;
    end;
{6} if d>30 then begin
     d:=d-30;
     mes:=mes+1;
    end;
{7} if d>31 then begin
     d:=d-31;
     mes:=mes+1;
    end;
{8} if d>31 then begin
     d:=d-31;
     mes:=mes+1;
    end;
{9} if d>30 then begin
     d:=d-30;
     mes:=mes+1;
    end;
{10} if d>31 then begin
     d:=d-31;
     mes:=mes+1;
    end;
{11} if d>30 then begin
     d:=d-30;
     mes:=mes+1;
    end;
    Writeln(e,'Date created: ',d,'/',mes,'/',y,' ',h,':',m,':',s);
    writeln(e,'Size: ',size);
    end;
   end;
   writeln(e);
  end;
  close(e);
  close(f);
  writeln(' ¢¥àè¥­®.');
end;

var i1: integer;
    sposob: byte;
Begin
  datagenerator;
 { for i1:=1 to 50 do begin
   with data[i1] do
    with date do begin
     writeln(y);
     writeln(d);
     writeln(h);
     writeln(m);
     writeln(s);
     writeln(size);
     writeln(name);
    end;
  end;}
  repeat
    writeln;
    Writeln('®àâ¨àãî à ­¤®¬­ë¥ ä ©«ë ''Valera'' ¯® à §¬¥àã, ¨¬¥­¨ ¨ ¤ â¥ á®§¤ ­¨ï.');
    writeln('¢¥¤¨â¥, ¯®¦ «ã©áâ :');
    writeln('1 - á®àâ¨à®¢ âì ¯® ¤ â¥;');
    writeln('2 - á®àâ¨à®¢ âì ¯® à §¬¥àã;');
    writeln('3 - á®àâ¨à®¢ âì ¯® ¨¬¥­¨;');
    if readkey=chr(27) then break;
    Readln(sposob);
    writeln('® ª ª®¬ã ¯à¨­æ¨¯ã á®àâ¨à®¢ âì?');
    writeln('1 - á®àâ¨à®¢ âì ¯® ¢®§à®áâ îé¥©;');
    writeln('2 - á®àâ¨à®¢ âì ¯® ã¡ë¢ îé¥©;');
    readln(princip);
    case sposob of
     1: sortbydate;
     2: sortbysize;
     3: sortbyname;
    end;
  until readkey=chr(27);
End.
