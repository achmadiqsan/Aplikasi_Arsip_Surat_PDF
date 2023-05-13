object DM: TDM
  OldCreateOrder = False
  Left = 592
  Top = 143
  Height = 359
  Width = 509
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\Aplikasi_Arsip_S' +
      'urat_PDF\Database\DatabaseAplikasiSuratPDF.mdb;Persist Security ' +
      'Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 32
    Top = 16
  end
  object ADOPeriode: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'periode'
    Left = 136
    Top = 16
  end
  object DSPeriode: TDataSource
    DataSet = ADOPeriode
    Left = 208
    Top = 16
  end
  object ADOLogin: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'login'
    Left = 40
    Top = 64
  end
  object DSLogin: TDataSource
    DataSet = ADOLogin
    Left = 96
    Top = 72
  end
  object ADOTempPeriode: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'tempPeriode'
    Left = 40
    Top = 248
  end
  object ADOSuratMasuk1: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'surat_masuk'
    Left = 40
    Top = 144
  end
  object DSSuratMasuk: TDataSource
    DataSet = ADOSuratMasuk
    Left = 128
    Top = 128
  end
  object DSSuratKeluar: TDataSource
    DataSet = ADOSuratKeluar
    Left = 128
    Top = 192
  end
  object ADOSuratKeluar1: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'surat_keluar'
    Left = 40
    Top = 200
  end
  object ADODataKantor: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'dataKantor'
    Left = 128
    Top = 248
  end
  object ADOQSuratMasuk: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM surat_masuk')
    Left = 192
    Top = 72
  end
  object ADOQSuratKeluar: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM surat_keluar')
    Left = 208
    Top = 144
  end
  object ADOQJumlahData: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM surat_keluar')
    Left = 208
    Top = 216
  end
  object TotalSM: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM surat_keluar')
    Left = 280
    Top = 24
  end
  object TotalSK: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM surat_keluar')
    Left = 280
    Top = 80
  end
  object SMTahun: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM surat_keluar')
    Left = 288
    Top = 144
  end
  object SKTahun: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM surat_keluar')
    Left = 304
    Top = 208
  end
  object ADOSuratMasuk: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM surat_masuk')
    Left = 352
    Top = 40
  end
  object ADOSuratKeluar: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM surat_keluar')
    Left = 360
    Top = 104
  end
end
