object frmCad_Bombas: TfrmCad_Bombas
  Left = 0
  Top = 0
  Caption = 'Cadastro de bombas'
  ClientHeight = 263
  ClientWidth = 626
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 626
    Height = 214
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object GPB_Cad: TGroupBox
      Left = 0
      Top = 0
      Width = 626
      Height = 214
      Align = alClient
      Caption = 'Cadastro de Bombas'
      TabOrder = 0
      object Label1: TLabel
        Left = 24
        Top = 31
        Width = 40
        Height = 13
        Caption = 'C'#243'digo :'
      end
      object Label2: TLabel
        Left = 24
        Top = 82
        Width = 88
        Height = 13
        Caption = 'Descri'#231#227'o bomba :'
      end
      object Label3: TLabel
        Left = 24
        Top = 135
        Width = 114
        Height = 13
        Caption = 'Tanque de combust'#237'vel:'
      end
      object edt_Codigo: TEdit
        Left = 24
        Top = 48
        Width = 121
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = True
        ParentFont = False
        TabOrder = 0
      end
      object edt_descricao: TEdit
        Left = 24
        Top = 104
        Width = 577
        Height = 21
        TabOrder = 1
      end
      object lcb_Tanques: TDBLookupComboBox
        Left = 24
        Top = 154
        Width = 577
        Height = 21
        KeyField = 'CD_TANQUE'
        ListField = 'TP_COMBUSTIVEL'
        ListSource = ds_Tanque
        TabOrder = 2
      end
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 214
    Width = 626
    Height = 49
    Align = alBottom
    TabOrder = 1
    object btnNovo: TButton
      Left = 19
      Top = 11
      Width = 90
      Height = 25
      Caption = 'Novo'
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnSalvar: TButton
      Left = 114
      Top = 11
      Width = 90
      Height = 25
      Caption = 'Salvar'
      TabOrder = 1
      OnClick = btnSalvarClick
    end
    object btnEditar: TButton
      Left = 210
      Top = 11
      Width = 90
      Height = 25
      Caption = 'Editar'
      TabOrder = 2
      OnClick = btnEditarClick
    end
    object btnExcluir: TButton
      Left = 304
      Top = 11
      Width = 90
      Height = 25
      Caption = 'Excluir'
      TabOrder = 3
      OnClick = btnExcluirClick
    end
    object btnPesquisar: TButton
      Left = 401
      Top = 11
      Width = 90
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 4
      OnClick = btnPesquisarClick
    end
    object btnSair: TButton
      Left = 511
      Top = 11
      Width = 90
      Height = 25
      Caption = 'Sair'
      TabOrder = 5
      OnClick = btnSairClick
    end
  end
  object QryAuxiliar: TFDQuery
    Connection = DM.DBConexao
    Left = 456
    Top = 16
  end
  object QryTANQUE: TFDQuery
    Connection = DM.DBConexao
    SQL.Strings = (
      'SELECT * FROM TB_TANQUE')
    Left = 520
    Top = 16
    object QryTANQUECD_TANQUE: TStringField
      FieldName = 'CD_TANQUE'
      Origin = 'CD_TANQUE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object QryTANQUETP_COMBUSTIVEL: TStringField
      FieldName = 'TP_COMBUSTIVEL'
      Origin = 'TP_COMBUSTIVEL'
      Size = 60
    end
    object QryTANQUETOTAL_LITROS: TBCDField
      FieldName = 'TOTAL_LITROS'
      Origin = 'TOTAL_LITROS'
      Precision = 18
    end
  end
  object ds_Tanque: TDataSource
    DataSet = QryTANQUE
    Left = 488
    Top = 16
  end
end
