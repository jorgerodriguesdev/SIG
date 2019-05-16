unit U_Cotacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Mask, StdCtrls, Buttons, Grids, DBGrids, MenBtn, Menus;

type
  TF_Cotacao = class(TForm)
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
    PopupMenu1: TPopupMenu;
    Incluir1: TMenuItem;
    Acessar1: TMenuItem;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    BitBtn4: TMenuButton;
    PopupMenu2: TPopupMenu;
    Imprimir1: TMenuItem;
    ImportarItens1: TMenuItem;
    procedure pegaitens;
    procedure habilita;
    procedure desabilita;
    procedure limpa;
    procedure BitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Incluir1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure Acessar1Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Cotacao: TF_Cotacao;

implementation

uses U_DMADO, U_PegaProdReq, U_ImpItemReq, U_Menu;

{$R *.dfm}

procedure TF_Cotacao.BitBtn5Click(Sender: TObject);
begin
	Close;
end;

procedure TF_Cotacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	Release;
end;

procedure TF_Cotacao.Incluir1Click(Sender: TObject);
begin
	habilita;
	F_DMADO.Q_CCotacao.Active := True;
   if F_Menu.Label3.Caption = 'MySQL' then begin
	   F_DMADO.Q_CCotacao.Append;
	   F_DMADO.Q_CCotacao.FieldByName('DATACOT').AsDateTime := Date;
	   F_DMADO.Q_CCotacao.Post;
	   F_DMADO.Q_CCotacao.Edit;
	   Edit2.Text := StringOfChar('0',10-Length(F_DMADO.Q_CCotacao.FieldByName('CODIGO').AsString)) + F_DMADO.Q_CCotacao.FieldByName('CODIGO').AsString;
   end
	else begin
   	F_DMADO.SP_CCotacao.Active := False;
   	F_DMADO.SP_CCotacao.Active := True;
	   Edit2.Text := StringOfChar('0',10-Length(F_DMADO.SP_CCotacao.FieldByName('ID').AsString)) + F_DMADO.SP_CCotacao.FieldByName('ID').AsString;
		F_DMADO.Q_Consultas.Active := False;
		F_DMADO.Q_Consultas.SQL.Clear;
      F_DMADO.Q_Consultas.SQL.Add('insert into C_COTACAO (CODIGO) values (:CODIGO)');
      F_DMADO.Q_Consultas.Parameters.ParamByName('CODIGO').Value := StrToInt(Edit2.Text);
      F_DMADO.Q_Consultas.ExecSQL;
	end;
   Edit2.ReadOnly := True;
   datainicio.SetFocus;
end;

procedure TF_Cotacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if key = 115 then begin
		Application.CreateForm(TF_ImpItemReq,F_ImpItemReq);
	   F_ImpItemReq.ShowModal;
	end;
end;

procedure TF_Cotacao.FormCreate(Sender: TObject);
begin
   desabilita;
   pegaitens;
   F_DMADO.T_Fornecedor.Open;
   F_DMADO.T_Fornecedor.First;
   while not F_DMADO.T_Fornecedor.eof do begin
   	Combobox1.Items.Add(StringOfChar('0',4-length(F_DMADO.T_FornecedorCodigo.AsString))+F_DMADO.T_FornecedorCodigo.AsString + ' - ' + F_DMADO.T_FornecedorNome.AsString);
   	Combobox2.Items.Add(StringOfChar('0',4-length(F_DMADO.T_FornecedorCodigo.AsString))+F_DMADO.T_FornecedorCodigo.AsString + ' - ' + F_DMADO.T_FornecedorNome.AsString);
   	Combobox3.Items.Add(StringOfChar('0',4-length(F_DMADO.T_FornecedorCodigo.AsString))+F_DMADO.T_FornecedorCodigo.AsString + ' - ' + F_DMADO.T_FornecedorNome.AsString);
		F_DMADO.T_Fornecedor.Next;
   end;
end;

