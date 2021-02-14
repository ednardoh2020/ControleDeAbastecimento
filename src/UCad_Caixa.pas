unit UCad_Caixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, UCaixa, Vcl.ExtCtrls;

type
  TfrmCad_Caixa = class(TForm)
    Panel1: TPanel;
    GPB_Cad: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edt_Codigo: TEdit;
    edit_DescricaoCaixa: TEdit;
    GroupBox1: TGroupBox;
    btnNovo: TButton;
    btnSalvar: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    btnPesquisar: TButton;
    btnSair: TButton;
    QryAuxiliar: TFDQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edt_CodigoEnter(Sender: TObject);
    procedure edt_CodigoExit(Sender: TObject);
    procedure edt_CodigoKeyPress(Sender: TObject; var Key: Char);
    procedure StatusBotao(booNovo, booSalvar, booEditar, booExcluir, booPesquisar : Boolean);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    strStatusCadastro : String;
    ObjCaixa : TCaixa;
    procedure NovoRegistro;
    procedure PreencheClasseCaixa;
    procedure GravaCadastroCaixa;
    procedure ExcluiCaixa(strCDCaixa : String);
    procedure ModoBrowse;
    procedure EditarRegistro;
    procedure ModoBrowseAposEcluir;
    procedure PesquisaCaixa(strCDCaixa : String);
  public
    { Public declarations }
  end;

var
  frmCad_Caixa: TfrmCad_Caixa;

implementation

{$R *.dfm}

uses uPesquisa, UDMPrincipal;

procedure TfrmCad_Caixa.btnEditarClick(Sender: TObject);
begin
  EditarRegistro;
end;

procedure TfrmCad_Caixa.btnExcluirClick(Sender: TObject);
begin
  if edt_Codigo.Text = '' then
    begin
      Showmessage('Faça uma consulta para excluir o Caixa.');
      edit_DescricaoCaixa.SetFocus;
    end
  else
    begin
      if Application.messageBox('Confirma a Exclusão do Caixa?','Confirmação',mb_YesNo+mb_IconInformation+mb_DefButton2) = IDYES then
        begin
          ExcluiCaixa(edt_Codigo.Text);
          ModoBrowseAposEcluir;
        end;
    end;
end;

procedure TfrmCad_Caixa.btnNovoClick(Sender: TObject);
begin
  NovoRegistro;
end;

procedure TfrmCad_Caixa.btnPesquisarClick(Sender: TObject);
begin
  FrmPesquisa := TFrmPesquisa.create(Self);
  FrmPesquisa.gblNomeTabela :='TB_CAIXA';
  FrmPesquisa.gblCodigo :='CD_CAIXA';
  FrmPesquisa.gblNomepesquisa := 'DS_CAIXA';
  FrmPesquisa.Caption :='Pesquisa [Caixa]';
  FrmPesquisa.ShowModal;
  edt_Codigo.Text := DM.gblValCodigo;
  edit_DescricaoCaixa.Text := DM.gblValNome;
  PesquisaCaixa(edt_Codigo.Text);
  edit_DescricaoCaixa.SetFocus;
end;

procedure TfrmCad_Caixa.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmCad_Caixa.btnSalvarClick(Sender: TObject);
begin
  PreencheClasseCaixa;
  GravaCadastroCaixa;
  if strStatusCadastro = 'Novo' then
    Showmessage('Caixa Cadastrado com sucesso.')
  else
    Showmessage('Caixa Alterado com sucesso.');
  ModoBrowse;
end;

procedure TfrmCad_Caixa.EditarRegistro;
begin
  strStatusCadastro :='Editar';
  StatusBotao(False,True,False,False,True);
  edit_DescricaoCaixa.SetFocus;
end;

procedure TfrmCad_Caixa.edt_CodigoEnter(Sender: TObject);
begin
  TEdit(Sender).Color := $00A0FAF8;
end;

procedure TfrmCad_Caixa.edt_CodigoExit(Sender: TObject);
begin
  TEdit(Sender).Color := clwindow;
end;

procedure TfrmCad_Caixa.edt_CodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    PERFORM(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmCad_Caixa.ExcluiCaixa(strCDCaixa: String);
begin
  ObjCaixa.GravaDados('Excluir',strCDCaixa);
end;

procedure TfrmCad_Caixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ObjCaixa.Free;
  Action := cafree;
end;

procedure TfrmCad_Caixa.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   frmCad_Caixa := Nil;
end;

procedure TfrmCad_Caixa.FormShow(Sender: TObject);
begin
  ObjCaixa := TCaixa.Create;
end;

procedure TfrmCad_Caixa.GravaCadastroCaixa;
begin
  if strStatusCadastro = 'Novo' then
    ObjCaixa.GravaDados('Novo')
   else
     ObjCaixa.GravaDados('Editar');
end;

procedure TfrmCad_Caixa.ModoBrowse;
begin
  strStatusCadastro :='Browse';
  StatusBotao(True,True,True,True,True);
  edit_DescricaoCaixa.SetFocus;
end;

procedure TfrmCad_Caixa.ModoBrowseAposEcluir;
begin
  strStatusCadastro :='Browse';
  edt_Codigo.Clear;
  edit_DescricaoCaixa.Clear;
  StatusBotao(True,True,True,True,True);
  edit_DescricaoCaixa.SetFocus;
end;

procedure TfrmCad_Caixa.NovoRegistro;
begin
  strStatusCadastro :='Novo';
  edt_Codigo.Clear;
  edit_DescricaoCaixa.Clear;
  StatusBotao(False,True,False,False,False);
  edit_DescricaoCaixa.SetFocus;
end;

procedure TfrmCad_Caixa.PesquisaCaixa(strCDCaixa: String);
begin
  QryAuxiliar.Close;
  QryAuxiliar.SQL.Clear;
  QryAuxiliar.SQL.Add('SELECT * FROM TB_CAIXA WHERE CD_CAIXA=:CD_CAIXA');
  QryAuxiliar.ParamByName('CD_CAIXA').AsString := strCDCaixa;
  QryAuxiliar.Open;
  edt_Codigo.Text          := QryAuxiliar.fieldbyname('CD_CAIXA').asString;
  edit_DescricaoCaixa.Text := QryAuxiliar.fieldbyname('DS_CAIXA').asString;
end;

procedure TfrmCad_Caixa.PreencheClasseCaixa;
begin
  if strStatusCadastro = 'Novo' then
    begin
      QryAuxiliar.Close;
      QryAuxiliar.SQL.Clear;
      QryAuxiliar.SQL.Add('select gen_id(GEN_CODCAIXA,1) as ID from rdb$database');
      QryAuxiliar.Open;
      ObjCaixa.SetCDCAIXA(FormatFloat('0000000',QryAuxiliar.Fields[0].asInteger));
      edt_Codigo.Text := FormatFloat('0000000',QryAuxiliar.Fields[0].asInteger);
    end
  else
    if strStatusCadastro = 'Editar' then
      ObjCaixa.SetCDCAIXA(FormatFloat('0000000',StrToInt(Trim(edt_Codigo.Text))));
  ObjCaixa.SetDSCAIXA(edit_DescricaoCaixa.Text);
end;

procedure TfrmCad_Caixa.StatusBotao(booNovo, booSalvar, booEditar, booExcluir,
  booPesquisar: Boolean);
begin
  btnNovo.Enabled      := booNovo;
  btnSalvar.Enabled    := booSalvar;
  btnEditar.Enabled    := booEditar;
  btnExcluir.Enabled   := booExcluir;
  btnPesquisar.Enabled := booPesquisar;
end;

end.
