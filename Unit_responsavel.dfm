object Form_responsavel: TForm_responsavel
  Left = 0
  Top = 0
  Caption = 'Form_responsavel'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object Label2: TLabel
    Left = 192
    Top = 112
    Width = 31
    Height = 15
    Caption = 'nome'
  end
  object DBGrid1: TDBGrid
    Left = 136
    Top = 248
    Width = 320
    Height = 120
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Visible = True
      end>
  end
  object ButtonAdicionar: TButton
    Left = 214
    Top = 388
    Width = 75
    Height = 25
    Caption = 'Adicionar'
    TabOrder = 1
    OnClick = ButtonAdicionarClick
  end
  object ButtonExcluir: TButton
    Left = 303
    Top = 388
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 2
    OnClick = ButtonExcluirClick
  end
  object Button1: TButton
    Left = 528
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 192
    Top = 133
    Width = 121
    Height = 23
    TabOrder = 4
  end
  object DataSource1: TDataSource
    DataSet = TFDTable_responsavel
    Left = 552
    Top = 16
  end
  object TFDTable_responsavel: TFDTable
    Active = True
    IndexFieldNames = 'codigo'
    Connection = Form1.FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'TB_responsavel'
    Left = 536
    Top = 80
    object TFDTable_responsavelcodigo: TFDAutoIncField
      FieldName = 'codigo'
      Origin = 'codigo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object TFDTable_responsavelnome: TWideMemoField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      BlobType = ftWideMemo
    end
  end
  object FDQuery1: TFDQuery
    Connection = Form1.FDConnection1
    SQL.Strings = (
      'SELECT * FROM TB_responsavel')
    Left = 496
    Top = 192
  end
end
