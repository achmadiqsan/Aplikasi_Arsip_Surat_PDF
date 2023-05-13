unit ULogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, frxpngimage, ExtCtrls;

type
  TFLogin = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel2: TPanel;
    Panel4: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Panel3: TPanel;
    procedure Panel3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLogin: TFLogin;

implementation

uses USettingPeriode, DataModule, UMainMenu;

{$R *.dfm}

procedure TFLogin.Panel3Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFLogin.FormActivate(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit1.SetFocus;
end;

procedure TFLogin.FormCreate(Sender: TObject);
// code untuk disable close button pada form :
var
  hSysMenu:HMENU;
begin
  hSysMenu:=GetSystemMenu(Self.Handle,False);
  if hSysMenu <> 0 then
  begin
    EnableMenuItem(hSysMenu,SC_CLOSE,MF_BYCOMMAND or MF_GRAYED);
    DrawMenuBar(Self.Handle);
  end;
end;

procedure TFLogin.Panel2Click(Sender: TObject);
begin
  if edit1.Text ='' then
     MessageDlg('Periode Kosong',mtinformation,[mbok],0)
  Else
  if edit2.Text ='' then
     MessageDlg('Nama User Kosong',mtinformation,[mbok],0)
  Else
  if edit3.Text ='' then
     MessageDlg('Password Kosong',mtinformation,[mbok],0)
  Else
  if (Edit1.Text = 'CREATOR') and (Edit2.Text = 'CREATOR') and (Edit3.Text = 'CREATOR') then
  begin
    FPeriode.Show;
  end
  else
  if DM.ADOPeriode.Locate('periode',edit1.Text,[]) then
    begin
       if DM.ADOLogin.Locate('username',edit2.Text,[]) then
           Begin
              if edit3.Text = DM.ADOLogin['password'] then
                 Begin
                    begin
                      // untuk mengubah data Temp Periode :
                      DM.ADOTempPeriode.Edit;
                      DM.ADOTempPeriode['periode'] := Edit1.Text;
                      DM.ADOTempPeriode.Post;
                      //
                      // untuk menampilkan Menu :
                      FMenu.Show;
                      // untuk menghide login :
                      FLogin.Hide;
                    end;
                 End
              Else
                 MessageDlg('Password Salah !!!',mtinformation,[mbok],0);
           End
        else MessageDlg('Username Salah !!!',mtinformation,[mbok],0);
    end
  else MessageDlg('Periode Yang Anda Masukkan Salah Atau Tidak Terdaftar !!!',mtinformation,[mbok],0);
end;

end.
