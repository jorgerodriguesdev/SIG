unit U_Ajuste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EditNum, StdCtrls, Buttons, MenBtn, Grids, DBGrids, ExtCtrls;

type
  TF_Ajuste = class(TForm)
    PanGrid: TPanel;
    DBGrid1: TDBGrid;
    PanProcura: TPanel;
    MenuButton1: TMenuButton;
    BitBtn14: TBitBtn;
    BitBtn10: TBitBtn;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    Label16: TLabel;
    EditProcura: TEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    EditNum5: TEditNum;
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MenuButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Ajuste: TF_Ajuste;

implementation

uses U_DMIBX;

{$R *.dfm}

procedure TF_Ajuste.BitBtn14Click(Sender: TObject);
begin
	//application.messabox
	F_DMIBX.Q_Produto.Delete;
end;

procedure TF_Ajuste.BitBtn10Click(Sender: TObject);
begin
	close;
end;

procedure TF_Ajuste.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	release;
end;

procedure TF_Ajuste.MenuButton1Click(Sender: TObject);
var
	taxa:double;
   staxa:String;
begin
	if radiobutton1.Checked then begin
		taxa := strtofloat(editnum5.text)/100;
	   staxa := copy(floattostr(taxa),3,4);
		F_DMIBX.Q_Atualiza.SQL.Clear;
      F_DMIBX.Q_Atualiza.SQL.Add('update PRODUTO set VLRVENDA=VLRVENDA*1.'+staxa);
      F_DMIBX.Q_Atualiza.ExecQuery;
      F_DMIBX.Q_Produto.Close;
      F_DMIBX.Q_Produto.Open;
   end;
	if radiobutton2.Checked then begin
		taxa := 100 - StrToFloat(Editnum5.Text);
      taxa := taxa / 100;
      staxa := copy(floattostr(taxa),3,4);
      showmessage('update PRODUTO set VLRVENDA=VLRVENDA*0.'+staxa);
		F_DMIBX.Q_Atualiza.SQL.Clear;
      F_DMIBX.Q_Atualiza.SQL.Add('update PRODUTO set VLRVENDA=VLRVENDA*0.'+staxa);
      F_DMIBX.Q_Atualiza.ExecQuery;
      F_DMIBX.Q_Produto.Close;
      F_DMIBX.Q_Produto.Open;
   end;
end;

procedure TF_Ajuste.FormCreate(Sender: TObject);
begin
	F_DMIBX.Q_Produto.Open;
end;

end.
