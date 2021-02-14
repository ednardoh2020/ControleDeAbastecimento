unit UCad_Fpgto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls, UFpgto, FireDAC.Comp.DataSet;

type
  TfrmCad_Fpgto = class(TForm)
    Panel1: TPanel;
    GPB_Cad: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edt_Codigo: TEdit;
    GroupBox1: TGroupBox;
    btnNovo: TButton;
    btnSalvar: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    btnPesquisar: TButton;
    btnSair: TButton;
    QryAuxiliar: TFDQuery;
    edt_Descricaofpgto: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnSairClick(Sender: TObject);
    procedure edt_CodigoEnter(Sender: TObject);
    procedure edt_CodigoExit(Sender: TObject);
    procedure edt_CodigoKeyPress(Sender: TObject; var Key: Char);
    procedure StatusBotao(booNovo, booSalvar, booEditar, booExcluir, booPesquisar : Boolean);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    strStatusCadastro : String;
    ObjFpgto : TFpgto;
    procedure NovoRegistro;
    procedure PreencheClasseFpgto;
    procedure GravaCadastroFpgto;
    procedure ExcluiFpgto(strCDFPGTO : String);
    procedure ModoBrowse;
    procedure EditarRegistro;
    procedure ModoBrowseAposEcluir;
    procedure PesquisaFpgto(strCDFPGTO : String);
  public
    { Public declarations }
  end;

var
  frmCad_Fpgto: TfrmCad_Fpgto;

implementation

{$R *.dfm}

uses uPesquisa, UDMPrincipal;

procedure TfrmCad_Fpgto.btnEditarClick(Sender: TObject);
begin
  EditarRegistro;
end;

procedure TfrmCad_Fpgto.btnExcluirClick(Sender: TObject);
begin
  if edt_Codigo.Text = '' then
    begin
      Showmessage('Faça uma consulta para excluir a Fpgto.');
      edt_Descricaofpgto.SetFocus;
    end
  else
    begin
      if Application.messageBox('Confirma a Exclusão da Fpgto?','Confirmação',mb_YesNo+mb_IconInformation+mb_DefButton2) = IDYES then
        begin
          ExcluiFpgto(edt_Codigo.Text);
          ModoBrowseAposEcluir;
        end;
    end;
end;

procedure TfrmCad_Fpgto.btnNovoClick(Sender: TObject);
begin
  NovoRegistro;
end;

procedure TfrmCad_Fpgto.btnPesquisarClick(Sender: TObject);
begin
  FrmPesquisa := TFrmPesquisa.create(Self);
  FrmPesquisa.gblNomeTabela   :='TB_FPGTO';
  FrmPesquisa.gblCodigo       :='CD_FPGTO';
  FrmPesquisa.gblNomepesquisa := 'DS_FPGTO';
  FrmPesquisa.Caption         :='Pesquisa [Fpgto]';
  FrmPesquisa.ShowModal;
  edt_Codigo.Text             := DM.gblValCodigo;
  edt_Descricaofpgto.Text     := DM.gblValNome;
  PesquisaFpgto(edt_Codigo.Text);
  edt_Descricaofpgto.SetFocus;
end;

procedure TfrmCad_Fpgto.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmCad_Fpgto.btnSalvarClick(Sender: TObject);
begin
  PreencheClasseFpgto;
  GravaCadastroFpgto;
  if strStatusCadastro = 'Novo' then
    Showmessage('Fpgto Cadastrado com sucesso.')
  else
    Showmessage('Fpgto Alterado com sucesso.');
  ModoBrowse;
end;

procedure TfrmCad_Fpgto.EditarRegistro;
begin
  strStatusCadastro :='Editar';
  StatusBotao(False,True,False,False,True);
  edt_Descricaofpgto.SetFocus;
end;

procedure TfrmCad_Fpgto.edt_CodigoEnter(Sender: TObject);
begin
  TEdit(Sender).Color := $00A0FAF8;
