object frmCad_Operador: TfrmCad_Operador
  Left = 0
  Top = 0
  Caption = 'Cadastro de Operador'
  ClientHeight = 256
  ClientWidth = 617
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
    Width = 617
    Height = 207
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitHeight = 193
    object GPB_Cad: TGroupBox
      Left = 0
      Top = 0
      Width = 617
      Height = 207
      Align = alClient
      Caption = 'Cadastro de Operador'
      TabOrder = 0
      ExplicitHeight = 193
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
        Width = 117
        Height = 13
        Caption = 'Descri'#231#227'o do Operador :'
      end
      object Label3: TLabel
        Left = 24
        Top = 135
        Width = 59
        Height = 13
        Caption = 'Comiss'#227'o %'
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
      object edt_Comissao: TEdit
        Left = 24
        Top = 152
        Width = 121
        Height = 21
        TabOrder = 2
        OnEnter = edt_CodigoEnter
        OnExit = edt_CodigoExit
        OnKeyPress = edt_ComissaoKeyPress
      end
      object edit_DescricaoOper: TEdit
        Left = 24
        Top = 101
        Width = 577
        Height = 21
        TabOrder = 1
        OnEnter = edt_CodigoEnter
        OnExit = edt_CodigoExit
        OnKeyPress = edt_CodigoKeyPress
      end
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 207
    Width = 617
    Height = 49
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 193
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
