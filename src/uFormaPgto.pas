unit uFormaPgto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmForma_Pgto = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btn_Confirma: TButton;
    Button2: TButton;
    Shape1: TShape;
    Label1: TLabel;
    edt_TotVenda: TEdit;
    Label2: TLabel;
    dbc_Formapgto: TDBLookupComboBox;
    Label3: TLabel;
    edt_Valpago: TEdit;
    Label4: TLabel;
    edt_Troco: TEdit;
    Qry_FormaPGTO: TFDQuery;
    ds_Fpgto: TDataSource;
    Qry_FormaPGTOCD_FPGTO: TStringField;
    Qry_FormaPGTODS_FPGTO: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure dbc_FormapgtoKeyPress(Sender: TObject; var Key: Char);
    procedure edt_ValpagoKeyPress(Sender: TObject; var Key: Char);
    procedure btn_ConfirmaClick(Sender: TObject);
    procedure edt_ValpagoExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    procedure CalculaTroco;
  public
    { Public declarations }
  end;

var
  frmForma_Pgto: TfrmForma_Pgto;

implementation

Uses UDMPrincipal;

{$R *.dfm}

procedure TfrmForma_Pgto.btn_ConfirmaClick(Sender: TObject);
begin
  DM.gblFormaPgto := dbc_Formapgto.KeyValue;
  DM.gblValorPago := edt_Valpago.Text;
  DM.gblTroco     := edt_Troco.Text;
  close;
end;

procedure TfrmForma_Pgto.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmForma_Pgto.CalculaTroco;
var
  vValtotal, vValpago, vValorTroco : Double;
begin
  vValtotal :=0;
  vValpago  :=0;
  vValorTroco :=0;

  vValtotal := StrToFloat(edt_TotVenda.Text);
  vValpago  := StrToFloat(edt_Valpago.Text);

  vValorTroco :=  vValpago - vValtotal;

  edt_Troco.Text := FormatFloat(',0.00',vValorTroco);
end;

procedure TfrmForma_Pgto.dbc_FormapgtoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then edt_Valpago.SetFocus;
end;

procedure TfrmForma_Pgto.edt_ValpagoExit(Sender: TObject);
begin
  edt_Valpago.Text := FormatFloat(',0.00',StrToFloat(edt_Valpago.Text));
  CalculaTroco;
end;

procedure TfrmForma_Pgto.edt_ValpagoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    begin
      CalculaTroco;
      edt_Troco.SetFocus;
    end;

end;

procedure TfrmForma_Pgto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action :=cafree;
end;

procedure TfrmForma_Pgto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_f5 then
    btn_ConfirmaClick(Self);
  if key = vk_escape then
    Button2Click(Self);
end;

procedure TfrmForma_Pgto.FormShow(Sender: TObject);
begin
  Qry_FormaPGTO.Close;
  Qry_FormaPGTO.Open();
  dbc_Formapgto.SetFocus;
end;

end.
