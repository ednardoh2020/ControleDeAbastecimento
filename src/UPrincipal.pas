unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, UConecta, Vcl.ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.Client, Vcl.ExtCtrls,
  Vcl.Buttons, FireDAC.Comp.DataSet, Vcl.Imaging.pngimage, Vcl.Imaging.jpeg;

type
  TfrmPrincipal = class(TForm)
    MainMenu_Principal: TMainMenu;
    File1: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    Print1: TMenuItem;
    PrintSetup1: TMenuItem;
    Exit1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Edit1: TMenuItem;
    Undo1: TMenuItem;
    FormadePagaento1: TMenuItem;
    Empresa1: TMenuItem;
    Vendas1: TMenuItem;
    PDV1: TMenuItem;
    ConectaroBanco1: TMenuItem;
    StatusBar1: TStatusBar;
    QryEmpresa: TFDQuery;
    QryEmpresaCNPJ: TStringField;
    QryEmpresaRAZAO_SOCIAL: TStringField;
    QryEmpresaNOME_FANTASIA: TStringField;
    QryEmpresaENDERECO: TStringField;
    QryEmpresaCEP: TStringField;
    QryEmpresaTELEFONE: TStringField;
    QryEmpresaIE: TStringField;
    QryEmpresaLOGOMARCA: TBlobField;
    Relatrios1: TMenuItem;
    RelatriodeAbastecimentodirioporperiodo1: TMenuItem;
    ControlBar1: TControlBar;
    btn_PDV: TSpeedButton;
    btn_Relatorio: TSpeedButton;
    procedure Exit1Click(Sender: TObject);
    procedure ConectaroBanco1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure FormadePagaento1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PrintSetup1Click(Sender: TObject);
    procedure Empresa1Click(Sender: TObject);
    procedure Undo1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PDV1Click(Sender: TObject);
    procedure RelatriodeAbastecimentodirioporperiodo1Click(Sender: TObject);
    procedure btn_PDVClick(Sender: TObject);
    procedure btn_RelatorioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmPrincipal: TfrmPrincipal;
  conexaoClass : TConexao;

implementation


{$R *.dfm}

uses UConexaoBDpas, UDMPrincipal, UCad_TAMQUE, UCad_Bomba, UCad_Produto,
  UCad_Fpgto, UCad_Operador, UDMCad, UCad_Caixa, UCad_Empresa, UParametro,
  UVendasPDV, uRel_MovimetosDiario;

procedure TfrmPrincipal.btn_PDVClick(Sender: TObject);
begin
  PDV1Click(Self);
end;

procedure TfrmPrincipal.btn_RelatorioClick(Sender: TObject);
begin
  RelatriodeAbastecimentodirioporperiodo1Click(Self);
end;

procedure TfrmPrincipal.ConectaroBanco1Click(Sender: TObject);
begin
  frmConectaDB :=TfrmConectaDB.create(Self);
  frmConectaDB.ShowModal;
end;

procedure TfrmPrincipal.Empresa1Click(Sender: TObject);
begin
  if frmCad_Empresa = Nil then
    begin
      frmCad_Empresa := TfrmCad_Empresa.create(Self);
      frmCad_Empresa.Show;
    end
  else
    frmCad_Empresa.Show;
end;

procedure TfrmPrincipal.Exit1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmPrincipal.FormadePagaento1Click(Sender: TObject);
begin
  if frmCad_Fpgto = Nil then
    begin
      frmCad_Fpgto := TfrmCad_Fpgto.create(Self);
      frmCad_Fpgto.Show;
    end
  else
    frmCad_Fpgto.Show;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.messageBox('Deseja Realmente sair do Sistema?','Confirmação',mb_YesNo+mb_IconInformation+mb_DefButton2) = IdYes then
    begin
      Application.Terminate;
    end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  conexaoClass := TConexao.Create(ExtractFilePath(Application.ExeName) + 'ConfigDB.ini', 'Conexao');
  if not conexaoClass.ConectouBanco then
    begin
      frmConectaDB :=TfrmConectaDB.Create(Self);
      frmConectaDB.ShowModal;
    end
  else
    begin
      conexaoClass.LeINI;
      conexaoClass.Conectar(DM.DBConexao);
    end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
var
  strCodEmprParam : String;
begin
  DMCad.QrParametro.Close;
  DMCad.QrParametro.Open();
  QryEmpresa.Close;
  QryEmpresa.Open();
  strCodEmprParam := DMCad.QrParametroCNPJ_EMPR.AsString;
  if QryEmpresa.Locate('CNPJ',strCodEmprParam,[]) then
    begin
      StatusBar1.Panels[0].Text :='Empresa : ' + QryEmpresaCNPJ.AsString + ' - ' + QryEmpresaNOME_FANTASIA.AsString + '  Telefone : ' + QryEmpresaTELEFONE.AsString;
      StatusBar1.Panels[1].Text :='Data : ' + FormatDateTime('DD/MM/YYYY',Now);
      StatusBar1.Panels[2].Text := 'Sistema de Abastecimento para Posto de combustível - Teste  ' + ' [F2 - Iniciar Venda] ';
    end
end;

procedure TfrmPrincipal.New1Click(Sender: TObject);
begin
  if frmCad_Tanques = Nil then
    begin
      frmCad_Tanques := TfrmCad_Tanques.create(Self);
      frmCad_Tanques.Show;
    end
  else
    frmCad_Tanques.Show;
end;

procedure TfrmPrincipal.Open1Click(Sender: TObject);
begin
  if frmCad_Bombas = Nil then
    begin
      frmCad_Bombas := TfrmCad_Bombas.create(Self);
      frmCad_Bombas.Show;
    end
  else
    frmCad_Bombas.Show;
end;

procedure TfrmPrincipal.PDV1Click(Sender: TObject);
begin
  frmMov_Vendas :=TfrmMov_Vendas.create(Self);
  frmMov_Vendas.ShowModal;
end;

procedure TfrmPrincipal.Print1Click(Sender: TObject);
begin
  if frmCad_Operador = Nil then
    begin
      frmCad_Operador := TfrmCad_Operador.create(Self);
      frmCad_Operador.Show;
    end
  else
    frmCad_Operador.Show;
end;

procedure TfrmPrincipal.PrintSetup1Click(Sender: TObject);
begin
  if frmCad_Caixa = Nil then
    begin
      frmCad_Caixa := TfrmCad_Caixa.create(Self);
      frmCad_Caixa.Show;
    end
  else
    frmCad_Caixa.Show;
end;

procedure TfrmPrincipal.RelatriodeAbastecimentodirioporperiodo1Click(
  Sender: TObject);
begin
  if frmRel_Vendas = Nil then
    begin
      frmRel_Vendas := TfrmRel_Vendas.create(Self);
      frmRel_Vendas.Show;
    end
  else
    frmRel_Vendas.Show;
end;

procedure TfrmPrincipal.Save1Click(Sender: TObject);
begin
  if frmCad_Produto = Nil then
    begin
      frmCad_Produto := TfrmCad_Produto.create(Self);
      frmCad_Produto.Show;
    end
  else
    frmCad_Produto.Show;
end;

procedure TfrmPrincipal.Undo1Click(Sender: TObject);
begin
  frmParametro :=TfrmParametro.create(Self);
  frmParametro.Showmodal;
end;

end.
