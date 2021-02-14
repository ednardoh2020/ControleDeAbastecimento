object frmCad_Caixa: TfrmCad_Caixa
  Left = 0
  Top = 0
  Caption = 'Cadastro de Caixa'
  ClientHeight = 198
  ClientWidth = 635
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
    Width = 635
    Height = 149
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object GPB_Cad: TGroupBox
      Left = 0
      Top = 0
      Width = 635
      Height = 149
      Align = alClient
      Caption = 'Cadastro de Caixa'
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
        Width = 98
        Height = 13
        Caption = 'Descri'#231#227'o do Caixa :'
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
      object edit_DescricaoCaixa: TEdit
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
    Top = 149
    Width = 635
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
      Left = 305
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