end;

procedure TfrmCad_Fpgto.edt_CodigoExit(Sender: TObject);
begin
  TEdit(Sender).Color := clwindow;
end;

procedure TfrmCad_Fpgto.edt_CodigoKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
  begin
    PERFORM(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmCad_Fpgto.ExcluiFpgto(strCDFPGTO: String);
begin
  ObjFpgto.GravaDados('Excluir',strCDFPGTO);
end;

procedure TfrmCad_Fpgto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ObjFpgto.Free;
  Action := cafree;
end;

procedure TfrmCad_Fpgto.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  frmCad_Fpgto := Nil;
end;

procedure TfrmCad_Fpgto.FormShow(Sender: TObject);
begin
  ObjFpgto := TFpgto.Create;
end;

procedure TfrmCad_Fpgto.GravaCadastroFpgto;
begin
  if strStatusCadastro = 'Novo' then
    ObjFpgto.GravaDados('Novo')
   else
     ObjFpgto.GravaDados('Editar');
end;

procedure TfrmCad_Fpgto.ModoBrowse;
begin
  strStatusCadastro :='Browse';
  StatusBotao(True,True,True,True,True);
  edt_Descricaofpgto.SetFocus;
end;

procedure TfrmCad_Fpgto.ModoBrowseAposEcluir;
begin
  strStatusCadastro :='Browse';
  edt_Codigo.Clear;
  edt_Descricaofpgto.Clear;
  StatusBotao(True,True,True,True,True);
  edt_Descricaofpgto.SetFocus;
end;

procedure TfrmCad_Fpgto.NovoRegistro;
begin
  strStatusCadastro :='Novo';
  edt_Codigo.Clear;
  edt_Descricaofpgto.Clear;
  StatusBotao(False,True,False,False,False);
  edt_Descricaofpgto.SetFocus;
end;

procedure TfrmCad_Fpgto.PesquisaFpgto(strCDFPGTO: String);
begin
  QryAuxiliar.Close;
  QryAuxiliar.SQL.Clear;
  QryAuxiliar.SQL.Add('SELECT * FROM TB_FPGTO WHERE CD_FPGTO=:CD_FPGTO');
  QryAuxiliar.ParamByName('CD_FPGTO').AsString := strCDFPGTO;
  QryAuxiliar.Open;
  edt_Codigo.Text          := QryAuxiliar.fieldbyname('CD_FPGTO').asString;
  edt_Descricaofpgto.Text  := QryAuxiliar.fieldbyname('DS_FPGTO').asString;
end;

procedure TfrmCad_Fpgto.PreencheClasseFpgto;
begin
  if strStatusCadastro = 'Novo' then
    begin
      QryAuxiliar.Close;
      QryAuxiliar.SQL.Clear;
      QryAuxiliar.SQL.Add('select gen_id(GEN_CODFPGTO,1) as ID from rdb$database');
      QryAuxiliar.Open;
      ObjFpgto.SetCDFPGTO(FormatFloat('0000000',QryAuxiliar.Fields[0].asInteger));
      edt_Codigo.Text := FormatFloat('0000000',QryAuxiliar.Fields[0].asInteger);
    end
  else
    if strStatusCadastro = 'Editar' then
      ObjFpgto.SetCDFPGTO(FormatFloat('0000000',StrToInt(Trim(edt_Codigo.Text))));
  ObjFpgto.SetDSFPGTO(edt_Descricaofpgto.Text);
end;

procedure TfrmCad_Fpgto.StatusBotao(booNovo, booSalvar, booEditar, booExcluir,
  booPesquisar: Boolean);
begin
  btnNovo.Enabled      := booNovo;
  btnSalvar.Enabled    := booSalvar;
  btnEditar.Enabled    := booEditar;
  btnExcluir.Enabled   := booExcluir;
  btnPesquisar.Enabled := booPesquisar;
end;

end.
