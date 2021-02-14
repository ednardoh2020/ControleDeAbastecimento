object frmForma_Pgto: TfrmForma_Pgto
  Left = 0
  Top = 0
  Caption = 'Forma de Pagamento'
  ClientHeight = 414
  ClientWidth = 424
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 349
    Width = 424
    Height = 65
    Align = alBottom
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object btn_Confirma: TButton
      Left = 64
      Top = 16
      Width = 146
      Height = 33
      Caption = 'Confirma - F5'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btn_ConfirmaClick
    end
    object Button2: TButton
      Left = 216
      Top = 16
      Width = 145
      Height = 33
      Caption = 'Fechar <Esc>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 424
    Height = 349
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object Shape1: TShape
      Left = 1
      Top = 1
      Width = 422
      Height = 347
      Align = alClient
      Shape = stRoundRect
      ExplicitLeft = 2
      ExplicitTop = -4
    end
    object Label1: TLabel
      Left = 24
      Top = 42
      Width = 171
      Height = 25
      Caption = 'Total da Venda :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 13
      Top = 96
      Width = 238
      Height = 25
      Caption = 'Forma de Pagamento :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 64
      Top = 198
      Width = 128
      Height = 25
      Caption = 'Valor Pago :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 119
      Top = 264
      Width = 73
      Height = 25
      Caption = 'Troco :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edt_TotVenda: TEdit
      Left = 208
      Top = 28
      Width = 185
      Height = 47
      Alignment = taRightJustify
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Text = '0,00'
    end
    object dbc_Formapgto: TDBLookupComboBox
      Left = 9
      Top = 127
      Width = 407
      Height = 37
      Color = 6599167
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      KeyField = 'CD_FPGTO'
      ListField = 'DS_FPGTO'
      ListSource = ds_Fpgto
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      OnKeyPress = dbc_FormapgtoKeyPress
    end
    object edt_Valpago: TEdit
      Left = 208
      Top = 184
      Width = 185
      Height = 47
      Alignment = taRightJustify
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      Text = '0,00'
      OnExit = edt_ValpagoExit
      OnKeyPress = edt_ValpagoKeyPress
    end
    object edt_Troco: TEdit
      Left = 208
      Top = 250
      Width = 185
      Height = 47
      Alignment = taRightJustify
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      Text = '0,00'
    end
  end
  object Qry_FormaPGTO: TFDQuery
    Connection = DM.DBConexao
    SQL.Strings = (
      'SELECT * FROM TB_FPGTO')
    Left = 128
    Top = 16
    object Qry_FormaPGTOCD_FPGTO: TStringField
      FieldName = 'CD_FPGTO'
      Origin = 'CD_FPGTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object Qry_FormaPGTODS_FPGTO: TStringField
      FieldName = 'DS_FPGTO'
      Origin = 'DS_FPGTO'
      Size = 60
    end
  end
  object ds_Fpgto: TDataSource
    DataSet = Qry_FormaPGTO
    Left = 88
    Top = 16
  end
end
