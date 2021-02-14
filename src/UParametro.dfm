object frmParametro: TfrmParametro
  Left = 0
  Top = 0
  Caption = 'Parametro do sistema'
  ClientHeight = 275
  ClientWidth = 613
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 613
    Height = 226
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object GPB_Cad: TGroupBox
      Left = 0
      Top = 0
      Width = 613
      Height = 226
      Align = alClient
      Caption = 'Parametros'
      TabOrder = 0
      object Label1: TLabel
        Left = 19
        Top = 24
        Width = 22
        Height = 13
        Caption = 'Cnpj'
      end
      object Label2: TLabel
        Left = 19
        Top = 71
        Width = 46
        Height = 13
        Caption = 'Operador'
      end
      object Label4: TLabel
        Left = 472
        Top = 115
        Width = 106
        Height = 13
        Caption = 'Dt. Abertura do Caixa'
      end
      object Label5: TLabel
        Left = 472
        Top = 27
        Width = 101
        Height = 13
        Caption = 'Saldo Inicial no Caixa'
      end
      object Label6: TLabel
        Left = 472
        Top = 70
        Width = 76
        Height = 13
        Caption = 'Imposto padr'#227'o'
      end
      object Label8: TLabel
        Left = 19
        Top = 117
        Width = 27
        Height = 13
        Caption = 'Caixa'
      end
      object Label3: TLabel
        Left = 19
        Top = 161
        Width = 102
        Height = 13
        Caption = 'Forma de Pagamento'
      end
      object Label7: TLabel
        Left = 472
        Top = 159
        Width = 82
        Height = 13
        Caption = 'Desconto padr'#227'o'
      end
      object dbc_Empresa: TDBLookupComboBox
        Left = 16
        Top = 43
        Width = 430
        Height = 21
        DataField = 'CNPJ_EMPR'
        DataSource = DMCad.ds_Parametro
        KeyField = 'CNPJ'
        ListField = 'NOME_FANTASIA'
        ListSource = dsEmpresa
        TabOrder = 0
        OnKeyPress = dbc_EmpresaKeyPress
      end
      object dbc_Operador: TDBLookupComboBox
        Left = 16
        Top = 88
        Width = 430
        Height = 21
        DataField = 'CD_OPERADOR'
        DataSource = DMCad.ds_Parametro
        KeyField = 'CD_OPERADOR'
        ListField = 'DS_OPERADOR'
        ListSource = dsOperador
        TabOrder = 1
        OnKeyPress = dbc_OperadorKeyPress
      end
      object dbc_Caixa: TDBLookupComboBox
        Left = 16
        Top = 133
        Width = 430
        Height = 21
        DataField = 'CD_CAIXA'
        DataSource = DMCad.ds_Parametro
        KeyField = 'CD_CAIXA'
        ListField = 'DS_CAIXA'
        ListSource = dsCaixa
        TabOrder = 2
        OnKeyPress = dbc_CaixaKeyPress
      end
      object dbc_Fpgto: TDBLookupComboBox
        Left = 16
        Top = 177
        Width = 428
        Height = 21
        DataField = 'CD_FPGTO'
        DataSource = DMCad.ds_Parametro
        KeyField = 'CD_FPGTO'
        ListField = 'DS_FPGTO'
        ListSource = dsFpgto
        TabOrder = 3
        OnKeyPress = dbc_FpgtoKeyPress
      end
      object DBEdit1: TDBEdit
        Left = 472
        Top = 43
        Width = 121
        Height = 21
        DataField = 'SLD_INICIAL'
        DataSource = DMCad.ds_Parametro
        TabOrder = 4
        OnKeyPress = DBEdit1KeyPress
      end
      object DBEdit2: TDBEdit
        Left = 472
        Top = 88
        Width = 121
        Height = 21
        DataField = 'IMPOSTO_PADR'
        DataSource = DMCad.ds_Parametro
        TabOrder = 5
        OnKeyPress = DBEdit2KeyPress
      end
      object DBEdit3: TDBEdit
        Left = 472
        Top = 177
        Width = 121
        Height = 21
        DataField = 'DESC_PADRAO'
        DataSource = DMCad.ds_Parametro
        TabOrder = 7
        OnKeyPress = DBEdit2KeyPress
      end
      object DBEdit4: TDBEdit
        Left = 472
        Top = 132
        Width = 121
        Height = 21
        DataField = 'DT_ABERTURA'
        DataSource = DMCad.ds_Parametro
        TabOrder = 6
      end
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 226
    Width = 613
    Height = 49
    Align = alBottom
    TabOrder = 1
    object btnSair: TButton
      Left = 488
      Top = 14
      Width = 90
      Height = 25
      Caption = 'Sair'
      TabOrder = 0
      OnClick = btnSairClick
    end
    object DBNavigator1: TDBNavigator
      Left = 72
      Top = 14
      Width = 320
      Height = 25
      DataSource = DMCad.ds_Parametro
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbCancel]
      TabOrder = 1
    end
  end
  object QryEmpresa: TFDQuery
    Connection = DM.DBConexao
    SQL.Strings = (
      'SELECT * FROM TB_EMPRESA')
    Left = 792
    Top = 24
    object QryEmpresaCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Required = True
      Size = 30
    end
    object QryEmpresaRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'RAZAO_SOCIAL'
      Size = 100
    end
    object QryEmpresaNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Origin = 'NOME_FANTASIA'
      Size = 60
    end
    object QryEmpresaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 100
    end
    object QryEmpresaCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 10
    end
    object QryEmpresaTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Size = 30
    end
    object QryEmpresaIE: TStringField
      FieldName = 'IE'
      Origin = 'IE'
    end
    object QryEmpresaLOGOMARCA: TBlobField
      FieldName = 'LOGOMARCA'
      Origin = 'LOGOMARCA'
    end
  end
  object dsEmpresa: TDataSource
    DataSet = QryEmpresa
    Left = 848
    Top = 24
  end
  object QryOperador: TFDQuery
    Connection = DM.DBConexao
    SQL.Strings = (
      'SELECT * FROM TB_OPERADOR')
    Left = 792
    Top = 72
    object QryOperadorCD_OPERADOR: TStringField
      FieldName = 'CD_OPERADOR'
      Origin = 'CD_OPERADOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object QryOperadorDS_OPERADOR: TStringField
      FieldName = 'DS_OPERADOR'
      Origin = 'DS_OPERADOR'
      Size = 60
    end
    object QryOperadorCOMISSAO: TBCDField
      FieldName = 'COMISSAO'
      Origin = 'COMISSAO'
      Precision = 18
      Size = 2
    end
  end
  object dsOperador: TDataSource
    DataSet = QryOperador
    Left = 848
    Top = 72
  end
  object QryCaixa: TFDQuery
    Connection = DM.DBConexao
    SQL.Strings = (
      'SELECT * FROM TB_CAIXA')
    Left = 792
    Top = 128
    object QryCaixaCD_CAIXA: TStringField
      FieldName = 'CD_CAIXA'
      Origin = 'CD_CAIXA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object QryCaixaDS_CAIXA: TStringField
      FieldName = 'DS_CAIXA'
      Origin = 'DS_CAIXA'
      Size = 60
    end
  end
  object dsCaixa: TDataSource
    DataSet = QryCaixa
    Left = 848
    Top = 128
  end
  object QryFpgto: TFDQuery
    Connection = DM.DBConexao
    SQL.Strings = (
      'SELECT * FROM TB_FPGTO')
    Left = 792
    Top = 184
    object QryFpgtoCD_FPGTO: TStringField
      FieldName = 'CD_FPGTO'
      Origin = 'CD_FPGTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object QryFpgtoDS_FPGTO: TStringField
      FieldName = 'DS_FPGTO'
      Origin = 'DS_FPGTO'
      Size = 60
    end
  end
  object dsFpgto: TDataSource
    DataSet = QryFpgto
    Left = 848
    Top = 184
  end
end
