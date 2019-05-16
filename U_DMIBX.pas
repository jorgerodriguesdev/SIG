unit U_DMIBX;

interface

uses
  SysUtils, Classes, IBDatabase, DB, IBCustomDataSet, IBQuery, IBUpdateSQL,
  IBSQL;

type
  TF_DMIBX = class(TDataModule)
    Conexao: TIBDatabase;
    Transacao: TIBTransaction;
    S_DNFE: TDataSource;
    Q_AtualizaCNFE: TIBQuery;
    S_Produto: TDataSource;
    Q_DNFE: TIBDataSet;
    Q_DNFENUMNOTA: TIntegerField;
    Q_DNFECODPRO: TIBStringField;
    Q_DNFEQTDE: TIntegerField;
    Q_DNFEVLRUNITARIO: TFloatField;
    Q_DNFEVLRTOTAL: TFloatField;
    Q_CNFE: TIBDataSet;
    Q_CNFENUMERO: TIntegerField;
    Q_CNFECODFORN: TIntegerField;
    Q_CNFECFOP: TIntegerField;
    Q_CNFEEMISSAO: TDateField;
    Q_CNFEENTRADA: TDateField;
    Q_CNFETOTAL: TFloatField;
    Q_CNFEAUDITORIA: TIBStringField;
    Q_Produto: TIBDataSet;
    Q_ProdutoCODIGO: TIBStringField;
    Q_ProdutoDESCRICAO: TIBStringField;
    Q_ProdutoVLRCOMPRA: TFloatField;
    Q_ProdutoVLRVENDA: TFloatField;
    Q_ProdutoESTOQUE: TIntegerField;
    Q_ProdutoCRITICO: TIntegerField;
    Q_ProdutoAUDITORIA: TIBStringField;
    Q_ProdutoCODFORN: TIntegerField;
    Q_ProdutoCODUND: TIntegerField;
    Q_Atualiza: TIBSQL;
    procedure Q_DNFEAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_DMIBX: TF_DMIBX;

implementation

{$R *.dfm}

procedure TF_DMIBX.Q_DNFEAfterPost(DataSet: TDataSet);
begin
//   Q_Produto.Edit;
//	Q_ProdutoEstoque.Value := Q_ProdutoEstoque.Value + Q_DNFEQTDE.Value;
//   Q_Produto.Post;
end;

end.
