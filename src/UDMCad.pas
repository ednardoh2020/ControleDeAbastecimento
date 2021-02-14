unit UDMCad;

interface

uses
  System.SysUtils, System.Classes, UDMPrincipal, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDMCad = class(TDataModule)
    QrParametro: TFDQuery;
    QrParametroCNPJ_EMPR: TStringField;
    QrParametroCD_OPERADOR: TStringField;
    QrParametroCD_CAIXA: TStringField;
    QrParametroDT_ABERTURA: TDateField;
    QrParametroSLD_INICIAL: TBCDField;
    QrParametroIMPOSTO_PADR: TCurrencyField;
    QrParametroCD_FPGTO: TStringField;
    ds_Parametro: TDataSource;
    QrParametroDESC_PADRAO: TBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCad: TDMCad;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
