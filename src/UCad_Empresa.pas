unit UCad_Empresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, UEmpresa,
  Vcl.ExtCtrls, Vcl.ExtDlgs, Vcl.Buttons, Vcl.Imaging.jpeg;

type
  TfrmCad_Empresa = class(TForm)
    Panel1: TPanel;
    GPB_Cad: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edt_Cnpj: TEdit;
    edt_Nomefantasia: TEdit;
    GroupBox1: TGroupBox;
    btnNovo: TButton;
    btnSalvar: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    btnPesquisar: TButton;
    btnSair: TButton;
    QryAuxiliar: TFDQuery;
    edt_Rasaosocial: TEdit;
    Label4: TLabel;
    edt_Endereco: TEdit;
    Label5: TLabel;
    edt_Cep: TEdit;
    Label6: TLabel;
    edt_Telefone: TEdit;
    Label7: TLabel;
    edt_Inscricaoestadual: TEdit;
    Label8: TLabel;
    img_Logo: TImage;
    btn_Logo: TBitBtn;
    OPD_LocalizaLogo: TOpenPictureDialog;
    Shape1: TShape;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edt_CnpjEnter(Sender: TObject);
    procedure edt_CnpjExit(Sender: TObject);
    procedure edt_CnpjKeyPress(Sender: TObject; var Key: Char);
    procedure StatusBotao(booNovo, booSalvar, booEditar, booExcluir, booPesquisar : Boolean);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_LogoClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
    strStatusCadastro : String;
    ObjEmpresa : TEmpresa;
    strFileName: string;
    procedure NovoRegistro;
    procedure PreencheClasseEmpresa;
    procedure GravaCadastroEmpresa;
    procedure ExcluiEmpresa(strCnpj : String);
    procedure ModoBrowse;
    procedure EditarRegistro;
    procedure ModoBrowseAposEcluir;
    procedure PesquisaEmpresa(strCnpj : String);
  public
    { Public declarations }
  end;

var
  frmCad_Empresa: TfrmCad_Empresa;

implementation

{$R *.dfm}

uses uPesquisa, UDMPrincipal;

procedure TfrmCad_Empresa.btnEditarClick(Sender: TObject);
begin
  EditarRegistro;
end;

procedure TfrmCad_Empresa.btnExcluirClick(Sender: TObject);
begin
  if edt_Cnpj.Text = '' then
    begin
      Showmessage('Faça uma consulta para excluir a Empresa.');
      edt_Cnpj.SetFocus;
    end
  else
    begin
      if Application.messageBox('Confirma a Exclusão da Empresa?','Confirmação',mb_YesNo+mb_IconInformation+mb_DefButton2) = IDYES then
        begin
          ExcluiEmpresa(edt_Cnpj.Text);
          ModoBrowseAposEcluir;
        end;
    end;
end;

procedure TfrmCad_Empresa.btnNovoClick(Sender: TObject);
begin
  NovoRegistro;
end;

procedure TfrmCad_Empresa.btnPesquisarClick(Sender: TObject);
begin
  FrmPesquisa := TFrmPesquisa.create(Self);
  FrmPesquisa.gblNomeTabela :='TB_EMPRESA';
  FrmPesquisa.gblCodigo :='CNPJ';
  FrmPesquisa.gblNomepesquisa := 'RAZAO_SOCIAL';
  FrmPesquisa.Caption :='Pesquisa [Empresa]';
  FrmPesquisa.ShowModal;
  edt_Cnpj.Text := DM.gblValCodigo;
  edt_Rasaosocial.Text := DM.gblValNome;
  PesquisaEmpresa(edt_Cnpj.Text);
  edt_Cnpj.SetFocus;
end;

procedure TfrmCad_Empresa.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmCad_Empresa.btnSalvarClick(Sender: TObject);
begin
  PreencheClasseEmpresa;
  GravaCadastroEmpresa;
  if strStatusCadastro = 'Novo' then
    Showmessage('Empresa Cadastrada com sucesso.')
  else
    Showmessage('Empresa Alterarda com sucesso.');
  ModoBrowse;
end;

procedure TfrmCad_Empresa.btn_LogoClick(Sender: TObject);
begin
  if OPD_LocalizaLogo.Execute then
    begin
      img_Logo.Picture.LoadFromFile(OPD_LocalizaLogo.FileName);
      strFileName := OPD_LocalizaLogo.FileName;
    end;
end;

procedure TfrmCad_Empresa.EditarRegistro;
begin
  strStatusCadastro :='Editar';
  StatusBotao(False,True,False,False,True);
  edt_Cnpj.SetFocus;
end;

procedure TfrmCad_Empresa.edt_CnpjEnter(Sender: TObject);
begin
  TEdit(Sender).Color := $00A0FAF8;
end;

procedure TfrmCad_Empresa.edt_CnpjExit(Sender: TObject);
begin
  TEdit(Sender).Color := clwindow;
end;

