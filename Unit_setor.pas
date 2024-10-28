unit Unit_setor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Mask, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TForm_setor = class(TForm)
    DataSource1: TDataSource;
    TFDTable_setor: TFDTable;
    ButtonAdicionar: TButton;
    ButtonExcluir: TButton;
    TFDTable_setorcodigo: TFDAutoIncField;
    TFDTable_setornome: TWideMemoField;
    TFDTable_setorresponsavel_codigo: TIntegerField;
    Label2: TLabel;
    DBMemo1: TDBMemo;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    DBGrid1: TDBGrid;
    procedure ButtonExcluirClick(Sender: TObject);
    procedure ButtonAdicionarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_setor: TForm_setor;

implementation

{$R *.dfm}

procedure TForm_setor.ButtonAdicionarClick(Sender: TObject);
begin
  TFDTable_setor.Append;
end;

procedure TForm_setor.ButtonExcluirClick(Sender: TObject);
begin
  TFDTable_setor.Delete;
end;

end.
