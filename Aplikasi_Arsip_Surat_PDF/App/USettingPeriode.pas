unit USettingPeriode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls;

type
  TFPeriode = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Edit2: TEdit;
    procedure Panel5Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPeriode: TFPeriode;

implementation

uses
  DataModule;

{$R *.dfm}

procedure TFPeriode.Panel5Click(Sender: TObject);
begin
    DM.ADOPeriode.Filtered := False;
    close;
end;

procedure TFPeriode.Panel4Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  DM.ADOPeriode.Filtered := False;
end;

procedure TFPeriode.Panel3Click(Sender: TObject);
begin
  if DM.ADOPeriode.IsEmpty then
   MessageDlg('Data Kosong',mtInformation,[mbok],0)
  else
  if Application.MessageBox('Yakin Hapus Data ???','Pesan',MB_YESNO or MB_ICONQUESTION)=MrYes then
     begin
       DM.ADOPeriode.Delete;
       Edit1.Clear;
     end;
end;

procedure TFPeriode.Panel2Click(Sender: TObject);
begin
  if Edit1.Text = '' then
    MessageDlg('Periode Tidak Boleh Kosong',mtInformation,[mbok],0)
  else
  if DM.ADOPeriode.Locate('periode',Edit1.Text,[]) then
    MessageDlg('Periode Telah Ada',mtInformation,[mbok],0)
  else
    begin
      DM.ADOPeriode.Append;
      DM.ADOPeriode['periode'] := Edit1.Text;
      DM.ADOPeriode.Post;
      Edit1.Clear;
    end;
end;

procedure TFPeriode.Edit2Change(Sender: TObject);
begin
  if Edit2.Text ='' then
     begin
       DM.ADOPeriode.Close;
       DM.ADOPeriode.Open;
       DM.ADOPeriode.Filtered := false;
     end
  Else
     begin
       DM.ADOPeriode.Close;
       DM.ADOPeriode.Open;
       DM.ADOPeriode.Filtered := False;
       DM.ADOPeriode.Filter :='periode LIKE '+Quotedstr('%'+Edit2.Text+'%');
       DM.ADOPeriode.Filtered := True;
     end;
end;

procedure TFPeriode.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if DM.ADOPeriode.IsEmpty then
     MessageDlg('Data Kosong',mtInformation,[mbok],0)
     else
     begin
       Edit1.Text:= DM.ADOPeriode['periode'];
     end;
  end;
end;

procedure TFPeriode.FormCreate(Sender: TObject);
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

end.
