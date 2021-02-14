object frmCad_Tanques: TfrmCad_Tanques
  Left = 0
  Top = 0
  Caption = 'Cadastro de Tanques'
  ClientHeight = 241
  ClientWidth = 618
  Color = clBtnFace
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
    Width = 618
    Height = 192
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object GPB_Cad: TGroupBox
      Left = 0
      Top = 0
      Width = 618
      Height = 192
      Align = alClient
      Caption = 'Cadastro de Tanques'
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
        Width = 103
        Height = 13
        Caption = 'Tipo de Combustivel :'
      end
      object Label3: TLabel
        Left = 24
        Top = 135
        Width = 99
        Height = 13
        Caption = 'Qtde Total de Litros:'
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
        OnEnter = edt_CodigoEnter
        OnExit = edt_CodigoExit
        OnKeyPress = edt_CodigoKeyPress
      end
      object edt_QtdeTotal: TEdit
        Left = 24
        Top = 152
        Width = 121
        Height = 21
        TabOrder = 2
        OnEnter = edt_CodigoEnter
        OnExit = edt_CodigoExit
        OnKeyPress = edt_QtdeTotalKeyPress
      end
      object cbo_tipocombustivel: TComboBox
        Left = 24
        Top = 101
        Width = 577
        Height = 21
        TabOrder = 1
        OnEnter = edt_CodigoEnter
        OnExit = edt_CodigoExit
        OnKeyPress = edt_CodigoKeyPress
        Items.Strings = (
          'GASILINA COMUM'
          'ALCOOL'
          'GASOLINA ADITIVADA'
          'GASOLINA POWER'
          'OLEO DIESEL')
      end
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 192
    Width = 618
    Height = 49
    Align = alBottom
    Color = clWhite
    ParentBackground = False
    ParentColor = False
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
      Left = 115
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
    Left = 568
    Top = 24
  end
end
