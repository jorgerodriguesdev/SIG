unit U_DMADO;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TF_DMADO = class(TDataModule)
    Conexao: TADOConnection;
    Q_CRequisicao: TADOQuery;
    Q_DRequisicao: TADOQuery;
    S_DRequisicao: TDataSource;
    Q_Produto: TADOQuery;
    S_Produto: TDataSource;
    Q_AtualizaCReq: TADOQuery;
    Q_DRequisicaoDESCRICAO: TStringField;
    Q_DRequisicaoCODREQ: TIntegerField;
    Q_DRequisicaoQTDE: TIntegerField;
    Q_DRequisicaoVLRUNITARIO: TFloatField;
    Q_DRequisicaoVLRTOTAL: TFloatField;
    Q_ProdutoCODIGO: TStringField;
    Q_ProdutoDESCRICAO: TStringField;
    Q_ProdutoVLRCOMPRA: TFloatField;
    Q_ProdutoVLRVENDA: TFloatField;
    Q_ProdutoESTOQUE: TIntegerField;
    Q_ProdutoCRITICO: TIntegerField;
    Q_ProdutoAUDITORIA: TStringField;
    Q_ProdutoCODFORN: TIntegerField;
    Q_ProdutoCODUND: TIntegerField;
    Q_DRequisicaoCODPROD: TStringField;
    T_Produto: TADOTable;
    T_ProdutoCODIGO: TStringField;
    T_ProdutoDESCRICAO: TStringField;
    T_ProdutoVLRCOMPRA: TFloatField;
    T_ProdutoVLRVENDA: TFloatField;
    T_ProdutoESTOQUE: TIntegerField;
    T_ProdutoCRITICO: TIntegerField;
    T_ProdutoAUDITORIA: TStringField;
    T_ProdutoCODFORN: TIntegerField;
    T_ProdutoCODUND: TIntegerField;
    T_Fornecedor: TADOTable;
    T_FornecedorCODIGO: TIntegerField;
    T_FornecedorNOME: TStringField;
    T_FornecedorENDERECO: TStringField;
    T_FornecedorEMAIL: TStringField;
    T_FornecedorBAIRRO: TStringField;
    T_FornecedorCIDADE: TStringField;
    T_FornecedorCEP: TStringField;
    T_FornecedorESTADO: TStringField;
    T_FornecedorFONE: TStringField;
    T_FornecedorCELULAR: TStringField;
    T_FornecedorCPF: TStringField;
    T_FornecedorOBS: TStringField;
    T_FornecedorRG: TStringField;
    T_FornecedorORGAORG: TStringField;
    T_FornecedorDESDE: TDateField;
    T_FornecedorCNPJ: TStringField;
    T_FornecedorINSEST: TStringField;
    T_FornecedorFAX: TStringField;
    T_FornecedorCONTATO: TStringField;
    T_FornecedorAUDITORIA: TStringField;
    Q_CCotacao: TADOQuery;
    S_DCotacao: TDataSource;
    Q_AtualizaCCot: TADOQuery;
    Q_DCotacao: TADOQuery;
    Q_DCotacaoCODCOTA: TIntegerField;
    Q_DCotacaoCODREQ: TIntegerField;
    Q_DCotacaoCODPRODREQ: TStringField;
    Q_DCotacaoQTDE: TIntegerField;
    Q_DCotacaoUNIT1: TFloatField;
    Q_DCotacaoUNIT2: TFloatField;
    Q_DCotacaoUNIT3: TFloatField;
    Q_DCotacaoTOTAL1: TFloatField;
    Q_DCotacaoTOTAL2: TFloatField;
    Q_DCotacaoTOTAL3: TFloatField;
    Q_DCotacaoDESCRICAO: TStringField;
    Q_ImportaReq: TADOQuery;
    Q_ImportaReqCODREQ: TIntegerField;
    Q_ImportaReqCODPROD: TStringField;
    Q_ImportaReqQTDE: TIntegerField;
    Q_ImportaReqVLRUNITARIO: TFloatField;
    Q_ImportaReqVLRTOTAL: TFloatField;
    S_ImportaReq: TDataSource;
    Q_ImportaReqDESCRICAO: TStringField;
    Q_ImportaReqTICK: TStringField;
    S_DConfCotacao: TDataSource;
    Q_DConfCotacao: TADOQuery;
    Q_DConfCotacaoCODCOTA: TIntegerField;
    Q_DConfCotacaoCODREQ: TIntegerField;
    Q_DConfCotacaoCODPRODREQ: TStringField;
    Q_DConfCotacaoQTDE: TIntegerField;
    Q_DConfCotacaoUNIT1: TFloatField;
    Q_DConfCotacaoUNIT2: TFloatField;
    Q_DConfCotacaoUNIT3: TFloatField;
    Q_DConfCotacaoTOTAL1: TFloatField;
    Q_DConfCotacaoTOTAL2: TFloatField;
    Q_DConfCotacaoTOTAL3: TFloatField;
    Q_Consultas: TADOQuery;
    Q_CPedido: TADOQuery;
    Q_DPedido: TADOQuery;
    S_DPedido: TDataSource;
    Q_DPedidoCODPED: TIntegerField;
    Q_DPedidoCODREQ: TIntegerField;
    Q_DPedidoCODCOT: TIntegerField;
    Q_DPedidoQTDE: TIntegerField;
    Q_DPedidoVLRUNITARIO: TFloatField;
    Q_DPedidoVLRTOTAL: TFloatField;
    Q_DPedidoDESCRICAO: TStringField;
    Q_AtualizaCPed: TADOQuery;
    Q_ImportaCot: TADOQuery;
    S_ImportaCot: TDataSource;
    Q_ImportaCotCODCOTA: TIntegerField;
    Q_ImportaCotCODREQ: TIntegerField;
    Q_ImportaCotCODPRODREQ: TStringField;
    Q_ImportaCotQTDE: TIntegerField;
    Q_ImportaCotUNIT1: TFloatField;
    Q_ImportaCotUNIT2: TFloatField;
    Q_ImportaCotUNIT3: TFloatField;
    Q_ImportaCotTOTAL1: TFloatField;
    Q_ImportaCotTOTAL2: TFloatField;
    Q_ImportaCotTOTAL3: TFloatField;
    Q_ImportaCotTICK: TStringField;
    Q_ImportaCotDESCRICAO: TStringField;
    Q_DPedidoCODPROD: TStringField;
    SP_CRequisicao: TADOStoredProc;
    SP_CRequisicaoID: TIntegerField;
    SP_CCotacao: TADOStoredProc;
    IntegerField1: TIntegerField;
    SP_CPedido: TADOStoredProc;
    IntegerField2: TIntegerField;
    Q_CVenda: TADOQuery;
    Q_DVenda: TADOQuery;
    Q_DVendaCODVENDA: TIntegerField;
    Q_DVendaCODPRO: TStringField;
    Q_DVendaQTDE: TIntegerField;
    Q_DVendaVLRUNITARIO: TFloatField;
    Q_DVendaVLRTOTAL: TFloatField;
    Q_DVendaDESCRICAO: TStringField;
    S_DVenda: TDataSource;
    SP_CVenda: TADOStoredProc;
    IntegerField3: TIntegerField;
    Q_AtualizaCVen: TADOQuery;
    T_Cartao: TADOTable;
    T_TipoPgto: TADOTable;
    T_CartaoCODIGO: TIntegerField;
    T_CartaoNOME: TStringField;
    T_CartaoTAXA: TFloatField;
    T_TipoPgtoCODIGO: TIntegerField;
    T_TipoPgtoDESCRICAO: TStringField;
    SP_SomaVenda: TADOStoredProc;
    SP_SomaVendaSOMA: TFloatField;
    Q_DConfCotacaoDESCRICAO: TStringField;
    procedure Q_DRequisicaoBeforePost(DataSet: TDataSet);
    procedure Q_DCotacaoBeforePost(DataSet: TDataSet);
    procedure Q_DConfCotacaoBeforePost(DataSet: TDataSet);
    procedure Q_DPedidoBeforePost(DataSet: TDataSet);
    procedure Q_DVendaBeforePost(DataSet: TDataSet);
    procedure Q_DVendaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_DMADO: TF_DMADO;

