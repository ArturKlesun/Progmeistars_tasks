//Эта программа сортирует числа с помощью рекурсии

Program RekursivnayaSortirovka;
Uses Graph,CRT;

Type PElement = ^TElement;
     TElement = Record
         next: Pelement;
         value: longint;
     end;
var k,ks: PElement;
Function Merge(a,b: PElement): PElement;
var c,r,ch: PElement;
Begin
        new(c);
        c^.value:=-1;
        ch:=c;
        Repeat
                 if (a^.value>b^.value) then begin
                        c^.next:=b;
                        b:=b^.next;
                 end else begin
                        c^.next:=a;
                        a:=a^.next;
                 end;
                 c:=c^.next;
         until (a=nil) or (b=nil);
         if a<>nil then c^.next:=a else c^.next:=b;
         r:=ch;
         Merge:=ch^.next;
         dispose(r);
End;
var c: PElement;
Function Sort(h: PElement; n: longint): PElement;
Var a,b: PElement;
        i,sub: longint;
Begin
         a:=h;
         b:=h;
         if n>1 then for i:=1 to n div 2 do b:=b^.next;
         if n>3 then for i:=1 to n div 2 - 1 do a:=a^.next;
         a^.next:=nil;
         a:=h;
         if n>2 then begin
                a:=Sort(a,n div 2);
                if n mod 2 = 1 then b:=Sort(b,n div 2+1) else b:=Sort(b,n div 2);
         end;
         c:=Merge(a,b);
         Sort:=c;
End;

Var n: longint;
        h,o,g: PElement;
Begin
         For n:=1 to 16 do
                 if n=1 then begin
                         new(h);
                         h^.value:=random(100);
                         Write(h^.value, ' ');
                         o:=h;
                 end else begin
                         new(g);
                         o^.next:=g;
                         o:=g;
                         o^.value:=random(100);
                         Write(o^.value, ' ');
                 end;
         o^.next:=nil;
         k:=h;
         Sort(h,16);
         o:=c;
         writeln;
         While o<>nil do begin
                 Write(o^.value, ' ');
                 g:=o;
                 o:=o^.next;
                 dispose(g);
         end;
         readln;
End.

