unit UParametro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.Mask;

type
  TfrmParametro = class(TForm)
    Panel1: TPanel;
    GPB_Cad: TGroupBox;
    GroupBox1: TGroupBox;
    btnSair: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    QryEmpresa: TFDQuery;
    QryEmpresaCNPJ: TStringField;
    QryEmpresaRAZAO_SOCIAL: TStringField;
    QryEmpresaNOME_FANTASIA: TStringField;
    QryEmpresaENDERECO: TStringField;
    QryEmpresaCEP: TStringField;
    QryEmpresaTELEFONE: TStringField;
    QryEmpresaIE: TStringField;
    QryEmpresaLOGOMARCA: TBlobField;
    dsEmpresa: TDataSource;
    dbc_Empresa: TDBLookupComboBox;
    QryOperador: TFDQuery;
    dsOperador: TDataSource;
    QryOperadorCD_OPERADOR: TStringField;
    QryOperadorDS_OPERADOR: TStringField;
    QryOperadorCOMISSAO: TBCDField;
    dbc_Operador: TDBLookupComboBox;
    QryCaixa: TFDQuery;
    dsCaixa: TDataSource;
    QryCaixaCD_CAIXA: TStringField;
    QryCaixaDS_CAIXA: TStringField;
    dbc_Caixa: TDBLookupComboBox;
    Label8: TLabel;
    QryFpgto: TFDQuery;
    dsFpgto: TDataSource;
    QryFpgtoCD_FPGTO: TStringField;
    QryFpgtoDS_FPGTO: TStringField;
    Label3: TLabel;
    dbc_Fpgto: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_EmpresaKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_OperadorKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_CaixaKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_FpgtoKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure DBDateEdit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParametro: TfrmParametro;

implementation

Uses UDMCad, UDMPrincipal;

{$R *.dfm}

procedure TfrmParametro.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmParametro.dbc_CaixaKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
  begin
    dbc_Fpgto.SetFocus;
  end;
end;

procedure TfrmParametro.dbc_EmpresaKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
  begin
    dbc_Operador.SetFocus;
  end;
end;

procedure TfrmParametro.dbc_FpgtoKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
  begin
    DBEdit1.SetFocus;
  end;
end;

procedure TfrmParametro.dbc_OperadorKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
  begin
    dbc_Caixa.SetFocus;
  end;
end;

procedure TfrmParametro.DBDateEdit1KeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
  begin
    DBEdit3.SetFocus;
  end;
end;

procedure TfrmParametro.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
  begin
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmParametro.DBEdit2KeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
  begin
    DBEdit4.SetFocus;
  end;
end;

procedure TfrmParametro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QryEmpresa.Close;
  QryOperador.Close;
  QryCaixa.Close;
  QryFpgto.Close;
  DMCad.QrParametro.Close;
  Action := cafree;
end;

procedure TfrmParametro.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
  begin
    PERFORM(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmParametro.FormShow(Sender: TObject);
begin
  QryEmpresa.Close;
  QryEmpresa.Open();
  QryOperador.Close;
  QryOperador.Open();
  QryCaixa.Close;
  QryCaixa.Open();
  QryFpgto.Close;
  QryFpgto.Open();
  DMCad.QrParametro.Close;
  DMCad.QrParametro.Open();
end;

end.
