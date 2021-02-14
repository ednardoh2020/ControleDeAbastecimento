unit UProdutos;

interface

Uses Winapi.Messages, Vcl.Dialogs, System.SysUtils, UConecta, FireDAC.Stan.Intf,
     FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
     FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
     Data.DB, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
     FireDAC.Comp.Client, UDMPrincipal;

type
  TProdutos = class

  private
   FCDPRODUTO : string;
   FDSPRODUTO : string;
   FDSREDUZIDOPRODUTO : string;
   FUNIDADEMEDIDA : string;
   FQTDESTOQUE : Double;
   FPRCPRODUTO : Double;
   Conexao   : TConexao;
   QryAuxiliar : TFDQuery;
  public
    function GetCDPRODUTO: string;
    function GetDSPRODUTO: string;
    function GetDSREDUZIDOPRODUTO: string;
    function GetUNIDADEMEDIDA: string;
    function GetQTDESTOQUE: Double;
    function GetPRCPRODUTO: Double;
    procedure SetCDPRODUTO(const Value: string);
    procedure SetDSPRODUTO(const Value: string);
    procedure SetDSREDUZIDOPRODUTO(const Value: string);
    procedure SetUNIDADEMEDIDA(const Value: string);
    procedure SetQTDESTOQUE(const Value: Double);
    procedure SetPRCPRODUTO(const Value: Double);
    procedure GravaDados(const Value: string; sEcluirID: string='');
    property CDPRODUTO: string read GetCDPRODUTO write SetCDPRODUTO;
    property DSPRODUTO: String read GetDSPRODUTO write SetDSPRODUTO;
    property DSREDUZIDOPRODUTO: String read GetDSREDUZIDOPRODUTO write SetDSREDUZIDOPRODUTO;
    property UNIDADEMEDIDA: String read GetUNIDADEMEDIDA write SetUNIDADEMEDIDA;
    property QTDESTOQUE: Double read GetQTDESTOQUE write SetQTDESTOQUE;
    property PRCPRODUTO: Double read GetPRCPRODUTO write SetPRCPRODUTO;
  protected

  published
    constructor Create;

end;

implementation

{ TProdutos }

constructor TProdutos.Create;
begin
  QryAuxiliar := TFDQuery.Create(nil);
  QryAuxiliar.Connection := dm.DBConexao;
end;

function TProdutos.GetCDPRODUTO: string;
begin
  Result := FCDPRODUTO;
end;

function TProdutos.GetDSPRODUTO: string;
begin
  Result := FDSPRODUTO;
end;

function TProdutos.GetDSREDUZIDOPRODUTO: string;
begin
  Result := FDSREDUZIDOPRODUTO;
end;

function TProdutos.GetPRCPRODUTO: Double;
begin
  Result := FPRCPRODUTO;
end;

function TProdutos.GetQTDESTOQUE: Double;
begin
  Result := FQTDESTOQUE;
end;

function TProdutos.GetUNIDADEMEDIDA: string;
begin
  Result := FUNIDADEMEDIDA;
end;

procedure TProdutos.GravaDados(const Value: string; sEcluirID: string);
begin
  try
  if Value = 'Novo' then
    begin
      QryAuxiliar.Close;
      QryAuxiliar.SQL.Clear;
      QryAuxiliar.SQL.Add('INSERT INTO TB_PRODUTOS (CD_PRODUTO, DS_PRODUTO, DS_REDUZIDO_PRODUTO, UNIDADE_MEDIDA, QTD_ESTOQUE, PRC_PRODUTO) ');
      QryAuxiliar.SQL.Add('       VALUES (:CD_PRODUTO, :DS_PRODUTO, :DS_REDUZIDO_PRODUTO, :UNIDADE_MEDIDA, :QTD_ESTOQUE, :PRC_PRODUTO) ');
      QryAuxiliar.ParamByName('CD_PRODUTO').AsString            := GetCDPRODUTO;
      QryAuxiliar.ParamByName('DS_PRODUTO').AsString            := GetDSPRODUTO;
      QryAuxiliar.ParamByName('DS_REDUZIDO_PRODUTO').AsString   := GetDSREDUZIDOPRODUTO;
      QryAuxiliar.ParamByName('UNIDADE_MEDIDA').AsString        := GetUNIDADEMEDIDA;
      QryAuxiliar.ParamByName('QTD_ESTOQUE').AsFloat            := GetQTDESTOQUE;
      QryAuxiliar.ParamByName('PRC_PRODUTO').AsFloat            := GetPRCPRODUTO;
      QryAuxiliar.ExecSQL();
    end
   else
     if Value = 'Editar' then
       begin
         QryAuxiliar.Close;
         QryAuxiliar.SQL.Clear;
         QryAuxiliar.SQL.Add('UPDATE TB_PRODUTOS ');
         QryAuxiliar.SQL.Add('SET DS_PRODUTO                =:DS_PRODUTO, ');
         QryAuxiliar.SQL.Add('    DS_REDUZIDO_PRODUTO       =:DS_REDUZIDO_PRODUTO,  ');
         QryAuxiliar.SQL.Add('    UNIDADE_MEDIDA            =:UNIDADE_MEDIDA,  ');
         QryAuxiliar.SQL.Add('    QTD_ESTOQUE               =:QTD_ESTOQUE,  ');
         QryAuxiliar.SQL.Add('    PRC_PRODUTO               =:PRC_PRODUTO  ');
         QryAuxiliar.SQL.Add('WHERE CD_PRODUTO=:CD_PRODUTO ');
         QryAuxiliar.ParamByName('CD_PRODUTO').AsString            := GetCDPRODUTO;
         QryAuxiliar.ParamByName('DS_PRODUTO').AsString            := GetDSPRODUTO;
         QryAuxiliar.ParamByName('DS_REDUZIDO_PRODUTO').AsString   := GetDSREDUZIDOPRODUTO;
         QryAuxiliar.ParamByName('UNIDADE_MEDIDA').AsString        := GetUNIDADEMEDIDA;
         QryAuxiliar.ParamByName('QTD_ESTOQUE').AsFloat            := GetQTDESTOQUE;
         QryAuxiliar.ParamByName('PRC_PRODUTO').AsFloat            := GetPRCPRODUTO;
         QryAuxiliar.ExecSQL();
       end
   else
     if Value = 'Excluir' then
       begin
         QryAuxiliar.Close;
         QryAuxiliar.SQL.Clear;
         QryAuxiliar.SQL.Add('DELETE FROM TB_PRODUTOS WHERE CD_PRODUTO=:CD_PRODUTO');
         QryAuxiliar.ParamByName('CD_PRODUTO').AsString := sEcluirID;
         QryAuxiliar.ExecSQL();
       end;
  except
    on E: Exception do
    ShowMessage('Ocorreu um erro Inesperado. (GravaCadastroProdutos): '+E.Message);
  end;
end;

procedure TProdutos.SetCDPRODUTO(const Value: string);
begin
  FCDPRODUTO := Value;
end;

procedure TProdutos.SetDSPRODUTO(const Value: string);
begin
  FDSPRODUTO := Value;
end;

procedure TProdutos.SetDSREDUZIDOPRODUTO(const Value: string);
begin
  FDSREDUZIDOPRODUTO := Value;
end;

procedure TProdutos.SetPRCPRODUTO(const Value: Double);
begin
  FPRCPRODUTO := Value;
end;

procedure TProdutos.SetQTDESTOQUE(const Value: Double);
begin
  FQTDESTOQUE := Value;
end;

procedure TProdutos.SetUNIDADEMEDIDA(const Value: string);
begin
  FUNIDADEMEDIDA := Value;
end;

end.
