unit UCad_TAMQUE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, UTanques,
  Vcl.StdCtrls, Vcl.Forms, Vcl.Controls, System.Classes, Vcl.ExtCtrls,
  Vcl.Graphics, Dialogs, Buttons, Menus, Mask, DBCtrls, DB,   ShellApi,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmCad_Tanques = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    btnNovo: TButton;
    btnSalvar: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    btnPesquisar: TButton;
    btnSair: TButton;
    GPB_Cad: TGroupBox;
    Label1: TLabel;
    edt_Codigo: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edt_QtdeTotal: TEdit;
    QryAuxiliar: TFDQuery;
    cbo_tipocombustivel: TComboBox;
    procedure edt_CodigoEnter(Sender: TObject);
    procedure edt_CodigoExit(Sender: TObject);
    procedure edt_CodigoKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure StatusBotao(booNovo, booSalvar, booEditar, booExcluir, booPesquisar : Boolean);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure edt_QtdeTotalKeyPress(Sender: TObject; var Key: Char);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    strStatusCadastro : String;
    ObjTanques : TTanques;
    procedure NovoRegistro;
    procedure PreencheClasseTanques;
    procedure GravaCadastroTanques;
    procedure ExcluiTanque(strCDTanque : String);
    procedure ModoBrowse;
    procedure EditarRegistro;
    procedure ModoBrowseAposEcluir;
    procedure PesquisaTanque(strCDTanque : String);
  public
    { Public declarations }
  end;

var
  frmCad_Tanques: TfrmCad_Tanques;

implementation

Uses UDMPrincipal, uPesquisa;

{$R *.dfm}

procedure TfrmCad_Tanques.btnEditarClick(Sender: TObject);
begin
  EditarRegistro;
end;

procedure TfrmCad_Tanques.btnExcluirClick(Sender: TObject);
begin
  if edt_Codigo.Text = '' then
    begin
      Showmessage('Faça uma consulta para excluir o Tanque.');
      cbo_tipocombustivel.SetFocus;
    end
  else
    begin
      if Application.messageBox('Confirma a Exclusão do Tanque?','Confirmação',mb_YesNo+mb_IconInformation+mb_DefButton2) = IDYES then
        begin
          ExcluiTanque(edt_Codigo.Text);
          ModoBrowseAposEcluir;
        end;
    end;
end;

procedure TfrmCad_Tanques.btnNovoClick(Sender: TObject);
begin
  NovoRegistro;
end;

procedure TfrmCad_Tanques.btnPesquisarClick(Sender: TObject);
begin
  FrmPesquisa := TFrmPesquisa.create(Self);
  FrmPesquisa.gblNomeTabela :='TB_TANQUE';
  FrmPesquisa.gblCodigo :='CD_TANQUE';
  FrmPesquisa.gblNomepesquisa := 'TP_COMBUSTIVEL';
  FrmPesquisa.Caption :='Pesquisa [Tanques]';
  FrmPesquisa.ShowModal;
  edt_Codigo.Text := DM.gblValCodigo;
  cbo_tipocombustivel.Text := DM.gblValNome;
  PesquisaTanque(edt_Codigo.Text);
  cbo_tipocombustivel.SetFocus;
end;

procedure TfrmCad_Tanques.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmCad_Tanques.btnSalvarClick(Sender: TObject);
begin
  PreencheClasseTanques;
  GravaCadastroTanques;
  if strStatusCadastro = 'Novo' then
    Showmessage('Tanque Cadastrado com sucesso.')
  else
    Showmessage('Tanque Alterado com sucesso.');
  ModoBrowse;
end;

procedure TfrmCad_Tanques.EditarRegistro;
begin
  strStatusCadastro :='Editar';
  StatusBotao(False,True,False,False,True);
  cbo_tipocombustivel.SetFocus;
end;

procedure TfrmCad_Tanques.edt_CodigoEnter(Sender: TObject);
begin
  TEdit(Sender).Color := $00A0FAF8;
end;

procedure TfrmCad_Tanques.edt_CodigoExit(Sender: TObject);
begin
  TEdit(Sender).Color := clwindow;
