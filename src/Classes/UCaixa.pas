unit UCaixa;

interface

Uses Winapi.Messages, Vcl.Dialogs, System.SysUtils, UConecta, FireDAC.Stan.Intf,
     FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
     FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
     Data.DB, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
     FireDAC.Comp.Client, UDMPrincipal;

type
  TCaixa = class

  private
   FCDCAIXA : string;
   FDSCAIXA : string;
   Conexao   : TConexao;
   QryAuxiliar : TFDQuery;
  public
    function GetCDCAIXA: string;
    function GetDSCAIXA: string;
    procedure SetCDCAIXA(const Value: string);
    procedure SetDSCAIXA(const Value: string);
    procedure GravaDados(const Value: string; sEcluirID: string='');
    property CDCAIXA: string read GetCDCAIXA write SetCDCAIXA;
    property DSCAIXA: String read GetDSCAIXA write SetDSCAIXA;
  protected

  published
    constructor Create;
end;

implementation

{ TCaixa }

constructor TCaixa.Create;
begin
  QryAuxiliar := TFDQuery.Create(nil);
  QryAuxiliar.Connection := dm.DBConexao;
end;

function TCaixa.GetCDCAIXA: string;
begin
  Result := FCDCAIXA;
end;

function TCaixa.GetDSCAIXA: string;
begin
  Result := FDSCAIXA;
end;

procedure TCaixa.GravaDados(const Value: string; sEcluirID: string);
begin
try
  if Value = 'Novo' then
    begin
      QryAuxiliar.Close;
      QryAuxiliar.SQL.Clear;
      QryAuxiliar.SQL.Add('INSERT INTO TB_CAIXA (CD_CAIXA, DS_CAIXA) ');
      QryAuxiliar.SQL.Add('       VALUES (:CD_CAIXA, :DS_CAIXA) ');
      QryAuxiliar.ParamByName('CD_CAIXA').AsString      := GetCDCAIXA;
      QryAuxiliar.ParamByName('DS_CAIXA').AsString      := GetDSCAIXA;
      QryAuxiliar.ExecSQL();
    end
   else
     if Value = 'Editar' then
       begin
         QryAuxiliar.Close;
         QryAuxiliar.SQL.Clear;
         QryAuxiliar.SQL.Add('UPDATE TB_CAIXA ');
         QryAuxiliar.SQL.Add('SET DS_CAIXA     =:DS_CAIXA ');
         QryAuxiliar.SQL.Add('WHERE CD_CAIXA   =:CD_CAIXA ');
         QryAuxiliar.ParamByName('CD_CAIXA').AsString      := GetCDCAIXA;
         QryAuxiliar.ParamByName('DS_CAIXA').AsString      := GetDSCAIXA;
         QryAuxiliar.ExecSQL();
       end
   else
     if Value = 'Excluir' then
       begin
         QryAuxiliar.Close;
         QryAuxiliar.SQL.Clear;
         QryAuxiliar.SQL.Add('DELETE FROM TB_CAIXA WHERE CD_CAIXA=:CD_CAIXA');
         QryAuxiliar.ParamByName('CD_CAIXA').AsString := sEcluirID;
         QryAuxiliar.ExecSQL();
       end;
  except
    on E: Exception do
    ShowMessage('Ocorreu um erro Inesperado. (GravaCadastroCaixa): '+E.Message);
  end;
end;

procedure TCaixa.SetCDCAIXA(const Value: string);
begin
  FCDCAIXA := Value;
end;

procedure TCaixa.SetDSCAIXA(const Value: string);
begin
  FDSCAIXA := Value;
end;

end.
