Unit Usup;
Interface
Procedure Pobeda(turn_s: string);
Implementation
Uses CRT;
Procedure Pobeda(turn_s: string);
Var i1: integer;
Begin
  GoToXY(7,2);
  For i1:=1 to 5 do write('����ࠢ�塞, ', turn_s, ' �ந�ࠫ�! ');
End;

Begin
End.