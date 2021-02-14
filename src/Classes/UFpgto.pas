unit UFpgto;

interface

Uses Winapi.Messages, Vcl.Dialogs, System.SysUtils, UConecta, FireDAC.Stan.Intf,
     FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
     FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
     Data.DB, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
     FireDAC.Comp.Client, UDMPrincipal;

type
  TFpgto = class

  private
   FCDFPGTO : string;
   FDSFPGTO : string;
   Conexao   : TConexao;
   QryAuxiliar : TFDQuery;
  public
    function GetCDFPGTO: string;
    function GetDSFPGTO: string;
    procedure SetCDFPGTO(const Value: string);
    procedure SetDSFPGTO(const Value: string);
    procedure GravaDados(const Value: string; sEcluirID: string='');
    property CDFPGTO: string read GetCDFPGTO write SetCDFPGTO;
    property DSFPGTO: String read GetDSFPGTO write SetDSFPGTO;
  protected

  published
    constructor Create;

end;

implementation

{ TFpgto }

constructor TFpgto.Create;
begin
  QryAuxiliar := TFDQuery.Create(nil);
  QryAuxiliar.Connection := dm.DBConexao;
end;

function TFpgto.GetCDFPGTO: string;
begin
  Result := FCDFPGTO;
end;

function TFpgto.GetDSFPGTO: string;
begin
  Result := FDSFPGTO;
end;

procedure TFpgto.GravaDados(const Value: string; sEcluirID: string);
begin
try
  if Value = 'Novo' then
    begin
      QryAuxiliar.Close;
      QryAuxiliar.SQL.Clear;
      QryAuxiliar.SQL.Add('INSERT INTO TB_FPGTO (CD_FPGTO, DS_FPGTO) ');
      QryAuxiliar.SQL.Add('       VALUES (:CD_FPGTO, :DS_FPGTO) ');
      QryAuxiliar.ParamByName('CD_FPGTO').AsString       := GetCDFPGTO;
      QryAuxiliar.ParamByName('DS_FPGTO').AsString       := GetDSFPGTO;
      QryAuxiliar.ExecSQL();
    end
   else
     if Value = 'Editar' then
       begin
         QryAuxiliar.Close;
         QryAuxiliar.SQL.Clear;
         QryAuxiliar.SQL.Add('UPDATE TB_FPGTO ');
         QryAuxiliar.SQL.Add('SET DS_FPGTO     =:DS_FPGTO ');
         QryAuxiliar.SQL.Add('WHERE CD_FPGTO   =:CD_FPGTO ');
         QryAuxiliar.ParamByName('CD_FPGTO').AsString      := GetCDFPGTO;
         QryAuxiliar.ParamByName('DS_FPGTO').AsString      := GetDSFPGTO;
         QryAuxiliar.ExecSQL();
       end
   else
     if Value = 'Excluir' then
       begin
         QryAuxiliar.Close;
         QryAuxiliar.SQL.Clear;
         QryAuxiliar.SQL.Add('DELETE FROM TB_FPGTO WHERE CD_FPGTO=:CD_FPGTO');
         QryAuxiliar.ParamByName('CD_FPGTO').AsString := sEcluirID;
         QryAuxiliar.ExecSQL();
       end;
  except
    on E: Exception do
    ShowMessage('Ocorreu um erro Inesperado. (GravaCadastroFpgto): '+E.Message);
  end;
end;

procedure TFpgto.SetCDFPGTO(const Value: string);
begin
  FCDFPGTO := Value;
end;

procedure TFpgto.SetDSFPGTO(const Value: string);
begin
  FDSFPGTO := Value;
end;

end.
