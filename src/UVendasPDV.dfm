object frmMov_Vendas: TfrmMov_Vendas
  Left = 0
  Top = 0
  Caption = 'Ponto de Vendas'
  ClientHeight = 749
  ClientWidth = 1367
  Color = clSilver
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1367
    Height = 749
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pn_Top: TPanel
      Left = 0
      Top = 0
      Width = 1367
      Height = 95
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      DesignSize = (
        1367
        95)
      object Shape1: TShape
        Left = 29
        Top = 9
        Width = 1324
        Height = 72
        Anchors = [akLeft, akTop, akRight, akBottom]
        Brush.Color = 6010624
        Shape = stRoundRect
      end
      object lblMessagem: TLabel
        Left = 40
        Top = 11
        Width = 1289
        Height = 62
        Alignment = taCenter
        AutoSize = False
        Caption = 'Caixa Livre'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -57
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
    end
    object pn_Botton: TPanel
      Left = 0
      Top = 673
      Width = 1367
      Height = 76
      Align = alBottom
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      object Label6: TLabel
        Left = 100
        Top = -267
        Width = 91
        Height = 39
        Alignment = taRightJustify
        Caption = 'Pre'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -32
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 889
        Top = 31
        Width = 185
        Height = 35
        Caption = 'Total Venda:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -29
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel2: TPanel
        Left = 15
        Top = 16
        Width = 170
        Height = 49
        Caption = 'F3 - Abre Venda'
        Color = 6010624
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
      object Panel3: TPanel
        Left = 189
        Top = 16
        Width = 138
        Height = 49
        Caption = 'F4 - Produto'
        Color = 6010624
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
      end
      object Panel8: TPanel
        Left = 331
        Top = 16
        Width = 130
        Height = 49
        Caption = 'F5 - Bomba'
        Color = 6010624
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
      end
      object Panel9: TPanel
        Left = 465
        Top = 16
        Width = 128
        Height = 49
        Caption = 'F6 - FPGTO'
        Color = 6010624
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 3
      end
      object Panel10: TPanel
        Left = 597
        Top = 16
        Width = 195
        Height = 49
        Caption = 'F7 - Finaliza Venda'
        Color = 6010624
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 4
      end
      object EdtTotVenda: TEdit
        Left = 1080
        Top = 16
        Width = 259
        Height = 50
        TabStop = False
        Alignment = taRightJustify
        Color = clYellow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -35
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
        Text = '0,00'
      end
    end
    object pn_Grid: TPanel
      Left = 0
      Top = 95
      Width = 817
      Height = 578
      Align = alLeft
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
      object Shape3: TShape
        Left = 29
        Top = 105
        Width = 756
        Height = 473
        Align = alClient
        ExplicitLeft = 47
        ExplicitTop = 6
        ExplicitWidth = 744
        ExplicitHeight = 555
      end
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 817
        Height = 105
        Align = alTop
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        object Label2: TLabel
          Left = 32
          Top = 6
          Width = 208
          Height = 39
          Caption = 'C'#243'd. Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -32
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 501
          Top = 11
          Width = 109
          Height = 29
          Caption = 'Qtd[F10]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 692
          Top = 6
          Width = 91
          Height = 39
          Alignment = taRightJustify
          Caption = 'Pre'#231'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -32
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 349
          Top = 6
          Width = 112
          Height = 39
          Caption = 'Bomba'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -32
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edt_CodigoProd: TEdit
          Left = 29
          Top = 49
          Width = 314
          Height = 50
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -35
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          HideSelection = False
          ParentFont = False
          TabOrder = 0
          OnKeyPress = edt_CodigoProdKeyPress
        end
        object Edt_Qtde: TEdit
          Left = 498
          Top = 48
          Width = 115
          Height = 50
          TabStop = False
          Color = clYellow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -35
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          Text = '1,000'
          OnExit = Edt_QtdeExit
          OnKeyPress = Edt_QtdeKeyPress
        end
        object Edt_PrecProd: TEdit
          Left = 616
          Top = 48
          Width = 169
          Height = 50
          TabStop = False
          Alignment = taRightJustify
          Color = clYellow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -35
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          Text = '0,0000'
          OnKeyPress = Edt_PrecProdKeyPress
        end
        object edt_Bomba: TEdit
          Left = 349
          Top = 48
          Width = 143
          Height = 50
          TabStop = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -35
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          OnExit = edt_BombaExit
          OnKeyPress = edt_BombaKeyPress
        end
      end
      object Panel4: TPanel
        Left = 785
        Top = 105
        Width = 32
        Height = 473
        Align = alRight
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
      end
      object pn_left: TPanel
        Left = 0
        Top = 105
        Width = 29
        Height = 473
        Align = alLeft
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 2
      end
      object DBGrid1: TDBGrid
        Left = 29
        Top = 105
        Width = 756
        Height = 473
        Align = alClient
        DataSource = ds_Venda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_PRODUTO'
            Width = 119
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DS_PRODREDUZIDO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNID_PROD'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_PROD'
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRC_PRODUTO'
            Width = 112
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DS_BOMBA'
            Width = 169
            Visible = True
          end>
      end
    end
    object pn_Cupom: TPanel
      Left = 817
      Top = 95
      Width = 550
      Height = 578
      Align = alClient
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 3
      object Shape4: TShape
        Left = 0
        Top = 64
        Width = 522
        Height = 514
        Align = alClient
        Shape = stRoundRect
        ExplicitLeft = 24
        ExplicitTop = 43
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 550
        Height = 64
        Align = alTop
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        object Label1: TLabel
          Left = 24
          Top = 6
          Width = 112
          Height = 25
          Caption = 'Operador :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 310
          Top = 6
          Width = 73
          Height = 25
          Caption = 'Caixa :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edt_Operador: TEdit
          Left = 140
          Top = 0
          Width = 121
          Height = 37
          TabStop = False
          Color = 6599167
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = '0000001'
        end
        object edt_Caixa: TEdit
          Left = 388
          Top = 0
          Width = 121
          Height = 37
          TabStop = False
          Color = 6599167
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Text = '0000001'
        end
      end
      object Panel6: TPanel
        Left = 522
        Top = 64
        Width = 28
        Height = 514
        Align = alRight
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        ExplicitLeft = 528
        ExplicitTop = 58
      end
      object mem_Cupom: TMemo
        Left = 22
        Top = 91
        Width = 487
        Height = 463
        BorderStyle = bsNone
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Lines.Strings = (
          '')
        ParentFont = False
        TabOrder = 2
      end
    end
  end
  object QryParamentro: TFDQuery
    Connection = DM.DBConexao
    SQL.Strings = (
      'SELECT * FROM tb_parametro')
    Left = 1024
    Top = 16
    object QryParamentroCNPJ_EMPR: TStringField
      FieldName = 'CNPJ_EMPR'
      Origin = 'CNPJ_EMPR'
      Size = 30
    end
    object QryParamentroCD_OPERADOR: TStringField
      FieldName = 'CD_OPERADOR'
      Origin = 'CD_OPERADOR'
      Size = 10
    end
    object QryParamentroCD_CAIXA: TStringField
      FieldName = 'CD_CAIXA'
      Origin = 'CD_CAIXA'
      Size = 10
    end
    object QryParamentroDT_ABERTURA: TDateField
      FieldName = 'DT_ABERTURA'
      Origin = 'DT_ABERTURA'
    end
    object QryParamentroSLD_INICIAL: TBCDField
      FieldName = 'SLD_INICIAL'
      Origin = 'SLD_INICIAL'
      Precision = 18
      Size = 2
    end
    object QryParamentroIMPOSTO_PADR: TCurrencyField
      FieldName = 'IMPOSTO_PADR'
      Origin = 'IMPOSTO_PADR'
    end
    object QryParamentroCD_FPGTO: TStringField
      FieldName = 'CD_FPGTO'
      Origin = 'CD_FPGTO'
      Size = 10
    end
    object QryParamentroDESC_PADRAO: TBCDField
      FieldName = 'DESC_PADRAO'
      Origin = 'DESC_PADRAO'
      Precision = 18
      Size = 2
    end
  end
  object Qry_VENDA: TFDQuery
    Connection = DM.DBConexao
    SQL.Strings = (
      'select * from tb_movimentacao_vendas'
      'where CD_MOVVENDAS=:CD_MOVVENDAS')
    Left = 1096
    Top = 16
    ParamData = <
      item
        Name = 'CD_MOVVENDAS'
        ParamType = ptInput
      end>
    object Qry_VENDACD_MOVVENDAS: TStringField
      FieldName = 'CD_MOVVENDAS'
      Origin = 'CD_MOVVENDAS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object Qry_VENDADT_MOVVENDAS: TDateField
      FieldName = 'DT_MOVVENDAS'
      Origin = 'DT_MOVVENDAS'
    end
    object Qry_VENDACD_TANQUE: TStringField
      FieldName = 'CD_TANQUE'
      Origin = 'CD_TANQUE'
      Size = 10
    end
    object Qry_VENDACD_BOMBA: TStringField
      FieldName = 'CD_BOMBA'
      Origin = 'CD_BOMBA'
      Size = 10
    end
    object Qry_VENDACD_PRODUTO: TStringField
      DisplayLabel = 'C'#243'd. Produto'
      FieldName = 'CD_PRODUTO'
      Origin = 'CD_PRODUTO'
      Size = 13
    end
    object Qry_VENDACD_OPERADOR: TStringField
      FieldName = 'CD_OPERADOR'
      Origin = 'CD_OPERADOR'
      Size = 10
    end
    object Qry_VENDACD_CAIXA: TStringField
      FieldName = 'CD_CAIXA'
      Origin = 'CD_CAIXA'
      Size = 10
    end
    object Qry_VENDACD_FPGTO: TStringField
      FieldName = 'CD_FPGTO'
      Origin = 'CD_FPGTO'
      Size = 10
    end
    object Qry_VENDADS_HISTORICO: TStringField
      FieldName = 'DS_HISTORICO'
      Origin = 'DS_HISTORICO'
      Size = 100
    end
    object Qry_VENDAVALOR_VENDA: TBCDField
      FieldName = 'VALOR_VENDA'
      Origin = 'VALOR_VENDA'
      Precision = 18
      Size = 2
    end
    object Qry_VENDADESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      Precision = 18
      Size = 2
    end
    object Qry_VENDATROCO: TBCDField
      FieldName = 'TROCO'
      Origin = 'TROCO'
      Precision = 18
      Size = 2
    end
    object Qry_VENDAQTD_PROD: TBCDField
      DisplayLabel = 'Qtde. Prod'
      FieldName = 'QTD_PROD'
      Origin = 'QTD_PROD'
      Precision = 18
    end
    object Qry_VENDAPRC_PROD: TBCDField
      FieldName = 'PRC_PROD'
      Origin = 'PRC_PROD'
      Precision = 18
    end
    object Qry_VENDAVALOR_IMPOSTO: TBCDField
      FieldName = 'VALOR_IMPOSTO'
      Origin = 'VALOR_IMPOSTO'
      Precision = 18
    end
    object Qry_VENDADS_PRODUTO: TStringField
      FieldKind = fkLookup
      FieldName = 'DS_PRODUTO'
      LookupDataSet = Qry_Produtos
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'DS_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 100
      Lookup = True
    end
    object Qry_VENDADS_PRODREDUZIDO: TStringField
      DisplayLabel = 'Descri'#231#227'o do Produto'
      FieldKind = fkLookup
      FieldName = 'DS_PRODREDUZIDO'
      LookupDataSet = Qry_Produtos
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'DS_REDUZIDO_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 30
      Lookup = True
    end
    object Qry_VENDAUNID_PROD: TStringField
      DisplayLabel = 'Unid. Prod'
      FieldKind = fkLookup
      FieldName = 'UNID_PROD'
      LookupDataSet = Qry_Produtos
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'UNIDADE_MEDIDA'
      KeyFields = 'CD_PRODUTO'
      Size = 10
      Lookup = True
    end
    object Qry_VENDAPRC_PRODUTO: TBCDField
      DisplayLabel = 'Prc. Produto'
      FieldKind = fkLookup
      FieldName = 'PRC_PRODUTO'
      LookupDataSet = Qry_Produtos
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'PRC_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      DisplayFormat = ',0.0000'
      Lookup = True
    end
    object Qry_VENDADS_BOMBA: TStringField
      DisplayLabel = 'BOMBA'
      FieldKind = fkLookup
      FieldName = 'DS_BOMBA'
      LookupDataSet = Qry_Bomba
      LookupKeyFields = 'CD_BOMBA'
      LookupResultField = 'CD_BOMBA'
      KeyFields = 'CD_BOMBA'
      Size = 60
      Lookup = True
    end
  end
  object ds_Venda: TDataSource
    DataSet = Qry_VENDA
    Left = 1160
    Top = 16
  end
  object Qry_Produtos: TFDQuery
    Active = True
    Connection = DM.DBConexao
    SQL.Strings = (
      'select * FROM TB_PRODUTOS')
    Left = 944
    Top = 16
    object Qry_ProdutosCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'CD_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 13
    end
    object Qry_ProdutosDS_PRODUTO: TStringField
      FieldName = 'DS_PRODUTO'
      Origin = 'DS_PRODUTO'
      Size = 100
    end
    object Qry_ProdutosDS_REDUZIDO_PRODUTO: TStringField
      FieldName = 'DS_REDUZIDO_PRODUTO'
      Origin = 'DS_REDUZIDO_PRODUTO'
      Size = 30
    end
    object Qry_ProdutosUNIDADE_MEDIDA: TStringField
      FieldName = 'UNIDADE_MEDIDA'
      Origin = 'UNIDADE_MEDIDA'
      Size = 10
    end
    object Qry_ProdutosQTD_ESTOQUE: TBCDField
      FieldName = 'QTD_ESTOQUE'
      Origin = 'QTD_ESTOQUE'
      Precision = 18
    end
    object Qry_ProdutosPRC_PRODUTO: TBCDField
      FieldName = 'PRC_PRODUTO'
      Origin = 'PRC_PRODUTO'
      Precision = 18
    end
  end
  object Qry_Bomba: TFDQuery
    Active = True
    Connection = DM.DBConexao
    SQL.Strings = (
      'SELECT * FROM TB_BOMBA')
    Left = 880
    Top = 16
    object Qry_BombaCD_BOMBA: TStringField
      FieldName = 'CD_BOMBA'
      Origin = 'CD_BOMBA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object Qry_BombaDS_BOMBA: TStringField
      FieldName = 'DS_BOMBA'
      Origin = 'DS_BOMBA'
      Size = 60
    end
    object Qry_BombaCD_TANQUE: TStringField
      FieldName = 'CD_TANQUE'
      Origin = 'CD_TANQUE'
      Size = 10
    end
  end
  object QryAuxiliar: TFDQuery
    Connection = DM.DBConexao
    Left = 824
    Top = 16
  end
  object Qry_Empresa: TFDQuery
    Connection = DM.DBConexao
    SQL.Strings = (
      'SELECT * FROM TB_EMPRESA'
      'WHERE CNPJ=:CNPJ')
    Left = 768
    Top = 16
    ParamData = <
      item
        Name = 'CNPJ'
        ParamType = ptInput
      end>
    object Qry_EmpresaCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Required = True
      Size = 30
    end
    object Qry_EmpresaRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'RAZAO_SOCIAL'
      Size = 100
    end
    object Qry_EmpresaNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Origin = 'NOME_FANTASIA'
      Size = 60
    end
    object Qry_EmpresaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 100
    end
    object Qry_EmpresaCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 10
    end
    object Qry_EmpresaTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Size = 30
    end
    object Qry_EmpresaIE: TStringField
      FieldName = 'IE'
      Origin = 'IE'
    end
    object Qry_EmpresaLOGOMARCA: TBlobField
      FieldName = 'LOGOMARCA'
      Origin = 'LOGOMARCA'
    end
  end
end
