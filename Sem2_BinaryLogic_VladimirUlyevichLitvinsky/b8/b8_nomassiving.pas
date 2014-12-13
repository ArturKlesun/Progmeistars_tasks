{
Здравствуйте, Владимир Юльевич.
Здесь программа, которую вы задали написать: которая сортирует 20 чисел в типизированном файле, не прибегая к массивам.
                Артур Клесун, пятничная группа.
}
{20 ¨­â¥£¥à®¢ ¢ â¨¯¨§¨à®¢ ­­®¬ ä ©«¥ - ®âá®àâ¨à®¢ âì, ­¥ ¯à¨¡¥£ ï ª ¬ áá¨¢ã}
Program nomassiving;
var a,b,c,i1,i2: integer;
    f: file of integer;
Begin
  assign(f,'data.dat');
  rewrite(f);
  For i1:=1 to 20 do begin
   c:=random(200)+1;
   write(f,c);
   writeln(c);
  end;
  writeln;
  close(f);
  reset(f);
  For i1:=1 to filesize(f) do begin
   seek(f,0);
   for i2:=1 to filesize(f)-1 do begin
    read(f,a);
    Read(f,b);
    if b<a then begin seek(f,i2-1); write(f,b); write(f,a); end;
    seek(f,i2);
   end;
  end;
  close(f);
  reset(f);
  seek(f,0);
  For i1:=1 to 20 do begin
   read(f,c);
   writeln(c);
  end;
  close(f);
end.
