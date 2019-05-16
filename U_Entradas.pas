unit U_Entradas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Mask, StdCtrls, Buttons, Grids, DBGrids, MenBtn, Menus,
  EditNum;

type
  TF_Entradas = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    DBGrid1: TDBGrid;
    BitBtn1: TMenuButton;
    PopupMenu1: TPopupMenu;
    Incluir1: TMenuItem;
    Acessar1: TMenuItem;
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    EditNum2: TEditNum;
    Edit1: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    datainicio: TMaskEdit;
    MaskEdit1: TMaskEdit;
    procedure soma;
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
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Entradas: TF_Entradas;
  verifica:integer;

implementation

uses U_Menu, U_DMIBX, U_PegaProdEnt;

{$R *.dfm}

procedure TF_Entradas.BitBtn5Click(Sender: TObject);
begin
	Close;
end;

procedure TF_Entradas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	Release;
end;

procedure TF_Entradas.Incluir1Click(Sender: TObject);
begin
	verifica := 1;
	habilita;
   F_DMIBX.Q_CNFE.Active := True;
   Edit1.SetFocus;
end;

procedure TF_Entradas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if key = 115 then begin
   	if verifica <> 3 then begin
      	F_DMIBX.Q_CNFE.Append;
         F_DMIBX.Q_CNFENUMERO.AsString := Edit1.Text;
         F_DMIBX.Q_CNFE.Post;
         verifica := 3;
      end;
		Application.CreateForm(TF_PegaProdEnt,F_PegaProdEnt);
	   F_PegaProdEnt.ShowModal;
	end;
end;

procedure TF_Entradas.FormCreate(Sender: TObject);
begin
	verifica := 0;
   desabilita;
   pegaitens;
end;

procedure TF_Entradas.Acessar1Click(Sender: TObject);
begin
	verifica := 2;
	habilita;
	Edit1.SetFocus;
end;

procedure TF_Entradas.limpa;
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

procedure TF_Entradas.habilita;
begin
	Panel1.Enabled := True;
   BitBtn2.Enabled := True;
   BitBtn3.Enabled := True;
   BitBtn4.Enabled := True;
   BitBtn6.Enabled := True;
   BitBtn1.Enabled := False;
   BitBtn5.Enabled := False;
end;

procedure TF_Entradas.desabilita;
begin
	Panel1.Enabled := False;
   BitBtn2.Enabled := False;
   BitBtn3.Enabled := False;
   BitBtn4.Enabled := False;
   BitBtn6.Enabled := False;
   BitBtn1.Enabled := True;
   BitBtn5.Enabled := True;
end;

procedure TF_Entradas.BitBtn2Click(Sender: TObject);
begin
	if Application.MessageBox('Deseja Realmente Excluir?','Pergunta do Sistema',MB_YesNo + MB_IconQuestion) = idYes then
   	F_DMIBX.Q_DNFE.Delete;
end;

procedure TF_Entradas.BitBtn6Click(Sender: TObject);
begin
	F_DMIBX.Q_AtualizaCNFE.Params.ParamByName('NUMERO').AsString := Edit1.Text;
	F_DMIBX.Q_AtualizaCNFE.Params.ParamByName('CODFORN').AsString := Edit3.Text;
	F_DMIBX.Q_AtualizaCNFE.Params.ParamByName('EMISSAO').AsString := datainicio.Text;
	F_DMIBX.Q_AtualizaCNFE.Params.ParamByName('ENTRADA').AsString := MaskEdit1.Text;
	F_DMIBX.Q_AtualizaCNFE.Params.ParamByName('TOTAL').AsString := EditNum2.Text;
   F_DMIBX.Q_AtualizaCNFE.ExecSQL;
   F_DMIBX.Transacao.CommitRetaining;
   Limpa;
   desabilita;
   pegaitens;
end;

procedure TF_Entradas.BitBtn3Click(Sender: TObject);
begin
	if Application.MessageBox('Deseja Realmente Cancelar? - Todos os Itens serão Perdidos!','Pergunta do Sistema',MB_YesNo + MB_IconQuestion) = idYes then begin
   	//é melhor um cancel ou um delete?
      F_DMIBX.Q_CNFE.Cancel;
      F_DMIBX.Transacao.RollbackRetaining;
      //implementar aqui o codigo que deletará os itens da tabela D_NFE.
      //isso deve ser feito no cliente ou no BD?
		limpa;
   end;
   desabilita;
   pegaitens;
