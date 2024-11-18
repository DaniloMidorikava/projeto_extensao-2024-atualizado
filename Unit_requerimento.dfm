object Form_requerimento: TForm_requerimento
  Left = 0
  Top = 0
  Caption = 'Form_requerimento'
  ClientHeight = 893
  ClientWidth = 914
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  TextHeight = 15
  object Label3: TLabel
    Left = 240
    Top = 304
    Width = 60
    Height = 15
    Caption = 'quantidade'
  end
  object Label4: TLabel
    Left = 240
    Top = 352
    Width = 166
    Height = 15
    Caption = 'requerente_responsavel_codigo'
  end
  object Label6: TLabel
    Left = 240
    Top = 512
    Width = 66
    Height = 15
    Caption = 'item_codigo'
  end
  object Label7: TLabel
    Left = 240
    Top = 560
    Width = 112
    Height = 15
    Caption = 'local_retirada_codigo'
  end
  object Label8: TLabel
    Left = 240
    Top = 608
    Width = 68
    Height = 15
    Caption = 'setor_codigo'
  end
  object ButtonAdicionar: TButton
    Left = 240
    Top = 668
    Width = 75
    Height = 25
    Caption = 'Adicionar'
    TabOrder = 0
    OnClick = ButtonAdicionarClick
  end
  object ButtonExcluir: TButton
    Left = 331
    Top = 668
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 1
    OnClick = ButtonExcluirClick
  end
  object DBGrid1: TDBGrid
    Left = 20
    Top = 727
    Width = 837
    Height = 135
    DataSource = DataSource1
    TabOrder = 2
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
        FieldName = 'data_requerimento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'requerente_responsavel_codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'requerente_nao_responsavel'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'item_codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'local_retirada_codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'setor_codigo'
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 608
    Top = 367
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 3
    OnClick = Button1Click
  end
  object ComboBox1: TComboBox
    Left = 240
    Top = 373
    Width = 145
    Height = 23
    TabOrder = 4
    Text = 'ComboBox1'
    OnChange = ComboBox1Change
  end
  object ComboBox2: TComboBox
    Left = 240
    Top = 533
    Width = 145
    Height = 23
    TabOrder = 5
    Text = 'ComboBox1'
    OnChange = ComboBox2Change
  end
  object ComboBox3: TComboBox
    Left = 240
    Top = 581
    Width = 145
    Height = 23
    TabOrder = 6
    Text = 'ComboBox1'
  end
  object ComboBox4: TComboBox
    Left = 240
    Top = 629
    Width = 145
    Height = 23
    TabOrder = 7
    Text = 'ComboBox1'
  end
  object Edit2: TEdit
    Left = 240
    Top = 323
    Width = 121
    Height = 23
    TabOrder = 8
  end
  object Edit3: TEdit
    Left = 395
    Top = 373
    Width = 121
    Height = 23
    TabOrder = 9
    Visible = False
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
  object FDQuery1: TFDQuery
    Connection = Form1.FDConnection1
    SQL.Strings = (
      'SELECT * FROM TB_requerimento')
    Left = 616
    Top = 88
  end
end
