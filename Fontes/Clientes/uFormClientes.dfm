object FormClientes: TFormClientes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Clientes'
  ClientHeight = 532
  ClientWidth = 608
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel_Superior: TPanel
    Left = 0
    Top = 0
    Width = 608
    Height = 145
    Align = alTop
    TabOrder = 0
    object lblCodCliente: TLabel
      Left = 7
      Top = 38
      Width = 23
      Height = 13
      Caption = 'C'#243'd.'
    end
    object lblNomeCliente: TLabel
      Left = 77
      Top = 38
      Width = 63
      Height = 13
      Caption = 'Nome Cliente'
    end
    object lblEmail: TLabel
      Left = 6
      Top = 86
      Width = 24
      Height = 13
      Caption = 'Email'
    end
    object lblTelefone: TLabel
      Left = 410
      Top = 38
      Width = 42
      Height = 13
      Caption = 'Telefone'
    end
    object DBEdt_CodCliente: TDBEdit
      Left = 6
      Top = 57
      Width = 65
      Height = 21
      DataField = 'id_cliente'
      DataSource = DS_Clientes
      Enabled = False
      ReadOnly = True
      TabOrder = 9
    end
    object DBEdt_NomeCliente: TDBEdit
      Left = 77
      Top = 57
      Width = 322
      Height = 21
      CharCase = ecUpperCase
      DataField = 'nome_cliente'
      DataSource = DS_Clientes
      TabOrder = 1
    end
    object DBEdt_Email: TDBEdit
      Left = 6
      Top = 105
      Width = 297
      Height = 21
      DataField = 'cli_email'
      DataSource = DS_Clientes
      TabOrder = 2
    end
    object DBEdt_Telefone: TDBEdit
      Left = 410
      Top = 57
      Width = 153
      Height = 21
      DataField = 'cli_telefone'
      DataSource = DS_Clientes
      TabOrder = 3
    end
    object DBNavigator2: TDBNavigator
      Left = 2
      Top = 2
      Width = 150
      Height = 25
      DataSource = DS_Clientes
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      TabOrder = 8
    end
    object btnNovo: TButton
      Left = 154
      Top = 2
      Width = 70
      Height = 25
      Caption = 'Novo'
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnSalvar: TButton
      Left = 226
      Top = 2
      Width = 70
      Height = 25
      Caption = 'Salvar'
      TabOrder = 4
      OnClick = btnSalvarClick
    end
    object btnExcluir: TButton
      Left = 369
      Top = 2
      Width = 66
      Height = 25
      Caption = 'Excluir'
      TabOrder = 6
      OnClick = btnExcluirClick
    end
    object btnCancelar: TButton
      Left = 437
      Top = 2
      Width = 74
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 7
      OnClick = btnCancelarClick
    end
    object btnEditar: TButton
      Left = 298
      Top = 2
      Width = 69
      Height = 25
      Caption = 'Editar'
      TabOrder = 5
      OnClick = btnEditarClick
    end
  end
  object Panel_Centro: TPanel
    Left = 0
    Top = 145
    Width = 608
    Height = 358
    Align = alClient
    TabOrder = 1
    object DBGrid_Clientes: TDBGrid
      Left = 1
      Top = 1
      Width = 606
      Height = 356
      Align = alClient
      DataSource = DS_Clientes
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'id_cliente'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome_cliente'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cli_email'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cli_telefone'
          Width = 100
          Visible = True
        end>
    end
  end
  object Panel_Inferior: TPanel
    Left = 0
    Top = 503
    Width = 608
    Height = 29
    Align = alBottom
    TabOrder = 2
    ExplicitLeft = 1
    ExplicitTop = 508
  end
  object DS_Clientes: TDataSource
    AutoEdit = False
    DataSet = Dados.FDT_Clientes
    Left = 312
    Top = 224
  end
end
