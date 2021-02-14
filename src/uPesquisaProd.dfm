object frmPes_Produto: TfrmPes_Produto
  Left = 0
  Top = 0
  Caption = 'Pesquisa de Produtos'
  ClientHeight = 317
  ClientWidth = 839
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
    Top = 268
    Width = 839
    Height = 49
    Align = alBottom
    TabOrder = 0
    object btn_Selecionar: TButton
      Left = 271
      Top = 11
      Width = 137
      Height = 25
      Caption = 'Selecionar produto  - F5'
      TabOrder = 0
      OnClick = btn_SelecionarClick
    end
    object Button3: TButton
      Left = 423
      Top = 10
      Width = 137
      Height = 25
      Caption = 'Fechar <Esc>'
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 65
    Width = 839
    Height = 203
    Align = alClient
    TabOrder = 1
    object DBG_Produto: TDBGrid
      Left = 1
      Top = 1
      Width = 837
      Height = 201
      Align = alClient
      DataSource = ds_Produto
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsBold]
      OnKeyPress = DBG_ProdutoKeyPress
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 839
    Height = 65
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 14
      Width = 198
      Height = 13
      Caption = 'Digite o c'#243'digo ou a descri'#231#227'o do produto'
    end
    object edt_Produto: TEdit
      Left = 16
      Top = 32
      Width = 537
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnKeyPress = edt_ProdutoKeyPress
    end
    object Button1: TButton
      Left = 565
      Top = 30
      Width = 105
      Height = 25
      Caption = 'Consultar - F3'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object Qry_Produto: TFDQuery
    Connection = DM.DBConexao
    SQL.Strings = (
      'select CD_PRODUTO,'
      '       DS_REDUZIDO_PRODUTO,'
      '       UNIDADE_MEDIDA,'
      '       QTD_ESTOQUE,'
      '       PRC_PRODUTO'
      'FROM TB_PRODUTOS'
      'WHERE CD_PRODUTO = '#39'  '#39)
    Left = 704
    Top = 8
    object Qry_ProdutoCD_PRODUTO: TStringField
      DisplayLabel = 'C'#243'd. Produto'
      DisplayWidth = 18
      FieldName = 'CD_PRODUTO'
      Origin = 'CD_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 13
    end
    object Qry_ProdutoDS_REDUZIDO_PRODUTO: TStringField
      DisplayLabel = 'Descri'#231#227'o do Produto'
      DisplayWidth = 42
      FieldName = 'DS_REDUZIDO_PRODUTO'
      Origin = 'DS_REDUZIDO_PRODUTO'
      Size = 30
    end
    object Qry_ProdutoUNIDADE_MEDIDA: TStringField
      DisplayLabel = 'Unidade'
      DisplayWidth = 9
      FieldName = 'UNIDADE_MEDIDA'
      Origin = 'UNIDADE_MEDIDA'
      Size = 10
    end
    object Qry_ProdutoQTD_ESTOQUE: TBCDField
      DisplayLabel = 'Qtde. Estoque'
      DisplayWidth = 13
      FieldName = 'QTD_ESTOQUE'
      Origin = 'QTD_ESTOQUE'
      DisplayFormat = ',0.000'
      Precision = 18
    end
    object Qry_ProdutoPRC_PRODUTO: TBCDField
      DisplayLabel = 'Pre'#231'o Produto'
      DisplayWidth = 26
      FieldName = 'PRC_PRODUTO'
      Origin = 'PRC_PRODUTO'
      Precision = 18
    end
  end
  object ds_Produto: TDataSource
    DataSet = Qry_Produto
    Left = 736
    Top = 8
  end
end
