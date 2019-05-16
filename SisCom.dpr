program SisCom;

uses
  Forms,
  U_Menu in 'U_Menu.pas' {F_Menu},
  U_Dados in 'U_Dados.pas' {F_Dados: TDataModule},
  U_Unidades in 'U_Unidades.pas' {F_Unidades},
  U_Login in 'U_Login.pas' {F_Login},
  U_Produtos in 'U_Produtos.pas' {F_Produtos},
  U_Funcionarios in 'U_Funcionarios.pas' {F_Funcionarios},
  U_NivelAcesso in 'U_NivelAcesso.pas' {F_NivelAcesso},
  U_Bancos in 'U_Bancos.pas' {F_Bancos},
  U_DMExpress in 'U_DMExpress.pas' {F_DMExpress: TDataModule},
  U_Pagamentos in 'U_Pagamentos.pas' {F_Pagamentos},
  U_Contas in 'U_Contas.pas' {F_Contas},
  U_Recebimentos in 'U_Recebimentos.pas' {F_Recebimentos},
  U_Erros in 'U_Erros.pas' {F_Erros},
  U_DMADO in 'U_DMADO.pas' {F_DMADO: TDataModule},
  U_Requisica in 'U_Requisica.pas' {F_Requisicao},
  U_PegaProdReq in 'U_PegaProdReq.pas' {F_PegaProdReq},
  U_Cotacao in 'U_Cotacao.pas' {F_Cotacao},
  U_ImpItemReq in 'U_ImpItemReq.pas' {F_ImpItemReq},
  U_ConfCotacao in 'U_ConfCotacao.pas' {F_ConfCotacao},
  U_Pedido in 'U_Pedido.pas' {F_Pedido},
  U_ImpItemCot in 'U_ImpItemCot.pas' {F_ImpItemCot},
  U_Vendas in 'U_Vendas.pas' {F_Vendas},
  U_DMIBX in 'U_DMIBX.pas' {F_DMIBX: TDataModule},
  U_Entradas in 'U_Entradas.pas' {F_Entradas},
  U_PegaProdEnt in 'U_PegaProdEnt.pas' {F_PegaProdEnt},
  U_Ajuste in 'U_Ajuste.pas' {F_Ajuste},
  UR_Bancos in 'UR_Bancos.pas' {FR_Bancos},
  UR_Funcionarios in 'UR_Funcionarios.pas' {FR_Funcionarios},
  UR_Produtos in 'UR_Produtos.pas' {FR_Produtos},
  U_Tela in 'U_Tela.pas' {F_Tela};

{$R *.res}

begin
  F_Tela:=TF_Tela.Create(Application);
  F_Tela.Show;
  F_Tela.Update;
  Application.Initialize;
  Application.HelpFile := 'C:\Documents and Settings\Albert\Desktop\SisCom\help\SISCOM.HLP';
  Application.Title := 'SIG';
  Application.CreateForm(TF_Menu, F_Menu);
  Application.CreateForm(TF_Login, F_Login);
  Application.CreateForm(TF_Dados, F_Dados);
  Application.CreateForm(TF_DMExpress, F_DMExpress);
  Application.CreateForm(TF_DMIBX, F_DMIBX);
  F_Tela.Free;
  F_Tela.Hide;
  F_Menu.Show;
  F_Login.ShowModal;
  Application.Run;
end.
