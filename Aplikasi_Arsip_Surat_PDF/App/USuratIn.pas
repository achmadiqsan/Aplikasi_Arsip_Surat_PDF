unit USuratIn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, DateUtils, FileCtrl;

type
  TFSuratIn = class(TForm)
    Panel1: TPanel;
    Shape1: TShape;
    Edit1: TEdit;
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    Shape2: TShape;
    Edit2: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Shape3: TShape;
    DateTimePicker1: TDateTimePicker;
    Label5: TLabel;
    Edit3: TEdit;
    Shape4: TShape;
    Label6: TLabel;
    Edit4: TEdit;
    Shape5: TShape;
    Label7: TLabel;
    Edit5: TEdit;
    Shape6: TShape;
    Label8: TLabel;
    Edit6: TEdit;
    Shape7: TShape;
    Edit7: TEdit;
    Shape8: TShape;
    Panel3: TPanel;
    Label9: TLabel;
    Panel4: TPanel;
    Label10: TLabel;
    OpenDialog1: TOpenDialog;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure IdSuratIn;
    procedure TanggalInput;
    procedure Panel3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Panel4Click(Sender: TObject);
    procedure bersih;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSuratIn: TFSuratIn;

implementation

uses
  DataModule, UMainMenu, Math;

{$R *.dfm}

procedure TFSuratIn.FormActivate(Sender: TObject);
begin
  DateTimePicker1.Date := Now;
  Label11.Caption := DateToStr(Now);
  if Label10.Caption = '0' then
  begin
      //
      Panel4.Caption := 'Save';
      IdSuratIn;
      TanggalInput;
  end
  else
  if Label10.Caption = '1' then
  begin
    Panel4.Caption := 'Update';
    TanggalInput;
  end;
end;

procedure TFSuratIn.IdSuratIn;
var
  id : string;
begin
  // coding untuk memilih kode dengan nomor yg paling terbesar :
      DM.ADOQSuratMasuk.Close;
      DM.ADOQSuratMasuk.SQL.Clear;
      DM.ADOQSuratMasuk.SQL.Add('SELECT TOP 1 surat_masuk.kode_in FROM surat_masuk');
      DM.ADOQSuratMasuk.SQL.Add('ORDER BY surat_masuk.kode_in DESC');
      DM.ADOQSuratMasuk.Open;

      // coding untuk mengcopy nilai yang di seleksi :
      id := Copy(DM.ADOQSuratMasuk.Fields[0].AsString, 4, 7);

      // coding jika seleksi = 0 maka id = 00001 jika tdk maka tambah 1 :
      if id <> '' then id := FormatFLoat('0000000', StrtoInt(id) + 1)
      else id := '0000001';

      // coding melakukan pengabungan kode string dan integer :
      Edit1.Text := 'SM-' + id;
end;

procedure TFSuratIn.TanggalInput;
var
  formattanggal : TDate;
  hari, bln, thn : Word;
  SHari, SBulan, STahun : string;
begin
  formattanggal := Now;
  hari := DayOf(formattanggal);
  bln := MonthOf(formattanggal);
  thn := YearOf(formattanggal);

  SHari := IntToStr(hari);
  case bln of
    1 : SBulan := 'Jan';
    2 : SBulan := 'Feb';
    3 : SBulan := 'Mar';
    4 : SBulan := 'Apr';
    5 : SBulan := 'May';
    6 : SBulan := 'Jun';
    7 : SBulan := 'Jul';
    8 : SBulan := 'Aug';
    9 : SBulan := 'Sep';
    10 : SBulan := 'Oct';
    11 : SBulan := 'Nov';
    12 : SBulan := 'Dec';
  end;
  STahun := IntToStr(thn);
  Edit2.Text := SHari+'-'+SBulan+'-'+STahun;
end;

procedure TFSuratIn.Panel3Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    begin
      Edit7.Text := OpenDialog1.FileName;
      Label12.Caption := ExtractFileName(Edit7.Text);
//      Edit7.Hint := Edit7.Text;
//      Label13.Caption := 'FROM : ' + Edit7.Text;
//      Label14.Caption := 'TO : ' + DM.ADODataKantor['folder']+Label12.Caption;
    end;
end;

procedure TFSuratIn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  bersih;
  FMenu.Edit6.Clear;
end;

procedure TFSuratIn.Panel4Click(Sender: TObject);
var
  data : string;
