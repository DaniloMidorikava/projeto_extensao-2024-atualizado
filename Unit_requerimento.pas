﻿unit Unit_requerimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Mask, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TForm_requerimento = class(TForm)
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Button1: TButton;
    FDQuery1: TFDQuery;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    Edit2: TEdit;
    Edit3: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_requerimento: TForm_requerimento;
  codigoResponsavel: array of Integer;
  codigoItem: array of Integer;
  codigoLocalRetirada: array of Integer;
  codigoSetor: array of Integer;

implementation

{$R *.dfm}

procedure TForm_requerimento.Button1Click(Sender: TObject);
var
  quantidadeRequerimento, requerenteNaoResponsavel: string;
  indexResponsavel, indexItem, indexLocalRetirada, indexSetor: Integer;
  valorCodigoResponsavel: Integer;
  camposValidos: boolean;
  dataAtual: TDate;
  i: Integer;
begin
  dataAtual := Date;

  quantidadeRequerimento := Edit2.Text;
  requerenteNaoResponsavel := Edit3.Text;
  indexResponsavel := ComboBox1.ItemIndex - 1;
  indexItem := ComboBox2.ItemIndex;
  indexLocalRetirada := ComboBox3.ItemIndex;
  indexSetor := ComboBox4.ItemIndex;

  // erros
  camposValidos := True;

  // QUANTIDADE
  // campo vazio
  if Trim(quantidadeRequerimento) = '' then
  begin
    showMessage('O campo "quantidade" não pode estar vazio!');
    camposValidos := False;
  end
  // valor não numérico
  else if TryStrToInt(quantidadeRequerimento, i) = False then
  begin
    showMessage('A quantidade precisa ser um valor numérico inteiro!');
    camposValidos := False;
  end
  // valor negativo
  else if quantidadeRequerimento.ToInteger < 1 then
  begin
    showMessage('A quantidade precisa ser um valor maior que 0!');
    camposValidos := False;
  end
  // OUTROS CAMPOS
  // comboboxes não selecionadas
  else if (ComboBox1.ItemIndex = -1) or (ComboBox2.ItemIndex = -1) or (ComboBox3.ItemIndex = -1) or (ComboBox4.ItemIndex = -1) then
  begin
    showMessage('Por favor, preencha todos os campos.');
    camposValidos := False;
  end
  else if (ComboBox1.ItemIndex = 0) and (Edit3.Text = '') then
  begin
    showMessage('Por favor, indique o nome do requerente.');
    camposValidos := False;
  end;


  if camposValidos then
  begin
    with FDQuery1 do begin
      SQL.Clear;
      SQL.Add('INSERT INTO TB_requerimento VALUES (null, :DataRequerimento, :Quantidade, :RequerenteResponsavelCodigo, :RequerenteNaoResponsavel, :ItemCodigo, :LocalRetiradaCodigo, :SetorCodigo);');
      ParamByName('dataRequerimento').AsString := DateToStr(dataAtual);
      ParamByName('quantidade').AsInteger := StrToInt(quantidadeRequerimento);
      if indexResponsavel <> -1 then ParamByName('requerenteResponsavelCodigo').AsInteger := codigoResponsavel[indexResponsavel]
      else begin
        ParamByName('requerenteResponsavelCodigo').DataType := ftInteger;
        ParamByName('requerenteResponsavelCodigo').Value := NULL;
      end;
      if requerenteNaoResponsavel <> '' then ParamByName('requerenteNaoResponsavel').AsString := requerenteNaoResponsavel
      else begin
        ParamByName('requerenteNaoResponsavel').DataType := ftString;
        ParamByName('requerenteNaoResponsavel').Value := NULL;
      end;
      ParamByName('itemCodigo').AsInteger := codigoItem[indexItem];
      ParamByName('localRetiradaCodigo').AsInteger := codigoLocalRetirada[indexLocalRetirada];
      ParamByName('setorCodigo').AsInteger := codigoSetor[indexSetor];
      Command.CommandKind := skInsert;
      ExecSQL;
    end;
    ShowMessage('Requerimento adicionado com sucesso!');
    Edit2.Clear;
    Edit3.Clear;
    ComboBox1.ClearSelection;
    ComboBox2.ClearSelection;
    ComboBox3.ClearSelection;
    ComboBox4.ClearSelection;
  end;
