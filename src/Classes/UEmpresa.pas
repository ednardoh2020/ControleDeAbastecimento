unit UEmpresa;

interface

Uses Winapi.Messages, Vcl.Dialogs, System.SysUtils, UConecta, FireDAC.Stan.Intf,
     FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
     FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
     Data.DB, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
     FireDAC.Comp.Client, UDMPrincipal, Graphics, Variants, Jpeg,
     Windows, Classes, Controls, Forms;

type
  TEmpresa = class

  private
    FCNPJ : string;
    FRAZAOSOCIAL : string;
    FNOMEFANTASIA : string;
    FENDERECO : string;
    FCEP : string;
    FTELEFONE : string;
    FIE : string;
    FLOGOMARCA : TGraphic;
    Conexao   : TConexao;
    QryAuxiliar : TFDQuery;
  public
    function GetCNPJ: string;
    function GetRAZAOSOCIAL: string;
    function GetNOMEFANTASIA : string;
    function GetENDERECO: string;
    function GetCEP : string;
    function GetTELEFONE : string;
    function GetIE : string;
    function GetLOGOMARCA : TGraphic;
    procedure SetCNPJ(const Value: string);
    procedure SetRAZAOSOCIAL(const Value: string);
    procedure SetNOMEFANTASIA(const Value: string);
    procedure SetENDERECO(const Value: string);
    procedure SetCEP(const Value: string);
    procedure SetTELEFONE(const Value: string);
    procedure SetIE(const Value: string);
    procedure SetLOGOMARCA(const Value: TGraphic);
    procedure GravaDados(const Value: string; sEcluirID: string='');
    property CNPJ: string read GetCNPJ write SetCNPJ;
    property RAZAOSOCIAL: String read GetRAZAOSOCIAL write SetRAZAOSOCIAL;
    property NOMEFANTASIA: String read GetNOMEFANTASIA write SetNOMEFANTASIA;
    property ENDERECO: String read GetENDERECO write SetENDERECO;
    property CEP: String read GetCEP write SetCEP;
    property TELEFONE: String read GetTELEFONE write SetTELEFONE;
    property IE: String read GetIE write SetIE;
    property LOGOMARCA: TGraphic read GetLOGOMARCA write SetLOGOMARCA;
  protected

  published
    constructor Create;

end;

implementation

Uses UCad_Empresa;

{ TEmpresa }

constructor TEmpresa.Create;
begin
  QryAuxiliar := TFDQuery.Create(nil);
  QryAuxiliar.Connection := dm.DBConexao;
end;

function TEmpresa.GetCEP: string;
begin
   Result := FCEP;
end;

function TEmpresa.GetCNPJ: string;
begin
   Result := FCNPJ
end;

function TEmpresa.GetENDERECO: string;
begin
   Result := FENDERECO;
end;

function TEmpresa.GetIE: string;
begin
   Result := FIE;
end;

function TEmpresa.GetLOGOMARCA: TGraphic;
begin
   Result := FLOGOMARCA;
end;

function TEmpresa.GetNOMEFANTASIA: string;
begin
   Result := FNOMEFANTASIA;
end;

function TEmpresa.GetRAZAOSOCIAL: string;
begin
   Result := FRAZAOSOCIAL;
end;

function TEmpresa.GetTELEFONE: string;
begin
   Result := FTELEFONE;
end;

procedure TEmpresa.GravaDados(const Value: string; sEcluirID: string);
var
  st: TMemoryStream;
