unit USuratOut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, DateUtils, FileCtrl;

type
  TFSuratOut = class(TForm)
    Panel1: TPanel;
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Shape2: TShape;
    Label3: TLabel;
    Label4: TLabel;
    Shape3: TShape;
    Label5: TLabel;
    Shape4: TShape;
    Label6: TLabel;
    Shape5: TShape;
    Label7: TLabel;
    Shape6: TShape;
    Label8: TLabel;
    Shape7: TShape;
    Shape8: TShape;
    Label9: TLabel;
    Edit1: TEdit;
    Panel2: TPanel;
    Edit2: TEdit;
    DateTimePicker1: TDateTimePicker;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Panel3: TPanel;
    Panel4: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    OpenDialog1: TOpenDialog;
    procedure FormActivate(Sender: TObject);
    procedure IdSuratIn;
    procedure TanggalInput;
    procedure Panel3Click(Sender: TObject);
    procedure bersih;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Panel4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSuratOut: TFSuratOut;

implementation

uses
  DataModule, UMainMenu;

{$R *.dfm}

procedure TFSuratOut.FormActivate(Sender: TObject);
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

procedure TFSuratOut.IdSuratIn;
var
  id : string;
begin
  // coding untuk memilih kode dengan nomor yg paling terbesar :
      DM.ADOQSuratKeluar.Close;
      DM.ADOQSuratKeluar.SQL.Clear;
      DM.ADOQSuratKeluar.SQL.Add('SELECT TOP 1 surat_keluar.kode_out FROM surat_keluar');
      DM.ADOQSuratKeluar.SQL.Add('ORDER BY surat_keluar.kode_out DESC');
      DM.ADOQSuratKeluar.Open;

      // coding untuk mengcopy nilai yang di seleksi :
      id := Copy(DM.ADOQSuratKeluar.Fields[0].AsString, 4, 7);

      // coding jika seleksi = 0 maka id = 00001 jika tdk maka tambah 1 :
      if id <> '' then id := FormatFLoat('0000000', StrtoInt(id) + 1)
      else id := '0000001';

      // coding melakukan pengabungan kode string dan integer :
      Edit1.Text := 'SK-' + id;
end;

procedure TFSuratOut.TanggalInput;
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

procedure TFSuratOut.Panel3Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    begin
      Edit7.Text := OpenDialog1.FileName;
      Label12.Caption := ExtractFileName(Edit7.Text);
    end;
end;

procedure TFSuratOut.bersih;
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

procedure TFSuratOut.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  bersih;
  FMenu.Edit6.Clear;
end;

procedure TFSuratOut.Panel4Click(Sender: TObject);
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
      DM.ADOSuratKeluar.Append;
      DM.ADOSuratKeluar['kode_out'] := Edit1.Text;
      DM.ADOSuratKeluar['tgl_out'] := StrToDate(Label11.Caption);//FormatDateTime('ddddd', StrToDate(Edit2.Text)); //StrToDate(Edit2.Text);
      DM.ADOSuratKeluar['tgl_surat_out'] := DateTimePicker1.Date;
      DM.ADOSuratKeluar['nomor_surat_out'] := Edit3.Text;
      DM.ADOSuratKeluar['pengirm_out'] := Edit4.Text;
      DM.ADOSuratKeluar['perihal_out'] := Edit5.Text;
      DM.ADOSuratKeluar['ditujukan_out'] := Edit6.Text;
      DM.ADOSuratKeluar['file_surat_out'] := DM.ADODataKantor['folder']+Label12.Caption;
      DM.ADOSuratKeluar.Post;
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
      DM.ADOSuratKeluar.Edit;
      DM.ADOSuratKeluar['kode_out'] := Edit1.Text;
      DM.ADOSuratKeluar['tgl_out'] := StrToDate(Label11.Caption);
      DM.ADOSuratKeluar['tgl_surat_out'] := DateTimePicker1.Date;
      DM.ADOSuratKeluar['nomor_surat_out'] := Edit3.Text;
      DM.ADOSuratKeluar['pengirm_out'] := Edit4.Text;
      DM.ADOSuratKeluar['perihal_out'] := Edit5.Text;
      DM.ADOSuratKeluar['ditujukan_out'] := Edit6.Text;
      if Label12.Caption <> DM.ADOSuratKeluar['file_surat_out'] then
        begin
          DeleteFile(Label13.Caption);
          DM.ADOSuratKeluar['file_surat_out'] := DM.ADODataKantor['folder']+Label12.Caption;
          data := DM.ADODataKantor['folder']+Label12.Caption;
          CopyFile(PChar(Edit7.Text), PChar(data), False);
        end
      else
        begin
          DM.ADOSuratKeluar['file_surat_out'] := Label13.Caption;
        end;
      DM.ADOSuratKeluar.Post;
      //
      bersih;
      Close;
      FMenu.Edit6.Clear;
      MessageDlg('Data Berhasil Di Update',mtInformation,[mbok],0);
    end;
  end;
end;

end.