implementation

uses U_Dados, U_Requisica, U_Cotacao, U_Pedido, U_Vendas;

{$R *.dfm}

procedure TF_DMADO.Q_DRequisicaoBeforePost(DataSet: TDataSet);
begin
	Q_DRequisicao.FieldByName('CODREQ').AsString := F_Requisicao.Edit2.Text;//Q_CRequisicao.FieldByName('CODIGO').AsInteger;
	Q_DRequisicao.FieldByName('VLRTOTAL').AsFloat := Q_DRequisicao.FieldByName('VLRUNITARIO').AsFloat * Q_DRequisicao.FieldByName('QTDE').AsInteger;
end;

procedure TF_DMADO.Q_DCotacaoBeforePost(DataSet: TDataSet);
begin
	Q_DCotacao.FieldByName('CODCOTA').AsString := F_Cotacao.Edit2.Text;//Q_CCotacao.FieldByName('CODIGO').AsInteger;
end;

procedure TF_DMADO.Q_DConfCotacaoBeforePost(DataSet: TDataSet);
begin
	Q_DConfCotacaoTOTAL1.AsFloat := Q_DConfCotacaoQTDE.AsInteger * Q_DConfCotacaoUNIT1.AsFloat;
	Q_DConfCotacaoTOTAL2.AsFloat := Q_DConfCotacaoQTDE.AsInteger * Q_DConfCotacaoUNIT2.AsFloat;
	Q_DConfCotacaoTOTAL3.AsFloat := Q_DConfCotacaoQTDE.AsInteger * Q_DConfCotacaoUNIT3.AsFloat;
end;

procedure TF_DMADO.Q_DPedidoBeforePost(DataSet: TDataSet);
begin
	Q_DPedido.FieldByName('CODPED').AsString := F_Pedido.Edit2.Text;//Q_CPedido.FieldByName('CODIGO').AsInteger;
end;

procedure TF_DMADO.Q_DVendaBeforePost(DataSet: TDataSet);
begin
	Q_DVenda.FieldByName('CODVENDA').AsString := F_Vendas.Edit2.Text;//Q_CRequisicao.FieldByName('CODIGO').AsInteger;
	Q_DVenda.FieldByName('VLRTOTAL').AsFloat := Q_DVenda.FieldByName('VLRUNITARIO').AsFloat * Q_DVenda.FieldByName('QTDE').AsInteger;
end;

procedure TF_DMADO.Q_DVendaCalcFields(DataSet: TDataSet);
begin
	F_Vendas.Soma;
end;

end.
