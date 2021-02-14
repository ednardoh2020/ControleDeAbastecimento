unit UVendasPDV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmMov_Vendas = class(TForm)
    Panel1: TPanel;
    pn_Top: TPanel;
    pn_Botton: TPanel;
    pn_Grid: TPanel;
    pn_Cupom: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel4: TPanel;
    Shape1: TShape;
    Shape3: TShape;
    Shape4: TShape;
    mem_Cupom: TMemo;
    pn_left: TPanel;
    DBGrid1: TDBGrid;
    lblMessagem: TLabel;
    edt_CodigoProd: TEdit;
    Edt_Qtde: TEdit;
    Edt_PrecProd: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    edt_Bomba: TEdit;
    Label5: TLabel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    EdtTotVenda: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label1: TLabel;
    edt_Operador: TEdit;
    Label8: TLabel;
    edt_Caixa: TEdit;
    QryParamentro: TFDQuery;
    QryParamentroCNPJ_EMPR: TStringField;
    QryParamentroCD_OPERADOR: TStringField;
    QryParamentroCD_CAIXA: TStringField;
    QryParamentroDT_ABERTURA: TDateField;
    QryParamentroSLD_INICIAL: TBCDField;
    QryParamentroIMPOSTO_PADR: TCurrencyField;
    QryParamentroCD_FPGTO: TStringField;
    Qry_VENDA: TFDQuery;
    Qry_VENDACD_MOVVENDAS: TStringField;
    Qry_VENDADT_MOVVENDAS: TDateField;
    Qry_VENDACD_TANQUE: TStringField;
    Qry_VENDACD_BOMBA: TStringField;
    Qry_VENDACD_PRODUTO: TStringField;
    Qry_VENDACD_OPERADOR: TStringField;
    Qry_VENDACD_CAIXA: TStringField;
    Qry_VENDACD_FPGTO: TStringField;
    Qry_VENDADS_HISTORICO: TStringField;
    Qry_VENDAVALOR_VENDA: TBCDField;
    Qry_VENDADESCONTO: TBCDField;
    Qry_VENDATROCO: TBCDField;
    Qry_VENDAQTD_PROD: TBCDField;
    Qry_VENDAPRC_PROD: TBCDField;
    Qry_VENDAVALOR_IMPOSTO: TBCDField;
    ds_Venda: TDataSource;
    Qry_Produtos: TFDQuery;
    Qry_ProdutosCD_PRODUTO: TStringField;
    Qry_ProdutosDS_PRODUTO: TStringField;
    Qry_ProdutosDS_REDUZIDO_PRODUTO: TStringField;
    Qry_ProdutosUNIDADE_MEDIDA: TStringField;
    Qry_ProdutosQTD_ESTOQUE: TBCDField;
    Qry_ProdutosPRC_PRODUTO: TBCDField;
    Qry_VENDADS_PRODUTO: TStringField;
    Qry_VENDADS_PRODREDUZIDO: TStringField;
    Qry_VENDAUNID_PROD: TStringField;
    Qry_VENDAPRC_PRODUTO: TBCDField;
    Qry_Bomba: TFDQuery;
    Qry_BombaCD_BOMBA: TStringField;
    Qry_BombaDS_BOMBA: TStringField;
    Qry_BombaCD_TANQUE: TStringField;
    QryAuxiliar: TFDQuery;
    Qry_Empresa: TFDQuery;
    Qry_EmpresaCNPJ: TStringField;
    Qry_EmpresaRAZAO_SOCIAL: TStringField;
    Qry_EmpresaNOME_FANTASIA: TStringField;
    Qry_EmpresaENDERECO: TStringField;
    Qry_EmpresaCEP: TStringField;
    Qry_EmpresaTELEFONE: TStringField;
    Qry_EmpresaIE: TStringField;
    Qry_EmpresaLOGOMARCA: TBlobField;
    QryParamentroDESC_PADRAO: TBCDField;
    Qry_VENDADS_BOMBA: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edt_CodigoProdKeyPress(Sender: TObject; var Key: Char);
    procedure edt_BombaExit(Sender: TObject);
    procedure edt_BombaKeyPress(Sender: TObject; var Key: Char);
    procedure Edt_QtdeExit(Sender: TObject);
    procedure Edt_QtdeKeyPress(Sender: TObject; var Key: Char);
    procedure Edt_PrecProdKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    sCodCupom : String;
    iTemPrd   : Integer;
    vlTotalVenda : Double;
    strStatusPDV : String;
    procedure MenssagemPDV(pMenssagem: string);
    procedure InicializaParametros;
    procedure AbreVenda;
    procedure AbreMovimentação(sCDMovvenda : String);
    procedure CriaCabecalhoArqCupom;
    procedure CriaItensArqCupom;
    procedure FinalizaCupom;
    procedure AbreAqrFileCupom;
    procedure ConsultaProduto;
    procedure ConsultaBomba;
    procedure LimpaCampos;
    procedure chamaFPgto;
    procedure FinalizaVenda;
    Procedure Memo_Print(Conteudo:TStrings);
    function PadC(S: String; I: Integer): String;
    function GeraCodigoVenda : string;
    function RetornaBombaTanque(pCdBomba : String) : String;
    function RetornaDescrProduto(pCDProduto : String) : String;
    function RetornaDescricaoFPGTO(pCDFpgto : String) : String;
    function Espaco(Tamanho: Integer): string;
  public
    { Public declarations }
  end;

