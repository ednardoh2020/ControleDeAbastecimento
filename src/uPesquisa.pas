unit uPesquisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, DB, FMTBcd, SqlExpr,
  Provider, DBClient, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Phys.Intf;

type
  TFrmPesquisa = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    edtNome: TEdit;
    btnPesquisar: TButton;
    btnSelecionar: TButton;
    btnCancelar: TButton;
    dbgPesquisa: TDBGrid;
    dsPesquisa: TDataSource;
    QryPesquisa: TFDQuery;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgPesquisaDblClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure dbgPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    Procedure AbreTabela(strNomeTabela, strCodigo, strNomepesquisa : String);
    Procedure PesquisaTabela(strNomeTabela, strCodigo, strNomepesquisa, strValorPesquisa : String);
  public
    { Public declarations }
    gblNomeTabela,
    gblCodigo,
    gblNomepesquisa : String;
  end;

var
  FrmPesquisa: TFrmPesquisa;

implementation

{$R *.dfm}

Uses UDMPrincipal;

procedure TFrmPesquisa.AbreTabela(strNomeTabela, strCodigo,
  strNomepesquisa: String);
begin
  QryPesquisa.Close;
  QryPesquisa.SQL.Clear;
  QryPesquisa.SQL.Add('SELECT * ');
  QryPesquisa.SQL.Add('FROM ' + strNomeTabela);
  QryPesquisa.SQL.Add('Order by '+strCodigo);
  QryPesquisa.Open;
end;

procedure TFrmPesquisa.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TFrmPesquisa.btnSelecionarClick(Sender: TObject);
begin
  DM.gblValCodigo := QryPesquisa.Fields[0].AsString;
  DM.gblValNome   := QryPesquisa.Fields[1].AsString;
  close;
end;

procedure TFrmPesquisa.FormShow(Sender: TObject);
begin
  AbreTabela(gblNomeTabela,gblCodigo,gblNomepesquisa);
end;

procedure TFrmPesquisa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TFrmPesquisa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_f3 then btnPesquisarClick(Self);
  if key = vk_f5 then btnSelecionarClick(Self);
  if key = vk_escape then btnCancelarClick(Self);
end;

procedure TFrmPesquisa.dbgPesquisaDblClick(Sender: TObject);
begin
  btnSelecionarClick(Self);
end;

procedure TFrmPesquisa.PesquisaTabela(strNomeTabela, strCodigo,
  strNomepesquisa, strValorPesquisa: String);
begin
  QryPesquisa.Close;
  QryPesquisa.SQL.Clear;
  QryPesquisa.SQL.Add('SELECT * ');
  QryPesquisa.SQL.Add('FROM ' + trim(strNomeTabela));
  QryPesquisa.SQL.Add('WHERE '+trim(strNomepesquisa)+ ' LIKE '+ quotedstr('%'+ trim(strValorPesquisa)+'%'));
  QryPesquisa.Open();
end;

procedure TFrmPesquisa.btnPesquisarClick(Sender: TObject);
begin
  if edtNome.Text = '' then
    Showmessage('Campo pesquisa não pode ser vazio.')
  else
    PesquisaTabela(gblNomeTabela, gblCodigo, gblNomepesquisa, Trim(edtNome.Text));
end;

procedure TFrmPesquisa.edtNomeKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    begin
      dbgPesquisa.SetFocus;
    end;
end;

procedure TFrmPesquisa.dbgPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then btnSelecionarClick(Self);
end;

end.
