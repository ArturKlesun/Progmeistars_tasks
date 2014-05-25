Program zec;
Uses a8_trololo, crt, a8_trololo_gaping;
Var eternity:char;
    i: integer;
Begin
Repeat
TextBackground(0);
clrscr;
draw;
Delay(2000);
TextBackground(0);
clrscr;
draw_gap;
Delay(2000);
if keypressed then break;
Until eternity='Vova';
end.
