object FPeriode: TFPeriode
  Left = 260
  Top = 160
  Width = 796
  Height = 403
  BorderIcons = [biSystemMenu]
  Caption = 'SETTING PERIODE'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 780
    Height = 364
    Align = alClient
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 371
      Height = 39
      Caption = 'FORM SETTING PERIODE'
      Font.Charset = ANSI_CHARSET
      Font.Color = 4210752
      Font.Height = -33
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 383
      Top = 84
      Width = 44
      Height = 15
      Caption = 'Periode'
      Font.Charset = ANSI_CHARSET
      Font.Color = 4210752
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel2: TPanel
      Left = 411
      Top = 29
      Width = 84
      Height = 29
      Cursor = crHandPoint
      Caption = 'Add Data'
      Color = 14120960
      TabOrder = 0
      OnClick = Panel2Click
    end
    object Panel3: TPanel
      Left = 503
      Top = 29
      Width = 84
      Height = 29
      Cursor = crHandPoint
      Caption = 'Delete'
      Color = 14120960
      TabOrder = 1
      OnClick = Panel3Click
    end
    object Panel4: TPanel
      Left = 593
      Top = 29
      Width = 84
      Height = 29
      Cursor = crHandPoint
      Caption = 'Reset'
      Color = 14120960
      TabOrder = 2
      OnClick = Panel4Click
    end
    object Panel5: TPanel
      Left = 684
      Top = 29
      Width = 84
      Height = 29
      Cursor = crHandPoint
      Caption = 'Close'
      Color = 14120960
      TabOrder = 3
      OnClick = Panel5Click
    end
    object Panel6: TPanel
      Left = 10
      Top = 63
      Width = 759
      Height = 5
      Color = clGray
      TabOrder = 4
    end
    object Edit1: TEdit
      Left = 291
      Top = 106
      Width = 228
      Height = 23
      BevelInner = bvNone
      Font.Charset = ANSI_CHARSET
      Font.Color = 4210752
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    object DBGrid1: TDBGrid
      Left = 72
      Top = 211
      Width = 633
      Height = 137
      DataSource = DM.DSPeriode
      FixedColor = 4210752
      Font.Charset = ANSI_CHARSET
      Font.Color = 4210752
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 6
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWhite
      TitleFont.Height = -13
      TitleFont.Name = 'Roboto'
      TitleFont.Style = [fsBold]
      OnKeyPress = DBGrid1KeyPress
      Columns = <
        item
          Color = clWhite
          Expanded = False
          FieldName = 'periode'
          Title.Alignment = taCenter
          Title.Caption = 'PERIODE'
          Width = 200
          Visible = True
        end>
    end
    object GroupBox1: TGroupBox
      Left = 72
      Top = 139
      Width = 633
      Height = 65
      Caption = 'Pencarian Berdasarkan Periode : '
      Font.Charset = ANSI_CHARSET
      Font.Color = 4210752
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      object Edit2: TEdit
        Left = 26
        Top = 26
        Width = 575
        Height = 23
        BevelInner = bvNone
        Font.Charset = ANSI_CHARSET
        Font.Color = 4210752
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnChange = Edit2Change
      end
    end
  end
end
