﻿unit Unit_item;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls,
  Vcl.DBCtrls, Data.DB, Vcl.Mask, Vcl.ExtCtrls, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  TForm_item = class(TForm)
    TFDTable_item: TFDTable;
    TFDTable_itemcodigo: TFDAutoIncField;
    TFDTable_itemnome: TWideMemoField;
    DataSource1: TDataSource;
    ButtonAdicionar: TButton;
    ButtonExcluir: TButton;
    DBGrid1: TDBGrid;
    TFDTable_itemlocal_retirada_codigo: TIntegerField;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Button1: TButton;
    FDQuery1: TFDQuery;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    procedure ButtonAdicionarClick(Sender: TObject);
    procedure ButtonExcluirClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_item: TForm_item;
  codigoLocalRetirada: array of Integer;

implementation

{$R *.dfm}

procedure TForm_item.Button1Click(Sender: TObject);
var
  nomeItem: string;
  indexLocalRetirada: Integer;
begin
  nomeItem := Edit1.Text;
  indexLocalRetirada := ComboBox1.ItemIndex;
  if Trim(nomeItem) <> '' then
  begin
    with FDQuery1.SQL do begin
      FDQuery1.SQL.Clear;
      FDQuery1.SQL.Add('INSERT INTO TB_item VALUES (null, :NomeItem, :CodigoLocalRetirada);');
      FDQuery1.ParamByName('nomeItem').AsString := nomeItem;
      FDQuery1.ParamByName('codigoLocalRetirada').AsInteger := codigoLocalRetirada[indexLocalRetirada];
      FDQuery1.Command.CommandKind := skInsert;
      FDQuery1.ExecSQL;
    end;
  end;
end;

procedure TForm_item.ButtonAdicionarClick(Sender: TObject);
begin
  TFDTable_item.Append;
end;

procedure TForm_item.ButtonExcluirClick(Sender: TObject);
begin
  TFDTable_item.Delete;
end;

procedure TForm_item.FormActivate(Sender: TObject);
var
  s: string;
  i, contador: Integer;
begin
  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('SELECT COUNT(*) FROM TB_local_retirada;');
  FDQuery1.Open;
  contador := FDQuery1.Fields.Fields[0].AsInteger;
  i := 0;
  SetLength(codigoLocalRetirada, contador); // aloca memória
  FDQuery1.Close;
  FDQuery1.SQL.Clear;

  FDQuery1.SQL.Add('SELECT codigo, nome FROM TB_local_retirada;');
  FDQuery1.Open;
  ComboBox1.Items.Clear;
  while not FDQuery1.Eof do
  begin
    codigoLocalRetirada[i] := FDQuery1.Fields.Fields[0].AsInteger;
    i := i + 1;
    s := FDQuery1.Fields.Fields[1].AsString;
    ComboBox1.Items.Add(s);
    FDQuery1.Next;
  end;
  FDQuery1.Close;
end;

end.
