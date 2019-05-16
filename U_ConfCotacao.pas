unit U_ConfCotacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Mask, StdCtrls, Buttons, Grids, DBGrids, MenBtn, Menus,
  EditNum, printfast;

type
  TF_ConfCotacao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    Label7: TLabel;
    datainicio: TMaskEdit;
    Edit2: TEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    DBGrid1: TDBGrid;
    BitBtn1: TMenuButton;
    BitBtn4: TMenuButton;
    PopupMenu2: TPopupMenu;
    Imprimir1: TMenuItem;
    ImportarItens1: TMenuItem;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Combobox3: TEdit;
    Combobox2: TEdit;
    Combobox1: TEdit;
    Edit1: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    EditNum2: TEditNum;
    EditNum1: TEditNum;
    EditNum3: TEditNum;
    EditNum6: TEditNum;
    EditNum7: TEditNum;
    EditNum8: TEditNum;
    EditNum11: TEditNum;
    EditNum12: TEditNum;
    EditNum13: TEditNum;
    EditNum16: TEditNum;
    EditNum17: TEditNum;
    EditNum18: TEditNum;
    pf: TPrintFast;
    procedure soma;
    procedure pegaitens;
    procedure habilita;
    procedure desabilita;
    procedure limpa;
    procedure BitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Incluir1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ImportarItens1Click(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ConfCotacao: TF_ConfCotacao;

implementation

uses U_DMADO, U_PegaProdReq, U_ImpItemReq;

{$R *.dfm}

procedure TF_ConfCotacao.BitBtn5Click(Sender: TObject);
begin
	Close;
end;

procedure TF_ConfCotacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	Release;
end;

procedure TF_ConfCotacao.Incluir1Click(Sender: TObject);
begin
{	habilita;
	F_DMADO.Q_CCotacao.Active := True;
   F_DMADO.Q_CCotacao.Append;
   F_DMADO.Q_CCotacao.FieldByName('DATACOT').AsDateTime := Date;
   F_DMADO.Q_CCotacao.Post;
   F_DMADO.Q_CCotacao.Edit;
   Edit2.Text := StringOfChar('0',10-Length(F_DMADO.Q_CCotacao.FieldByName('CODIGO').AsString)) + F_DMADO.Q_CCotacao.FieldByName('CODIGO').AsString;
   Edit2.ReadOnly := True;
   datainicio.SetFocus;}
end;

procedure TF_ConfCotacao.FormCreate(Sender: TObject);
begin
   desabilita;
   pegaitens;
{   F_DMADO.T_Fornecedor.Open;
   F_DMADO.T_Fornecedor.First;
   while not F_DMADO.T_Fornecedor.eof do begin
   	Combobox1.Items.Add(StringOfChar('0',4-length(F_DMADO.T_FornecedorCodigo.AsString))+F_DMADO.T_FornecedorCodigo.AsString + ' - ' + F_DMADO.T_FornecedorNome.AsString);
   	Combobox2.Items.Add(StringOfChar('0',4-length(F_DMADO.T_FornecedorCodigo.AsString))+F_DMADO.T_FornecedorCodigo.AsString + ' - ' + F_DMADO.T_FornecedorNome.AsString);
   	Combobox3.Items.Add(StringOfChar('0',4-length(F_DMADO.T_FornecedorCodigo.AsString))+F_DMADO.T_FornecedorCodigo.AsString + ' - ' + F_DMADO.T_FornecedorNome.AsString);
		F_DMADO.T_Fornecedor.Next;
   end;}
end;

procedure TF_ConfCotacao.Edit2Exit(Sender: TObject);
begin
	Edit2.Text := StringOfChar('0',10-Length(Edit2.Text)) + Edit2.Text;
   F_DMADO.Q_CCotacao.Active := False;
   F_DMADO.Q_CCotacao.SQL.Clear;
   F_DMADO.Q_CCotacao.SQL.Add('select * from C_COTACAO where CODIGO='+#39+Edit2.Text+#39);
   F_DMADO.Q_CCotacao.Active := True;
   if F_DMADO.Q_CCotacao.FieldByName('CODIGO').AsString <> '' then begin
   	datainicio.Text := F_DMADO.Q_CCotacao.FieldByName('DATACOT').AsString;
      //pegar o codigo e o nome dos fornecedores e jogar nos comboboxes
      Combobox1.Text := F_DMADO.Q_CCotacao.FieldByName('FORN1').AsString;
      Combobox2.Text := F_DMADO.Q_CCotacao.FieldByName('FORN2').AsString;
      Combobox3.Text := F_DMADO.Q_CCotacao.FieldByName('FORN3').AsString;
      Edit1.Text := F_DMADO.Q_CCotacao.FieldByName('ENTREGA1').AsString;
      Edit5.Text := F_DMADO.Q_CCotacao.FieldByName('ENTREGA2').AsString;
      Edit6.Text := F_DMADO.Q_CCotacao.FieldByName('ENTREGA3').AsString;
      Edit9.Text := F_DMADO.Q_CCotacao.FieldByName('CONDICAO1').AsString;
      Edit10.Text := F_DMADO.Q_CCotacao.FieldByName('CONDICAO2').AsString;
      Edit11.Text := F_DMADO.Q_CCotacao.FieldByName('CONDICAO3').AsString;
      EditNum2.Text := F_DMADO.Q_CCotacao.FieldByName('DESCONTO1').AsString;
      EditNum1.Text := F_DMADO.Q_CCotacao.FieldByName('DESCONTO2').AsString;
      EditNum3.Text := F_DMADO.Q_CCotacao.FieldByName('DESCONTO3').AsString;
      EditNum16.Text := F_DMADO.Q_CCotacao.FieldByName('TOTAL1').AsString;
      EditNum17.Text := F_DMADO.Q_CCotacao.FieldByName('TOTAL2').AsString;
      EditNum18.Text := F_DMADO.Q_CCotacao.FieldByName('TOTAL3').AsString;
      F_DMADO.Q_CCotacao.Edit;
      pegaitens;
      soma;
   end
   else begin
   	Application.MessageBox('Número de Cotação não Encontrado','Erro no Sistema',MB_IConError + MB_OK);
      Limpa;
   end;
end;

procedure TF_ConfCotacao.limpa;
var
	i:integer;
begin
	for i := 0 to componentcount - 1 do begin
   	if (components[i] is TEdit) then
      	(components[i] as TEdit).Clear;
   end;
	for i := 0 to componentcount - 1 do begin
   	if (components[i] is TMaskEdit) then
      	(components[i] as TMaskEdit).Clear;
   end;
	for i := 0 to componentcount - 1 do begin
   	if (components[i] is TEditNum) then
      	(components[i] as TEditNum).Text := '0,00';
   end;
end;

procedure TF_ConfCotacao.habilita;
begin
	Panel1.Enabled := True;
   BitBtn2.Enabled := True;
   BitBtn3.Enabled := True;
   BitBtn4.Enabled := True;
   BitBtn6.Enabled := True;
   BitBtn1.Enabled := False;
   BitBtn5.Enabled := False;
end;

procedure TF_ConfCotacao.desabilita;
begin
	Panel1.Enabled := False;
   BitBtn2.Enabled := False;
   BitBtn3.Enabled := False;
   BitBtn4.Enabled := False;
   BitBtn6.Enabled := False;
   BitBtn1.Enabled := True;
   BitBtn5.Enabled := True;
end;

procedure TF_ConfCotacao.BitBtn2Click(Sender: TObject);
begin
	if Application.MessageBox('Deseja Realmente Excluir?','Pergunta do Sistema',MB_YesNo + MB_IconQuestion) = idYes then
   	F_DMADO.Q_DCotacao.Delete;
end;

procedure TF_ConfCotacao.BitBtn6Click(Sender: TObject);
begin
	F_DMADO.Q_AtualizaCCot.Parameters.ParamByName('CODIGO').Value := StrToInt(Edit2.Text);
	F_DMADO.Q_AtualizaCCot.Parameters.ParamByName('FORN1').Value := StrToInt(Combobox1.Text);
	F_DMADO.Q_AtualizaCCot.Parameters.ParamByName('FORN2').Value := StrToInt(Combobox2.Text);
	F_DMADO.Q_AtualizaCCot.Parameters.ParamByName('FORN3').Value := StrToInt(Combobox3.Text);
	F_DMADO.Q_AtualizaCCot.Parameters.ParamByName('ENTREGA1').Value := Edit1.Text;
	F_DMADO.Q_AtualizaCCot.Parameters.ParamByName('ENTREGA2').Value := Edit5.Text;
	F_DMADO.Q_AtualizaCCot.Parameters.ParamByName('ENTREGA3').Value := Edit6.Text;
	F_DMADO.Q_AtualizaCCot.Parameters.ParamByName('CONDICAO1').Value := Edit9.Text;
	F_DMADO.Q_AtualizaCCot.Parameters.ParamByName('CONDICAO2').Value := Edit10.Text;
	F_DMADO.Q_AtualizaCCot.Parameters.ParamByName('CONDICAO3').Value := Edit11.Text;
	F_DMADO.Q_AtualizaCCot.Parameters.ParamByName('DESCONTO1').Value := StrToFloat(EditNum2.Text);
	F_DMADO.Q_AtualizaCCot.Parameters.ParamByName('DESCONTO2').Value := StrToFloat(EditNum1.Text);
	F_DMADO.Q_AtualizaCCot.Parameters.ParamByName('DESCONTO3').Value := StrToFloat(EditNum3.Text);
	F_DMADO.Q_AtualizaCCot.Parameters.ParamByName('TOTAL1').Value := StrToFloat(EditNum16.Text);
	F_DMADO.Q_AtualizaCCot.Parameters.ParamByName('TOTAL2').Value := StrToFloat(EditNum17.Text);
	F_DMADO.Q_AtualizaCCot.Parameters.ParamByName('TOTAL3').Value := StrToFloat(EditNum18.Text);
	F_DMADO.Q_AtualizaCCot.Parameters.ParamByName('DATACOT').Value := StrToDate(datainicio.Text);
   F_DMADO.Q_AtualizaCCot.ExecSQL;
   Limpa;
   desabilita;
   pegaitens;
end;

procedure TF_ConfCotacao.BitBtn3Click(Sender: TObject);
begin
	if Application.MessageBox('Deseja Realmente Cancelar? - Todos os Itens serão Perdidos!','Pergunta do Sistema',MB_YesNo + MB_IconQuestion) = idYes then begin
   	//é melhor um cancel ou um delete?
	 	F_DMADO.Q_CCotacao.Cancel;
      //implementar aqui o codigo que deletará os itens da tabela D_Requisicao.
		limpa;
   end;
   desabilita;
   pegaitens;
end;

procedure TF_ConfCotacao.pegaitens;
begin
	F_DMADO.Q_DConfCotacao.Active := False;
	F_DMADO.Q_DConfCotacao.SQL.Clear;
   if Edit2.Text <> '' then
		F_DMADO.Q_DConfCotacao.SQL.Add('select * from D_COTACAO where CODCOTA='+#39+Edit2.Text+#39)
   else
		F_DMADO.Q_DConfCotacao.SQL.Add('select * from D_COTACAO where CODCOTA=0');
	F_DMADO.Q_DConfCotacao.Active := True;
end;

procedure TF_ConfCotacao.BitBtn1Click(Sender: TObject);
begin
	habilita;
	Edit2.SetFocus;
   Edit2.ReadOnly := False;
end;

procedure TF_ConfCotacao.ImportarItens1Click(Sender: TObject);
begin
	F_DMADO.Q_Consultas.Active := False;
   F_DMADO.Q_Consultas.SQL.Clear;
   F_DMADO.Q_Consultas.SQL.Add('select sum(TOTAL1) as TOTAL1, sum(TOTAL2) as TOTAL2, sum(TOTAL3) as TOTAL3');
   F_DMADO.Q_Consultas.SQL.Add(' from D_COTACAO where CODCOTA='+#39+Edit2.Text+#39);
	F_DMADO.Q_Consultas.Active := True;
   //
   EditNum16.Text := F_DMADO.Q_Consultas.FieldByName('TOTAL1').AsString;
   EditNum17.Text := F_DMADO.Q_Consultas.FieldByName('TOTAL2').AsString;
   EditNum18.Text := F_DMADO.Q_Consultas.FieldByName('TOTAL3').AsString;
   //
   soma;
end;

procedure TF_ConfCotacao.soma;
begin
   EditNum11.Text := FloatToStr((StrToFloat(EditNum16.Text) * StrToFloat(EditNum2.Text)) / 100);
   EditNum12.Text := FloatToStr((StrToFloat(EditNum17.Text) * StrToFloat(EditNum1.Text)) / 100);
   EditNum13.Text := FloatToStr((StrToFloat(EditNum18.Text) * StrToFloat(EditNum3.Text)) / 100);
	//
   EditNum6.Text := FloatToStr(StrToFloat(EditNum16.Text) - StrToFloat(EditNum11.Text));
   EditNum7.Text := FloatToStr(StrToFloat(EditNum17.Text) - StrToFloat(EditNum12.Text));
   EditNum8.Text := FloatToStr(StrToFloat(EditNum18.Text) - StrToFloat(EditNum13.Text));
end;

procedure TF_ConfCotacao.Imprimir1Click(Sender: TObject);
var
   sub1,sub2,sub3,td1,td2,td3,d1,d2,d3,vt1,vt2,vt3:double;
begin
   PF.Preview := True;
   PF.PageHeader := True;
   PF.HeaderData.Title1      := 'Albert Eije Barreto Mouta';
   PF.HeaderData.Title2      := 'www.alberteije.com';
   PF.HeaderData.Left4 := PF.Repete(' ',51)+'***   Mapa Comparativo de Precos   ***';
   PF.PageWidth := 140;
   PF.QtLines   := 60;
   //
   if PF.IniciaImpr then begin
      PF.ImprComo(pCompr175);
      PF.ImprString('','Mapa Referente a Cotacao No..: '+Edit2.Text,0,False);
      PF.ImprString('','DATA..: '+datainicio.text,114,True);
      PF.ImprString('',PF.Repete('=',140),0,True);
      PF.ImprString('','FORNECEDORES',0,False);
      PF.ImprString('','CONDICOES DE PAGAMENTO',57,False);
      PF.ImprString('','PRAZO DE ENTREGA',107,True);
      PF.ImprString('',PF.Repete('=',140),0,True);
      PF.ImprString('','Fornecedor 1: '+Combobox1.Text,0,False);
      PF.ImprString('',Edit1.Text,57,False);
      PF.ImprString('',Edit9.Text,107,True);
      PF.ImprString('','Fornecedor 2: '+Combobox2.Text,0,False);
      PF.ImprString('',Edit5.Text,57,False);
      PF.ImprString('',Edit10.Text,107,True);
      PF.ImprString('','Fornecedor 3: '+Combobox3.Text,0,False);
      PF.ImprString('',Edit6.Text,57,False);
      PF.ImprString('',Edit11.Text,107,True);
      //
      PF.ImprString('',PF.Repete('=',140),0,True);
      PF.ImprString('','CODIGO',0,False);
      PF.ImprString('','QUANT',17,False);
      PF.ImprString('','DESCRICAO',24,False);
      PF.ImprString('','F1UNIT',3,False);
      PF.ImprString('','F1TOT',14,False);
      PF.ImprString('','F2UNIT',23,False);
      PF.ImprString('','F2TOT',34,False);
      PF.ImprString('','F3UNIT',43,False);
      PF.ImprString('','F3TOT',54,False);
      PF.ImprString('','ESCOLHA',100,True);
      PF.ImprString('',PF.Repete('=',140),0,True);
      //
      F_DMADO.Q_DConfCotacao.DisableControls;
      F_DMADO.Q_DConfCotacao.First;
      while not F_DMADO.Q_DConfCotacao.eof do begin
            PF.ImprString('',F_DMADO.Q_DConfCotacaoCodProdReq.asstring,0,False);
            PF.ImprString('',PF.MascaraVlr('##,##0',F_DMADO.Q_DConfCotacaoQtde.value),15,False);
            PF.ImprString('',F_DMADO.Q_DConfCotacaoDescricao.AsString,24,False);
            PF.ImprString('',PF.MascaraVlr('##,##0.00',F_DMADO.Q_DConfCotacaoUnit1.value),0,False);
            PF.ImprString('',PF.MascaraVlr('##,##0.00',F_DMADO.Q_DConfCotacaoTotal1.value),10,False);
            PF.ImprString('',PF.MascaraVlr('##,##0.00',F_DMADO.Q_DConfCotacaoUnit2.value),20,False);
            PF.ImprString('',PF.MascaraVlr('##,##0.00',F_DMADO.Q_DConfCotacaoTotal2.value),30,False);
            PF.ImprString('',PF.MascaraVlr('##,##0.00',F_DMADO.Q_DConfCotacaoUnit3.value),40,False);
            PF.ImprString('',PF.MascaraVlr('##,##0.00',F_DMADO.Q_DConfCotacaoTotal3.value),50,True);
            PF.ImprString('',PF.Repete('-',140),0,True);
            F_DMADO.Q_DConfCotacao.next;
      end;
//      PF.ImprString('',PF.Repete('-',140),0,True);
      //
      PF.ImprString('','',0,True);
      PF.ImprString('','***   VALOR TOTAL DOS FORNECEDORES   ***',50,True);
      PF.ImprString('','',0,True);
      PF.ImprString('',PF.Repete('=',140),0,True);
      //
      PF.ImprString('','FORNECEDORES',0,False);
      PF.ImprString('','SUB TOTAIS',54,False);
      PF.ImprString('','TAXA DE DESCONTO',78,False);
      PF.ImprString('','VALOR DO DESCONTO',102,False);
      PF.ImprString('','VALOR TOTAL',128,True);
      PF.ImprString('',PF.Repete('=',140),0,True);
      //
      sub1 := StrToFloat(EditNum16.Text);
      sub2 := StrToFloat(EditNum17.Text);
      sub3 := StrToFloat(EditNum18.Text);
      td1 := StrToFloat(EditNum2.Text);
      td2 := StrToFloat(EditNum1.Text);
      td3 := StrToFloat(EditNum3.Text);
      d1 := StrToFloat(EditNum11.Text);
      d2 := StrToFloat(EditNum12.Text);
      d3 := StrToFloat(EditNum13.Text);
      vt1 := StrToFloat(EditNum6.Text);
      vt2 := StrToFloat(EditNum7.Text);
      vt3 := StrToFloat(EditNum8.Text);
      //
      PF.ImprString('','Fornecedor 1: '+Combobox1.Text,0,False);
      PF.ImprString('',PF.MascaraVlr('##,##0.00',Sub1),55,False);
      PF.ImprString('',PF.MascaraVlr('##,##0.00',td1),85,False);
      PF.ImprString('',PF.MascaraVlr('##,##0.00',d1),110,False);
      PF.ImprString('',PF.MascaraVlr('##,##0.00',vt1),130,True);
      PF.ImprString('','Fornecedor 2: '+Combobox2.Text,0,False);
      PF.ImprString('',PF.MascaraVlr('##,##0.00',Sub2),55,False);
      PF.ImprString('',PF.MascaraVlr('##,##0.00',td2),85,False);
      PF.ImprString('',PF.MascaraVlr('##,##0.00',d2),110,False);
      PF.ImprString('',PF.MascaraVlr('##,##0.00',vt2),130,True);
      PF.ImprString('','Fornecedor 3: '+Combobox3.Text,0,False);
      PF.ImprString('',PF.MascaraVlr('##,##0.00',Sub3),55,False);
      PF.ImprString('',PF.MascaraVlr('##,##0.00',td3),85,False);
      PF.ImprString('',PF.MascaraVlr('##,##0.00',d3),110,False);
      PF.ImprString('',PF.MascaraVlr('##,##0.00',vt3),130,True);
      //
      PF.ImprString('',PF.Repete('=',140),0,True);
      //
      PF.ImprString('','',0,True);
      PF.ImprString('','',0,True);
      PF.ImprString('','',0,True);
      PF.ImprString('','',0,True);
      PF.ImprString('','',0,True);
      PF.ImprString('','',0,True);
      PF.ImprString('','_______________________________________',0,False);
      PF.ImprString('','_______________________________________',48,False);
      PF.ImprString('','_______________________________________',99,True);
      PF.ImprString('','               GERENCIA                ',0,False);
      PF.ImprString('','               DIRETORIA               ',48,False);
      PF.ImprString('','                COMPRAS                ',99,True);
      //
      PF.Ejeta;
      PF.ImprComo(tCompr175);
      PF.FimImpr;
      F_DMADO.Q_DConfCotacao.First;
      F_DMADO.Q_DConfCotacao.EnableControls;
   end;
end;

end.