procedure TfrmCad_Empresa.edt_CnpjKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then
  begin
    PERFORM(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmCad_Empresa.ExcluiEmpresa(strCnpj: String);
begin
  ObjEmpresa.GravaDados('Excluir',strCnpj);
end;

procedure TfrmCad_Empresa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ObjEmpresa.Free;
  Action := cafree;
end;

procedure TfrmCad_Empresa.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  frmCad_Empresa := Nil;
end;

procedure TfrmCad_Empresa.FormShow(Sender: TObject);
begin
  ObjEmpresa := TEmpresa.Create;
end;

procedure TfrmCad_Empresa.GravaCadastroEmpresa;
begin
  if strStatusCadastro = 'Novo' then
    ObjEmpresa.GravaDados('Novo')
   else
     ObjEmpresa.GravaDados('Editar');
end;

procedure TfrmCad_Empresa.ModoBrowse;
begin
  strStatusCadastro :='Browse';
  StatusBotao(True,True,True,True,True);
  edt_Cnpj.SetFocus;
end;

procedure TfrmCad_Empresa.ModoBrowseAposEcluir;
begin
  strStatusCadastro :='Browse';
  edt_Cnpj.Clear;
  edt_Rasaosocial.Clear;
  edt_Nomefantasia.Clear;
  edt_Endereco.Clear;
  edt_Cep.Clear;
  edt_Telefone.Clear;
  edt_Inscricaoestadual.Clear;
  StatusBotao(True,True,True,True,True);
  edt_Cnpj.SetFocus;
end;

procedure TfrmCad_Empresa.NovoRegistro;
begin
  strStatusCadastro :='Novo';
  edt_Cnpj.Clear;
  edt_Rasaosocial.Clear;
  edt_Nomefantasia.Clear;
  edt_Endereco.Clear;
  edt_Cep.Clear;
  edt_Telefone.Clear;
  edt_Inscricaoestadual.Clear;
  StatusBotao(False,True,False,False,False);
  edt_Cnpj.SetFocus;
end;

procedure TfrmCad_Empresa.PesquisaEmpresa(strCnpj: String);
var
  st: TMemoryStream;
  bmp: TBitmap;
begin
  try
  st := TMemoryStream.Create;
  bmp:= TBitmap.Create;
  QryAuxiliar.Close;
  QryAuxiliar.SQL.Clear;
  QryAuxiliar.SQL.Add('SELECT * FROM TB_EMPRESA WHERE CNPJ=:CNPJ');
  QryAuxiliar.ParamByName('CNPJ').AsString := strCnpj;
  QryAuxiliar.Open;
  edt_Cnpj.Text            := QryAuxiliar.fieldbyname('CNPJ').asString;
  edt_Rasaosocial.Text     := QryAuxiliar.fieldbyname('RAZAO_SOCIAL').asString;
  edt_Nomefantasia.Text    := QryAuxiliar.fieldbyname('NOME_FANTASIA').AsString;
  edt_Endereco.Text        := QryAuxiliar.fieldbyname('ENDERECO').AsString;
  edt_Cep.Text             := QryAuxiliar.fieldbyname('CEP').AsString;
  edt_Telefone.Text        := QryAuxiliar.fieldbyname('TELEFONE').AsString;
  edt_Inscricaoestadual.Text:= QryAuxiliar.fieldbyname('IE').AsString;

  if not QryAuxiliar.IsEmpty then
    begin
      if not QryAuxiliar.FieldByName('LOGOMARCA').isNull then
        begin
          TBlobField(QryAuxiliar.FieldByName('LOGOMARCA')).SaveToStream(St);
          St.Position:=0;
          bmp.LoadFromStream(st);
          img_Logo.Picture.Assign(bmp);
        end;
     end;
     st.Free;
     bmp.Free;
  except
  end;
end;

procedure TfrmCad_Empresa.PreencheClasseEmpresa;
begin
  ObjEmpresa.SetCNPJ(Trim(edt_Cnpj.Text));
  ObjEmpresa.SetRAZAOSOCIAL(edt_Rasaosocial.Text);
  ObjEmpresa.SetNOMEFANTASIA(edt_Nomefantasia.Text);
  ObjEmpresa.SetENDERECO(edt_Endereco.Text);
  ObjEmpresa.SetCEP(edt_Cep.Text);
  ObjEmpresa.SetTELEFONE(edt_Telefone.Text);
  ObjEmpresa.SetIE(edt_Inscricaoestadual.Text);
  ObjEmpresa.SetLOGOMARCA(img_Logo.Picture.Graphic);
end;

procedure TfrmCad_Empresa.StatusBotao(booNovo, booSalvar, booEditar, booExcluir,
  booPesquisar: Boolean);
begin
  btnNovo.Enabled      := booNovo;
  btnSalvar.Enabled    := booSalvar;
  btnEditar.Enabled    := booEditar;
  btnExcluir.Enabled   := booExcluir;
  btnPesquisar.Enabled := booPesquisar;
end;

end.