var
  frmMov_Vendas: TfrmMov_Vendas;

implementation

Uses UDMPrincipal, uPesquisaProd, uPesquisa, uFormaPgto, Printers;

{$R *.dfm}

procedure TfrmMov_Vendas.AbreAqrFileCupom;
begin
  mem_Cupom.Lines.Clear;
  mem_Cupom.Lines.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Cupomvenda.TXT');
end;

procedure TfrmMov_Vendas.AbreMovimentação(sCDMovvenda : String);
begin
  Qry_VENDA.Append;
  Qry_VENDACD_MOVVENDAS.AsString :=sCDMovvenda;
  Qry_VENDADT_MOVVENDAS.Value    := now;
  Qry_VENDACD_OPERADOR.AsString  := edt_Operador.Text;
  Qry_VENDACD_CAIXA.AsString     := edt_Caixa.Text;
end;

procedure TfrmMov_Vendas.AbreVenda;
begin
  sCodCupom :='';
  iTemPrd   :=0;
  vlTotalVenda :=0;
  MenssagemPDV('CAIXA EM MOVIMENTAÇÃO DE VENDA');
  Qry_VENDA.Insert;
  Qry_VENDACD_MOVVENDAS.AsString :=GeraCodigoVenda;
  Qry_VENDADT_MOVVENDAS.Value    := now;
  Qry_VENDACD_OPERADOR.AsString  := edt_Operador.Text;
  Qry_VENDACD_CAIXA.AsString     := edt_Caixa.Text;
  sCodCupom :=Qry_VENDACD_MOVVENDAS.AsString;
  edt_CodigoProd.SetFocus;
  CriaCabecalhoArqCupom; //gera o cabecalho do cupon
  AbreAqrFileCupom;
  strStatusPDV :='EM PROCESSO DE VENDA';
end;

procedure TfrmMov_Vendas.chamaFPgto;
begin
  if strStatusPDV ='EM PROCESSO DE VENDA' then
    begin
      MenssagemPDV('CAIXA EM MOVIMENTAÇÃO DE PAGAMENTO');
      strStatusPDV := 'CAIXA EM MOVIMENTAÇÃO DE PAGAMENTO';
      if Qry_VENDA.State in [dsEdit, dsInsert] then
        Qry_VENDA.Cancel;
      frmForma_Pgto :=TfrmForma_Pgto.create(Self);
      frmForma_Pgto.edt_TotVenda.Text := EdtTotVenda.Text;
      frmForma_Pgto.Showmodal;
    end
  else
    begin
      Showmessage('Só poderá efetuar pagamento se estiver em precesso de venda.');
    end;
end;

