unit Unit_setor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Mask, Vcl.ExtCtrls;

type
  TForm_setor = class(TForm)
    DataSource1: TDataSource;
    TFDTable_setor: TFDTable;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBMemo1: TDBMemo;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    ButtonAdicionar: TButton;
    ButtonExcluir: TButton;
    TFDTable_setorcodigo: TFDAutoIncField;
    TFDTable_setornome: TWideMemoField;
    TFDTable_setorresponsavel_codigo: TIntegerField;
    TFDTable_setorlocal_retirada_codigo: TIntegerField;
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