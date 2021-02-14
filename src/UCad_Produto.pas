unit UCad_Produto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UProdutos, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.StdCtrls, Data.DB, FireDAC.Comp.DataSet, Vcl.ExtCtrls, FireDAC.Comp.Client;

type
  TfrmCad_Produto = class(TForm)
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
    edt_Descricaoprod: TEdit;
    Label3: TLabel;
    edt_DescricaoProdReduzido: TEdit;
    cbo_Unidade: TComboBox;
    Label4: TLabel;
    edt_QtdeTotal: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    edt_Precoprd: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnSairClick(Sender: TObject);
    procedure edt_QtdeTotalKeyPress(Sender: TObject; var Key: Char);
    procedure edt_PrecoprdKeyPress(Sender: TObject; var Key: Char);
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
    ObjProdutos : TProdutos;
    procedure NovoRegistro;
    procedure PreencheClasseProdutos;
    procedure GravaCadastroProdutos;
    procedure ExcluiProdutos(strCDProduto : String);
    procedure ModoBrowse;
    procedure EditarRegistro;
    procedure ModoBrowseAposEcluir;
    procedure PesquisaProdutos(strCDProduto : String);
  public
    { Public declarations }
  end;

var
  frmCad_Produto: TfrmCad_Produto;

implementation

Uses UDMPrincipal, uPesquisa;

{$R *.dfm}

procedure TfrmCad_Produto.btnEditarClick(Sender: TObject);
begin
  EditarRegistro;
end;

procedure TfrmCad_Produto.btnExcluirClick(Sender: TObject);
begin
  if edt_Codigo.Text = '' then
    begin
      Showmessage('Faça uma consulta para excluir o Produto.');
      edt_Descricaoprod.SetFocus;
    end
  else
    begin
      if Application.messageBox('Confirma a Exclusão do Produto?','Confirmação',mb_YesNo+mb_IconInformation+mb_DefButton2) = IDYES then
        begin
          ExcluiProdutos(edt_Codigo.Text);
          ModoBrowseAposEcluir;
        end;
    end;
end;

procedure TfrmCad_Produto.btnNovoClick(Sender: TObject);
begin
  NovoRegistro;
end;

procedure TfrmCad_Produto.btnPesquisarClick(Sender: TObject);
begin
  FrmPesquisa := TFrmPesquisa.create(Self);
  FrmPesquisa.gblNomeTabela :='TB_PRODUTOS';
  FrmPesquisa.gblCodigo :='CD_PRODUTO';
  FrmPesquisa.gblNomepesquisa := 'DS_PRODUTO';
  FrmPesquisa.Caption :='Pesquisa [Produtos]';
  FrmPesquisa.ShowModal;
  edt_Codigo.Text := DM.gblValCodigo;
  edt_Descricaoprod.Text := DM.gblValNome;
  PesquisaProdutos(edt_Codigo.Text);
  edt_Descricaoprod.SetFocus;
end;

procedure TfrmCad_Produto.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmCad_Produto.btnSalvarClick(Sender: TObject);
begin
  PreencheClasseProdutos;
  GravaCadastroProdutos;
  if strStatusCadastro = 'Novo' then
    Showmessage('Produto Cadastrado com sucesso.')
  else
    Showmessage('Produto Alterado com sucesso.');
  ModoBrowse;
end;