procedure TfrmMov_Vendas.ConsultaBomba;
begin
  if strStatusPDV ='EM PROCESSO DE VENDA' then
    begin
      FrmPesquisa := TFrmPesquisa.create(Self);
      FrmPesquisa.gblNomeTabela :='TB_BOMBA';
      FrmPesquisa.gblCodigo :='CD_BOMBA';
      FrmPesquisa.gblNomepesquisa := 'DS_BOMBA';
      FrmPesquisa.Caption :='Pesquisa [Bomba]';
      FrmPesquisa.ShowModal;
      edt_Bomba.Text := DM.gblValCodigo;
    end
  else
    begin
      Showmessage('Só poderá consultar Bombas se estiver em precesso de venda.');
      edt_Bomba.SetFocus;
    end;
end;

procedure TfrmMov_Vendas.ConsultaProduto;
begin
  if strStatusPDV ='EM PROCESSO DE VENDA' then
    begin
      frmPes_Produto := TfrmPes_Produto.create(Self);
      frmPes_Produto.ShowModal;
      edt_CodigoProd.Text := DM.gblValCodigo;
      Edt_PrecProd.Text   := FormatFloat(',0.0000',StrToFloat(DM.gblValPrcProd));
      lblMessagem.Caption := RetornaDescrProduto(Trim(edt_CodigoProd.Text));
    end
  else
    begin
      Showmessage('Só poderá consultar Produtos se estiver em precesso de venda.');
      edt_CodigoProd.SetFocus;
    end;
end;

procedure TfrmMov_Vendas.CriaCabecalhoArqCupom;
var  arqF: TextFile;
begin
  try
    {PEGA OS DADOS DA EMPRESA, ME ESQUECI DE BOTAR A CIDADE NO CADASTRO DA EMPRESA
     MAIS VOU BOTAR NA MÃO POR QUE ESTOU SEM TEMPO...}
    Qry_Empresa.Close;
    Qry_Empresa.Params.ParamByName('CNPJ').AsString := QryParamentroCNPJ_EMPR.AsString;
    Qry_Empresa.Open();
    AssignFile(arqF, ExtractFilePath(Application.ExeName) + 'Cupomvenda.TXT');
    Rewrite(arqF);
    Writeln(arqF, PadC(Qry_EmpresaNOME_FANTASIA.AsString, 60));
    Writeln(arqF, PadC(Qry_EmpresaENDERECO.AsString, 60));
    Writeln(arqF, PadC('FORTALEZA - CE', 60));
    Writeln(arqF, 'CNPJ : ' + Qry_EmpresaCNPJ.AsString);
    Writeln(arqF, 'IE : ' + Qry_EmpresaIE.AsString);
    Writeln(arqF, '------------------------------------------------------------');
    Writeln(arqF, PadC(FormatDateTime('dd/mm/yyyy HH:mm:ss',Now)+'        C00 : ' + sCodCupom, 60));
    Writeln(arqF, PadC('CUPOM FIISCAL DE TESTE',60));
    Writeln(arqF, PadC('ITEM CODPROD       DESCRICAO      QTDE VL UNIT VL IMPOS',60));
    Writeln(arqF, '------------------------------------------------------------');
    CloseFile(arqF);

  except

  end;

end;