end;

procedure TForm_requerimento.ComboBox1Change(Sender: TObject);
begin
  if ComboBox1.ItemIndex = 0 then Edit3.Visible := True
  else
  begin
    Edit3.Visible := False;
    Edit3.Clear;
  end;
end;

procedure TForm_requerimento.ComboBox2Change(Sender: TObject);
var
  indexItem: Integer;
begin
  indexItem := ComboBox2.ItemIndex;
  FDQuery1.Close;
  FDQUery1.SQL.Clear;
  FDQuery1.SQL.Add('SELECT local_retirada_codigo FROM TB_item WHERE codigo = :CodigoItem;');
  FDQuery1.ParamByName('codigoItem').AsInteger := indexItem;
  FDQuery1.Open;
  ComboBox3.ItemIndex := FDQuery1.Fields.Fields[0].AsInteger;
  FDQuery1.Close;
end;

procedure TForm_requerimento.FormActivate(Sender: TObject);
var
  s: string;
  i, contador: Integer;
begin
  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('SELECT COUNT(*) FROM TB_responsavel;');
  FDQuery1.Open;
  contador := FDQuery1.Fields.Fields[0].AsInteger;
  SetLength(codigoResponsavel, contador);

  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('SELECT COUNT(*) FROM TB_item;');
  FDQuery1.Open;
  contador := FDQuery1.Fields.Fields[0].AsInteger;
  SetLength(codigoItem, contador);

  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('SELECT COUNT(*) FROM TB_local_retirada;');
  FDQuery1.Open;
  contador := FDQuery1.Fields.Fields[0].AsInteger;
  SetLength(codigoLocalRetirada, contador);

  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('SELECT COUNT(*) FROM TB_setor;');
  FDQuery1.Open;
  contador := FDQuery1.Fields.Fields[0].AsInteger;
  SetLength(codigoSetor, contador);

  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('SELECT codigo, nome FROM TB_responsavel;');
  FDQuery1.Open;
  ComboBox1.Items.Clear;
  i := 0;
  ComboBox1.Items.Add('Outro');
  while not FDQuery1.Eof do
  begin
    codigoResponsavel[i] := FDQuery1.Fields.Fields[0].AsInteger;
    i := i + 1;
    s := FDQuery1.Fields.Fields[1].AsString;
    ComboBox1.Items.Add(s);
    FDQuery1.Next;
  end;

  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('SELECT codigo, nome FROM TB_item;');
  FDQuery1.Open;
  ComboBox2.Items.Clear;
  i := 0;
  while not FDQuery1.Eof do
  begin
    codigoItem[i] := FDQuery1.Fields.Fields[0].AsInteger;
    i := i + 1;
    s := FDQuery1.Fields.Fields[1].AsString;
    ComboBox2.Items.Add(s);
    FDQuery1.Next;
  end;

  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('SELECT codigo, nome FROM TB_local_retirada;');
  FDQuery1.Open;
  i := 0;
  while not FDQuery1.Eof do
  begin
    codigoLocalRetirada[i] := FDQuery1.Fields.Fields[0].AsInteger;
    i := i + 1;
    s := FDQuery1.Fields.Fields[1].AsString;
    ComboBox3.Items.Add(s);
    FDQuery1.Next;
  end;

  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('SELECT codigo, nome FROM TB_setor;');
  FDQuery1.Open;
  ComboBox4.Items.Clear;
  i := 0;
  while not FDQUery1.Eof do
  begin
    codigoSetor[i] := FDQuery1.Fields.Fields[0].AsInteger;
    i := i + 1;
    s := FDQuery1.Fields.Fields[1].AsString;
    ComboBox4.Items.Add(s);
    FDQuery1.Next;
  end;
  FDQuery1.Close;

end;

end.
