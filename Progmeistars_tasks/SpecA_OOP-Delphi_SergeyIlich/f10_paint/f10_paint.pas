unit f10_paint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls, StdCtrls, Buttons, ColorGrd, Math;


Const BTN_Count = 16;

type
  TPaintBtn = class(TSpeedButton)
  private
    TheIndexOfTheCurrentBtn: integer;
    Procedure SetIndex(arg: integer);
  public
    property indx: integer read TheIndexOfTheCurrentBtn write SetIndex;
  end;

  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Edit1: TMenuItem;
    View1: TMenuItem;
    Image1: TMenuItem;
    Colors1: TMenuItem;
    Help1: TMenuItem;
    ColorGrid1: TColorGrid;
    PaintBox1: TPaintBox;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    asd,asdsub: integer;
    Function TrySq(value,x,y: integer; c: Tcolor): boolean;
    procedure LetsText(x,y: integer);
    procedure LetsSpray(x,y: integer);
    procedure Fill(x,y: integer);
    Procedure Throw(x,y: integer; c: TColor);
    { Public declarations }
  end;

var
  Form1: TForm1;
  BMcopy: TBitMap;
  BTNs: array [1..BTN_COUNT] of TPaintBtn;
  curtool,x0,y0: integer;
  ismousedown: boolean;

implementation


{$R *.DFM}

const BTNWIDTH = 33;
      BTNHEIGHT = 33;


procedure TForm1.LetsSpray(x,y: integer);
var i,xx,yy: integer;
    force: integer;
Begin
   force:=15;
   with Form1.paintbox1 do for i:=1 to 4 do begin
   repeat
      xx:=x+random(force*2)-force;
      yy:=y+random(force*2)-force;
   until ( sqr(x-xx)+sqr(y-yy) ) < sqr(force);
     canvas.Pixels[xx,yy]:=Form1.ColorGrid1.ForegroundColor;;
   end;
end;

procedure TPaintBtn.SetIndex(arg: integer);
Begin
   TheIndexOfTheCurrentBtn:=arg;
End;

procedure TForm1.FormCreate(Sender: TObject);
var i: integer;
begin

   with PaintBox1 do begin
      Canvas.Brush.Color:=16*16*16*16*16*16;
      Canvas.Rectangle( Rect(1,1,Height-1,Width-1) );
   end;

   // Создаём кнопки
   for i:=1 to BTN_COUNT{16} do begin
      BTNs[i]:=TPaintBtn.create(self);
      With BTNs[i] do begin
        parent:=Self;
        Glyph:=TBitMap.Create;
        if not (i in [1..3,5..6,10,12,14]) then Glyph.LoadFromFile('Paint''sPaintings\btn ('+IntToStr(i)+').bmp');
        Left:=1 * BTNWIDTH - (i mod 2) * BTNWIDTH;
        Top:= ( (i-1) div 2 ) * BTNHEIGHT;
        Width:= BTNWIDTH;
        Height:= BTNHEIGHT;
        indx:=i;
        GroupIndex:=1;
      end;

   end;

   //curtool:=7;
   Btns[7].Down:=true;
   BMCopy:= TBitMap.Create;
   BMCopy.width:= PaintBox1.width;
   BMCopy.height:= PaintBox1.height;
   BMcopy.Canvas.CopyRect(BMCopy.Canvas.ClipRect,
        PaintBox1.Canvas, PaintBox1.Canvas.ClipRect);
   ColorGrid1.BackGroundIndex:=15;

   with PaintBox1 do begin
      Canvas.Brush.Color:=16*16*16*16*16*16-1;
      Canvas.FillRect( Rect(0,0,Width,Height) );
   end;
   BMCopy:= TBitMap.Create;
   BMCopy.width:= PaintBox1.width;
   BMCopy.height:= PaintBox1.height;
   BMcopy.Canvas.CopyRect(BMCopy.Canvas.ClipRect,
        PaintBox1.Canvas, PaintBox1.Canvas.ClipRect);
end;


procedure TForm1.LetsText(x,y: integer);
Begin
End;