end;

procedure TF_Entradas.pegaitens;
begin
	F_DMIBX.Q_DNFE.Active := False;
	F_DMIBX.Q_DNFE.SelectSQL.Clear;
	if edit1.text <> '' then
		F_DMIBX.Q_DNFE.SelectSQL.Add('select * from D_NFE where NUMNOTA='+#39+Edit1.Text+#39)
   else
		F_DMIBX.Q_DNFE.SelectSQL.Add('select * from D_NFE where NUMNOTA=0');
	F_DMIBX.Q_DNFE.Active := True;
end;

procedure TF_Entradas.Edit3Exit(Sender: TObject);
begin
{	Edit3.Text := StringOfChar('0',4-Length(Edit3.Text)) + Edit3.Text;
	F_DMADO.Q_Consultas.Active := False;
	F_DMADO.Q_Consultas.SQL.Clear;
   F_DMADO.Q_Consultas.SQL.Add('select * from CLIENTE where CODIGO='+#39+Edit3.Text+#39);
	F_DMADO.Q_Consultas.Active := True;
   if F_DMADO.Q_Consultas.FieldByName('CODIGO').AsString <> '' then begin
   	Edit4.Text := F_DMADO.Q_Consultas.FieldByName('NOME').AsString;
      datainicio.SetFocus;
   end
   else begin
   	Application.MessageBox('Código de Cliente não Encontrado','Erro no Sistema',MB_IConError + MB_OK);
      Edit4.Clear;
   	if Edit3.Text <> '0000' then
      	Edit3.Setfocus;
   end;}
end;

procedure TF_Entradas.soma;
begin
{   if F_Menu.Label3.Caption = 'MySQL' then begin
		F_DMADO.Q_Consultas.Active := False;
		F_DMADO.Q_Consultas.SQL.Clear;
	   F_DMADO.Q_Consultas.SQL.Add('select sum(VLRTOTAL) as TOTAL from D_VENDA where CODVENDA='+#39+Edit2.Text+#39);
		F_DMADO.Q_Consultas.Active := True;
      EditNum20.Text := F_DMADO.Q_Consultas.FieldByName('TOTAL').AsString;
      calcdesc;
      EditNum10.Text := FloatToStr(StrToFloat(EditNum20.Text) - StrToFloat(EditNum15.Text));
   end
   else begin
		F_DMADO.SP_SomaVenda.Active := True;
		F_DMADO.SP_SomaVenda.Parameters.ParamByName('CODIGO').Value := StrToInt(Edit2.Text);
      F_DMADO.SP_SomaVenda.ExecProc;
      EditNum20.Text := F_DMADO.SP_SomaVenda.FieldByName('SOMA').AsString;
   end;}
end;

procedure TF_Entradas.Edit1Exit(Sender: TObject);
begin
 Edit1.Text := StringOfChar('0',10-Length(Edit1.Text)) + Edit1.Text;
 if verifica = 2 then begin
   F_DMIBX.Q_CNFE.Active := False;
   F_DMIBX.Q_CNFE.SelectSQL.Clear;
   F_DMIBX.Q_CNFE.SelectSQL.Add('select * from C_NFE where NUMERO='+#39+Edit1.Text+#39);
   F_DMIBX.Q_CNFE.Active := True;
   if F_DMIBX.Q_CNFE.FieldByName('NUMERO').AsString <> '' then begin
   	Edit3.Text := F_DMIBX.Q_CNFE.FieldByName('CODFORN').AsString;
   	datainicio.Text := F_DMIBX.Q_CNFE.FieldByName('EMISSAO').AsString;
   	MaskEdit1.Text := F_DMIBX.Q_CNFE.FieldByName('ENTRADA').AsString;
      EditNum2.Text := F_DMIBX.Q_CNFE.FieldByName('TOTAL').AsString;
      pegaitens;
   end
   else begin
   	Application.MessageBox('Número da NF não Encontrado','Erro no Sistema',MB_IConError + MB_OK);
      Limpa;
   end;
 end;
end;

end.
