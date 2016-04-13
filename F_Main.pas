unit F_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, jpeg, ExtCtrls, StdCtrls, FileCtrl;

type
  TForm1 = class(TForm)
    SaveFile: TSaveDialog;
    OpenFile: TOpenDialog;
    mm1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    scrlbx1: TScrollBox;
    img1: TImage;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    mmo1: TMemo;
    N10: TMenuItem;
    tmr1: TTimer;
    N11: TMenuItem;
    N12: TMenuItem;
    procedure N5Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure img1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N12Click(Sender: TObject);

  private
    { Private declarations }
  public
  end;
var
  Form1: TForm1;
  flag,slaidon:Boolean;
  del,curslaid:string;
  btnselect,slaidcount,i:Integer;
  chdir:string;
  sr:TSearchRec;

implementation

{$R *.dfm}

procedure TForm1.N5Click(Sender: TObject);
begin
Close;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
if OpenFile.Execute then
  begin
    img1.Picture.LoadFromFile(OpenFile.FileName);
    del:=(OpenFile.FileName);
    img1.Width:=scrlbx1.Width-1;
    img1.Height:=scrlbx1.Height-1;
    img1.Left:=Trunc(scrlbx1.Width/2-img1.Width/2);
  end;

end;

procedure TForm1.N3Click(Sender: TObject);
begin
  img1.Picture:=nil;
end;

procedure TForm1.img1Click(Sender: TObject);
begin
img1.Proportional:=not img1.Proportional;
 if img1.Proportional then
 begin
    img1.Width:=scrlbx1.Width-1;
    img1.Height:=scrlbx1.Height-1;
    img1.Left:=Trunc(scrlbx1.Width/2-img1.Width/2);
 end
 else
 begin
    if flag then
    begin
    img1.Width:=img1.Picture.Width;
    img1.Height:=img1.Picture.Height;
    img1.Left:=Trunc(scrlbx1.Width/2-img1.Width/2);
    end
    else
    begin
    img1.Width:=img1.Picture.Width;
    img1.Height:=img1.Picture.Height;
    img1.Left:=Trunc(scrlbx1.Width/2-img1.Width/2);
    end;
 end;
 end;


procedure TForm1.N4Click(Sender: TObject);
begin
if SaveFile.Execute
then img1.Picture.SaveToFile(SaveFile.FileName);
end;

procedure TForm1.N6Click(Sender: TObject);
begin
  if not flag then
  begin
    Form1.Align:=alClient;
    Form1.BorderStyle:=bsNone;
    scrlbx1.Align:=alClient;
    flag:=True;
    img1.Width:=scrlbx1.Width;
    img1.Height:=scrlbx1.Height;
  end
  else
  begin
    Form1.Align:=alNone;
    form1.BorderStyle:=bsSingle;
    flag:=False;
    Form1.Width:=907;
    form1.Height:=628;
    Form1.ClientHeight:=566;
    Form1.ClientWidth:=889;
    form1.Position:=poDesktopCenter;
    scrlbx1.Align:=alNone;
    scrlbx1.Width:=880;
    scrlbx1.Height:=480;
    scrlbx1.Left:=5;
    scrlbx1.Top:=8;
    img1.Width:=scrlbx1.Width-1;
    img1.Height:=scrlbx1.Height-1;
    img1.Left:=Trunc(scrlbx1.Width/2-img1.Width/2);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
flag:=False;
slaidon:=False;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
  btnselect:=MessageDlg('Вы действительно хотите удалить файл?',mtConfirmation,[mbYes,mbNo],0);
  if btnselect = 6 then
  begin
  if DeleteFile(del)
  then
  begin
  ShowMessage('Файл успешно удален!');
  img1.Picture:=nil;
  end
  else ShowMessage('Упссс... Что-то пошло не так :( Удалить файл не удалось!');
  end;
end;

procedure TForm1.N9Click(Sender: TObject);
begin
  tmr1.Interval:=1000*StrToInt(InputBox('Задержка', 'Пожалуйста, укажите задержку в секундах между показами слайдов', '2'));
  if SelectDirectory('Выберите папку с изображениями', '', chdir)
    then ShowMessage('Выбранная папка: '+chdir)
    else ShowMessage('Выбор папки прервался');
  mmo1.Clear;
  if FindFirst(chdir + '\*.jpg', faAnyFile, sr) = 0 then
  begin
  repeat
  mmo1.Lines.Add(chdir+'\'+sr.Name);
  until FindNext(sr) <> 0;
  FindClose(sr);
  slaidcount:=mmo1.Lines.Count;
  i:=0;
  tmr1.Enabled:=True;
  slaidon:=True;
  scrlbx1.Color:=clBlack;
end;
end;

procedure TForm1.tmr1Timer(Sender: TObject);
begin
  curslaid:=mmo1.Lines[i];
  if i < slaidcount
  then
  begin
    del:=curslaid;
    img1.Picture.LoadFromFile(curslaid);
    i:=i+1;
  end
  else
  begin
    slaidon:=False;
    tmr1.Enabled:=False;
    img1.Picture:=nil;
    ShowMessage('Слайдшоу завершено!');
    scrlbx1.Color:=clBtnFace;
  end;
end;

procedure TForm1.N10Click(Sender: TObject);
begin
  if slaidon
  then tmr1.Enabled:=not tmr1.Enabled;
end;

procedure TForm1.N12Click(Sender: TObject);
begin
  if slaidon then
  begin
    slaidon:=False;
    tmr1.Enabled:=False;
    img1.Picture:=nil;
    ShowMessage('Слайдшоу завершено!');
    scrlbx1.Color:=clBtnFace;
  end;
end;

end.