end;

procedure TfrmCad_Tanques.edt_CodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    PERFORM(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmCad_Tanques.edt_QtdeTotalKeyPress(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#08,#13] ) then
    key:=#0;

  if Key = #13 then
  begin
    PERFORM(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmCad_Tanques.ExcluiTanque(strCDTanque: String);
begin
  ObjTanques.GravaDados('Excluir',strCDTanque);
end;

procedure TfrmCad_Tanques.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ObjTanques.Free;
  Action := Cafree;
end;

procedure TfrmCad_Tanques.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  frmCad_Tanques :=Nil;
end;

procedure TfrmCad_Tanques.FormShow(Sender: TObject);
begin
  ObjTanques := TTanques.Create;
end;

procedure TfrmCad_Tanques.GravaCadastroTanques;
begin
  if strStatusCadastro = 'Novo' then
    ObjTanques.GravaDados('Novo')
   else
     ObjTanques.GravaDados('Editar');
end;

procedure TfrmCad_Tanques.ModoBrowse;
begin
  strStatusCadastro :='Browse';
  StatusBotao(True,True,True,True,True);
  cbo_tipocombustivel.SetFocus;
end;

procedure TfrmCad_Tanques.ModoBrowseAposEcluir;
begin
  strStatusCadastro :='Browse';
  edt_Codigo.Clear;
  cbo_tipocombustivel.Text :='';
  edt_QtdeTotal.Clear;
  StatusBotao(True,True,True,True,True);
  cbo_tipocombustivel.SetFocus;
end;

procedure TfrmCad_Tanques.NovoRegistro;
begin
  strStatusCadastro :='Novo';
  edt_Codigo.Clear;
  cbo_tipocombustivel.Text :='';
  edt_QtdeTotal.Clear;
  StatusBotao(False,True,False,False,False);
  cbo_tipocombustivel.SetFocus;
end;

procedure TfrmCad_Tanques.PesquisaTanque(strCDTanque: String);
begin
  QryAuxiliar.Close;
  QryAuxiliar.SQL.Clear;
  QryAuxiliar.SQL.Add('SELECT * FROM TB_TANQUE WHERE CD_TANQUE=:CD_TANQUE');
  QryAuxiliar.ParamByName('CD_TANQUE').AsString := strCDTanque;
  QryAuxiliar.Open;
  edt_Codigo.Text          := QryAuxiliar.fieldbyname('CD_TANQUE').asString;
  cbo_tipocombustivel.Text := QryAuxiliar.fieldbyname('TP_COMBUSTIVEL').asString;
  edt_QtdeTotal.Text       := QryAuxiliar.fieldbyname('TOTAL_LITROS').AsString;
end;

procedure TfrmCad_Tanques.PreencheClasseTanques;
begin
  if strStatusCadastro = 'Novo' then
    begin
      QryAuxiliar.Close;
      QryAuxiliar.SQL.Clear;
      QryAuxiliar.SQL.Add('select gen_id(GEN_CODTANQUE,1) as ID from rdb$database');
      QryAuxiliar.Open;
      ObjTanques.SetCDTanque(FormatFloat('0000000',QryAuxiliar.Fields[0].asInteger));
      edt_Codigo.Text := FormatFloat('0000000',QryAuxiliar.Fields[0].asInteger);
    end
  else
    if strStatusCadastro = 'Editar' then
      ObjTanques.SetCDTanque(FormatFloat('0000000',StrToInt(Trim(edt_Codigo.Text))));
  ObjTanques.SetTPCombustivel(cbo_tipocombustivel.Text);
  ObjTanques.SetTotalLitros(StrToFloat(edt_QtdeTotal.Text));
end;

procedure TfrmCad_Tanques.StatusBotao(booNovo, booSalvar, booEditar, booExcluir,
  booPesquisar: Boolean);
begin
  btnNovo.Enabled      := booNovo;
  btnSalvar.Enabled    := booSalvar;
  btnEditar.Enabled    := booEditar;
  btnExcluir.Enabled   := booExcluir;
  btnPesquisar.Enabled := booPesquisar;
end;

end.
