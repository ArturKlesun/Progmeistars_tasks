Program DinamoRasstavlyalka;
Type TElement = ^PElement;
	 PElement = record
		 next: TElement;
		 data: longint;
	 end;
Var i,j,p,h: TElement;
	 i1,i2,i3: longint;
	 f: text;
Function NahoditMentchwee: PElement;
Begin

End;
Begin
         randomize;
	 Assign(f,'data.txt');
	 Rewrite(f);
	 For i1:=1 to 20 do
		 Writeln(f,random(50)-25);
	 close(f);
	 reset(f);
	 new(h);
	 h^.next:=nil;
         readln(f,i1);
	 h^.data:=i1;

         readln(f,i1);
         new(i); i^.data:=i1;
         i^.next:=nil;
         if i1>=h^.data then
           h^.next:=i else begin
             i^.next:=h;
             h:=i;
           end;
	 repeat
		 readln(f,i1);
                 new(i); i^.data:=i1;
                 i^.next:=nil;
                 p:=h;
                 if i1<=h^.data then begin
                   i^.next:=h;
                   h:=i;
                 end else begin
                   writeln;
                   writeln;
                   writeln;
                   while p^.next^.data<i^.data do begin
                     p:=p^.next;
                     if p^.next=nil then break;
                   end;
                     if p^.next<>nil then i^.next:=p^.next;
                     p^.next:=i;
                 end;
	 until eof(f);
         i1:=0;
         writeln(h^.data);
	 repeat
                 p:=h;
                 i1:=i1+1;
                 h:=h^.next;
                 dispose(p);
		 writeln(h^.data);
                 if i1=20 then h^.next:=nil;
         until h^.next=nil;
         dispose(h);
	 close(f);
End.
