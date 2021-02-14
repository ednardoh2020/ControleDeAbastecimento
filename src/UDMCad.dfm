object DMCad: TDMCad
  OldCreateOrder = False
  Height = 311
  Width = 454
  object QrParametro: TFDQuery
    Connection = DM.DBConexao
    SQL.Strings = (
      'SELECT * FROM tb_parametro')
    Left = 24
    Top = 16
    object QrParametroCNPJ_EMPR: TStringField
      FieldName = 'CNPJ_EMPR'
      Origin = 'CNPJ_EMPR'
      Size = 30
    end
    object QrParametroCD_OPERADOR: TStringField
      FieldName = 'CD_OPERADOR'
      Origin = 'CD_OPERADOR'
      Size = 10
    end
    object QrParametroCD_CAIXA: TStringField
      FieldName = 'CD_CAIXA'
      Origin = 'CD_CAIXA'
      Size = 10
    end
    object QrParametroDT_ABERTURA: TDateField
      FieldName = 'DT_ABERTURA'
      Origin = 'DT_ABERTURA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object QrParametroSLD_INICIAL: TBCDField
      FieldName = 'SLD_INICIAL'
      Origin = 'SLD_INICIAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QrParametroIMPOSTO_PADR: TCurrencyField
      FieldName = 'IMPOSTO_PADR'
      Origin = 'IMPOSTO_PADR'
      DisplayFormat = ',0.000'
    end
    object QrParametroCD_FPGTO: TStringField
      FieldName = 'CD_FPGTO'
      Origin = 'CD_FPGTO'
      Size = 10
    end
    object QrParametroDESC_PADRAO: TBCDField
      FieldName = 'DESC_PADRAO'
      Origin = 'DESC_PADRAO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
  end
  object ds_Parametro: TDataSource
    DataSet = QrParametro
    Left = 88
    Top = 16
  end
end
