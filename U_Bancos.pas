unit U_Bancos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, Mask, DBCtrls,
  DosMove;

type
  TF_Bancos = class(TForm)
    PanTitulo: TPanel;
    PanGrid: TPanel;
    DBGrid1: TDBGrid;
    PanBotoes: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    PanEdits: TPanel;
    BitBtn6: TBitBtn;
    EditProcura: TEdit;
    Label9: TLabel;
    Bevel1: TBevel;
    SpeedButton1: TSpeedButton;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    Bevel2: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    EditNome: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Label1: TLabel;
    MaskEdit3: TMaskEdit;
    procedure selecao;
    procedure limpa;
    procedure gravainclusao;
    procedure gravaalteracao;
    procedure QueryToEdits;
    procedure procura;
    procedure pinta;
    procedure BitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure EditProcuraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Bancos: TF_Bancos;
  idCol,confira,codbanco : Integer;
  nCol : String;

implementation

uses U_Dados, UR_Bancos;

{$R *.dfm}

procedure TF_Bancos.selecao;
begin
	F_Dados.Q_Banco.Active := False;
   F_Dados.Q_Banco.SQL.Clear;
   F_Dados.Q_Banco.SQL.Add('SELECT * FROM BANCO WHERE CODBANCO='+#39+Edit2.Text+#39);
   F_Dados.Q_Banco.Active := True;
end;

procedure TF_Bancos.limpa;
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
end;

procedure TF_Bancos.QueryToEdits;
begin
	EditNome.Text		:= 		F_Dados.Q_Banco.FieldByName('Nome').AsString;
	Edit2.Text			:= 		F_Dados.Q_Banco.FieldByName('codbanco').AsString;
   Edit3.Text			:= 		F_Dados.Q_Banco.FieldByName('email').AsString;
   Edit4.Text			:= 		F_Dados.Q_Banco.FieldByName('endereco').AsString;
   Edit5.Text			:= 		F_Dados.Q_Banco.FieldByName('bairro').AsString;
   Edit6.Text			:= 		F_Dados.Q_Banco.FieldByName('cidade').AsString;
   Edit7.Text			:= 		F_Dados.Q_Banco.FieldByName('cep').AsString;
   Edit8.Text			:= 		F_Dados.Q_Banco.FieldByName('estado').AsString;
   MaskEdit1.Text		:=			F_Dados.Q_Banco.FieldByName('fone').AsString;
   MaskEdit2.Text		:=			F_Dados.Q_Banco.FieldByName('celular').AsString;
   MaskEdit3.Text		:=			F_Dados.Q_Banco.FieldByName('fax').AsString;
   Edit12.Text			:= 		F_Dados.Q_Banco.FieldByName('gerente').AsString;
   Edit13.Text			:= 		F_Dados.Q_Banco.FieldByName('agencia').AsString;
   Edit14.Text			:= 		F_Dados.Q_Banco.FieldByName('conta').AsString;
end;

procedure TF_Bancos.GravaInclusao;
begin
	showmessage('INSERT INTO BANCO (NOME,CODBANCO,EMAIL,ENDERECO,BAIRRO,CIDADE,CEP,ESTADO,FONE,CELULAR,FAX,GERENTE,AGENCIA,CONTA) VALUES ('+EditNome.Text+','+Edit2.Text+',');
   //
	F_Dados.Q_Banco.Active := False;
   F_Dados.Q_Banco.SQL.Clear;
   F_Dados.Q_Banco.SQL.Add('INSERT INTO BANCO (NOME,CODBANCO,EMAIL,ENDERECO,BAIRRO,CIDADE,CEP,ESTADO,FONE,CELULAR,FAX,GERENTE,AGENCIA,CONTA) VALUES (');
   F_Dados.Q_Banco.SQL.Add('"'+EditNome.Text+'","');
   F_Dados.Q_Banco.SQL.Add(Edit2.Text+'","');
   F_Dados.Q_Banco.SQL.Add(Edit3.Text+'","');
   F_Dados.Q_Banco.SQL.Add(Edit4.Text+'","');
   F_Dados.Q_Banco.SQL.Add(Edit5.Text+'","');
   F_Dados.Q_Banco.SQL.Add(Edit6.Text+'","');
   F_Dados.Q_Banco.SQL.Add(Edit7.Text+'","');
   F_Dados.Q_Banco.SQL.Add(Edit8.Text+'","');
   F_Dados.Q_Banco.SQL.Add(MaskEdit1.Text+'","');
   F_Dados.Q_Banco.SQL.Add(MaskEdit2.Text+'","');
   F_Dados.Q_Banco.SQL.Add(MaskEdit3.Text+'","');
   F_Dados.Q_Banco.SQL.Add(Edit12.Text+'","');
   F_Dados.Q_Banco.SQL.Add(Edit13.Text+'","');
   F_Dados.Q_Banco.SQL.Add(Edit14.Text+'")');
   F_Dados.Q_Banco.ExecSQL;
end;

procedure TF_Bancos.GravaAlteracao;
begin
	F_Dados.Q_Banco.Active := False;
   F_Dados.Q_Banco.SQL.Clear;
   F_Dados.Q_Banco.SQL.Add('UPDATE BANCO SET ');
   F_Dados.Q_Banco.SQL.Add('NOME="'+EditNome.Text+'","');
   F_Dados.Q_Banco.SQL.Add('CODBANCO"'+Edit2.Text+'","');
   F_Dados.Q_Banco.SQL.Add('EMAIL="'+Edit3.Text+'","');
   F_Dados.Q_Banco.SQL.Add('ENDERECO="'+Edit4.Text+'","');
   F_Dados.Q_Banco.SQL.Add('BAIRRO="'+Edit5.Text+'","');
   F_Dados.Q_Banco.SQL.Add('CIDADE="'+Edit6.Text+'","');
   F_Dados.Q_Banco.SQL.Add('CEP="'+Edit7.Text+'","');
   F_Dados.Q_Banco.SQL.Add('ESTADO="'+Edit8.Text+'","');
   F_Dados.Q_Banco.SQL.Add('FONE="'+MaskEdit1.Text+'","');
   F_Dados.Q_Banco.SQL.Add('CELULAR="'+MaskEdit2.Text+'","');
   F_Dados.Q_Banco.SQL.Add('FAX="'+MaskEdit3.Text+'","');
   F_Dados.Q_Banco.SQL.Add('GERENTE="'+Edit12.Text+'","');
   F_Dados.Q_Banco.SQL.Add('AGENCIA="'+Edit13.Text+'","');
   F_Dados.Q_Banco.SQL.Add('CONTA="'+Edit14.Text+'" WHERE CODIGO='+#39+IntToStr(codbanco)+#39);
   F_Dados.Q_Banco.ExecSQL;
end;

procedure TF_Bancos.pinta;
var
	i : integer;
begin
	for i := 0 to DbGrid1.Columns.Count - 1 do
   	DbGrid1.Columns.Items[i].Color := clWindow;
   DbGrid1.Columns.Items[idCol].Color := clInfoBk;
end;

procedure TF_Bancos.procura;
begin
	If EditProcura.Text <> '' then begin
   	if ncol = '' then
      	Application.MessageBox('Primeiro Ordene uma Coluna para Realizar a Consulta','Clique em um Título',MB_OK + MB_IconError)
      else begin
      	F_Dados.Q_Banco.Active := False;
         F_Dados.Q_Banco.SQL.Clear;
         F_Dados.Q_Banco.SQL.Add('SELECT * FROM BANCO WHERE '+nCol+' LIKE '+#39+EditProcura.Text+'%'+#39);
         F_Dados.Q_Banco.SQL.Add('order by '+nCol);
      	F_Dados.Q_Banco.Active := True;
      end;
   end;
end;

procedure TF_Bancos.BitBtn5Click(Sender: TObject);
begin
	close;
end;

procedure TF_Bancos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	Release;
end;

procedure TF_Bancos.BitBtn1Click(Sender: TObject);
begin
	confira := 1;
   PanTitulo.Caption := 'Cadastro de Funcionários - Inserindo';
   PanGrid.SendToBack;
   EditNome.SetFocus;
   PanBotoes.Enabled := False;
end;

procedure TF_Bancos.BitBtn2Click(Sender: TObject);
begin
	codbanco := F_Dados.Q_Banco.FieldByName('Codigo').Value;
	confira := 2;
   QueryToEdits;
   PanTitulo.Caption := 'Cadastro de Funcionários - Alterando';
   PanGrid.SendToBack;
   PanBotoes.Enabled := False;
end;

procedure TF_Bancos.BitBtn3Click(Sender: TObject);
begin
	codbanco := F_Dados.Q_Banco.FieldByName('Codigo').Value;
	if Application.MessageBox('Deseja Realmente Excluir?','Pergunta do Sistema',MB_YesNo + MB_IconQuestion) = idYes then begin
		F_Dados.Q_Banco.Active := False;
   	F_Dados.Q_Banco.SQL.Clear;
	   F_Dados.Q_Banco.SQL.Add('DELETE FROM BANCO WHERE CODIGO='+#39+IntToStr(codbanco)+#39);
   	F_Dados.Q_Banco.ExecSQL;
   end;
end;

procedure TF_Bancos.BitBtn6Click(Sender: TObject);
begin
	confira := 3;
   PanTitulo.Caption := 'Cadastro de Funcionários - Consultando';
   PanGrid.SendToBack;
   PanBotoes.Enabled := False;
end;

procedure TF_Bancos.BitBtn7Click(Sender: TObject);
begin
   PanGrid.BringToFront;
   PanBotoes.Enabled := True;
   Limpa;
end;

procedure TF_Bancos.BitBtn8Click(Sender: TObject);
begin
	if confira = 1 then
	   gravainclusao
   else if confira = 2 then
   	gravaalteracao;
   PanGrid.BringToFront;
   PanBotoes.Enabled := True;
   selecao;
   Limpa;   
end;

procedure TF_Bancos.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
	key := upcase(key);
end;

procedure TF_Bancos.DBGrid1TitleClick(Column: TColumn);
begin
	idCol := Column.ID;
   nCol := Column.FieldName;
   pinta;
   procura;
end;

procedure TF_Bancos.FormCreate(Sender: TObject);
begin
	F_Dados.Q_Banco.Active := False;
   F_Dados.Q_Banco.SQL.Clear;
   F_Dados.Q_Banco.SQL.Add('SELECT * FROM BANCO WHERE CODIGO=1');
   F_Dados.Q_Banco.Active := True;
end;

procedure TF_Bancos.SpeedButton1Click(Sender: TObject);
begin
	procura;
end;

procedure TF_Bancos.EditProcuraKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if key = 113 then
   	procura;
end;

procedure TF_Bancos.BitBtn4Click(Sender: TObject);
begin
	Application.CreateForm(TFR_Bancos,FR_Bancos);
   FR_Bancos.QuickRep1.Preview;
end;

end.
