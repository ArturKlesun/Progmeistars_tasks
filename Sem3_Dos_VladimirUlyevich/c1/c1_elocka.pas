{
Задача "Пьедестал" с листочка, который вы нам давали. 
}
{невхуйебу}
Program elocka;
Uses CRT;
const h=18;
      a=17;
      number=h*a;
{      current=i1*(h-1)-h+1+i2 mod (a+1);   }
Var e: array [1..number] of longint;
    e_sum: longint;
    i1,i2,i3,i4: integer;
    k,ara: longint;

Function xytoarnumber(x,y:integer): integer;
Begin
  xytoarnumber:=(y*(h-1)-h+1+x mod (a+1));
end;
Function vhodli(x,y: integer): longint;
var i1,i2,i3,i4,arghx,arghy,k,ara: longint;
begin
  e_sum:=0;

  For i1:=1 to (h-y+1) do begin
   for i2:=1 to (i1) do begin
     arghx:=i2;
     arghy:=i1;
     if a-(x+arghx)<-1 then arghx:=a+1;
     if arghx<>a+1 then e_sum:=e_sum+(e[xytoarnumber(x+arghx-1,y+arghy-1)]);
   end;
  end;

  k:=0;
  For i1:=1 to (h-y+1) do begin
   k:=k+1;
   for i2:=1 to (i1) do begin
     arghx:=i2;
     arghy:=i1;
     if x-arghx<=0 then arghx:=a+1;
     if (arghx<>a+1) and (i1<>1) and (i2<>k) then e_sum:=e_sum+(e[xytoarnumber(x-arghx,y+arghy-1)]);
   end;
  end;
  vhodli:=e_sum;
end;

Procedure cwantacosta;
var x:integer;
Begin
  For i1:=1 to h do begin
   for i2:=1 to a do begin
     e[xytoarnumber(i2,i1)]:=vhodli(i2,i1);
     write((e[xytoarnumber(i2,i1)]):5)
   end;
  writeln;
  end;
End;


Begin
 clrscr;
 For i1:=1 to number do begin
   e[i1]:=random(10);

 End;
 Writeln;
 Writeln;
 For i1:=1 to h do begin
   For i2:=1 to a do begin
     ara:=i1*(h-1)-h+1+i2 mod (a+1);
    write(e[ara],' ');
   end;
   writeln;
 end;
 cwantacosta;
 readln;
End.