procedure TF_Cotacao.Acessar1Click(Sender: TObject);
begin
	habilita;
	Edit2.SetFocus;
   Edit2.ReadOnly := False;
end;

procedure TF_Cotacao.Edit2Exit(Sender: TObject);
begin
	Edit2.Text := StringOfChar('0',10-Length(Edit2.Text)) + Edit2.Text;
   F_DMADO.Q_CCotacao.Active := False;
   F_DMADO.Q_CCotacao.SQL.Clear;
   F_DMADO.Q_CCotacao.SQL.Add('select * from C_COTACAO where CODIGO='+#39+Edit2.Text+#39);
   F_DMADO.Q_CCotacao.Active := True;
   if F_DMADO.Q_CCotacao.FieldByName('CODIGO').AsString <> '' then begin
   	datainicio.Text := F_DMADO.Q_CCotacao.FieldByName('DATACOT').AsString;
      //pegar o codigo e o nome dos fornecedores e jogar nos comboboxes
      F_DMADO.Q_CCotacao.Edit;
      pegaitens;
   end
   else begin
   	Application.MessageBox('Número de Cotação não Encontrado','Erro no Sistema',MB_IConError + MB_OK);
      Limpa;
   end;
end;

procedure TF_Cotacao.limpa;
begin
	Edit2.Clear;
   Datainicio.Clear;
   Combobox1.Text := '';
   Combobox2.Text := '';
   Combobox3.Text := '';
end;

procedure TF_Cotacao.habilita;
begin
	Panel1.Enabled := True;
   BitBtn2.Enabled := True;
   BitBtn3.Enabled := True;
   BitBtn4.Enabled := True;
   BitBtn6.Enabled := True;
   BitBtn1.Enabled := False;
   BitBtn5.Enabled := False;
end;

procedure TF_Cotacao.desabilita;
begin
	Panel1.Enabled := False;
   BitBtn2.Enabled := False;
   BitBtn3.Enabled := False;
   BitBtn4.Enabled := False;
   BitBtn6.Enabled := False;
   BitBtn1.Enabled := True;
   BitBtn5.Enabled := True;
end;

procedure TF_Cotacao.BitBtn2Click(Sender: TObject);
begin
	if Application.MessageBox('Deseja Realmente Excluir?','Pergunta do Sistema',MB_YesNo + MB_IconQuestion) = idYes then
   	F_DMADO.Q_DCotacao.Delete;
end;

procedure TF_Cotacao.BitBtn6Click(Sender: TObject);
begin
	F_DMADO.Q_AtualizaCCot.Parameters.ParamByName('CODIGO').Value := StrToInt(Edit2.Text);
	F_DMADO.Q_AtualizaCCot.Parameters.ParamByName('FORN1').Value := StrToInt(Copy(Combobox1.Text,1,4));
	F_DMADO.Q_AtualizaCCot.Parameters.ParamByName('FORN2').Value := StrToInt(Copy(Combobox2.Text,1,4));
	F_DMADO.Q_AtualizaCCot.Parameters.ParamByName('FORN3').Value := StrToInt(Copy(Combobox3.Text,1,4));
	F_DMADO.Q_AtualizaCCot.Parameters.ParamByName('DATACOT').Value := StrToDate(datainicio.Text);
   F_DMADO.Q_AtualizaCCot.ExecSQL;
   Limpa;
   desabilita;
   pegaitens;
end;

procedure TF_Cotacao.BitBtn3Click(Sender: TObject);
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

procedure TF_Cotacao.pegaitens;
begin
	F_DMADO.Q_DCotacao.Active := False;
	F_DMADO.Q_DCotacao.SQL.Clear;
   if Edit2.Text <> '' then
		F_DMADO.Q_DCotacao.SQL.Add('select * from D_COTACAO where CODCOTA='+#39+Edit2.Text+#39)
   else
		F_DMADO.Q_DCotacao.SQL.Add('select * from D_COTACAO where CODCOTA=0');
	F_DMADO.Q_DCotacao.Active := True;
end;

end.
