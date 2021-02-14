unit UOperador;

interface

Uses Winapi.Messages, Vcl.Dialogs, System.SysUtils, UConecta, FireDAC.Stan.Intf,
     FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
     FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
     Data.DB, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
     FireDAC.Comp.Client, UDMPrincipal;

type
  TOperador = class

  private
   FCDOPERADOR : string;
   FDSOPERADOR : string;
   FCOMISSAO : Double;
   Conexao   : TConexao;
   QryAuxiliar : TFDQuery;
  public
    function GetCDOPERADOR: string;
    function GetDSOPERADOR: string;
    function GetCOMISSAO: Double;
    procedure SetCDOPERADOR(const Value: string);
    procedure SetDSOPERADOR(const Value: string);
    procedure SetCOMISSAO(const Value: Double);
    procedure GravaDados(const Value: string; sEcluirID: string='');
    property CDOPERADOR: string read GetCDOPERADOR write SetCDOPERADOR;
    property DSOPERADOR: String read GetDSOPERADOR write SetDSOPERADOR;
    property COMISSAO: double read GetCOMISSAO write SetCOMISSAO;
  protected

  published
    constructor Create;

end;

implementation

{ TOperador }

constructor TOperador.Create;
begin
  QryAuxiliar := TFDQuery.Create(nil);
  QryAuxiliar.Connection := dm.DBConexao;
end;

function TOperador.GetCDOPERADOR: string;
begin
  Result := FCDOPERADOR;
end;

function TOperador.GetCOMISSAO: Double;
begin
  Result := FCOMISSAO;
end;

function TOperador.GetDSOPERADOR: string;
begin
  Result := FDSOPERADOR;
end;

procedure TOperador.GravaDados(const Value: string; sEcluirID: string);
begin
  try
  if Value = 'Novo' then
    begin
      QryAuxiliar.Close;
      QryAuxiliar.SQL.Clear;
      QryAuxiliar.SQL.Add('INSERT INTO TB_OPERADOR (CD_OPERADOR, DS_OPERADOR, COMISSAO) ');
      QryAuxiliar.SQL.Add('       VALUES (:CD_OPERADOR, :DS_OPERADOR, :COMISSAO) ');
      QryAuxiliar.ParamByName('CD_OPERADOR').AsString      := GetCDOPERADOR;
      QryAuxiliar.ParamByName('DS_OPERADOR').AsString      := GetDSOPERADOR;
      QryAuxiliar.ParamByName('COMISSAO').AsString         := FloatToStr(GetCOMISSAO);
      QryAuxiliar.ExecSQL();
    end
   else
     if Value = 'Editar' then
       begin
         QryAuxiliar.Close;
         QryAuxiliar.SQL.Clear;
         QryAuxiliar.SQL.Add('UPDATE TB_OPERADOR ');
         QryAuxiliar.SQL.Add('SET DS_OPERADOR     =:DS_OPERADOR, ');
         QryAuxiliar.SQL.Add('    COMISSAO        =:COMISSAO  ');
         QryAuxiliar.SQL.Add('WHERE CD_OPERADOR=:CD_OPERADOR ');
         QryAuxiliar.ParamByName('CD_OPERADOR').AsString      := GetCDOPERADOR;
         QryAuxiliar.ParamByName('DS_OPERADOR').AsString      := GetDSOPERADOR;
         QryAuxiliar.ParamByName('COMISSAO').AsString         := FloatToStr(GetCOMISSAO);
         QryAuxiliar.ExecSQL();
       end
   else
     if Value = 'Excluir' then
       begin
         QryAuxiliar.Close;
         QryAuxiliar.SQL.Clear;
         QryAuxiliar.SQL.Add('DELETE FROM TB_OPERADOR WHERE CD_OPERADOR=:CD_OPERADOR');
         QryAuxiliar.ParamByName('CD_OPERADOR').AsString := sEcluirID;
         QryAuxiliar.ExecSQL();
       end;
  except
    on E: Exception do
    ShowMessage('Ocorreu um erro Inesperado. (GravaCadastroOperador): '+E.Message);
  end;
end;

procedure TOperador.SetCDOPERADOR(const Value: string);
begin
  FCDOPERADOR := Value;
end;

procedure TOperador.SetCOMISSAO(const Value: Double);
begin
  FCOMISSAO := Value;
end;

procedure TOperador.SetDSOPERADOR(const Value: string);
begin
  FDSOPERADOR := Value;
end;

end.
