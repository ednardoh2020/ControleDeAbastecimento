unit UBombas;

interface

Uses Winapi.Messages, Vcl.Dialogs, System.SysUtils, UConecta, FireDAC.Stan.Intf,
     FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
     FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
     Data.DB, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
     FireDAC.Comp.Client, UDMPrincipal;

type
  TBombas = class

  private
   FCDBOMBA  : string;
   FDSBOMBA  : string;
   FCDTANQUE : string;
   Conexao   : TConexao;
   QryAuxiliar : TFDQuery;
  public
    function GetCDBOMBA: string;
    function GetDSBOMBA: string;
    function GetCDTANQUE: string;
    procedure SetCDBOMBA(const Value: string);
    procedure SetDSBOMBA(const Value: string);
    procedure SetCDTANQUE(const Value: string);
    procedure GravaDados(const Value: string; sEcluirID: string='');
    property CDBOMBA: string read GetCDBOMBA write SetCDBOMBA;
    property DSBOMBA: String read GetDSBOMBA write SetDSBOMBA;
    property CDTANQUE: String read GetCDTANQUE write SetCDTANQUE;
  protected

  published
    constructor Create;
end;

implementation

{ TBombas }

constructor TBombas.Create;
begin
  QryAuxiliar := TFDQuery.Create(nil);
  QryAuxiliar.Connection := dm.DBConexao;
end;

function TBombas.GetCDBOMBA: string;
begin
  Result := FCDBOMBA;
end;

function TBombas.GetCDTANQUE: string;
begin
  Result := FCDTANQUE;
end;

function TBombas.GetDSBOMBA: string;
begin
  Result := FDSBOMBA;
end;

procedure TBombas.GravaDados(const Value: string; sEcluirID: string='');
begin
try
  if Value = 'Novo' then
    begin
      QryAuxiliar.Close;
      QryAuxiliar.SQL.Clear;
      QryAuxiliar.SQL.Add('INSERT INTO TB_BOMBA (CD_BOMBA, DS_BOMBA, CD_TANQUE) ');
      QryAuxiliar.SQL.Add('       VALUES (:CD_BOMBA, :DS_BOMBA, :CD_TANQUE) ');
      QryAuxiliar.ParamByName('CD_BOMBA').AsString      := GetCDBOMBA;
      QryAuxiliar.ParamByName('DS_BOMBA').AsString      := GetDSBOMBA;
      QryAuxiliar.ParamByName('CD_TANQUE').AsString     := GetCDTANQUE;
      QryAuxiliar.ExecSQL();
    end
   else
     if Value = 'Editar' then
       begin
         QryAuxiliar.Close;
         QryAuxiliar.SQL.Clear;
         QryAuxiliar.SQL.Add('UPDATE TB_BOMBA ');
         QryAuxiliar.SQL.Add('SET DS_BOMBA        =:DS_BOMBA, ');
         QryAuxiliar.SQL.Add('    CD_TANQUE       =:CD_TANQUE  ');
         QryAuxiliar.SQL.Add('WHERE CD_BOMBA=:CD_BOMBA ');
         QryAuxiliar.ParamByName('CD_BOMBA').AsString       := GetCDBOMBA;
         QryAuxiliar.ParamByName('DS_BOMBA').AsString       := GetDSBOMBA;
         QryAuxiliar.ParamByName('CD_TANQUE').AsString      := GetCDTANQUE;
         QryAuxiliar.ExecSQL();
       end
   else
     if Value = 'Excluir' then
       begin
        QryAuxiliar.Close;
        QryAuxiliar.SQL.Clear;
        QryAuxiliar.SQL.Add('DELETE FROM TB_BOMBA WHERE CD_BOMBA=:CD_BOMBA');
        QryAuxiliar.ParamByName('CD_BOMBA').AsString := sEcluirID;
        QryAuxiliar.ExecSQL();
       end;
  except
    on E: Exception do
    ShowMessage('Ocorreu um erro Inesperado. (GravaCadastroBombas): '+E.Message);
  end;
end;

procedure TBombas.SetCDBOMBA(const Value: string);
begin
  FCDBOMBA :=Value;
end;

procedure TBombas.SetCDTANQUE(const Value: string);
begin
  FCDTANQUE :=Value;
end;

procedure TBombas.SetDSBOMBA(const Value: string);
begin
  FDSBOMBA :=Value;
end;

end.
