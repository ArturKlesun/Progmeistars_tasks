{  1.}  Program LifeGame;
{  2.}  Uses CRT;
{  3.}  
{  4.}  Const Height = 20;  Width  = 60;  // размеры игрового поля
{  5.}        Alive = '*';  Dead = '.';   // обозначения клеток
{  6.}  
{  7.}  Type TField = Array [0..Height+1, 0..Width+1] of Char;
{  8.}  
{  9.}  Procedure Draw (F: TField);
{ 10.}  Var i, j: Integer;
{ 11.}  Begin
{ 12.}    GotoXY (1, 1);
{ 13.}    For i:= 1 To Height Do Begin
{ 14.}      For j:= 1 To Width Do Begin
{ 15.}        Write (F[i,j]);
{ 16.}      End;
{ 17.}      Writeln;
{ 18.}    End;
{ 19.}  End;
{ 20.}  
{ 21.}  Procedure NextGeneration (var F: TField);
{ 22.}  Var i, j, i1, j1: Integer;
{ 23.}      F1: TField;
{ 24.}      neighbors: Integer;
{ 25.}  Begin
{ 26.}    For i:= 1 To Height Do Begin
{ 27.}      For j:= 1 To Width Do Begin
{ 28.}        neighbors:= 0;
{ 29.}        For i1:= i-1 To i+1 Do Begin
{ 30.}          For j1:= j-1 To j+1 Do Begin
{ 31.}            If F[i1,j1] = Alive Then Inc(neighbors);
{ 32.}          End;
{ 33.}        End;
{ 34.}        If F[i,j] = Alive Then Begin
{ 35.}          {Живая клетка переходит в следующее поколение,
{ 36.}           если у неё 2 или 3 соседа, иначе - умирает }
{ 37.}          Dec(neighbors);
{ 38.}          If (neighbors<2) or (neighbors>3) Then F1[i,j]:= Dead
{ 39.}                                            Else F1[i,j]:= Alive;
{ 40.}        End
{ 41.}        Else Begin
{ 42.}          {В мёртвой клетке появляется жизнь тогда и только
{ 43.}           тогда, когда у неё есть ровно 3 живых соседних клетки}
{ 44.}          If (neighbors=3) Then F1[i,j]:= Alive
{ 45.}                           Else F1[i,j]:= Dead;
{ 46.}        End;
{ 47.}      End;
{ 48.}    End;
{ 49.}    F:= F1;
{ 50.}  End;
{ 51.}  
{ 52.}  Var Field: TField;
{ 53.}      i, j: Integer;
{ 54.}      f: Text;
{ 55.}  Begin
{ 56.}    Assign (f, 'life.dat');
{ 57.}    Reset (f);
{ 58.}    {Файл life.dat содержит ровно height строк по width символов
{ 59.}     - точек (мёртвые клетки) и звёздочек (живые) - в каждой}
{ 60.}    For i:= 1 To Height Do Begin
{ 61.}      For j:= 1 To Width Do Begin
{ 62.}        Read (f, Field[i,j]);
{ 63.}      End;
{ 64.}      Readln (f);
{ 65.}    End;
{ 66.}    Close (f);
{ 67.}  
{ 68.}    ClrScr;
{ 69.}    Window (5, 2, 80, 24);
{ 70.}    Repeat
{ 71.}      Draw (Field);
{ 72.}      NextGeneration (Field);
{ 73.}    Until ReadKey = #27;      // #27 = Esc
{ 74.}  End.
