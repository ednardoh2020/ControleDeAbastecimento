unit UTanques;

interface

Uses Winapi.Messages, Vcl.Dialogs, System.SysUtils, UConecta, FireDAC.Stan.Intf,
     FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
     FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
     Data.DB, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
     FireDAC.Comp.Client, UDMPrincipal;

type
  TTanques = class

  private
   FCDTanque : string;
   FTPCombustivel : string;
   FTotalLitros : Double;
   Conexao   : TConexao;
   QryAuxiliar : TFDQuery;
  public
    function GetCDTanque: string;
    function GetTPCombustivel: string;
    function GetTotalLitros: Double;
    procedure SetCDTanque(const Value: string);
    procedure SetTPCombustivel(const Value: string);
    procedure SetTotalLitros(const Value: Double);
    procedure GravaDados(const Value: string; sEcluirID: string='');
    property CDTanque: string read GetCDTanque write SetCDTanque;
    property TPCombustivel: String read GetTPCombustivel write SetTPCombustivel;
    property TotalLitros: double read GetTotalLitros write SetTotalLitros;
  protected

  published
    constructor Create;

end;

implementation

{ TTanques }

constructor TTanques.Create;
begin
  QryAuxiliar := TFDQuery.Create(nil);
  QryAuxiliar.Connection := dm.DBConexao;
end;

function TTanques.GetCDTanque: string;
begin
  Result := FCDTanque;
end;

function TTanques.GetTotalLitros: Double;
begin
  Result := FTotalLitros;
end;

function TTanques.GetTPCombustivel: string;
begin
  Result := FTPCombustivel;
end;

procedure TTanques.GravaDados(const Value: string; sEcluirID: string);
begin
try
  if Value = 'Novo' then
    begin
      QryAuxiliar.Close;
      QryAuxiliar.SQL.Clear;
      QryAuxiliar.SQL.Add('INSERT INTO TB_TANQUE (CD_TANQUE, TP_COMBUSTIVEL, TOTAL_LITROS) ');
      QryAuxiliar.SQL.Add('       VALUES (:CD_TANQUE, :TP_COMBUSTIVEL, :TOTAL_LITROS) ');
      QryAuxiliar.ParamByName('CD_TANQUE').AsString      := GetCDTanque;
      QryAuxiliar.ParamByName('TP_COMBUSTIVEL').AsString := GetTPCombustivel;
      QryAuxiliar.ParamByName('TOTAL_LITROS').AsString   := FloatToStr(GetTotalLitros);
      QryAuxiliar.ExecSQL();
    end
   else
     if Value = 'Editar' then
       begin
         QryAuxiliar.Close;
         QryAuxiliar.SQL.Clear;
         QryAuxiliar.SQL.Add('UPDATE TB_TANQUE ');
         QryAuxiliar.SQL.Add('SET TP_COMBUSTIVEL     =:TP_COMBUSTIVEL, ');
         QryAuxiliar.SQL.Add('    TOTAL_LITROS       =:TOTAL_LITROS  ');
         QryAuxiliar.SQL.Add('WHERE CD_TANQUE=:CD_TANQUE ');
         QryAuxiliar.ParamByName('CD_TANQUE').AsString      := GetCDTanque;
         QryAuxiliar.ParamByName('TP_COMBUSTIVEL').AsString := GetTPCombustivel;
         QryAuxiliar.ParamByName('TOTAL_LITROS').AsString   := FloatToStr(GetTotalLitros);
         QryAuxiliar.ExecSQL();
       end
   else
     if Value = 'Excluir' then
       begin
         QryAuxiliar.Close;
         QryAuxiliar.SQL.Clear;
         QryAuxiliar.SQL.Add('DELETE FROM TB_TANQUE WHERE CD_TANQUE=:CD_TANQUE');
         QryAuxiliar.ParamByName('CD_TANQUE').AsString := sEcluirID;
         QryAuxiliar.ExecSQL();
       end;
  except
    on E: Exception do
    ShowMessage('Ocorreu um erro Inesperado. (GravaCadastroTanques): '+E.Message);
  end;
end;

procedure TTanques.SetCDTanque(const Value: string);
begin
  FCDTanque := Value;
end;

procedure TTanques.SetTotalLitros(const Value: Double);
begin
  FTotalLitros := Value;
end;

procedure TTanques.SetTPCombustivel(const Value: string);
begin
   FTPCombustivel := Value;
end;

end.
