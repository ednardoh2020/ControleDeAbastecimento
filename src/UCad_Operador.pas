unit UCad_Operador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.ExtCtrls, UOperador, FireDAC.Stan.Async;

type
  TfrmCad_Operador = class(TForm)
    Panel1: TPanel;
    GPB_Cad: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edt_Codigo: TEdit;
    edt_Comissao: TEdit;
    GroupBox1: TGroupBox;
    btnNovo: TButton;
    btnSalvar: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    btnPesquisar: TButton;
    btnSair: TButton;
    QryAuxiliar: TFDQuery;
    edit_DescricaoOper: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure StatusBotao(booNovo, booSalvar, booEditar, booExcluir, booPesquisar : Boolean);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure edt_CodigoEnter(Sender: TObject);
    procedure edt_CodigoExit(Sender: TObject);
    procedure edt_CodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edt_ComissaoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    strStatusCadastro : String;
    ObjOperador : TOperador;
    procedure NovoRegistro;
    procedure PreencheClasseOperador;
    procedure GravaCadastroOperador;
    procedure ExcluiOperador(strCDOperador : String);
    procedure ModoBrowse;
    procedure EditarRegistro;
    procedure ModoBrowseAposEcluir;
    procedure PesquisaOperador(strCDOperador : String);
  public
    { Public declarations }
  end;

var
  frmCad_Operador: TfrmCad_Operador;

implementation

{$R *.dfm}

uses uPesquisa, UDMPrincipal;

procedure TfrmCad_Operador.btnEditarClick(Sender: TObject);
begin
  EditarRegistro;
end;

procedure TfrmCad_Operador.btnExcluirClick(Sender: TObject);
begin
  if edt_Codigo.Text = '' then
    begin
      Showmessage('Faça uma consulta para excluir o Operador.');
      edit_DescricaoOper.SetFocus;
    end
  else
    begin
      if Application.messageBox('Confirma a Exclusão do Operador?','Confirmação',mb_YesNo+mb_IconInformation+mb_DefButton2) = IDYES then
        begin
          ExcluiOperador(edt_Codigo.Text);
          ModoBrowseAposEcluir;
        end;
    end;
end;

procedure TfrmCad_Operador.btnNovoClick(Sender: TObject);
begin
  NovoRegistro;
end;

procedure TfrmCad_Operador.btnPesquisarClick(Sender: TObject);
begin
  FrmPesquisa := TFrmPesquisa.create(Self);
  FrmPesquisa.gblNomeTabela :='TB_OPERADOR';
  FrmPesquisa.gblCodigo :='CD_OPERADOR';
  FrmPesquisa.gblNomepesquisa := 'DS_OPERADOR';
  FrmPesquisa.Caption :='Pesquisa [Operador]';
  FrmPesquisa.ShowModal;
  edt_Codigo.Text := DM.gblValCodigo;
  edit_DescricaoOper.Text := DM.gblValNome;
  PesquisaOperador(edt_Codigo.Text);
  edit_DescricaoOper.SetFocus;
end;

procedure TfrmCad_Operador.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmCad_Operador.btnSalvarClick(Sender: TObject);
begin
  PreencheClasseOperador;
  GravaCadastroOperador;
  if strStatusCadastro = 'Novo' then
    Showmessage('Operador Cadastrado com sucesso.')
  else
    Showmessage('Operador Alterado com sucesso.');
  ModoBrowse;
end;

procedure TfrmCad_Operador.EditarRegistro;
begin
  strStatusCadastro :='Editar';
  StatusBotao(False,True,False,False,True);
  edit_DescricaoOper.SetFocus;
end;

procedure TfrmCad_Operador.edt_CodigoEnter(Sender: TObject);
begin
  TEdit(Sender).Color := $00A0FAF8;
end;

procedure TfrmCad_Operador.edt_CodigoExit(Sender: TObject);
begin
  TEdit(Sender).Color := clwindow;
end;

