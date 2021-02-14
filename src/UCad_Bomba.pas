unit UCad_Bomba;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, UBombas,
  FireDAC.Comp.Client;

type
  TfrmCad_Bombas = class(TForm)
    Panel1: TPanel;
    GPB_Cad: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edt_Codigo: TEdit;
    GroupBox1: TGroupBox;
    btnNovo: TButton;
    btnSalvar: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    btnPesquisar: TButton;
    btnSair: TButton;
    QryAuxiliar: TFDQuery;
    edt_descricao: TEdit;
    lcb_Tanques: TDBLookupComboBox;
    QryTANQUE: TFDQuery;
    QryTANQUECD_TANQUE: TStringField;
    QryTANQUETP_COMBUSTIVEL: TStringField;
    QryTANQUETOTAL_LITROS: TBCDField;
    ds_Tanque: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
    strStatusCadastro : String;
    ObjBombas : TBombas;
    procedure NovoRegistro;
    procedure PreencheClasseBombas;
    procedure GravaCadastroBombas;
    procedure ExcluiBombas(strCDBomba : String);
    procedure ModoBrowse;
    procedure EditarRegistro;
    procedure ModoBrowseAposEcluir;
    procedure PesquisaBomba(strCDBomba : String);
    procedure StatusBotao(booNovo, booSalvar, booEditar, booExcluir, booPesquisar : Boolean);
  public
    { Public declarations }
  end;

var
  frmCad_Bombas: TfrmCad_Bombas;

implementation

Uses UDMPrincipal, uPesquisa;

{$R *.dfm}

procedure TfrmCad_Bombas.btnEditarClick(Sender: TObject);
begin
  EditarRegistro;
end;

procedure TfrmCad_Bombas.btnExcluirClick(Sender: TObject);
begin
  if edt_Codigo.Text = '' then
    begin
      Showmessage('Faça uma consulta para excluir a Bomba.');
      edt_descricao.SetFocus;
    end
  else
    begin
      if Application.messageBox('Confirma a Exclusão da Bomba?','Confirmação',mb_YesNo+mb_IconInformation+mb_DefButton2) = IDYES then
        begin
          ExcluiBombas(edt_Codigo.Text);
          ModoBrowseAposEcluir;
        end;
    end;
end;

procedure TfrmCad_Bombas.btnNovoClick(Sender: TObject);
begin
  NovoRegistro;
end;

procedure TfrmCad_Bombas.btnPesquisarClick(Sender: TObject);
begin
  FrmPesquisa := TFrmPesquisa.create(Self);
  FrmPesquisa.gblNomeTabela :='TB_BOMBA';
  FrmPesquisa.gblCodigo :='CD_BOMBA';
  FrmPesquisa.gblNomepesquisa := 'DS_BOMBA';
  FrmPesquisa.Caption :='Pesquisa [Bombas]';
  FrmPesquisa.ShowModal;
  edt_Codigo.Text := DM.gblValCodigo;
  edt_descricao.Text := DM.gblValNome;
  PesquisaBomba(edt_Codigo.Text);
  edt_descricao.SetFocus;
end;

procedure TfrmCad_Bombas.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmCad_Bombas.btnSalvarClick(Sender: TObject);
begin
  PreencheClasseBombas;
  GravaCadastroBombas;
  if strStatusCadastro = 'Novo' then
    Showmessage('Bomba Cadastrado com sucesso.')
  else
    Showmessage('Bomba Alterada com sucesso.');
  ModoBrowse;
  ObjBombas.Free;
end;

procedure TfrmCad_Bombas.EditarRegistro;
begin
  strStatusCadastro :='Editar';
  StatusBotao(False,True,False,False,True);
  edt_descricao.SetFocus;
end;

procedure TfrmCad_Bombas.ExcluiBombas(strCDBomba: String);
begin
  ObjBombas.GravaDados('Excluir',strCDBomba);
end;

procedure TfrmCad_Bombas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TfrmCad_Bombas.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  ObjBombas.Free;
  frmCad_Bombas := Nil;
end;

procedure TfrmCad_Bombas.FormShow(Sender: TObject);
begin
  ObjBombas := TBombas.Create;
  QryTANQUE.Close;
  QryTANQUE.Open();
end;

procedure TfrmCad_Bombas.GravaCadastroBombas;
begin
  if strStatusCadastro = 'Novo' then
    ObjBombas.GravaDados('Novo')
   else
     ObjBombas.GravaDados('Editar');
end;

procedure TfrmCad_Bombas.ModoBrowse;
begin
  strStatusCadastro :='Browse';
  StatusBotao(True,True,True,True,True);
  edt_descricao.SetFocus;
end;

procedure TfrmCad_Bombas.ModoBrowseAposEcluir;
begin
  strStatusCadastro :='Browse';
  edt_Codigo.Clear;
  edt_descricao.clear;
  lcb_Tanques.KeyValue :='';
  StatusBotao(True,True,True,True,True);
  edt_descricao.SetFocus;
end;

procedure TfrmCad_Bombas.NovoRegistro;
begin
  strStatusCadastro :='Novo';
  edt_Codigo.Clear;
  edt_descricao.Clear;
  lcb_Tanques.KeyValue :='';
  StatusBotao(False,True,False,False,False);
  edt_descricao.SetFocus;
end;

procedure TfrmCad_Bombas.PesquisaBomba(strCDBomba: String);
begin
  QryAuxiliar.Close;
  QryAuxiliar.SQL.Clear;
  QryAuxiliar.SQL.Add('SELECT * FROM TB_BOMBA WHERE CD_BOMBA=:CD_BOMBA');
  QryAuxiliar.ParamByName('CD_BOMBA').AsString := strCDBomba;
  QryAuxiliar.Open;
  edt_Codigo.Text          := QryAuxiliar.fieldbyname('CD_BOMBA').asString;
  edt_descricao.Text       := QryAuxiliar.fieldbyname('DS_BOMBA').asString;
  lcb_Tanques.KeyValue     := QryAuxiliar.fieldbyname('CD_TANQUE').asString;
end;

procedure TfrmCad_Bombas.PreencheClasseBombas;
begin
  if strStatusCadastro = 'Novo' then
    begin
      QryAuxiliar.Close;
      QryAuxiliar.SQL.Clear;
      QryAuxiliar.SQL.Add('select gen_id(GEN_CODBOMBA,1) as ID from rdb$database');
      QryAuxiliar.Open;
      ObjBombas.SetCDBOMBA(FormatFloat('000',QryAuxiliar.Fields[0].asInteger));
      edt_Codigo.Text := FormatFloat('000',QryAuxiliar.Fields[0].asInteger);
    end
  else
    if strStatusCadastro = 'Editar' then
      ObjBombas.SetCDBOMBA(FormatFloat('000',StrToInt(Trim(edt_Codigo.Text))));
  ObjBombas.SetDSBOMBA(edt_descricao.Text);
  ObjBombas.SetCDTANQUE(lcb_Tanques.KeyValue);
end;

procedure TfrmCad_Bombas.StatusBotao(booNovo, booSalvar, booEditar, booExcluir,
  booPesquisar: Boolean);
begin
  btnNovo.Enabled      := booNovo;
  btnSalvar.Enabled    := booSalvar;
  btnEditar.Enabled    := booEditar;
  btnExcluir.Enabled   := booExcluir;
  btnPesquisar.Enabled := booPesquisar;
end;

end.