begin
try
  st:= TMemoryStream.Create;
  if Value = 'Novo' then
    begin
      QryAuxiliar.Close;
      QryAuxiliar.SQL.Clear;
      QryAuxiliar.SQL.Add('INSERT INTO TB_EMPRESA (CNPJ, RAZAO_SOCIAL, NOME_FANTASIA, ENDERECO, CEP, TELEFONE, IE, LOGOMARCA) ');
      QryAuxiliar.SQL.Add('       VALUES (:CNPJ, :RAZAO_SOCIAL, :NOME_FANTASIA, :ENDERECO, :CEP, :TELEFONE, :IE, :LOGOMARCA) ');
      QryAuxiliar.ParamByName('CNPJ').AsString            := GetCNPJ;
      QryAuxiliar.ParamByName('RAZAO_SOCIAL').AsString    := GetRAZAOSOCIAL;
      QryAuxiliar.ParamByName('NOME_FANTASIA').AsString   := GetNOMEFANTASIA;
      QryAuxiliar.ParamByName('ENDERECO').AsString        := GetENDERECO;
      QryAuxiliar.ParamByName('CEP').AsString             := GetCEP;
      QryAuxiliar.ParamByName('TELEFONE').AsString        := GetTELEFONE;
      QryAuxiliar.ParamByName('IE').AsString              := GetIE;

      frmCad_Empresa.img_Logo.Picture.Graphic.SaveToStream(st);
      st.Seek(0,0);

      QryAuxiliar.ParamByName('LOGOMARCA').LoadFromStream(St, ftGraphic);
      QryAuxiliar.ExecSQL();
    end
   else
     if Value = 'Editar' then
       begin
         QryAuxiliar.Close;
         QryAuxiliar.SQL.Clear;
         QryAuxiliar.SQL.Add('UPDATE TB_EMPRESA ');
         QryAuxiliar.SQL.Add('SET RAZAO_SOCIAL     =:RAZAO_SOCIAL, ');
         QryAuxiliar.SQL.Add('    NOME_FANTASIA    =:NOME_FANTASIA,  ');
         QryAuxiliar.SQL.Add('    ENDERECO         =:ENDERECO,  ');
         QryAuxiliar.SQL.Add('    CEP              =:CEP,  ');
         QryAuxiliar.SQL.Add('    TELEFONE         =:TELEFONE,  ');
         QryAuxiliar.SQL.Add('    IE               =:IE,  ');
         QryAuxiliar.SQL.Add('    LOGOMARCA        =:LOGOMARCA  ');
         QryAuxiliar.SQL.Add('WHERE CNPJ=:CNPJ ');
         QryAuxiliar.ParamByName('CNPJ').AsString            := GetCNPJ;
         QryAuxiliar.ParamByName('RAZAO_SOCIAL').AsString    := GetRAZAOSOCIAL;
         QryAuxiliar.ParamByName('NOME_FANTASIA').AsString   := GetNOMEFANTASIA;
         QryAuxiliar.ParamByName('ENDERECO').AsString        := GetENDERECO;
         QryAuxiliar.ParamByName('CEP').AsString             := GetCEP;
         QryAuxiliar.ParamByName('TELEFONE').AsString        := GetTELEFONE;
         QryAuxiliar.ParamByName('IE').AsString              := GetIE;

         frmCad_Empresa.img_Logo.Picture.Graphic.SaveToStream(st);
         st.Seek(0,0);

         QryAuxiliar.ParamByName('LOGOMARCA').LoadFromStream(St, ftGraphic);

         QryAuxiliar.ExecSQL();

         st.Free;
       end
   else
     if Value = 'Excluir' then
       begin
         QryAuxiliar.Close;
         QryAuxiliar.SQL.Clear;
         QryAuxiliar.SQL.Add('DELETE FROM TB_EMPRESA WHERE CNPJ=:CNPJ');
         QryAuxiliar.ParamByName('CNPJ').AsString := sEcluirID;
         QryAuxiliar.ExecSQL();
       end;
  except
    on E: Exception do
    ShowMessage('Ocorreu um erro Inesperado. (GravaCadastroEmpresa): '+E.Message);
  end;
end;

procedure TEmpresa.SetCEP(const Value: string);
begin
  FCEP := Value;
end;

procedure TEmpresa.SetCNPJ(const Value: string);
begin
  FCNPJ := Value;
end;

procedure TEmpresa.SetENDERECO(const Value: string);
begin
  FENDERECO := Value;
end;

procedure TEmpresa.SetIE(const Value: string);
begin
  FIE := Value;
end;

procedure TEmpresa.SetLOGOMARCA(const Value: TGraphic);
begin
  FLOGOMARCA := Value;
end;

procedure TEmpresa.SetNOMEFANTASIA(const Value: string);
begin
  FNOMEFANTASIA := Value;
end;

procedure TEmpresa.SetRAZAOSOCIAL(const Value: string);
begin
  FRAZAOSOCIAL := Value;
end;

procedure TEmpresa.SetTELEFONE(const Value: string);
begin
  FTELEFONE := Value;
end;

end.
