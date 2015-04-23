Program Dniwe;
Uses CRT;
const R = 15;
Type PElement = ^TElement;
	 TElement = record
		 next,prev: PElement;
		 data: longint;
	 end;
Var Ring,p: PElement;
	 n,o,k,i,a: longint;
Begin
	 Writeln('Привет!');
	 Writeln('Эта программа ставит n-ное количетсво людей по кругу и убивает каждого k-ого из них, покамест не останется только один.');
	 Writeln('Введите, пожалуйста, n:');
	 Readln(n);
	 Writeln('Введите, пожалуйста, k:');
	 Readln(k);
	 New(Ring);
	 Ring^.next:=nil;
	 Ring^.prev:=nil;
         Ring^.data:=1;
	 p:=Ring;
	 clrscr;
         window(1,1,140,40);
	 For i:=2 to n do begin
                 textcolor(lightcyan);
		 new(p^.next);
                 GoToXY(70+round(cos(2*Pi/n*i)*2*R),20+round(sin(2*Pi/n*i)*R));
                 write('p^.next');
		 p^.next^.data:=i;
                 textcolor(red);
                 write(' ',i);
		 p^.next^.prev:=p;
                 GoToXY(70+round(cos(2*Pi/n*i)*2*R)-5,20+round(sin(2*Pi/n*i)*R));
                 textcolor(yellow);
                 write('p',p^.data,'<-');
		 p:=p^.next;
	 end;
	 p^.next:=Ring;
	 Ring^.prev:=p^.next;
	 textcolor(lightcyan);
	 GoToXY(70+round(cos(2*Pi/n)*2*R),20+round(sin(2*Pi/n)*R));
                 write('p^.next - Ring');
	 textcolor(red);
                 write(' ',Ring^.data);
	 GoToXY(70+round(cos(2*Pi/n)*2*R)-5,20+round(sin(2*Pi/n)*R));
                 textcolor(yellow);
                 write('p',p^.data,'<-');
                 readkey;
	 TextColor(red);
         While (Ring^.Next<>Ring) do begin
                 P:=Ring;
                For i:=1 to k-1 do
                 P:=P^.Next;
                 Ring:=P^.next;
		 P^.Prev^.Next:=Ring;
                 Ring^.Prev:=P^.Prev;
		 Dispose(P);
		 GoToXY(70+round(cos(2*Pi/n*(p^.data))*2*R),20+round(sin(2*Pi/n*(p^.data))*R));
                 write('X');
                 readkey;
	 End;
         Gotoxy(5,0);
         Write('Последним останется номер: ',Ring^.data);
End.
