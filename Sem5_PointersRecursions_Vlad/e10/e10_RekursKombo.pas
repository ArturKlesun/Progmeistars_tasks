// � �⮩ �ணࠬ�� ���� �᫮ � � �����஥ ������⢮ �ᥫ �. �ணࠬ�� ��室�� �� �������樨, ��� ᪫��뢠� �᫠ �� ������⢠ � ����� ������� �᫮ �.
Program RekursoCombo;
Uses CRT;
const etotX = 255;
Type SeSe = set of 1..etotX;
     PElement = ^TElement;
     TElement = record
        next: PElement;
        Answer: String;
     end;

Var top: PElement;

Function Incl(N: String; i: longint): String;
var s:string[3];
Begin
        str(i,s);
        Incl:=N+s+' ';
End;
Procedure Combo(x:longint;Mgr: SeSe; InOutSe: string);
var i,i2: byte;
        sub,subsub: SeSe;
Begin
         subsub:=Mgr;
         if x=0 then begin
                top^.Answer:=InOutSe;
                new(top^.next);
                top:=top^.next;
                top^.next:=nil;

         end else
         Repeat
             sub:=Mgr;
             For i in sub do begin
                  if i<>0 then if (x>=i) then Combo(x-i,subsub,Incl(InOutSe,i))  else
                       exclude(Mgr,i);
                  exclude(subsub,i);      // ���୮

             end;
         Until sub<>[];

End;
Var x,i,c,r,t: longint;
        key: byte;
        w:real;
        M: SeSe;
        MM: array [1..etotX] of byte;
        h: PElement;
        f: text;
Begin
        new(h);
        h^.next:=nil;
        top:=h;
        Writeln('������, �������� ��o, ���஥ �㤥� �㬬��:');
        Readln(x);
        M:=[];
        i:=1;
        Repeat
                Writeln('������, �������� ',i, '-e �᫮, ���஥ ��� �ᯮ�짮���� � ����������:');
                Writeln('��� ������ �᫮ 255, �᫨ ����� �����筮 �ᥫ:');
                Readln(key);
                if key<>255 then include(M,key);
                i:=i+1;
        Until key = 255;
        Combo(x,M,'');
        assign(f,'data.txt');
        rewrite(f);
        writeln;
        Repeat
                 writeln(h^.answer);
                 Writeln(f,h^.answer);
                 top:=h;
                 h:=h^.next;
                 dispose(top);
        Until h=nil;
        readln;
        close(f);
End.
