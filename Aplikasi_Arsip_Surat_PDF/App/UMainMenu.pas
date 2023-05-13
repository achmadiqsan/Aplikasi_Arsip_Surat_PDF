unit UMainMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, frxpngimage, Menus, Grids, DBGrids,
  UFrameSuratIn, UFrameSuratOut, FileCtrl, ComCtrls;

type
  TFMenu = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Image2: TImage;
    Label2: TLabel;
    Image3: TImage;
    Label3: TLabel;
    Image4: TImage;
    Label4: TLabel;
    Image5: TImage;
    Label5: TLabel;
    Label6: TLabel;
    Image6: TImage;
    Label7: TLabel;
    Panel4: TPanel;
    Label8: TLabel;
    Shape1: TShape;
    Edit1: TEdit;
    Label9: TLabel;
    Edit2: TEdit;
    Shape2: TShape;
    Label10: TLabel;
    Edit3: TEdit;
    Shape3: TShape;
    Label11: TLabel;
    Edit4: TEdit;
    Shape4: TShape;
    Label12: TLabel;
    Edit5: TEdit;
    Shape5: TShape;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Image7: TImage;
    Label13: TLabel;
    Panel9: TPanel;
    Label14: TLabel;
    Shape6: TShape;
    Label15: TLabel;
    Edit7: TEdit;
    Shape7: TShape;
    Panel10: TPanel;
    Panel11: TPanel;
    ComboBox1: TComboBox;
    Label16: TLabel;
    Panel12: TPanel;
    MainMenu1: TMainMenu;
    D1: TMenuItem;
    S1: TMenuItem;
    S2: TMenuItem;
    S3: TMenuItem;
    U1: TMenuItem;
    P1: TMenuItem;
    E1: TMenuItem;
    Y1: TMenuItem;
    T1: TMenuItem;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Shape8: TShape;
    Edit6: TEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Shape9: TShape;
    Edit8: TEdit;
    Label17: TLabel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel25: TPanel;
    Panel27: TPanel;
    Panel29: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    OpenDialog1: TOpenDialog;
    DateTimePicker1: TDateTimePicker;
    procedure Image1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure exitApp;
    procedure Y1Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure U1Click(Sender: TObject);
    procedure P1Click(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure S2Click(Sender: TObject);
    procedure TampilFormSuratIn;
    procedure TampilFormSuratOut;
    procedure Label2Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure refresh;
    procedure Label4Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
    procedure Panel6Click(Sender: TObject);
    procedure Panel7Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Panel11Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure DBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure Panel10Click(Sender: TObject);
    procedure Panel12Click(Sender: TObject);
    procedure Panel13Click(Sender: TObject);
    procedure Panel14Click(Sender: TObject);
    procedure Panel15Click(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure jmlhData;
    procedure jmlData2;
    procedure totalSuratKeluar;
    procedure totalSuratMasuk;
    procedure totalSeluruhSurat;
    procedure suratMasukTahun;
    procedure suratKeluarTahun;
    procedure suratMasuk;
    procedure suratKeluar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenu: TFMenu;

implementation

uses DataModule, ULogin, USettingUser, USettingPeriode, USuratIn,
  USuratOut, UViewPdf;

{$R *.dfm}

procedure TFMenu.Image1Click(Sender: TObject);
begin
  if label6.Caption = '0' then
  begin
    //
    Panel1.Width := 49;
    Panel3.Width := 342;
    Panel2.Width := 958;
    label6.Caption := '1';
  end
  else
  if label6.Caption = '1' then
  begin
    Panel1.Width := 185;
    Panel3.Width := 342;
    Panel2.Width := 821;
    label6.Caption := '0';
  end;
end;

procedure TFMenu.FormCreate(Sender: TObject);
var
  hSysMenu:HMENU;
begin
  //
    label6.Caption := '1';
    Panel1.Width := 49;
    Panel3.Width := 342;
    Panel2.Width := 958;
  hSysMenu:=GetSystemMenu(Self.Handle,False);
  if hSysMenu <> 0 then
  begin
    EnableMenuItem(hSysMenu,SC_CLOSE,MF_BYCOMMAND or MF_GRAYED);
    DrawMenuBar(Self.Handle);
  end;
end;

procedure TFMenu.exitApp;
begin
  // membersihkan temp peridoe :
  DM.ADOTempPeriode.Edit;
  DM.ADOTempPeriode['periode'] := '-';
  DM.ADOTempPeriode.Post;
  // tutup menu dan show login kembali :
  FMenu.Close;
  FLogin.Show;
end;

procedure TFMenu.Y1Click(Sender: TObject);
begin
  // call procedure :
  exitApp;
end;

procedure TFMenu.Label5Click(Sender: TObject);
begin
  if Application.MessageBox('Yakin Anda Ingin Exit ???','Pesan',MB_YESNO or MB_ICONQUESTION)=MrYes then
  begin
  // call procedure :
  exitApp;
  end;
end;

procedure TFMenu.Image5Click(Sender: TObject);
begin
  if Application.MessageBox('Yakin Anda Ingin Exit ???','Pesan',MB_YESNO or MB_ICONQUESTION)=MrYes then
  begin
  // call procedure :
  exitApp;
  end;
end;

procedure TFMenu.U1Click(Sender: TObject);
begin
  FUser.show;
end;

procedure TFMenu.P1Click(Sender: TObject);
begin
  FPeriode.show;
end;

procedure TFMenu.S1Click(Sender: TObject);
begin
  TampilFormSuratIn;
end;

procedure TFMenu.S2Click(Sender: TObject);
begin
  TampilFormSuratOut;
end;

procedure TFMenu.TampilFormSuratIn;
begin
  if RadioButton1.Checked then
  begin
    FSuratIn.show;
  end
  else MessageDlg('Silahkan Pilih / Checked Surat Masuk Terlebih Dahulu',mtInformation,[mbok],0);
end;

procedure TFMenu.TampilFormSuratOut;
begin
  if RadioButton2.Checked then
  begin
    FSuratOut.show;
  end
  else MessageDlg('Silahkan Pilih / Checked Surat Keluar Terlebih Dahulu',mtInformation,[mbok],0);
end;

procedure TFMenu.Label2Click(Sender: TObject);
begin
  TampilFormSuratIn;
end;

procedure TFMenu.Image2Click(Sender: TObject);
begin
  TampilFormSuratIn;
end;

procedure TFMenu.Label3Click(Sender: TObject);
begin
  TampilFormSuratOut;
end;

procedure TFMenu.Image3Click(Sender: TObject);
begin
  TampilFormSuratOut;
end;

procedure TFMenu.refresh;
begin
  // show pesan berhasil refresh :
  MessageDlg('Data Berhasil Di Refresh',mtInformation,[mbok],0);
end;

procedure TFMenu.Label4Click(Sender: TObject);
begin
  refresh;
  //
  totalSuratKeluar;
  totalSuratMasuk;
  //
  suratMasukTahun;
  suratKeluarTahun;
  //
  totalSeluruhSurat;
end;

procedure TFMenu.Image4Click(Sender: TObject);
begin
  refresh;
  //
  totalSuratKeluar;
  totalSuratMasuk;
  //
  suratMasukTahun;
  suratKeluarTahun;
  //
  totalSeluruhSurat;
  if RadioButton1.Checked then
  begin
    jmlhData;
  end
  else
  if RadioButton2.Checked then
  begin
    jmlData2;
  end;
end;

procedure TFMenu.Panel5Click(Sender: TObject);
begin
  if Panel5.Caption = 'Update' then
  begin
    Edit1.Enabled := True;
    Edit2.Enabled := True;
    Edit3.Enabled := True;
    Edit4.Enabled := True;
    //Edit5.Enabled := True;
    Panel7.Enabled := True;
    Panel5.Caption := 'Save';
    Edit1.SetFocus;
  end
  else
  if Panel5.Caption = 'Save' then
  begin
    DM.ADODataKantor.Edit;
    DM.ADODataKantor['nama_kantor'] := Edit1.Text;
    DM.ADODataKantor['Alamat'] := Edit2.Text;
    DM.ADODataKantor['telpon'] := Edit3.Text;
    DM.ADODataKantor['email'] := Edit4.Text;
    DM.ADODataKantor['folder'] := Edit5.Text;
    DM.ADODataKantor.Post;
    Edit1.Enabled := False;
    Edit2.Enabled := False;
    Edit3.Enabled := False;
    Edit4.Enabled := False;
    //Edit5.Enabled := False;
    Panel7.Enabled := False;
    Panel5.Caption := 'Update';
  end;
end;

procedure TFMenu.Panel6Click(Sender: TObject);
begin
  if Application.MessageBox('Yakin Anda Ingin Menghapus Data Kantor ???','Pesan',MB_YESNO or MB_ICONQUESTION)=MrYes then
  begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit5.Clear;
  DM.ADODataKantor.Delete;
  end;
end;

procedure TFMenu.Panel7Click(Sender: TObject);
var
  st : string;
begin
  st := 'C:\';
  if SelectDirectory(St, [], 0) then Edit5.Text:= st+'\';
end;

procedure TFMenu.RadioButton1Click(Sender: TObject);
begin
  Label16.Caption := 'TABEL DATA SURAT MASUK';
  DBGrid2.Enabled := True;
  DBGrid2.Visible := True;
  DBGrid1.Visible := False;
  DBGrid1.Enabled := False;
    //
  suratMasuk;
  DM.ADOSuratMasuk.Close;
  DM.ADOSuratMasuk.Open;
  //
  jmlhData;
end;

procedure TFMenu.RadioButton2Click(Sender: TObject);
begin
  Label16.Caption := 'TABEL DATA SURAT KELUAR';
  DBGrid1.Enabled := True;
  DBGrid1.Visible := True;
  DBGrid2.Visible := False;
  DBGrid2.Enabled := False;
    //
  suratKeluar;
  //
  DM.ADOSuratKeluar.Close;
  DM.ADOSuratKeluar.Open;
  jmlData2;
end;

procedure TFMenu.FormActivate(Sender: TObject);
begin
  if DM.ADODataKantor['nama_kantor'] = null then Edit1.Text := '' else Edit1.Text := DM.ADODataKantor['nama_kantor'];
  if DM.ADODataKantor['Alamat'] = null then Edit2.Text := '' else Edit2.Text := DM.ADODataKantor['Alamat'];
  if DM.ADODataKantor['telpon'] = null then Edit3.Text := '' else Edit3.Text := DM.ADODataKantor['telpon'];
  if DM.ADODataKantor['email'] = null then Edit4.Text := '' else Edit4.Text := DM.ADODataKantor['email'];
  if DM.ADODataKantor['folder'] = null then Edit5.Text := '' else Edit5.Text := DM.ADODataKantor['folder'];
  //
  suratMasuk;
  suratKeluar;
  //
  DateTimePicker1.Date := Now;
  //
  totalSuratKeluar;
  totalSuratMasuk;
  //
  suratMasukTahun;
  suratKeluarTahun;
  //
  totalSeluruhSurat;
end;

procedure TFMenu.Panel11Click(Sender: TObject);
begin
  ComboBox1.Text := '';
  Edit7.Clear;
  Edit7.Visible := True;
  Edit7.Enabled := False;
  DateTimePicker1.Visible := False;
  //
  if RadioButton2.Checked then
    begin
      //
      DM.ADOSuratKeluar.Close;
      DM.ADOSuratKeluar.Open;
      DM.ADOSuratKeluar.Filtered := False;
      jmlData2;
    end
  else
  if RadioButton1.Checked then
  begin
    //
    DM.ADOSuratMasuk.Close;
    DM.ADOSuratMasuk.Open;
    DM.ADOSuratMasuk.Filtered := False;
    jmlhData;
  end;
end;

procedure TFMenu.ComboBox1Change(Sender: TObject);
begin
  if (ComboBox1.Text = 'Nomor Surat') or (ComboBox1.Text = 'Pengirim') or (ComboBox1.Text = 'Perihal') or (ComboBox1.Text = 'Ditujukan')  then
    begin
      Edit7.Enabled := True;
      Edit7.Visible := True;
      DateTimePicker1.Visible := False;
    end
  else
  if ComboBox1.Text = 'Tanggal Surat' then
    begin
      Edit7.Enabled := False;
      Edit7.Visible := False;
      DateTimePicker1.Visible := True;
    end
  else MessageDlg('Silahkan Pilih Kriteria yang Telah Di Tentukan',mtInformation,[mbok],0);
end;

procedure TFMenu.DBGrid2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
       if DM.ADOSuratMasuk.IsEmpty then
        MessageDlg('Data Kosong',mtInformation,[mbok],0)
       else
       begin
          //
          Edit6.Text := DM.ADOSuratMasuk['kode_in'];
          FSuratIn.Label10.Caption := '1';
       end;
  end;
end;

procedure TFMenu.Panel10Click(Sender: TObject);
begin
  if RadioButton1.Checked then
  begin
    //
    if ComboBox1.Text = 'Tanggal Surat' then
      begin
        DM.ADOSuratMasuk.Close;
        DM.ADOSuratMasuk.Open;
        DM.ADOSuratMasuk.Filtered := False;
        DM.ADOSuratMasuk.Filter :='tgl_in = '+Quotedstr(DateToStr(DateTimePicker1.Date));
        DM.ADOSuratMasuk.Filtered := True;
        //jmlhData;
        Edit8.Text := IntToStr(DM.ADOSuratMasuk.RecordCount);
      end
    else
    if ComboBox1.Text = 'Nomor Surat' then
      begin
        if Edit7.Text = '' then
          begin
            DM.ADOSuratMasuk.Close;
            DM.ADOSuratMasuk.Open;
            DM.ADOSuratMasuk.Filtered := False;
            //jmlhData;
            Edit8.Text := IntToStr(DM.ADOSuratMasuk.RecordCount);
          end
        else
          begin
            DM.ADOSuratMasuk.Close;
            DM.ADOSuratMasuk.Open;
            DM.ADOSuratMasuk.Filtered := False;
            DM.ADOSuratMasuk.Filter :='nomor_surat_in LIKE '+Quotedstr('%'+Edit7.Text+'%');
            DM.ADOSuratMasuk.Filtered := True;
            //jmlhData;
            Edit8.Text := IntToStr(DM.ADOSuratMasuk.RecordCount);
          end;
      end
    else
    if ComboBox1.Text = 'Pengirim' then
      begin
        if Edit7.Text = '' then
          begin
            DM.ADOSuratMasuk.Close;
            DM.ADOSuratMasuk.Open;
            DM.ADOSuratMasuk.Filtered := False;
            //jmlhData;
            Edit8.Text := IntToStr(DM.ADOSuratMasuk.RecordCount);
          end
        else
          begin
            DM.ADOSuratMasuk.Close;
            DM.ADOSuratMasuk.Open;
            DM.ADOSuratMasuk.Filtered := False;
            DM.ADOSuratMasuk.Filter :='pengirim_in LIKE '+Quotedstr('%'+Edit7.Text+'%');
            DM.ADOSuratMasuk.Filtered := True;
            //jmlhData;
            Edit8.Text := IntToStr(DM.ADOSuratMasuk.RecordCount);
          end;
      end
    else
    if ComboBox1.Text = 'Perihal' then
      begin
        if Edit7.Text = '' then
          begin
            DM.ADOSuratMasuk.Close;
            DM.ADOSuratMasuk.Open;
            DM.ADOSuratMasuk.Filtered := False;
            //jmlhData;
            Edit8.Text := IntToStr(DM.ADOSuratMasuk.RecordCount);
          end
        else
          begin
            DM.ADOSuratMasuk.Close;
            DM.ADOSuratMasuk.Open;
            DM.ADOSuratMasuk.Filtered := False;
            DM.ADOSuratMasuk.Filter :='perihal_in LIKE '+Quotedstr('%'+Edit7.Text+'%');
            DM.ADOSuratMasuk.Filtered := True;
            //jmlhData;
            Edit8.Text := IntToStr(DM.ADOSuratMasuk.RecordCount);
          end;
      end
    else
    if ComboBox1.Text = 'Ditujukan' then
      begin
        if Edit7.Text = '' then
          begin
            DM.ADOSuratMasuk.Close;
            DM.ADOSuratMasuk.Open;
            DM.ADOSuratMasuk.Filtered := False;
            //jmlhData;
            Edit8.Text := IntToStr(DM.ADOSuratMasuk.RecordCount);
          end
        else
          begin
            DM.ADOSuratMasuk.Close;
            DM.ADOSuratMasuk.Open;
            DM.ADOSuratMasuk.Filtered := False;
            DM.ADOSuratMasuk.Filter :='ditujukan_in LIKE '+Quotedstr('%'+Edit7.Text+'%');
            DM.ADOSuratMasuk.Filtered := True;
            //jmlhData;
            Edit8.Text := IntToStr(DM.ADOSuratMasuk.RecordCount);
          end;
      end;
  end
  else
  if RadioButton2.Checked then
  begin
    //
    if ComboBox1.Text = 'Tanggal Surat' then
      begin
        DM.ADOSuratKeluar.Close;
        DM.ADOSuratKeluar.Open;
        DM.ADOSuratKeluar.Filtered := False;
        DM.ADOSuratKeluar.Filter :='tgl_out = '+Quotedstr(DateToStr(DateTimePicker1.Date));
        DM.ADOSuratKeluar.Filtered := True;
        //jmlData2;
        Edit8.Text := IntToStr(DM.ADOSuratKeluar.RecordCount);
      end
    else
    if ComboBox1.Text = 'Nomor Surat' then
      begin
        if Edit7.Text = '' then
          begin
            DM.ADOSuratKeluar.Close;
            DM.ADOSuratKeluar.Open;
            DM.ADOSuratKeluar.Filtered := False;
            //jmlData2;
            Edit8.Text := IntToStr(DM.ADOSuratKeluar.RecordCount);
          end
        else
          begin
            DM.ADOSuratKeluar.Close;
            DM.ADOSuratKeluar.Open;
            DM.ADOSuratKeluar.Filtered := False;
            DM.ADOSuratKeluar.Filter :='nomor_surat_out LIKE '+Quotedstr('%'+Edit7.Text+'%');
            DM.ADOSuratKeluar.Filtered := True;
            //jmlData2;
            Edit8.Text := IntToStr(DM.ADOSuratKeluar.RecordCount);
          end;
      end
    else
    if ComboBox1.Text = 'Pengirim' then
      begin
        if Edit7.Text = '' then
          begin
            DM.ADOSuratKeluar.Close;
            DM.ADOSuratKeluar.Open;
            DM.ADOSuratKeluar.Filtered := False;
            //jmlData2;
            Edit8.Text := IntToStr(DM.ADOSuratKeluar.RecordCount);
          end
        else
          begin
            DM.ADOSuratKeluar.Close;
            DM.ADOSuratKeluar.Open;
            DM.ADOSuratKeluar.Filtered := False;
            DM.ADOSuratKeluar.Filter :='pengirm_out LIKE '+Quotedstr('%'+Edit7.Text+'%');
            DM.ADOSuratKeluar.Filtered := True;
            //jmlData2;
            Edit8.Text := IntToStr(DM.ADOSuratKeluar.RecordCount);
          end;
      end
    else
    if ComboBox1.Text = 'Perihal' then
      begin
        if Edit7.Text = '' then
          begin
            DM.ADOSuratKeluar.Close;
            DM.ADOSuratKeluar.Open;
            DM.ADOSuratKeluar.Filtered := False;
            //jmlData2;
            Edit8.Text := IntToStr(DM.ADOSuratKeluar.RecordCount);
          end
        else
          begin
            DM.ADOSuratKeluar.Close;
            DM.ADOSuratKeluar.Open;
            DM.ADOSuratKeluar.Filtered := False;
            DM.ADOSuratKeluar.Filter :='perihal_out LIKE '+Quotedstr('%'+Edit7.Text+'%');
            DM.ADOSuratKeluar.Filtered := True;
            //jmlData2;
            Edit8.Text := IntToStr(DM.ADOSuratKeluar.RecordCount);
          end;
      end
    else
    if ComboBox1.Text = 'Ditujukan' then
      begin
        if Edit7.Text = '' then
          begin
            DM.ADOSuratKeluar.Close;
            DM.ADOSuratKeluar.Open;
            DM.ADOSuratKeluar.Filtered := False;
            //jmlData2;
            Edit8.Text := IntToStr(DM.ADOSuratKeluar.RecordCount);
          end
        else
          begin
            DM.ADOSuratKeluar.Close;
            DM.ADOSuratKeluar.Open;
            DM.ADOSuratKeluar.Filtered := False;
            DM.ADOSuratKeluar.Filter :='ditujukan_out LIKE '+Quotedstr('%'+Edit7.Text+'%');
            DM.ADOSuratKeluar.Filtered := True;
            //jmlData2;
            Edit8.Text := IntToStr(DM.ADOSuratKeluar.RecordCount);
          end;
      end;
  end
  else MessageDlg('Silahkan Pilih / Checked Surat Masuk atau Surat Keluar Terlebih Dahulu',mtInformation,[mbok],0);
end;

procedure TFMenu.Panel12Click(Sender: TObject);
begin
  if RadioButton1.Checked then
  begin
    //
    if DM.ADOSuratMasuk.IsEmpty then
     MessageDlg('Data Kosong',mtInformation,[mbok],0)
    else
    if Application.MessageBox('Yakin Hapus Data ???','Pesan',MB_YESNO or MB_ICONQUESTION)=MrYes then
       begin
        DeleteFile(DM.ADOSuratMasuk['file_surat_in']);
        Dm.ADOSuratMasuk.Delete;
        Edit6.Clear;
        MessageDlg('Data Berhasil Di Hapus',mtInformation,[mbok],0);
       end;
      //
    totalSuratKeluar;
    totalSuratMasuk;
    //
    suratMasukTahun;
    suratKeluarTahun;
    //
    totalSeluruhSurat;
  end
  else
  if RadioButton2.Checked then
  begin
    //
    if DM.ADOSuratKeluar.IsEmpty then
     MessageDlg('Data Kosong',mtInformation,[mbok],0)
    else
    if Application.MessageBox('Yakin Hapus Data ???','Pesan',MB_YESNO or MB_ICONQUESTION)=MrYes then
       begin
        DeleteFile(DM.ADOSuratKeluar['file_surat_out']);
        Dm.ADOSuratKeluar.Delete;
        Edit6.Clear;
        MessageDlg('Data Berhasil Di Hapus',mtInformation,[mbok],0);
       end;
      //
    totalSuratKeluar;
    totalSuratMasuk;
    //
    suratMasukTahun;
    suratKeluarTahun;
    //
    totalSeluruhSurat;
  end
  else MessageDlg('Silahkan Pilih / Checked Surat Masuk atau Surat Keluar Terlebih Dahulu',mtInformation,[mbok],0);
end;

procedure TFMenu.Panel13Click(Sender: TObject);
begin
  if RadioButton1.Checked then
  begin
    //
    FSuratIn.Edit1.Text := DM.ADOSuratMasuk['kode_in'];
    FSuratIn.Label11.Caption := DM.ADOSuratMasuk['tgl_in'] ;
    FSuratIn.DateTimePicker1.Date := DM.ADOSuratMasuk['tgl_surat_in']  ;
    FSuratIn.Edit3.Text := DM.ADOSuratMasuk['nomor_surat_in']  ;
    FSuratIn.Edit4.Text :=  DM.ADOSuratMasuk['pengirim_in'] ;
    FSuratIn.Edit5.Text := DM.ADOSuratMasuk['perihal_in'] ;
    FSuratIn.Edit6.Text := DM.ADOSuratMasuk['ditujukan_in']  ;
    FSuratIn.Edit7.Text :=  DM.ADOSuratMasuk['file_surat_in'] ;
    FSuratIn.Label12.Caption :=  DM.ADOSuratMasuk['file_surat_in'] ;
    FSuratIn.Label13.Caption :=  DM.ADOSuratMasuk['file_surat_in'] ;
    FSuratIn.Show;
  end
  else
  if RadioButton2.Checked then
  begin
    //
    FSuratOut.Edit1.Text := DM.ADOSuratKeluar['kode_out'];
    FSuratOut.Label11.Caption := DM.ADOSuratKeluar['tgl_out'] ;
    FSuratOut.DateTimePicker1.Date := DM.ADOSuratKeluar['tgl_surat_out']  ;
    FSuratOut.Edit3.Text := DM.ADOSuratKeluar['nomor_surat_out']  ;
    FSuratOut.Edit4.Text :=  DM.ADOSuratKeluar['pengirm_out'] ;
    FSuratOut.Edit5.Text := DM.ADOSuratKeluar['perihal_out'] ;
    FSuratOut.Edit6.Text := DM.ADOSuratKeluar['ditujukan_out']  ;
    FSuratOut.Edit7.Text :=  DM.ADOSuratKeluar['file_surat_out'] ;
    FSuratOut.Label12.Caption :=  DM.ADOSuratKeluar['file_surat_out'] ;
    FSuratOut.Label13.Caption :=  DM.ADOSuratKeluar['file_surat_out'] ;
    FSuratOut.Show;
  end
  else MessageDlg('Silahkan Pilih / Checked Surat Masuk atau Surat Keluar Terlebih Dahulu',mtInformation,[mbok],0);
end;

procedure TFMenu.Panel14Click(Sender: TObject);
begin
  if RadioButton1.Checked then
  begin
    //
    Edit6.Clear;
    RadioButton1.Checked := False;
    RadioButton2.Checked := False;
    DBGrid2.Enabled := False;
  end
  else
  if RadioButton2.Checked then
  begin
    Edit6.Clear;
    RadioButton1.Checked := False;
    RadioButton2.Checked := False;
    DBGrid1.Enabled := False;
    DBGrid2.Enabled := False;
    DBGrid1.Visible := False;
    DBGrid2.Visible := True;
    //
  end
  else MessageDlg('Silahkan Pilih / Checked Surat Masuk atau Surat Keluar Terlebih Dahulu',mtInformation,[mbok],0);
  Label16.Caption := 'TABEL DATA SURAT BELUM DIPILIH';
end;

procedure TFMenu.Panel15Click(Sender: TObject);
begin
  if RadioButton1.Checked then
  begin
    // menggunakan cara web browser bawaan delphi :
    FViewPdf.Show;
    FViewPdf.WebBrowser1.Navigate(DM.ADOSuratMasuk['file_surat_in']);
  end
  else
  if RadioButton2.Checked then
  begin
    // menggunakan cara web browser bawaan delphi :
    FViewPdf.Show;
    FViewPdf.WebBrowser1.Navigate(DM.ADOSuratKeluar['file_surat_out']);
  end
  else MessageDlg('Silahkan Pilih / Checked Surat Masuk atau Surat Keluar Terlebih Dahulu',mtInformation,[mbok],0);
end;

procedure TFMenu.Edit6Change(Sender: TObject);
begin
  if RadioButton1.Checked then
  begin
    if Edit6.Text <> '' then
      begin
        DM.ADOSuratMasuk.Close;
        DM.ADOSuratMasuk.Open;
        DM.ADOSuratMasuk.Filtered := False;
        DM.ADOSuratMasuk.Filter :='kode_in LIKE '+Quotedstr('%'+Edit6.Text+'%');
        DM.ADOSuratMasuk.Filtered := True;
      end
    else
      begin
        DM.ADOSuratMasuk.Close;
        DM.ADOSuratMasuk.Open;
        DM.ADOSuratMasuk.Filtered := False;
      end;
  end
  else
  if RadioButton2.Checked then
  begin
    if Edit6.Text <> '' then
      begin
        DM.ADOSuratKeluar.Close;
        DM.ADOSuratKeluar.Open;
        DM.ADOSuratKeluar.Filtered := False;
        DM.ADOSuratKeluar.Filter :='kode_out LIKE '+Quotedstr('%'+Edit6.Text+'%');
        DM.ADOSuratKeluar.Filtered := True;
      end
    else
      begin
        DM.ADOSuratKeluar.Close;
        DM.ADOSuratKeluar.Open;
        DM.ADOSuratKeluar.Filtered := False;
      end;
  end;
end;

procedure TFMenu.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
       if DM.ADOSuratKeluar.IsEmpty then
        MessageDlg('Data Kosong',mtInformation,[mbok],0)
       else
       begin
          //
          Edit6.Text := DM.ADOSuratKeluar['kode_out'];
          FSuratOut.Label10.Caption := '1';
       end;
  end;
end;

procedure TFMenu.jmlhData;
begin
  DM.ADOQJumlahData.Close;
  DM.ADOQJumlahData.SQL.Clear;
  DM.ADOQJumlahData.SQL.Add('SELECT COUNT(*) AS jml FROM surat_masuk WHERE YEAR(tgl_in) = "'+DM.ADOTempPeriode['periode']+'"');
  DM.ADOQJumlahData.Open;
  // menampilkan data ke edit
  Edit8.Clear;
  Edit8.Text := DM.ADOQJumlahData['jml'];
end;

procedure TFMenu.jmlData2;
begin
  DM.ADOQJumlahData.Close;
  DM.ADOQJumlahData.SQL.Clear;
  DM.ADOQJumlahData.SQL.Add('SELECT COUNT(*) AS jml FROM surat_keluar WHERE YEAR(tgl_out) = "'+DM.ADOTempPeriode['periode']+'"');
  DM.ADOQJumlahData.Open;
  // menampilkan data ke edit
  Edit8.Clear;
  Edit8.Text := DM.ADOQJumlahData['jml'];
end;

procedure TFMenu.totalSuratMasuk;
begin
  DM.TotalSM.Close;
  DM.TotalSM.SQL.Clear;
  DM.TotalSM.SQL.Add('SELECT COUNT(*) AS jml FROM surat_masuk');
  DM.TotalSM.Open;
  // menampilkan data ke edit
  Panel22.Caption := DM.TotalSM['jml'];
end;

procedure TFMenu.totalSuratKeluar;
begin
  DM.TotalSK.Close;
  DM.TotalSK.SQL.Clear;
  DM.TotalSK.SQL.Add('SELECT COUNT(*) AS jml FROM surat_keluar');
  DM.TotalSK.Open;
  // menampilkan data ke edit
  Panel23.Caption := DM.TotalSK['jml'];
end;

procedure TFMenu.totalSeluruhSurat;
begin
  Panel29.Caption := IntToStr(StrToInt(Panel25.Caption) + StrToInt(Panel27.Caption));
end;

procedure TFMenu.suratKeluarTahun;
begin
  //
  DM.SKTahun.Close;
  DM.SKTahun.SQL.Clear;
  DM.SKTahun.SQL.Add('SELECT COUNT(*) AS jml FROM surat_keluar WHERE YEAR(tgl_out) = "'+DM.ADOTempPeriode['periode']+'"');
  DM.SKTahun.Open;
  // menampilkan data ke edit
  Panel27.Caption := DM.SKTahun['jml'];
end;

procedure TFMenu.suratMasukTahun;
begin
  //
  DM.SMTahun.Close;
  DM.SMTahun.SQL.Clear;
  DM.SMTahun.SQL.Add('SELECT COUNT(*) AS jml FROM surat_masuk WHERE YEAR(tgl_in) = "'+DM.ADOTempPeriode['periode']+'"');
  DM.SMTahun.Open;
  // menampilkan data ke edit
  Panel25.Caption := DM.SMTahun['jml'];
end;

procedure TFMenu.suratKeluar;
begin
  //
  DM.ADOSuratKeluar.Close;
  DM.ADOSuratKeluar.SQL.Clear;
  DM.ADOSuratKeluar.SQL.Add('SELECT * FROM surat_keluar WHERE YEAR(tgl_out) = "'+DM.ADOTempPeriode['periode']+'"');
  DM.ADOSuratKeluar.Open;
end;

procedure TFMenu.suratMasuk;
begin
  //
  DM.ADOSuratMasuk.Close;
  DM.ADOSuratMasuk.SQL.Clear;
  DM.ADOSuratMasuk.SQL.Add('SELECT * FROM surat_masuk WHERE YEAR(tgl_in) = "'+DM.ADOTempPeriode['periode']+'"');
  DM.ADOSuratMasuk.Open;
end;

end.


