object frmCad_Produto: TfrmCad_Produto
  Left = 0
  Top = 0
  Caption = 'Cadastro de produto'
  ClientHeight = 295
  ClientWidth = 822
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
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
    Width = 822
    Height = 246
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object GPB_Cad: TGroupBox
      Left = 0
      Top = 0
      Width = 822
      Height = 246
      Align = alClient
      Caption = 'Cadastro de Produtos'
      TabOrder = 0
      ExplicitTop = 6
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
        Width = 109
        Height = 13
        Caption = 'Descri'#231#227'o do Produto :'
      end
      object Label3: TLabel
        Left = 24
        Top = 130
        Width = 153
        Height = 13
        Caption = 'Descri'#231#227'o do Produto reduzido :'
      end
      object Label4: TLabel
        Left = 24
        Top = 183
        Width = 66
        Height = 13
        Caption = 'Unid. produto'
      end
      object Label5: TLabel
        Left = 128
        Top = 183
        Width = 70
        Height = 13
        Caption = 'Qtde. estoque'
      end
      object Label6: TLabel
        Left = 248
        Top = 183
        Width = 60
        Height = 13
        Caption = 'Prc. Produto'
      end
      object edt_Codigo: TEdit
        Left = 24
        Top = 48
        Width = 161
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
      object edt_Descricaoprod: TEdit
        Left = 24
        Top = 102
        Width = 777
        Height = 21
        TabOrder = 1
        OnEnter = edt_CodigoEnter
        OnExit = edt_CodigoExit
        OnKeyPress = edt_CodigoKeyPress
      end
      object edt_DescricaoProdReduzido: TEdit
        Left = 24
        Top = 150
        Width = 777
        Height = 21
        TabOrder = 2
        OnEnter = edt_CodigoEnter
        OnExit = edt_CodigoExit
        OnKeyPress = edt_CodigoKeyPress
      end
      object cbo_Unidade: TComboBox
        Left = 24
        Top = 200
        Width = 85
        Height = 21
        TabOrder = 3
        OnEnter = edt_CodigoEnter
        OnExit = edt_CodigoExit
        OnKeyPress = edt_CodigoKeyPress
        Items.Strings = (
          'AMPOLA'
          'BALDE'
          'BANDEJ'
          'BARRA'
          'BISNAG'
          'BLOCO'
          'BOBINA'
          'BOMB'
          'CAPS'
          'CART'
          'CENTO'
          'CJ'
          'CM'
          'CM2'
          'CX'
          'CX2'
          'CX3'
          'CX5'
          'CX10'
          'CX15'
          'CX20'
          'CX25'
          'CX50'
          'CX100'
          'DISP'
          'DUZIA'
          'EMBAL'
          'FARDO'
          'FOLHA'
          'FRASCO'
          'GALAO'
          'GF'
          'GRAMAS'
          'JOGO'
          'KG'
          'KIT'
          'LATA'
          'LITRO'
          'M'
          'M2'
          'M3'
          'MILHEI'
          'ML'
          'MWH'
          'PACOTE'
          'PALETE'
          'PARES'
          'PC'
          'POTE'
          'K'
          'RESMA'
          'ROLO'
          'SACO'
          'SACOLA'
          'TAMBOR'
          'TANQUE'
          'TON'
          'TUBO'
          'UNID'
          'VASIL'
          'VIDRO')
      end
      object edt_QtdeTotal: TEdit
        Left = 128
        Top = 200
        Width = 97
        Height = 21
        TabOrder = 4
        OnKeyPress = edt_QtdeTotalKeyPress
      end
      object edt_Precoprd: TEdit
        Left = 248
        Top = 200
        Width = 97
        Height = 21
        TabOrder = 5
        OnKeyPress = edt_PrecoprdKeyPress
      end
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 246
    Width = 822
    Height = 49
    Align = alBottom
    TabOrder = 1
    object btnNovo: TButton
      Left = 19
      Top = 13
      Width = 90
      Height = 25
      Caption = 'Novo'
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnSalvar: TButton
      Left = 114
      Top = 13
      Width = 90
      Height = 25
      Caption = 'Salvar'
      TabOrder = 1
      OnClick = btnSalvarClick
    end
    object btnEditar: TButton
      Left = 210
      Top = 13
      Width = 90
      Height = 25
      Caption = 'Editar'
      TabOrder = 2
      OnClick = btnEditarClick
    end
    object btnExcluir: TButton
      Left = 304
      Top = 13
      Width = 90
      Height = 25
      Caption = 'Excluir'
      TabOrder = 3
      OnClick = btnExcluirClick
    end
    object btnPesquisar: TButton
      Left = 401
      Top = 13
      Width = 90
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 4
      OnClick = btnPesquisarClick
    end
    object btnSair: TButton
      Left = 719
      Top = 12
      Width = 90
      Height = 25
      Caption = 'Sair'
      TabOrder = 5
      OnClick = btnSairClick
    end
  end
  object QryAuxiliar: TFDQuery
    Connection = DM.DBConexao
    Left = 760
    Top = 24
  end
end
