object Form_requerimento: TForm_requerimento
  Left = 0
  Top = 0
  Caption = 'Form_requerimento'
  ClientHeight = 731
  ClientWidth = 644
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 240
    Top = 144
    Width = 37
    Height = 15
    Caption = 'codigo'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 240
    Top = 192
    Width = 100
    Height = 15
    Caption = 'data_requerimento'
    FocusControl = DBMemo1
  end
  object Label3: TLabel
    Left = 240
    Top = 304
    Width = 60
    Height = 15
    Caption = 'quantidade'
    FocusControl = DBEdit2
  end
  object Label4: TLabel
    Left = 240
    Top = 352
    Width = 166
    Height = 15
    Caption = 'requerente_responsavel_codigo'
    FocusControl = DBEdit3
  end
  object Label5: TLabel
    Left = 240
    Top = 400
    Width = 149
    Height = 15
    Caption = 'requerente_nao_responsavel'
    FocusControl = DBMemo2
  end
  object Label6: TLabel
    Left = 240
    Top = 512
    Width = 66
    Height = 15
    Caption = 'item_codigo'
    FocusControl = DBEdit4
  end
  object Label7: TLabel
    Left = 240
    Top = 560
    Width = 112
    Height = 15
    Caption = 'local_retirada_codigo'
    FocusControl = DBEdit5
  end
  object Label8: TLabel
    Left = 240
    Top = 608
    Width = 68
    Height = 15
    Caption = 'setor_codigo'
    FocusControl = DBEdit6
  end
  object DBEdit1: TDBEdit
    Left = 240
    Top = 160
    Width = 154
    Height = 23
    DataField = 'codigo'
    DataSource = DataSource1
    TabOrder = 0
  end
  object DBMemo1: TDBMemo
    Left = 240
    Top = 208
    Width = 185
    Height = 89
    DataField = 'data_requerimento'
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 240
    Top = 320
    Width = 154
    Height = 23
    DataField = 'quantidade'
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBEdit3: TDBEdit
    Left = 240
    Top = 368
    Width = 154
    Height = 23
    DataField = 'requerente_responsavel_codigo'
    DataSource = DataSource1
    TabOrder = 3
  end
  object DBMemo2: TDBMemo
    Left = 240
    Top = 416
    Width = 185
    Height = 89
    DataField = 'requerente_nao_responsavel'
    DataSource = DataSource1
    TabOrder = 4
  end
  object DBEdit4: TDBEdit
    Left = 240
    Top = 528
    Width = 154
    Height = 23
    DataField = 'item_codigo'
    DataSource = DataSource1
    TabOrder = 5
  end
  object DBEdit5: TDBEdit
    Left = 240
    Top = 576
    Width = 154
    Height = 23
    DataField = 'local_retirada_codigo'
    DataSource = DataSource1
    TabOrder = 6
  end
  object DBEdit6: TDBEdit
    Left = 240
    Top = 624
    Width = 154
    Height = 23
    DataField = 'setor_codigo'
    DataSource = DataSource1
    TabOrder = 7
  end
  object TFDTable_requerimento: TFDTable
    IndexFieldNames = 'codigo'
    Connection = Form1.FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'TB_requerimento'
    Left = 432
    Top = 32
    object TFDTable_requerimentocodigo: TFDAutoIncField
      FieldName = 'codigo'
      Origin = 'codigo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object TFDTable_requerimentodata_requerimento: TWideMemoField
      FieldName = 'data_requerimento'
      Origin = 'data_requerimento'
      Required = True
      BlobType = ftWideMemo
    end
    object TFDTable_requerimentoquantidade: TIntegerField
      FieldName = 'quantidade'
      Origin = 'quantidade'
      Required = True
    end
    object TFDTable_requerimentorequerente_responsavel_codigo: TIntegerField
      FieldName = 'requerente_responsavel_codigo'
      Origin = 'requerente_responsavel_codigo'
    end
    object TFDTable_requerimentorequerente_nao_responsavel: TWideMemoField
      FieldName = 'requerente_nao_responsavel'
      Origin = 'requerente_nao_responsavel'
      BlobType = ftWideMemo
    end
    object TFDTable_requerimentoitem_codigo: TIntegerField
      FieldName = 'item_codigo'
      Origin = 'item_codigo'
      Required = True
    end
    object TFDTable_requerimentolocal_retirada_codigo: TIntegerField
      FieldName = 'local_retirada_codigo'
      Origin = 'local_retirada_codigo'
      Required = True
    end
    object TFDTable_requerimentosetor_codigo: TIntegerField
      FieldName = 'setor_codigo'
      Origin = 'setor_codigo'
      Required = True
    end
  end
  object DataSource1: TDataSource
    DataSet = TFDTable_requerimento
    Left = 544
    Top = 32
  end
end