Function TForm1.TrySq(value,x,y: integer; c: Tcolor): boolean;
var y0,x0: integer;
Begin
  with Form1.PaintBox1.Canvas do begin
    if x-value<0 then value:=x;
    if y-value<0 then value:=y;
    if x+value>Form1.PaintBox1.Width then value:=Form1.PaintBox1.Width-x;
    if y+value>Form1.PaintBox1.Height then value:=Form1.PaintBox1.Height-y;

   for x0:=x - value to x + value do
    for y0:=y - value to y + value do begin
       if (pixels[x0,y0]<> c) then begin result:=false; exit; end;
    end;

   for x0:=x - value to x + value do
    for y0:=y - value to y + value do begin
       pixels[x0,y0]:=Form1.PaintBox1.Canvas.Pen.Color;
    end;
  {
   with Form1.PaintBox1 do begin
      Brush.Color:=Form1.PaintBox1.Canvas.Pen.Color;
      Rectangle( Rect(x - value,y - value,
                                  x + value,y + value) );
   end;
                                                            }
   y0:=y - value;
   for x0:=x - value to x + value do
    if pixels[x0,y0-1]=c then Fill(x0,y0-1);

   x0:=x + value;
   for y0:=y - value to y + value do
    if pixels[x0+1,y0]=c then Fill(x0+1,y0);

   y0:=y + value;
   for x0:=x + value downto x - value do
    if pixels[x0,y0+1]=c then Fill(x0,y0+1);

   x0:=x - value;
   for y0:=y + value downto y - value do
    if pixels[x0-1,y0]=c then Fill(x0-1,y0);

  end;
  result:=true;
  exit;
end;


Procedure TForm1.Throw(x,y: integer; c: TColor);
var i,ves,ves2,ilimit: integer;
    bo: boolean;
Begin
  ves:=3;
  ves2:=4;
  ilimit:=80;
  With PaintBox1.Canvas do begin
   i:=1;
   while (pixels[x-i,y] = c) and (i<ilimit) do
      inc(i);
   dec(i);
   if i>2 then begin
      bo:=trySq(i div ves, x-i div 2,y,c);
      if bo=false then bo:=trySq(i div ves2, x-i div 2,y,c);
   end;

   i:=1;
   while (pixels[x,y-i] = c) and (i<ilimit) do
      inc(i);
   dec(i);
   if i>2 then begin

      bo:=trySq(i div ves, x,y-i div 2,c);
   end;

   i:=1;
   while (pixels[x+i,y] = c) and (i<ilimit) do
      inc(i);
   dec(i);
   if i>2 then begin

      bo:=trySq(i div ves, x+i div 2,y, c);
   end;

   i:=1;
   while (pixels[x,y+i] = c) and (i<ilimit) do
      inc(i);
   dec(i);
   if i>2 then begin

      bo:= trySq(i div ves, x,y+ i div 2, c);
   end;
  end;
End;

procedure TForm1.Fill(x,y: integer);    //Плохой вариант, выкидывает  stack overwlow,
                                 //   когда стэк переполняется
var c: Tcolor;
Begin
   inc(asd);
   if asd>50000 then begin
      exit;
   end;
   c:=Form1.PaintBox1.Canvas.Pixels[x,y];

   if asd-asdsub>10 then begin
    Throw(x,y,c);
    asdsub:=asd;
   end;

    Form1.PaintBox1.Canvas.Pixels[x,y]:=Form1.PaintBox1.Canvas.Pen.Color;   // По Пикселам
    with Form1.PaintBox1.Canvas do begin
     if (Pixels[x,y-1]=C) then Fill(x,y-1);
     if (Pixels[x+1,y]=C) then Fill(x+1,y);
     if (Pixels[x,y+1]=C) then Fill(x,y+1);
     if (Pixels[x-1,y]=C) then Fill(x-1,y);
    end;
