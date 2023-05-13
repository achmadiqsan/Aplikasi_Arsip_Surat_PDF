unit DataModule;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOPeriode: TADOTable;
    DSPeriode: TDataSource;
    ADOLogin: TADOTable;
    DSLogin: TDataSource;
    ADOTempPeriode: TADOTable;
    ADOSuratMasuk1: TADOTable;
    DSSuratMasuk: TDataSource;
    DSSuratKeluar: TDataSource;
    ADOSuratKeluar1: TADOTable;
    ADODataKantor: TADOTable;
    ADOQSuratMasuk: TADOQuery;
    ADOQSuratKeluar: TADOQuery;
    ADOQJumlahData: TADOQuery;
    TotalSM: TADOQuery;
    TotalSK: TADOQuery;
    SMTahun: TADOQuery;
    SKTahun: TADOQuery;
    ADOSuratMasuk: TADOQuery;
    ADOSuratKeluar: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
