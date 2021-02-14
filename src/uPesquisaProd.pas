unit uPesquisaProd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Phys.Intf;

type
  TfrmPes_Produto = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    edt_Produto: TEdit;
    Button1: TButton;
    Label1: TLabel;
    btn_Selecionar: TButton;
    Button3: TButton;
    DBG_Produto: TDBGrid;
    Qry_Produto: TFDQuery;
    ds_Produto: TDataSource;
    Qry_ProdutoCD_PRODUTO: TStringField;
    Qry_ProdutoDS_REDUZIDO_PRODUTO: TStringField;
    Qry_ProdutoUNIDADE_MEDIDA: TStringField;
    Qry_ProdutoQTD_ESTOQUE: TBCDField;
    Qry_ProdutoPRC_PRODUTO: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure btn_SelecionarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edt_ProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure DBG_ProdutoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPes_Produto: TfrmPes_Produto;

implementation

Uses UDMCad, UDMPrincipal;

{$R *.dfm}

procedure TfrmPes_Produto.btn_SelecionarClick(Sender: TObject);
begin
  DM.gblValCodigo  := Qry_ProdutoCD_PRODUTO.AsString;
  DM.gblValPrcProd := Qry_ProdutoPRC_PRODUTO.AsString;
  close;
end;

procedure TfrmPes_Produto.Button1Click(Sender: TObject);
begin
  if edt_Produto.Text = '' then
    begin
      Showmessage('Digite algo para Consultar produto.');
      edt_Produto.SetFocus
    end
  else
    begin
      Qry_Produto.Close;
      Qry_Produto.SQL.Clear;
      Qry_Produto.SQL.Add('select CD_PRODUTO,            '+
                          '         DS_REDUZIDO_PRODUTO, '+
                          '         UNIDADE_MEDIDA, '+
                          '         QTD_ESTOQUE,    '+
                          '         PRC_PRODUTO     '+
                          ' FROM TB_PRODUTOS        '+
                          ' WHERE PRC_PRODUTO LIKE ' + quotedstr('%' + Trim(edt_Produto.Text)));
      Qry_Produto.Open();
      if Qry_Produto.Eof then
        begin
          Qry_Produto.Close;
          Qry_Produto.SQL.Clear;
          Qry_Produto.SQL.Add('select CD_PRODUTO,            '+
                              '         DS_REDUZIDO_PRODUTO, '+
                              '         UNIDADE_MEDIDA, '+
                              '         QTD_ESTOQUE,    '+
                              '         PRC_PRODUTO     '+
                              ' FROM TB_PRODUTOS        '+
                              ' WHERE DS_REDUZIDO_PRODUTO LIKE ' + quotedstr('%' + Trim(edt_Produto.Text) + '%'));
          Qry_Produto.Open();
        end;
        DBG_Produto.SetFocus;
    end;

end;

procedure TfrmPes_Produto.DBG_ProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    btn_SelecionarClick(Self);
end;

procedure TfrmPes_Produto.edt_ProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  if key =#13 then
    Button1Click(Self);
end;

procedure TfrmPes_Produto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TfrmPes_Produto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F3 then
    Button1Click(Self);
  if Key = VK_F5 then
    btn_SelecionarClick(Self);
  if key = VK_Escape then
    Close;
end;

procedure TfrmPes_Produto.FormShow(Sender: TObject);
begin
  edt_Produto.SetFocus;
end;

end.
