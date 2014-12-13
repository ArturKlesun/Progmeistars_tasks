{  1.}  Program BEGUNOK;
{  2.}  Uses Crt;
{  3.}  
{  4.}  Const Up    = Chr(72);      Down  = Chr(80);
{  5.}        Left  = Chr(75);      Right = Chr(77);
{  6.}        Stop  = Chr(27);
{  7.}  
{  8.}        width = 80;           height = 23;
{  9.}  
{ 10.}  Procedure PrintXY (x, y: Integer; s: String);
{ 11.}  Begin
{ 12.}    GotoXY (x, y);
{ 13.}    Write (s);
{ 14.}  End;
{ 15.}  
{ 16.}  Function Interior (x, y: Integer): Integer;
{ 17.}  Begin
{ 18.}    If (x>0) and (x<=width) and (y>0) and (y<=height) Then
{ 19.}      Interior:= 1
{ 20.}    Else
{ 21.}      Interior:= 0;
{ 22.}  End;
{ 23.}  
{ 24.}  Var key: Char;
{ 25.}      x, dx, x1: Integer;
{ 26.}      y, dy, y1: Integer;
{ 27.}      sx, sy: String[2];
{ 28.}  Begin
{ 29.}    TextColor(Magenta);
{ 30.}    TextBackground(Black);
{ 31.}    ClrScr;
{ 32.}    x:= width div 2;
{ 33.}    y:= height div 2;
{ 34.}    dx:= 0;
{ 35.}    dy:= 0;
{ 36.}    PrintXY (x, y, '*');
{ 37.}    PrintXY (40, 24, ' Пауза - <пробел> .  Конец - ESC .');
{ 38.}    {Основной цикл}
{ 39.}    Repeat
{ 40.}      { Проверка и обработка событий }
{ 41.}      If KeyPressed Then Begin
{ 42.}        key:= ReadKey;
{ 43.}        Case key of
{ 44.}          Up:    Begin dx:= 0; dy:=-1; End;
{ 45.}          Down:  Begin dx:= 0; dy:= 1; End;
{ 46.}          Left:  Begin dx:=-1; dy:= 0; End;
{ 47.}          Right: Begin dx:= 1; dy:= 0; End;
{ 48.}          ' ':   Begin dx:= 0; dy:= 0; End;
{ 49.}          #27:   Begin Break; End;           //выход из цикла
{ 50.}        End {Case};
{ 51.}      End;
{ 52.}      { Один шаг движения }
{ 53.}      x1:= x+dx;
{ 54.}      y1:= y+dy;
{ 55.}      If (Interior (x1, y1) = 1) Then Begin
{ 56.}        Delay(80);
{ 57.}        PrintXY (x, y, ' ');
{ 58.}        x:= x1;
{ 59.}        y:= y1;
{ 60.}        PrintXY (x, y, '*');
{ 61.}        Str (x:2, sx);
{ 62.}        Str (y:2, sy);
{ 63.}        PrintXY (2, 24, '( ' + sx + ' ; ' + sy + ' )');
{ 64.}      End;
{ 65.}    Until (1=0);
{ 66.}  End.
