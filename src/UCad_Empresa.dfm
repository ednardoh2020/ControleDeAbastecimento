object frmCad_Empresa: TfrmCad_Empresa
  Left = 0
  Top = 0
  Caption = 'Cadastro de Empresa'
  ClientHeight = 487
  ClientWidth = 714
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
    Width = 714
    Height = 438
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 913
    ExplicitHeight = 287
    object GPB_Cad: TGroupBox
      Left = 0
      Top = 0
      Width = 714
      Height = 438
      Align = alClient
      Caption = 'Cadastro de Empresa'
      TabOrder = 0
      ExplicitWidth = 913
      ExplicitHeight = 287
      object Shape1: TShape
        Left = 24
        Top = 34
        Width = 134
        Height = 121
      end
      object Label1: TLabel
        Left = 24
        Top = 199
        Width = 29
        Height = 13
        Caption = 'Cnpj :'
      end
      object Label2: TLabel
        Left = 24
        Top = 250
        Width = 66
        Height = 13
        Caption = 'Raz'#227'o social :'
      end
      object Label3: TLabel
        Left = 24
        Top = 297
        Width = 91
        Height = 13
        Caption = 'Nome de fantasia :'
      end
      object Label4: TLabel
        Left = 24
        Top = 341
        Width = 52
        Height = 13
        Caption = 'Endere'#231'o :'
      end
      object Label5: TLabel
        Left = 24
        Top = 386
        Width = 26
        Height = 13
        Caption = 'CEP :'
      end
      object Label6: TLabel
        Left = 152
        Top = 386
        Width = 49
        Height = 13
        Caption = 'Telefone :'
      end
      object Label7: TLabel
        Left = 434
        Top = 386
        Width = 17
        Height = 13
        Caption = 'IE :'
      end
      object Label8: TLabel
        Left = 21
        Top = 15
        Width = 30
        Height = 13
        Caption = 'Logo :'
      end
      object img_Logo: TImage
        Left = 27
        Top = 36
        Width = 129
        Height = 118
        Stretch = True
      end
      object edt_Cnpj: TEdit
        Left = 24
        Top = 216
        Width = 201
        Height = 21
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnEnter = edt_CnpjEnter
        OnExit = edt_CnpjExit
        OnKeyPress = edt_CnpjKeyPress
      end
      object edt_Nomefantasia: TEdit
        Left = 24
        Top = 314
        Width = 667
        Height = 21
        TabOrder = 2
        OnEnter = edt_CnpjEnter
        OnExit = edt_CnpjExit
        OnKeyPress = edt_CnpjKeyPress
      end
      object edt_Rasaosocial: TEdit
        Left = 24
        Top = 269
        Width = 667
        Height = 21
        TabOrder = 1
        OnEnter = edt_CnpjEnter
        OnExit = edt_CnpjExit
        OnKeyPress = edt_CnpjKeyPress
      end
      object edt_Endereco: TEdit
        Left = 24
        Top = 358
        Width = 667
        Height = 21
        TabOrder = 3
        OnEnter = edt_CnpjEnter
        OnExit = edt_CnpjExit
        OnKeyPress = edt_CnpjKeyPress
      end
      object edt_Cep: TEdit
        Left = 24
        Top = 403
        Width = 113
        Height = 21
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnEnter = edt_CnpjEnter
        OnExit = edt_CnpjExit
        OnKeyPress = edt_CnpjKeyPress
      end
      object edt_Telefone: TEdit
        Left = 152
        Top = 403
        Width = 274
        Height = 21
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnEnter = edt_CnpjEnter
        OnExit = edt_CnpjExit
        OnKeyPress = edt_CnpjKeyPress
      end
      object edt_Inscricaoestadual: TEdit
        Left = 434
        Top = 403
        Width = 257
        Height = 21
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        OnEnter = edt_CnpjEnter
        OnExit = edt_CnpjExit
        OnKeyPress = edt_CnpjKeyPress
      end
      object btn_Logo: TBitBtn
        Left = 26
        Top = 159
        Width = 129
        Height = 25
        Caption = 'Localizar Logo'
        TabOrder = 7
        OnClick = btn_LogoClick
      end
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 438
    Width = 714
    Height = 49
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 287
    ExplicitWidth = 913
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
      Left = 551
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
    Left = 840
    Top = 56
  end
  object OPD_LocalizaLogo: TOpenPictureDialog
    DefaultExt = '*.bmp'
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Left = 232
    Top = 152
  end
end
