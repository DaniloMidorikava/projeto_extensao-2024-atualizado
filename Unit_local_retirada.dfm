object Form_local_retirada: TForm_local_retirada
  Left = 0
  Top = 0
  Caption = 'Form_local_retirada'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 288
    Top = 232
    Width = 37
    Height = 15
    Caption = 'codigo'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 288
    Top = 280
    Width = 31
    Height = 15
    Caption = 'nome'
    FocusControl = DBMemo1
  end
  object DBEdit1: TDBEdit
    Left = 288
    Top = 248
    Width = 154
    Height = 23
    DataField = 'codigo'
    DataSource = DataSource1
    TabOrder = 0
  end
  object DBMemo1: TDBMemo
    Left = 288
    Top = 296
    Width = 185
    Height = 89
    DataField = 'nome'
    DataSource = DataSource1
    TabOrder = 1
  end
  object TFDTable_local_retirada: TFDTable
    IndexFieldNames = 'codigo'
    Connection = Form1.FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'TB_local_retirada'
    Left = 496
    Top = 88
    object TFDTable_local_retiradacodigo: TFDAutoIncField
      FieldName = 'codigo'
      Origin = 'codigo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object TFDTable_local_retiradanome: TWideMemoField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      BlobType = ftWideMemo
    end
  end
  object DataSource1: TDataSource
    DataSet = TFDTable_local_retirada
    Left = 336
    Top = 56
  end
end