procedure TfrmMov_Vendas.CriaItensArqCupom;
var  arqF: TextFile;
begin
  try
    {PEGA OS DADOS DA EMPRESA, ME ESQUECI DE BOTAR A CIDADE NO CADASTRO DA EMPRESA
     MAIS VOU BOTAR NA MÃO POR QUE ESTOU SEM TEMPO...}
    vlTotalVenda := 0;
    Qry_Empresa.Close;
    Qry_Empresa.Params.ParamByName('CNPJ').AsString := QryParamentroCNPJ_EMPR.AsString;
    Qry_Empresa.Open();
    AssignFile(arqF, ExtractFilePath(Application.ExeName) + 'Cupomvenda.TXT');
    Rewrite(arqF);
    Writeln(arqF, PadC(Qry_EmpresaNOME_FANTASIA.AsString, 60));
    Writeln(arqF, PadC(Qry_EmpresaENDERECO.AsString, 60));
    Writeln(arqF, PadC('FORTALEZA - CE', 60));
    Writeln(arqF, 'CNPJ : ' + Qry_EmpresaCNPJ.AsString);
    Writeln(arqF, 'IE : ' + Qry_EmpresaIE.AsString);
    Writeln(arqF, '------------------------------------------------------------');
    Writeln(arqF, PadC(FormatDateTime('dd/mm/yyyy HH:mm:ss',Now)+'        C00 : ' + sCodCupom, 60));
    Writeln(arqF, PadC('CUPOM FIISCAL DE TESTE',60));
    Writeln(arqF, PadC('ITEM CODPROD       DESCRICAO      QTDE VL UNIT VL IMPOS',60));
    Writeln(arqF, '------------------------------------------------------------');
    Qry_VENDA.Close;
    Qry_VENDA.Params.ParamByName('CD_MOVVENDAS').AsString :=sCodCupom;
    Qry_VENDA.Open();
    Qry_VENDA.First;
    while not Qry_VENDA.eof do
      begin
        iTemPrd := iTemPrd + 1;
        Writeln(arqF, IntToStr(iTemPrd)+'  '+
                      Qry_VENDA.FieldByName('CD_PRODUTO').AsString+'   '+
                      Copy(Qry_VENDA.FieldByName('DS_PRODREDUZIDO').AsString,1,16)+
                      Espaco(18-Length(copy(Qry_VENDA.FieldByName('DS_PRODREDUZIDO').AsString,1,16)))+'  '+
                      FormatFloat(',0.000',Qry_VENDA.FieldByName('QTD_PROD').AsFloat)+'  '+
                      FormatFloat(',0.0000',Qry_VENDA.FieldByName('PRC_PROD').AsFloat)+'   '+
                      FormatFloat(',0.00',Qry_VENDA.FieldByName('VALOR_VENDA').AsFloat));
        vlTotalVenda := vlTotalVenda + ((Qry_VENDAQTD_PROD.AsFloat * Qry_VENDAPRC_PROD.AsFloat) + Qry_VENDAVALOR_IMPOSTO.AsFloat) - Qry_VENDADESCONTO.AsFloat;
        Qry_VENDA.Next;
      end;
    CloseFile(arqF);
    AbreAqrFileCupom;
    EdtTotVenda.Text := FormatFloat(',0.00',vlTotalVenda);
  except

  end;
end;

procedure TfrmMov_Vendas.edt_BombaExit(Sender: TObject);
begin
  if trim(edt_Bomba.Text) = '' then
    begin
      Showmessage('Bomba não pode ser Nulo, Favor prencha o campo da Bomba.');
      edt_Bomba.SetFocus;
    end;
end;

procedure TfrmMov_Vendas.edt_BombaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    begin
      if edt_Bomba.Text <> '' then
        Edt_Qtde.SetFocus
      else
        edt_Bomba.SetFocus;    
    end;
end;

procedure TfrmMov_Vendas.edt_CodigoProdKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    begin
      edt_Bomba.SetFocus;
    end;
end;