procedure TfrmCad_Produto.edt_PrecoprdKeyPress(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#08,#13,',','.'] ) then
    key:=#0;

  if Key = #13 then
  begin
    btnSalvar.SetFocus;
  end;
end;

procedure TfrmCad_Produto.EditarRegistro;
begin
  strStatusCadastro :='Editar';
  StatusBotao(False,True,False,False,True);
  edt_Descricaoprod.SetFocus;
end;

procedure TfrmCad_Produto.edt_CodigoEnter(Sender: TObject);
begin
  TEdit(Sender).Color := $00A0FAF8;
end;

procedure TfrmCad_Produto.edt_CodigoExit(Sender: TObject);
begin
  TEdit(Sender).Color := clwindow;
end;

procedure TfrmCad_Produto.edt_CodigoKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then
  begin
    PERFORM(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmCad_Produto.edt_QtdeTotalKeyPress(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#08,#13,',','.'] ) then
    key:=#0;

  if Key = #13 then
  begin
    edt_Precoprd.SetFocus;
  end;
end;

procedure TfrmCad_Produto.ExcluiProdutos(strCDProduto: String);
begin
  ObjProdutos.GravaDados('Excluir',strCDProduto);
end;

procedure TfrmCad_Produto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ObjProdutos.Free;
  Action := cafree;
end;

procedure TfrmCad_Produto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  frmCad_Produto := Nil;
end;

procedure TfrmCad_Produto.FormShow(Sender: TObject);
begin
  ObjProdutos := TProdutos.Create;
end;

procedure TfrmCad_Produto.GravaCadastroProdutos;
begin
  if strStatusCadastro = 'Novo' then
    ObjProdutos.GravaDados('Novo')
   else
     ObjProdutos.GravaDados('Editar');
end;

procedure TfrmCad_Produto.ModoBrowse;
begin
  strStatusCadastro :='Browse';
  StatusBotao(True,True,True,True,True);
  edt_Descricaoprod.SetFocus;
end;

procedure TfrmCad_Produto.ModoBrowseAposEcluir;
begin
  strStatusCadastro :='Browse';
  edt_Codigo.Clear;
  edt_Descricaoprod.Clear;
  edt_DescricaoProdReduzido.Clear;
  cbo_Unidade.Text :='';
  edt_QtdeTotal.Clear;
  edt_Precoprd.Clear;
  StatusBotao(True,True,True,True,True);
  edt_Descricaoprod.SetFocus;
end;

procedure TfrmCad_Produto.NovoRegistro;
begin
  strStatusCadastro :='Novo';
  edt_Codigo.Clear;
  edt_Descricaoprod.Clear;
  edt_DescricaoProdReduzido.Clear;
  cbo_Unidade.Text :='';
  edt_QtdeTotal.Clear;
  edt_Precoprd.Clear;
  StatusBotao(False,True,False,False,False);
  edt_Descricaoprod.SetFocus;
end;

procedure TfrmCad_Produto.PesquisaProdutos(strCDProduto: String);
begin
  QryAuxiliar.Close;
  QryAuxiliar.SQL.Clear;
  QryAuxiliar.SQL.Add('SELECT * FROM TB_PRODUTOS WHERE CD_PRODUTO=:CD_PRODUTO');
  QryAuxiliar.ParamByName('CD_PRODUTO').AsString := strCDProduto;
  QryAuxiliar.Open;
  edt_Codigo.Text                 := QryAuxiliar.fieldbyname('CD_PRODUTO').asString;
  edt_Descricaoprod.Text          := QryAuxiliar.fieldbyname('DS_PRODUTO').asString;
  edt_DescricaoProdReduzido.Text  := QryAuxiliar.fieldbyname('DS_REDUZIDO_PRODUTO').asString;
  cbo_Unidade.Text                := QryAuxiliar.fieldbyname('UNIDADE_MEDIDA').asString;
  edt_QtdeTotal.Text              := QryAuxiliar.fieldbyname('QTD_ESTOQUE').asString;
  edt_Precoprd.Text               := QryAuxiliar.fieldbyname('PRC_PRODUTO').asString;

end;

procedure TfrmCad_Produto.PreencheClasseProdutos;
begin
  if strStatusCadastro = 'Novo' then
    begin
      QryAuxiliar.Close;
      QryAuxiliar.SQL.Clear;
      QryAuxiliar.SQL.Add('select gen_id(GEN_CODPRODUTO,1) as ID from rdb$database');
      QryAuxiliar.Open;
      ObjProdutos.SetCDPRODUTO(FormatFloat('0000000000000',QryAuxiliar.Fields[0].asInteger));
      edt_Codigo.Text := FormatFloat('0000000000000',QryAuxiliar.Fields[0].asInteger);
    end
  else
    if strStatusCadastro = 'Editar' then
      ObjProdutos.SetCDPRODUTO(FormatFloat('0000000000000',StrToInt(Trim(edt_Codigo.Text))));
  ObjProdutos.SetDSPRODUTO(edt_Descricaoprod.Text);
  ObjProdutos.SetDSREDUZIDOPRODUTO(edt_DescricaoProdReduzido.Text);
  ObjProdutos.SetUNIDADEMEDIDA(cbo_Unidade.Text);
  ObjProdutos.SetQTDESTOQUE(StrToFloat(edt_QtdeTotal.Text));
  ObjProdutos.SetPRCPRODUTO(StrToFloat(edt_Precoprd.Text));
end;

procedure TfrmCad_Produto.StatusBotao(booNovo, booSalvar, booEditar, booExcluir,
  booPesquisar: Boolean);
begin
  btnNovo.Enabled      := booNovo;
  btnSalvar.Enabled    := booSalvar;
  btnEditar.Enabled    := booEditar;
  btnExcluir.Enabled   := booExcluir;
  btnPesquisar.Enabled := booPesquisar;
end;

end.