begin
  if Panel4.Caption = 'Save' then
  begin
    //
    if Edit3.Text ='' then MessageDlg('Nomor Surat Kosong',mtInformation,[mbok],0) else
    if Edit4.Text ='' then MessageDlg('Pengirim Kosong',mtInformation,[mbok],0) else
    if Edit5.Text ='' then MessageDlg('Perihal Kosong',mtInformation,[mbok],0) else
    if Edit6.Text ='' then MessageDlg('Kepada Kosong',mtInformation,[mbok],0) else
    if Edit7.Text ='' then MessageDlg('File Surat Kosong',mtInformation,[mbok],0) else
    if FMenu.Edit5.Text ='' then MessageDlg('Folder Penyimpanan Pada Identitas Kantor Belum di Setting',mtInformation,[mbok],0) else
    begin
      DM.ADOSuratMasuk.Append;
      DM.ADOSuratMasuk['kode_in'] := Edit1.Text;
      DM.ADOSuratMasuk['tgl_in'] := StrToDate(Label11.Caption);//FormatDateTime('ddddd', StrToDate(Edit2.Text)); //StrToDate(Edit2.Text);
      DM.ADOSuratMasuk['tgl_surat_in'] := DateTimePicker1.Date;
      DM.ADOSuratMasuk['nomor_surat_in'] := Edit3.Text;
      DM.ADOSuratMasuk['pengirim_in'] := Edit4.Text;
      DM.ADOSuratMasuk['perihal_in'] := Edit5.Text;
      DM.ADOSuratMasuk['ditujukan_in'] := Edit6.Text;
      DM.ADOSuratMasuk['file_surat_in'] := DM.ADODataKantor['folder']+Label12.Caption;
      DM.ADOSuratMasuk.Post;
      //
      data := DM.ADODataKantor['folder']+Label12.Caption;
      CopyFile(PChar(Edit7.Text), PChar(data), False);
      bersih;
      Panel4.Caption := 'Save';
      IdSuratIn;
      TanggalInput;
      Label11.Caption := DateToStr(Now);
      MessageDlg('Data Berhasil Di Simpan',mtInformation,[mbok],0);
    end;
  end
  else
  if Panel4.Caption = 'Update' then
  begin
    //
    if Edit3.Text ='' then MessageDlg('Nomor Surat Kosong',mtInformation,[mbok],0) else
    if Edit4.Text ='' then MessageDlg('Pengirim Kosong',mtInformation,[mbok],0) else
    if Edit5.Text ='' then MessageDlg('Perihal Kosong',mtInformation,[mbok],0) else
    if Edit6.Text ='' then MessageDlg('Kepada Kosong',mtInformation,[mbok],0) else
    if Edit7.Text ='' then MessageDlg('File Surat Kosong',mtInformation,[mbok],0) else
    if FMenu.Edit5.Text ='' then MessageDlg('Folder Penyimpanan Pada Identitas Kantor Belum di Setting',mtInformation,[mbok],0) else
    begin
      DM.ADOSuratMasuk.Edit;
      DM.ADOSuratMasuk['kode_in'] := Edit1.Text;
      DM.ADOSuratMasuk['tgl_in'] := StrToDate(Label11.Caption);
      DM.ADOSuratMasuk['tgl_surat_in'] := DateTimePicker1.Date;
      DM.ADOSuratMasuk['nomor_surat_in'] := Edit3.Text;
      DM.ADOSuratMasuk['pengirim_in'] := Edit4.Text;
      DM.ADOSuratMasuk['perihal_in'] := Edit5.Text;
      DM.ADOSuratMasuk['ditujukan_in'] := Edit6.Text;
      if Label12.Caption <> DM.ADOSuratMasuk['file_surat_in'] then
        begin
          DeleteFile(Label13.Caption);
          DM.ADOSuratMasuk['file_surat_in'] := DM.ADODataKantor['folder']+Label12.Caption;
          data := DM.ADODataKantor['folder']+Label12.Caption;
          CopyFile(PChar(Edit7.Text), PChar(data), False);
        end
      else
        begin
          DM.ADOSuratMasuk['file_surat_in'] := Label13.Caption;
        end;
      DM.ADOSuratMasuk.Post;
      //
      bersih;
      Close;
      FMenu.Edit6.Clear;
      MessageDlg('Data Berhasil Di Update',mtInformation,[mbok],0);
    end;
  end;
end;

procedure TFSuratIn.bersih;
begin
  Label10.Caption := '0';
  Edit1.Clear;
  Edit2.Clear;
  DateTimePicker1.Date := Now;
  Edit3.Clear;
  Edit4.Clear;
  Edit5.Clear;
  Edit6.Clear;
  Edit7.Clear;
  Label11.Caption := 'Label11';
  Label12.Caption := 'Label12';
  Label13.Caption := 'Label13';
end;

end.
