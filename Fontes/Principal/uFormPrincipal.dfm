object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Notifica v1.2 - VERS'#195'O TESTE'
  ClientHeight = 425
  ClientWidth = 774
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = Menu
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel_Superior: TPanel
    Left = 0
    Top = 49
    Width = 774
    Height = 34
    Align = alTop
    TabOrder = 0
    object lblDataAtual: TLabel
      Left = 316
      Top = 10
      Width = 27
      Height = 13
      Caption = 'Data:'
    end
    object DataHoje: TcxDateEdit
      Left = 349
      Top = 7
      EditValue = 43205d
      Properties.ShowOnlyValidDates = True
      Style.ButtonStyle = btsDefault
      StyleDisabled.BorderStyle = ebsFlat
      TabOrder = 0
      Width = 81
    end
  end
  object Panel_Centro: TPanel
    Left = 0
    Top = 83
    Width = 774
    Height = 317
    Align = alClient
    TabOrder = 1
    object DBGrid_Contas: TDBGrid
      Left = 1
      Top = 1
      Width = 772
      Height = 315
      Align = alClient
      DataSource = DS_Contas
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid_ContasDrawColumnCell
      OnDblClick = DBGrid_ContasDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'id_conta'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'id_cliente'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'dt_cadastro'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'valor_conta'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NomeCliente'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dt_vencimento'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dt_notificar'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cliente_notificado'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'caminho_boleto'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'caminho_nf'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'situacao_atual'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pode_notificar'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'mensagem'
          Visible = False
        end>
    end
  end
  object Panel_Inferior: TPanel
    Left = 0
    Top = 400
    Width = 774
    Height = 25
    Align = alBottom
    TabOrder = 2
    object WN2018: TLabel
      Left = 4
      Top = 7
      Width = 35
      Height = 11
      Caption = 'WN2018'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblMensagem: TLabel
      Left = 392
      Top = 5
      Width = 32
      Height = 13
      Alignment = taCenter
      Caption = '<<>>'
    end
  end
  object Panel_Botoes: TPanel
    Left = 0
    Top = 0
    Width = 774
    Height = 49
    Align = alTop
    TabOrder = 3
    object btnApagarVencidas: TButton
      Left = 127
      Top = 6
      Width = 102
      Height = 37
      Caption = 'Apagar Vencidas'
      DoubleBuffered = False
      ParentDoubleBuffered = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      WordWrap = True
      StyleElements = [seFont, seClient]
      OnClick = btnApagarVencidasClick
    end
    object btnNotificacao: TButton
      Left = 12
      Top = 6
      Width = 109
      Height = 37
      Caption = 'Notificar'
      TabOrder = 1
      OnClick = btnNotificacaoClick
    end
  end
  object DS_Contas: TDataSource
    AutoEdit = False
    DataSet = Dados.FDT_Contas
    Left = 688
    Top = 8
  end
  object Menu: TMainMenu
    Left = 624
    Top = 9
    object MenuConfiguracao: TMenuItem
      Caption = 'CONFIGURA'#199#195'O'
      object Configurao1: TMenuItem
        Caption = 'Configurar Email'
        ShortCut = 16454
        OnClick = Configurao1Click
      end
    end
    object MenuConta: TMenuItem
      Caption = 'CONTAS'
      object MenuInserirNovaConta: TMenuItem
        Caption = 'Inserir Nova Conta'
        ShortCut = 16462
        OnClick = MenuInserirNovaContaClick
      end
      object MenuContas: TMenuItem
        Caption = 'Contas'
        ShortCut = 16461
        Visible = False
      end
    end
    object MenuCliente: TMenuItem
      Caption = 'CLIENTES'
      object MenuInserirCliente: TMenuItem
        Caption = 'Novo Cliente'
        ShortCut = 16451
        OnClick = MenuInserirClienteClick
      end
      object MenuClientes: TMenuItem
        Caption = 'Clientes'
        ShortCut = 16460
        Visible = False
      end
    end
    object MenuAjuda: TMenuItem
      Caption = 'AJUDA'
      object Ajuda1: TMenuItem
        Caption = 'Ajuda'
        ShortCut = 112
        Visible = False
      end
      object MenuRegistro: TMenuItem
        Caption = 'Registro do Programa'
        ShortCut = 113
        OnClick = MenuRegistroClick
      end
      object ReportarErro1: TMenuItem
        Caption = 'FeedBack'
        ShortCut = 114
        OnClick = ReportarErro1Click
      end
    end
  end
  object DS_Registro: TDataSource
    AutoEdit = False
    DataSet = Dados.FDT_Registro
    Left = 560
    Top = 8
  end
end
