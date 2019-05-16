unit U_Contas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids;

type
  TF_Contas = class(TForm)
    DBGrid1: TDBGrid;
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Contas: TF_Contas;

implementation

uses U_DMExpress, U_Pagamentos;

{$R *.dfm}

procedure TF_Contas.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
	if key = #13 then begin
   	F_Pagamentos.Edit3.Text := F_DMExpress.Cds_PlanoConta.FieldByName('Codigo').AsString;
   	F_Pagamentos.Edit4.Text := F_DMExpress.Cds_PlanoConta.FieldByName('Descricao').AsString;
      Close;
   end;
end;

procedure TF_Contas.FormCreate(Sender: TObject);
begin
	F_DMExpress.Cds_PlanoConta.Active := True;
end;

end.