procedure TfrmMov_Vendas.Edt_PrecProdKeyPress(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#08,#13] ) then
    key:=#0;
end;

procedure TfrmMov_Vendas.Edt_QtdeExit(Sender: TObject);
var
  fPrecoVenda,
  fValorImposto,
  fValorDesc : Double;
begin
  try
  fPrecoVenda   := 0;
  fValorImposto := 0;
  fValorDesc    := 0;
  if trim(Edt_Qtde.Text) = '' then
    begin
      Showmessage('Qtde não pode ser Nulo, Favor prencha o campo da Qtde.');
      Edt_Qtde.SetFocus;
    end
  else
    begin
      Edt_Qtde.Text := FormatFloat(',0.000',StrToFloat(Edt_Qtde.Text));
      if Qry_Produtos.Locate('CD_PRODUTO',edt_CodigoProd.Text,[]) then
        begin
          if Qry_VENDA.State in [dsEdit, dsInsert] then
            begin
              {GRAVA OS PRODUTOS DA VENDA}
              fPrecoVenda   := (Qry_ProdutosPRC_PRODUTO.AsFloat * StrToFloat(Trim(Edt_Qtde.Text)));
              fValorImposto := ((Qry_ProdutosPRC_PRODUTO.AsFloat * StrToFloat(Trim(Edt_Qtde.Text))) * QryParamentroIMPOSTO_PADR.AsFloat / 100);
              fValorDesc    := ((Qry_ProdutosPRC_PRODUTO.AsFloat * StrToFloat(Trim(Edt_Qtde.Text))) * QryParamentroDESC_PADRAO.AsFloat / 100);
              Qry_VENDACD_PRODUTO.AsString   := Qry_ProdutosCD_PRODUTO.AsString;
              Qry_VENDADS_HISTORICO.AsString := 'VENDA AO CONSUMIDOR CUPOM : '+sCodCupom;
              Qry_VENDAQTD_PROD.AsString     := Trim(Edt_Qtde.Text);
              Qry_VENDAPRC_PROD.AsString     := Qry_ProdutosPRC_PRODUTO.AsString;
              Qry_VENDACD_TANQUE.AsString    := RetornaBombaTanque(Trim(edt_Bomba.Text)); //CD_TANQUE QUE PEGOU DA PESQUISA DE BOMBAS
              Qry_VENDACD_BOMBA.AsString     := Trim(edt_Bomba.Text); //CD_BOMBA QUE PEGOU DA CONSULTA
              Qry_VENDAVALOR_VENDA.AsFloat   := (fPrecoVenda + fValorImposto) - fValorDesc;
              Qry_VENDADESCONTO.AsFloat      := fValorDesc;
              Qry_VENDAVALOR_IMPOSTO.AsFloat := fValorImposto;
              Qry_VENDA.Post;
              CriaItensArqCupom;
              LimpaCampos;
              if strStatusPDV ='EM PROCESSO DE VENDA' then
                AbreMovimentação(sCodCupom);
            end;
        end;
    end;
  except

  end;
end;

procedure TfrmMov_Vendas.Edt_QtdeKeyPress(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#08,#13] ) then
    key:=#0;

  if key = #13 then
    begin
      if Edt_Qtde.Text <> '' then
        edt_CodigoProd.SetFocus
      else
        Edt_Qtde.SetFocus;
    end;
end;

function TfrmMov_Vendas.Espaco(Tamanho: Integer): string;
begin
  Result := '';
  while Tamanho > 0 do
    begin
      Tamanho:= Tamanho - 1;
      Result := Result + ' ';
    end;
end;

procedure TfrmMov_Vendas.FinalizaCupom;
var  arqF: TextFile;
begin
  try
    {PEGA OS DADOS DA EMPRESA, ME ESQUECI DE BOTAR A CIDADE NO CADASTRO DA EMPRESA
     MAIS VOU BOTAR NA MÃO POR QUE ESTOU SEM TEMPO...}
    Qry_Empresa.Close;
    Qry_Empresa.Params.ParamByName('CNPJ').AsString := QryParamentroCNPJ_EMPR.AsString;
    Qry_Empresa.Open();
    AssignFile(arqF, ExtractFilePath(Application.ExeName) + 'Cupomvenda.TXT');
    Rewrite(arqF);
    Writeln(arqF, PadC(Qry_EmpresaNOME_FANTASIA.AsString, 60));
    Writeln(arqF, PadC(Qry_EmpresaENDERECO.AsString, 60));
    Writeln(arqF, PadC('FORTALEZA - CE', 60));
    Writeln(arqF, 'CNPJ : ' + Qry_EmpresaCNPJ.AsString);
    Writeln(arqF, 'IE : ' + Qry_EmpresaIE.AsString);
    Writeln(arqF, '------------------------------------------------------------');
    Writeln(arqF, PadC(FormatDateTime('dd/mm/yyyy HH:mm:ss',Now)+'        C00 : ' + sCodCupom, 60));
    Writeln(arqF, PadC('CUPOM FIISCAL DE TESTE',60));
    Writeln(arqF, PadC('ITEM CODPROD       DESCRICAO      QTDE VL UNIT VL IMPOS',60));
    Writeln(arqF, '------------------------------------------------------------');
    Qry_VENDA.Close;
    Qry_VENDA.Params.ParamByName('CD_MOVVENDAS').AsString :=sCodCupom;
    Qry_VENDA.Open();
    Qry_VENDA.First;
    while not Qry_VENDA.eof do
      begin
        iTemPrd := iTemPrd + 1;
        Writeln(arqF, IntToStr(iTemPrd)+'  '+
                      Qry_VENDA.FieldByName('CD_PRODUTO').AsString+'   '+
                      Copy(Qry_VENDA.FieldByName('DS_PRODREDUZIDO').AsString,1,16)+
                      Espaco(18-Length(copy(Qry_VENDA.FieldByName('DS_PRODREDUZIDO').AsString,1,16)))+'  '+
                      FormatFloat(',0.000',Qry_VENDA.FieldByName('QTD_PROD').AsFloat)+'  '+
                      FormatFloat(',0.0000',Qry_VENDA.FieldByName('PRC_PROD').AsFloat)+'   '+
                      FormatFloat(',0.00',Qry_VENDA.FieldByName('VALOR_VENDA').AsFloat));
        Qry_VENDA.Next;
      end;
    Writeln(arqF, '------------------------------------------------------------');
    Writeln(arqF, ' TOTAL           R$ ' +Espaco(60-length(' TOTAL           R$ '+EdtTotVenda.Text))+EdtTotVenda.Text);
    Writeln(arqF, RetornaDescricaoFPGTO(dm.gblFormaPgto) + Espaco(60-length(RetornaDescricaoFPGTO(dm.gblFormaPgto)+dm.gblValorPago))+dm.gblValorPago);
    Writeln(arqF, 'TROCO R$ '+Espaco(60-length('TROCO R$ '+DM.gblTroco))+DM.gblTroco);
    Writeln(arqF, '------------------------------------------------------------');
    Writeln(arqF, PadC('OBRIGADO VOLTE SEMPRE !!!',60));
    CloseFile(arqF);
    AbreAqrFileCupom;
  except

  end;
end;

procedure TfrmMov_Vendas.FinalizaVenda;
begin
  try
  QryAuxiliar.Close;
  QryAuxiliar.SQL.Clear;
  QryAuxiliar.SQL.Add('UPDATE TB_MOVIMENTACAO_VENDAS  ' +
                      '       SET CD_FPGTO=:CD_FPGTO, TROCO=:TROCO '+
                              ' WHERE CD_MOVVENDAS=:CD_MOVVENDAS');
  QryAuxiliar.Params.ParamByName('CD_FPGTO').AsString     := dm.gblFormaPgto;
  QryAuxiliar.Params.ParamByName('TROCO').AsFloat         := StrToFloat(dm.gblTroco);
  QryAuxiliar.Params.ParamByName('CD_MOVVENDAS').AsString := sCodCupom;
  QryAuxiliar.ExecSQL;
  MenssagemPDV('CAIXA LIVRE');
  sCodCupom :='';
  mem_Cupom.Lines.Clear;
  Edt_PrecProd.Text :='0,0000';
  Edt_Qtde.Text     :='1,000';
  EdtTotVenda.Text  :='0,00';
  edt_Bomba.Clear;
  edt_CodigoProd.Clear;
  Qry_VENDA.Close;
  Qry_VENDA.Params.ParamByName('CD_MOVVENDAS').AsString :='';
  Qry_VENDA.Open();
  edt_CodigoProd.SetFocus;
  except

  end;
end;

procedure TfrmMov_Vendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action :=cafree;
end;

procedure TfrmMov_Vendas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    close;
  if Key = VK_F3 then
    AbreVenda;  //Abre a venda
  if key = VK_F4 then
    ConsultaProduto;
  if key = VK_F5 then
    ConsultaBomba;
  if key = VK_F6 then
    chamaFPgto;
  if key = VK_F7 then
    begin
      if strStatusPDV = 'CAIXA EM MOVIMENTAÇÃO DE PAGAMENTO' then
        begin
          FinalizaCupom;
          if Application.messageBox('Deseja Imprimir o cupom ?','Confirmação',mb_YesNo+mb_IconInformation+mb_DefButton2) = IdYes then
            Memo_Print(mem_Cupom.Lines);
          FinalizaVenda;
        end
      else
        begin
          Showmessage('Não poderá finalizar a venda, por que não está em Movimentção de Pagamento.');
          edt_CodigoProd.SetFocus;
        end;
    end;
end;

procedure TfrmMov_Vendas.FormShow(Sender: TObject);
begin
  Qry_Bomba.Close;
  Qry_Bomba.Open();
  Qry_Produtos.Close;
  Qry_Produtos.Open();
  QryParamentro.Close;
  QryParamentro.Open();
  Qry_VENDA.Close;
  Qry_VENDA.Params.ParamByName('CD_MOVVENDAS').AsString :='';
  Qry_VENDA.Open();
  strStatusPDV :='CAIXA LIVRE';
  MenssagemPDV('CAIXA LIVRE...');
end;

function TfrmMov_Vendas.GeraCodigoVenda: string;
begin
  Result :='';
  QryAuxiliar.Close;
  QryAuxiliar.SQL.Clear;
  QryAuxiliar.SQL.Add('select gen_id(GEN_CODMOVIMENTOVENDA,1) as ID from rdb$database');
  QryAuxiliar.Open;
  Result :=FormatFloat('0000000',QryAuxiliar.Fields[0].asInteger);
end;

procedure TfrmMov_Vendas.InicializaParametros;
begin
  QryParamentro.Close;
  QryParamentro.Open();
  edt_Operador.Text := QryParamentroCD_OPERADOR.AsString;
  edt_Caixa.Text    := QryParamentroCD_CAIXA.AsString;
end;

procedure TfrmMov_Vendas.LimpaCampos;
begin
  edt_CodigoProd.Clear;
  edt_Bomba.Clear;
  Edt_Qtde.Text     :='1,000';
  Edt_PrecProd.Text :='0,0000';
  MenssagemPDV('CAIXA EM MOVIMENTAÇÃO DE VENDA');
end;

procedure TfrmMov_Vendas.Memo_Print(Conteudo: TStrings);
Var
  MemoFile :TextFile;
  P :Integer;
begin
  AssignPrn(MemoFile);
  Rewrite(MemoFile);
  For P := 0 to Conteudo.Count-1 do
    Writeln(MemoFile,Conteudo.Strings[P]);
  CloseFile(MemoFile);
end;

procedure TfrmMov_Vendas.MenssagemPDV(pMenssagem: string);
begin
  lblMessagem.Caption :='';
  lblMessagem.Caption :=UpperCase(pMenssagem);
end;

function TfrmMov_Vendas.PadC(S: String; I: Integer): String;
var
  L:byte;
begin
  Result :='';
  if I < Length(s) then
    begin
      Exit;
    end;
  L := (I-Length(S)) div 2;
  while l > 0 do
    begin
      Result := Result + ' ';
      Dec(l);
    end;
  for l:=1 to Length(S) do
    begin
      Result := Result + S[L];
    end;
end;

function TfrmMov_Vendas.RetornaBombaTanque(pCdBomba: String): String;
begin
  Result :='';
  QryAuxiliar.Close;
  QryAuxiliar.SQL.Clear;
  QryAuxiliar.SQL.Add('SELECT CD_TANQUE FROM TB_BOMBA WHERE CD_BOMBA=:CD_BOMBA');
  QryAuxiliar.Params.ParamByName('CD_BOMBA').AsString := pCdBomba;
  QryAuxiliar.Open();
  Result := QryAuxiliar.FieldByName('CD_TANQUE').AsString;
end;

function TfrmMov_Vendas.RetornaDescricaoFPGTO(pCDFpgto: String): String;
begin
  Result :='';
  QryAuxiliar.Close;
  QryAuxiliar.SQL.Clear;
  QryAuxiliar.SQL.Add('SELECT DS_FPGTO FROM TB_FPGTO WHERE CD_FPGTO=:CD_FPGTO');
  QryAuxiliar.Params.ParamByName('CD_FPGTO').AsString := pCDFpgto;
  QryAuxiliar.Open();
  Result := QryAuxiliar.FieldByName('DS_FPGTO').AsString;
end;

function TfrmMov_Vendas.RetornaDescrProduto(pCDProduto: String): String;
begin
  Result :='';
  QryAuxiliar.Close;
  QryAuxiliar.SQL.Clear;
  QryAuxiliar.SQL.Add('SELECT DS_REDUZIDO_PRODUTO FROM TB_PRODUTOS WHERE CD_PRODUTO=:CD_PRODUTO');
  QryAuxiliar.Params.ParamByName('CD_PRODUTO').AsString := pCDProduto;
  QryAuxiliar.Open();
  Result := QryAuxiliar.FieldByName('DS_REDUZIDO_PRODUTO').AsString;
end;

end.