End; {

Procedure Fill(x,y: integer);     // Будем делать по спиральке
var c: color;
    i,i1,colored: integer;
    proven: array [1..125], [1..1000]  of byte;
begin
   for i:=1 to 125000 do
      for i1:=1 to 1000 do
       proven[i,i1]:=0;
   proven[x div 8 + 1,y]:=power(2,x mod 8);
   c:=Form1.PaintBox1.Canvas.Pixels[x,y];
   Form1.PaintBox1.Canvas.Pixels[x,y]:=Form1.PaintBox1.Canvas.Pen.Color;
   with Form1.PaintBox1.Canvas do Repeat
      if pixels[x,y-i] = pixels[x,y-i+1] then ;
   until colored=0;              // Нет, не будем делать по спиральке
end;
}
procedure TForm1.PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   ismousedown:=true;
   PaintBox1.Canvas.Pen.Color:=ColorGrid1.ForegroundColor;
   PaintBox1.Canvas.Brush.Color:=ColorGrid1.BackgroundColor;
   PaintBox1.Canvas.Pen.Width:=1;
   PaintBox1.Canvas.MoveTo(x,y);
   case curtool of
        4: Begin
           asd:=0;
           asdsub:=0;
           Fill(x,y);
        End;
        7: begin
           PaintBox1.Canvas.Pixels[x,y]:=ColorGrid1.ForegroundColor;
        end;
        8: begin           // brush
           PaintBox1.Canvas.Pen.Width:=4;
           PaintBox1.Canvas.LineTo(x,y);
        end;
        9: begin
           LetsSpray(x,y);
        end;
        10: LetsText(x,y);
        11,12,13,15,16: begin          // straight
           x0:=x;
           y0:=y;
        end;
   end;
end;

procedure TForm1.PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   if ismousedown=true then begin
      case curtool of
        7,8: begin
           PaintBox1.Canvas.LineTo(x,y);
           PaintBox1.Canvas.MoveTo(x,y);
        end;
        9: LetsSpray(x,y);
        11: begin
           PaintBox1.Canvas.CopyRect(PaintBox1.Canvas.ClipRect,
                                BMCopy.Canvas, BMCopy.Canvas.ClipRect);
           PaintBox1.Canvas.MoveTo(x0,y0);
           PaintBox1.Canvas.lineto(x,y);
        end;
        13: begin
           PaintBox1.Canvas.CopyRect(PaintBox1.Canvas.ClipRect,
                                BMCopy.Canvas, BMCopy.Canvas.ClipRect);
           PaintBox1.Canvas.MoveTo(x0,y0);
           PaintBox1.Canvas.Rectangle(x0,y0,x,y);
        end;
        15: begin
           PaintBox1.Canvas.CopyRect(PaintBox1.Canvas.ClipRect,
                                BMCopy.Canvas, BMCopy.Canvas.ClipRect);
           PaintBox1.Canvas.MoveTo(x0,y0);
           PaintBox1.Canvas.Ellipse(x0,y0,x,y);
        end;
        16: begin
           PaintBox1.Canvas.CopyRect(PaintBox1.Canvas.ClipRect,
                                BMCopy.Canvas, BMCopy.Canvas.ClipRect);
           PaintBox1.Canvas.MoveTo(x0,y0);
           PaintBox1.Canvas.RoundRect(x0,y0,x,y,100,100);
        end;
      end;

   end;
end;

procedure TForm1.PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   ismousedown:=false;
   case curtool of
        7,8: begin end;
   end;
   BMcopy.Canvas.CopyRect(BMCopy.Canvas.ClipRect,
        PaintBox1.Canvas, PaintBox1.Canvas.ClipRect);
   //BMCopy.Canvas.CopyRect( Rect() );
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var i: integer;
    x,y: integer;
    p: tpoint;
begin
   if IsMouseDown = false then
        PaintBox1.Canvas.CopyRect(PaintBox1.Canvas.ClipRect,
                                BMCopy.Canvas, BMCopy.Canvas.ClipRect);
   for i:=1 to Btn_Count do begin
      if Btns[i].down=true then CurTool:=i;
      if CurTool = 9 then begin
        Windows.GetCursorPos(P);
        Windows.ScreenToClient(Form1.Handle, P );
        P.X:=p.X-PaintBox1.Left;
        P.y:=p.y-PaintBox1.Top;
        LetsSpray(p.x,p.y);
      end;

   end;
   //PaintBox1.Canvas.TextOut(200,200, inttostr(curtool) );
end;

end.