procedure TfrmCad_Operador.edt_CodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    PERFORM(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmCad_Operador.edt_ComissaoKeyPress(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#08,#13,',','.'] ) then
    key:=#0;

  if Key = #13 then
  begin
    PERFORM(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmCad_Operador.ExcluiOperador(strCDOperador: String);
begin
  ObjOperador.GravaDados('Excluir',strCDOperador);
end;

procedure TfrmCad_Operador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ObjOperador.Free;
  Action := cafree;
end;

procedure TfrmCad_Operador.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  frmCad_Operador := Nil;
end;

procedure TfrmCad_Operador.FormShow(Sender: TObject);
begin
  ObjOperador := TOperador.Create;
end;

procedure TfrmCad_Operador.GravaCadastroOperador;
begin
  if strStatusCadastro = 'Novo' then
    ObjOperador.GravaDados('Novo')
   else
     ObjOperador.GravaDados('Editar');
end;

procedure TfrmCad_Operador.ModoBrowse;
begin
  strStatusCadastro :='Browse';
  StatusBotao(True,True,True,True,True);
  edit_DescricaoOper.SetFocus;
end;

procedure TfrmCad_Operador.ModoBrowseAposEcluir;
begin
  strStatusCadastro :='Browse';
  edt_Codigo.Clear;
  edit_DescricaoOper.Text :='';
  edt_Comissao.Clear;
  StatusBotao(True,True,True,True,True);
  edit_DescricaoOper.SetFocus;
end;

procedure TfrmCad_Operador.NovoRegistro;
begin
  strStatusCadastro :='Novo';
  edt_Codigo.Clear;
  edit_DescricaoOper.Text :='';
  edt_Comissao.Clear;
  StatusBotao(False,True,False,False,False);
  edit_DescricaoOper.SetFocus;
end;

procedure TfrmCad_Operador.PesquisaOperador(strCDOperador: String);
begin
QryAuxiliar.Close;
  QryAuxiliar.SQL.Clear;
  QryAuxiliar.SQL.Add('SELECT * FROM TB_OPERADOR WHERE CD_OPERADOR=:CD_OPERADOR');
  QryAuxiliar.ParamByName('CD_OPERADOR').AsString := strCDOperador;
  QryAuxiliar.Open;
  edt_Codigo.Text          := QryAuxiliar.fieldbyname('CD_OPERADOR').asString;
  edit_DescricaoOper.Text  := QryAuxiliar.fieldbyname('DS_OPERADOR').asString;
  edt_Comissao.Text        := QryAuxiliar.fieldbyname('COMISSAO').AsString;
end;

procedure TfrmCad_Operador.PreencheClasseOperador;
begin
  if strStatusCadastro = 'Novo' then
    begin
      QryAuxiliar.Close;
      QryAuxiliar.SQL.Clear;
      QryAuxiliar.SQL.Add('select gen_id(GEN_CODOPERADOR,1) as ID from rdb$database');
      QryAuxiliar.Open;
      ObjOperador.SetCDOPERADOR(FormatFloat('0000000',QryAuxiliar.Fields[0].asInteger));
      edt_Codigo.Text := FormatFloat('0000000',QryAuxiliar.Fields[0].asInteger);
    end
  else
    if strStatusCadastro = 'Editar' then
      ObjOperador.SetCDOPERADOR(FormatFloat('0000000',StrToInt(Trim(edt_Codigo.Text))));
  ObjOperador.SetDSOPERADOR(edit_DescricaoOper.Text);
  ObjOperador.SetCOMISSAO(StrToFloat(edt_Comissao.Text));
end;

procedure TfrmCad_Operador.StatusBotao(booNovo, booSalvar, booEditar,
  booExcluir, booPesquisar: Boolean);
begin
  btnNovo.Enabled      := booNovo;
  btnSalvar.Enabled    := booSalvar;
  btnEditar.Enabled    := booEditar;
  btnExcluir.Enabled   := booExcluir;
  btnPesquisar.Enabled := booPesquisar;
end;

end.
