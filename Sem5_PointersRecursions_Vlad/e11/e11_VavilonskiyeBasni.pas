{
Здесь программа, которая делает Ханойскую башню с помощью рекурсии.
}
Program VavilonskiyeBasni;
Uses Graph, WinCRT,CRT;
Type PElement = ^TElement;
        TElement = record
                next: PElement;
                prev: PElement;
                number: byte;
                color: byte;
                x: byte;
        end;
Var AA,BB,CC: PElement;
etotX: byte;
var propusk,propusky: integer;// = 300;
Procedure Rect(x,y,x2,y2:byte);
Begin
        Line(x,y,x2,y2);
        Line(x,y-1,x2,y2-1);
        Line(x,y-2,x2,y2-2);
        Line(x,y-3,x2,y2-3);
        Line(x,y-4,x2,y2-4);
        Line(x,y-5,x2,y2-5);
        Line(x,y-6,x2,y2-6);
        Line(x,y-7,x2,y2-7);

End;
Procedure Draw(x:byte;PP: PElement);
var P: PElement; i:byte;
Begin

        p:=PP;
        while P^.next<>nil do P:=P^.next;
        i:=0;
        While P<>nil do begin
                i:=i+1;
                setcolor(P^.color);
                if P^.number<=etotX then begin
                        Line(propusk*x-12 * P^.number,propusky-i*10,propusk*x+12* P^.number,propusky-i*10);
                        Line(propusk*x-12 * P^.number,propusky-i*10+1,propusk*x+12* P^.number,propusky-i*10+1);
                        Line(propusk*x-12 * P^.number,propusky-i*10+2,propusk*x+12* P^.number,propusky-i*10+2);
                        Line(propusk*x-12 * P^.number,propusky-i*10+3,propusk*x+12* P^.number,propusky-i*10+3);
                        Line(propusk*x-12 * P^.number,propusky-i*10+4,propusk*x+12* P^.number,propusky-i*10+4);
                        Line(propusk*x-12 * P^.number,propusky-i*10+5,propusk*x+12* P^.number,propusky-i*10+5);
                        Line(propusk*x-12 * P^.number,propusky-i*10+6,propusk*x+12* P^.number,propusky-i*10+6);
                        Line(propusk*x-12 * P^.number,propusky-i*10+7,propusk*x+12* P^.number,propusky-i*10+7);
                end;
                P:=P^.prev;
        end;


End;
Procedure GetX(var P: PElement);
var pp: PElement;
Begin
        pp:=P;
        While pp^.next<>nil do
                pp:=pp^.next;
        p^.x:=pp^.x;

End;
Procedure Move(var Pir,PPir,LPir: PElement;n: byte);
//â  ¯à®æ¥¤ãà  ¯¥à¥¬¥é ¥â ­ã¦­®¥ ª®«¨ç¥áâ¢® áâ®«¡¨ª®¢ ¢¯à ¢®, ­® ¯®ª  ª®«-¢® áâ®«¡¨ª®¢ ®£à ­¨ç¥­® ¥¤¨­¨æ¥©
var p,pp:PElement;
Begin
        if n>1 then
                Move(Pir,LPir,PPir,n-1);

        p:=Pir^.next;
        Pir^.next:=PPir;
        PPir^.prev:=Pir;
        PPir:=Pir;
        Pir:=p;
        P^.Prev:=nil;
        if etotX<11 then readkey;

             if etotX<19 then begin
                GetX(Pir);
                GetX(PPir);
                GetX(LPir);
                ClearDevice;
                Draw(Pir^.x,Pir);
                Draw(pPir^.x,PPir);
                Draw(lPir^.x,LPir);
                settextstyle(1,2,10);
                setcolor(red);
                OutTextXY(propusk-40,propusky*2-(propusky div 2),'A');
                setcolor(yellow);
                Line(0,round(propusky*1.1),GetMaxX,round(propusky*1.1));
                Line(propusk*3 div 2,0,propusk*3 div 2,1440);
                OutTextXY(2*propusk-40,propusky*2-(propusky div 2),'B');
                Line(propusk*3-propusk div 2,0,propusk*3-propusk div 2,1440);
                setcolor(cyan);
                OutTextXY(3*propusk-40,propusky*2-(propusky div 2),'C');
                Delay(24);
             end;

        if n>1 then
                Move(LPir,PPir,Pir,n-1);
End;
Procedure DisPouz(P: PElement);
var pp:PElement;
Begin
        repeat
                pp:=p;
                p:=p^.next;
                dispose(pp);
        until p=nil;
End;
var gd,gm,i: integer;
        a,b,c,p: PElement;

Begin
        Writeln;
        Writeln;
        Writeln('â  ¯à®£à ¬¬  ¯¥à¥¬¥é ¥â ¯¨à ¬¨¤ªã á  ­  .');
        Writeln('¢¥¤¨â¥, ¯®¦ «ã©áâ , ¢ëá®âã ¯¨à ¬¨¤ª¨: ');
        Writeln('Core2Duo:');
        Writeln('26 - 2 á¥ªã­¤ë;');
        Writeln('27 - 4 á¥ªã­¤ë;');
        Writeln('28 - 8 á¥ªã­¤;');
        Readln(etotX);
        gd:=detect;
        initgraph(gd,gm,'');
        propusk:= round(GetMaxX * 0.24);
        propusky:=500;
        new(A);
        new(B);
        new(C);
        AA:=a;
        BB:=B;
        CC:=C;
        A^.next:=nil;
        A^.prev:=nil;
        A^.number:=etotX+1;
        A^.x:=1;
        B^.next:=nil;
        B^.prev:=nil;
        B^.number:=etotX+1;
        B^.x:=2;
        C^.next:=nil;
        C^.prev:=nil;
        C^.number:=etotX+1;
        c^.x:=3;
        for i:=etotX downto 1 do begin
                new(P);
                if i = etotX then P^.prev:=nil;
                P^.x:=1;
                P^.color:=i+1;
                P^.next:=A;
                A^.prev:=P;
                P^.number:=i;
                A:=P;
        end;

        Draw(1,A);
        Delay(600);
        Move(a,b,c,etotX);

        ClearDevice;
        Draw(1,A);
        Draw(2,B);
        Draw(3,C);
        DisPouz(b);
        readkey;


End.

