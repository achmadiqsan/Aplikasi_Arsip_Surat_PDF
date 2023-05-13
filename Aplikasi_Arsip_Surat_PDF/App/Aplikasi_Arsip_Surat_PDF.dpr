program Aplikasi_Arsip_Surat_PDF;

uses
  Forms,
  UMainMenu in 'UMainMenu.pas' {FMenu},
  ULogin in 'ULogin.pas' {FLogin},
  USettingUser in 'USettingUser.pas' {FUser},
  USettingPeriode in 'USettingPeriode.pas' {FPeriode},
  USuratIn in 'USuratIn.pas' {FSuratIn},
  USuratOut in 'USuratOut.pas' {FSuratOut},
  DataModule in 'DataModule.pas' {DM: TDataModule},
  UViewPdf in 'UViewPdf.pas' {FViewPdf};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFLogin, FLogin);
  Application.CreateForm(TFMenu, FMenu);
  Application.CreateForm(TFUser, FUser);
  Application.CreateForm(TFPeriode, FPeriode);
  Application.CreateForm(TFSuratIn, FSuratIn);
  Application.CreateForm(TFSuratOut, FSuratOut);
  Application.CreateForm(TFViewPdf, FViewPdf);
  Application.Run;
end.
