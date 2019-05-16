unit U_DMExpress;

interface

uses
  SysUtils, Classes, DBXpress, FMTBcd, Provider, DBClient, DB, SqlExpr,
  RpDefine, RpRave, RpBase, RpSystem, RpCon, RpConDS, RpRender, RpRenderPDF;

type
  TF_DMExpress = class(TDataModule)
    Conexao: TSQLConnection;
    Q_Pagamento: TSQLQuery;
    S_Pagamento: TDataSource;
    Cds_Pagamento: TClientDataSet;
    Pr_Pagamento: TDataSetProvider;
    T_TipoPgto: TSQLTable;
    T_TipoPgtoCODIGO: TIntegerField;
    T_TipoPgtoDESCRICAO: TStringField;
    T_PlanoConta: TSQLDataSet;
    T_PlanoContaCODIGO: TIntegerField;
    T_PlanoContaDESCRICAO: TStringField;
    Cds_PlanoConta: TClientDataSet;
    Pr_PlanoConta: TDataSetProvider;
    S_PlanoConta: TDataSource;
    QSP_Pagamento: TSQLQuery;
    Q_Recebimento: TSQLQuery;
    Pr_Recebimento: TDataSetProvider;
    Cds_Recebimento: TClientDataSet;
    S_Recebimento: TDataSource;
    QSP_Recebimento: TSQLQuery;
    Cds_RecebimentoCODIGO: TIntegerField;
    Cds_RecebimentoNUMDOC: TStringField;
    Cds_RecebimentoCODCLIENTE: TIntegerField;
    Cds_RecebimentoBANCO: TIntegerField;
    Cds_RecebimentoTIPOPGTO: TIntegerField;
    Cds_RecebimentoVLRTOTAL: TFloatField;
    Cds_RecebimentoJURO: TFloatField;
    Cds_RecebimentoMULTA: TFloatField;
    Cds_RecebimentoDESCONTO: TFloatField;
    Cds_RecebimentoVLRECEBIDO: TFloatField;
    Cds_RecebimentoLANCAMENTO: TDateField;
    Cds_RecebimentoEMISSAO: TDateField;
    Cds_RecebimentoVENCIMENTO: TDateField;
    Cds_RecebimentoRECEBIMENTO: TDateField;
    Cds_RecebimentoAUDITORIA: TStringField;
    Rv_Recebimento: TRvProject;
    RvSystem1: TRvSystem;
    RvDs_Recebimento: TRvDataSetConnection;
    Rv_Pagamento: TRvProject;
    RvDs_Pagamento: TRvDataSetConnection;
    Cds_PagamentoCODIGO: TIntegerField;
    Cds_PagamentoNUMDOC: TStringField;
    Cds_PagamentoCODFORN: TIntegerField;
    Cds_PagamentoCODPED: TIntegerField;
    Cds_PagamentoCONTA: TIntegerField;
    Cds_PagamentoBANCO: TIntegerField;
    Cds_PagamentoTIPOPGTO: TIntegerField;
    Cds_PagamentoVLRTOTAL: TFloatField;
    Cds_PagamentoJURO: TFloatField;
    Cds_PagamentoMULTA: TFloatField;
    Cds_PagamentoDESCONTO: TFloatField;
    Cds_PagamentoVLRPAGO: TFloatField;
    Cds_PagamentoCHEQUE: TStringField;
    Cds_PagamentoNOMINAL: TStringField;
    Cds_PagamentoLANCAMENTO: TDateField;
    Cds_PagamentoEMISSAO: TDateField;
    Cds_PagamentoVENCIMENTO: TDateField;
    Cds_PagamentoPAGAMENTO: TDateField;
    Cds_PagamentoDATACHEQUE: TDateField;
    Cds_PagamentoAUDITORIA: TStringField;
    Rv_PDFPgto: TRvRenderPDF;
    procedure Cds_RecebimentoReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_DMExpress: TF_DMExpress;

implementation

uses U_Erros;

{$R *.dfm}

procedure TF_DMExpress.Cds_RecebimentoReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
	Action := HandleReconcileError(DataSet,UpdateKind,E);
end;

end.
