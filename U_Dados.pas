unit U_Dados;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset,
  ZAbstractTable, ZDataset, ZConnection, ZSequence;

type
  TF_Dados = class(TDataModule)
    Z_SisCom: TZConnection;
    T_Unidade: TZTable;
    S_Unidade: TDataSource;
    Sq_Unidade: TZSequence;
    Q_Produto: TZQuery;
    S_Produto: TDataSource;
    Q_Funcionario: TZQuery;
    S_Funcionario: TDataSource;
    Sq_Funcionario: TZSequence;
    Q_NivelAcesso: TZQuery;
    S_NivelAcesso: TDataSource;
    Q_ConsFunc: TZReadOnlyQuery;
    S_ConsFunc: TDataSource;
    Q_Banco: TZQuery;
    S_Banco: TDataSource;
    Sq_Banco: TZSequence;
    Q_Funcionariocodigo: TLargeintField;
    Q_Funcionariocoddpto: TLargeintField;
    Q_Funcionarionome: TStringField;
    Q_Funcionarioendereco: TStringField;
    Q_Funcionarioemail: TStringField;
    Q_Funcionariobairro: TStringField;
    Q_Funcionariocidade: TStringField;
    Q_Funcionariocep: TStringField;
    Q_Funcionarioestado: TStringField;
    Q_Funcionariofone: TStringField;
    Q_Funcionariocelular: TStringField;
    Q_Funcionariocpf: TStringField;
    Q_Funcionariorg: TStringField;
    Q_Funcionarioorgaorg: TStringField;
    Q_Funcionarioposse: TDateField;
    Q_Funcionariocargo: TStringField;
    Q_Funcionariocomissao: TFloatField;
    Q_Funcionariologin: TStringField;
    Q_Funcionariosenha: TStringField;
    Q_Funcionarioauditoria: TStringField;
    Q_Funcionarioactotal: TStringField;
    Q_Produtocodigo: TStringField;
    Q_Produtocodund: TLargeintField;
    Q_Produtocodforn: TLargeintField;
    Q_Produtodescricao: TStringField;
    Q_Produtovlrcompra: TFloatField;
    Q_Produtovlrvenda: TFloatField;
    Q_Produtoestoque: TLargeintField;
    Q_Produtocritico: TLargeintField;
    Q_Produtoauditoria: TStringField;
    procedure T_UnidadeAfterPost(DataSet: TDataSet);
    procedure T_UnidadeAfterInsert(DataSet: TDataSet);
    procedure Q_FuncionarioAfterInsert(DataSet: TDataSet);
    procedure Q_ConsFuncAfterScroll(DataSet: TDataSet);
    procedure Q_BancoAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Dados: TF_Dados;

implementation

uses U_Unidades, U_Menu;

{$R *.dfm}

procedure TF_Dados.T_UnidadeAfterPost(DataSet: TDataSet);
begin
	F_Unidades.PanTitulo.Caption := 'Cadastro das Unidades - Visualizando';
end;

procedure TF_Dados.T_UnidadeAfterInsert(DataSet: TDataSet);
begin
	if F_Menu.Label3.Caption = 'Firebird' then
		T_Unidade.FieldByName('Codigo').Value := Sq_Unidade.GetNextValue;
end;

procedure TF_Dados.Q_FuncionarioAfterInsert(DataSet: TDataSet);
begin
	if F_Menu.Label3.Caption = 'Firebird' then
		Q_Funcionario.FieldByName('Codigo').Value := Sq_Funcionario.GetNextValue;
end;

procedure TF_Dados.Q_ConsFuncAfterScroll(DataSet: TDataSet);
begin
	F_Dados.Q_NivelAcesso.Active := False;
 	F_Dados.Q_NivelAcesso.Sql.Clear;
 	F_Dados.Q_NivelAcesso.Sql.Add('SELECT * FROM NIVELACESSO WHERE CODFUNC='+#39+Q_ConsFunc.FieldByName('CODIGO').AsString+#39);
  	F_Dados.Q_NivelAcesso.Active := True;
end;

procedure TF_Dados.Q_BancoAfterInsert(DataSet: TDataSet);
begin
	if F_Menu.Label3.Caption = 'Firebird' then
		Q_Banco.FieldByName('Codigo').Value := Sq_Banco.GetNextValue;
end;

end.
