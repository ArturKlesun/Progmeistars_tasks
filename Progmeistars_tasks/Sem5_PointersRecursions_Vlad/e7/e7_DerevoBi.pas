{
с помощью рекурсии построить бинарное дерево, которое пускает корни влево, когда дочерняя буква меньше; вправо - когда дочерняя буква больше, потом программа эти буквы выводит в алфавитном порядке, а потом диспоузит всё дерево.
}
Program DvoyeMisliye;
Uses Graph,wincrt;
Const Safronix=999999;
Type PVetv = ^TVetv;
         TVetv = record
                 Left,Right: PVetv;
                 Bu: char;
                 count: longint;
                 level: longint;
         end;
Var h: longint;
         root: PVetv;
         var i: longint;
Procedure DobavitjVetvj(VarBu: char; P: PVetv);
Begin
         if VarBu<P^.Bu then begin
           if P^.left<>nil then
            DobavitjVetvj(VarBu,P^.Left)
           else begin
                 new(P^.left);
                 P^.left^.left:=nil;
                 P^.left^.right:=nil;
                 p^.left^.count:=1;
                 p^.left^.Bu:=VarBu;
           end;
         end
         else if VarBu>P^.Bu then begin
           if P^.Right<>nil then
            DobavitjVetvj(VarBu,P^.Right)
           else begin
                 new(P^.Right);
                 P^.Right^.left:=nil;
                 P^.Right^.right:=nil;
                 p^.Right^.count:=1;
                 p^.Right^.Bu:=VarBu;
           end;
         end
         else {f VarBu=P^.Bu then} P^.count:=P^.count+1;
End;
Procedure Narisovatj(start: PVetv; x,y:integer);
Var P: PVetv;
i: longint;
co: byte;
sub: string;
Begin
         with start^ do begin
                 if level=1 then i:=320 else
                 if level=2 then i:=120;
                 if level=3 then i:=20;
                 co:=random(15)+1;
                 setcolor(co);
                 if left<>nil then begin line(x+7,y+6,x-i+7,y+86); left^.level:=level+1; Narisovatj(left,x-i,y+80); end;
                 if right<>nil then begin line(x+7,y+6,x+i+7,y+86); right^.level:=level+1; Narisovatj(right,x+i,y+80); end;
                 setcolor(co);
                 circle(x+7,y+6,20);
                 circle(x+7,y+6,21);
                 OutTextXY(x,y,Bu);
                 SetColor(white);
                 if count>1 then begin
                         settextstyle(DefaultFont,HorizDir,1);
                         str(count,sub);
                         OutTextXY(x+16,y+9,sub);
                         settextstyle(DefaultFont,HorizDir,2);
                 end;
         end;
End;
Procedure O4isti(cel: PVetv);
Begin
         if cel^.left<>nil then O4isti(cel^.left);
         if cel^.right<>nil then O4isti(cel^.right);
         dispose(cel);
         i:=i+1;
End;
Procedure Zastrokuj(cel: PVetv);
var i: integer;
Begin
         if cel^.left<>nil then Zastrokuj(cel^.left);
         for i:=1 to cel^.count do write(cel^.bu);
         writeln;
         if cel^.right<>nil then Zastrokuj(cel^.right);
End;
var gd,gm: integer;
        susu: string;
Begin
         randomize;
         gd:= detect;
         initgraph(gd,gm,'');
         settextstyle(DefaultFont,HorizDir,2);
         new(root);
         with root^ do begin
                 left:=nil;
                 right:=left;
                 Bu:=chr(random(26)+65);
                 count:=1;
         end;
         For i:=1 to 160 do DobavitjVetvj(chr(random(26)+65),Root);
         root^.level:=1;
         Narisovatj(root,600,0);
         readkey;
         i:=0;
         Zastrokuj(root);
         O4isti(root);
         readkey;
         closegraph;
         readln;
end.
