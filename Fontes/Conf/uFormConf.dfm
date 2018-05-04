object FormConf: TFormConf
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Configura'#231#227'o'
  ClientHeight = 329
  ClientWidth = 413
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel
    Left = 63
    Top = 251
    Width = 261
    Height = 13
    Caption = 'Atualmente este programa s'#243' '#233' compativel como Gmail'
  end
  object lblSenha: TLabel
    Left = 231
    Top = 61
    Width = 30
    Height = 13
    Caption = 'Senha'
  end
  object lblEmailSecundario: TLabel
    Left = 8
    Top = 109
    Width = 80
    Height = 13
    Caption = 'Email Secund'#225'rio'
  end
  object lblAssunto: TLabel
    Left = 8
    Top = 157
    Width = 39
    Height = 13
    Caption = 'Assunto'
  end
  object lblServidorEmail: TLabel
    Left = 8
    Top = 205
    Width = 82
    Height = 13
    Caption = 'Servidor de Email'
  end
  object lblPorta: TLabel
    Left = 319
    Top = 205
    Width = 26
    Height = 13
    Caption = 'Porta'
  end
  object lblHost: TLabel
    Left = 185
    Top = 205
    Width = 22
    Height = 13
    Caption = 'Host'
  end
  object lblEmailUsuario: TLabel
    Left = 8
    Top = 61
    Width = 24
    Height = 13
    Caption = 'Email'
  end
  object lblNomeUsuario: TLabel
    Left = 8
    Top = 13
    Width = 78
    Height = 13
    Caption = 'Usu'#225'rio de email'
  end
  object lblTexto: TLabel
    Left = 291
    Top = 131
    Width = 82
    Height = 13
    Caption = '(N'#227'o obrigat'#243'rio)'
  end
  object DBEdt_NomeUsuario: TDBEdit
    Left = 8
    Top = 32
    Width = 217
    Height = 21
    DataField = 'nome_usuario'
    DataSource = DS_Conf_Email
    TabOrder = 0
  end
  object DBEdt_EmailUsuario: TDBEdit
    Left = 8
    Top = 80
    Width = 217
    Height = 21
    DataField = 'email_usuario'
    DataSource = DS_Conf_Email
    TabOrder = 1
  end
  object DBEdt_EmailSecundario: TDBEdit
    Left = 8
    Top = 128
    Width = 264
    Height = 21
    DataField = 'email_secundario'
    DataSource = DS_Conf_Email
    TabOrder = 3
  end
  object DBEdt_Senha: TDBEdit
    Left = 231
    Top = 80
    Width = 169
    Height = 21
    DataField = 'senha_email'
    DataSource = DS_Conf_Email
    PasswordChar = '*'
    TabOrder = 2
  end
  object DBEdt_Assunto: TDBEdit
    Left = 8
    Top = 176
    Width = 305
    Height = 21
    DataField = 'assunto_email'
    DataSource = DS_Conf_Email
    TabOrder = 4
  end
  object DBEdt_Host: TDBEdit
    Left = 183
    Top = 224
    Width = 121
    Height = 21
    DataField = 'host_email'
    DataSource = DS_Conf_Email
    ReadOnly = True
    TabOrder = 6
  end
  object DBEdt_Porta: TDBEdit
    Left = 319
    Top = 224
    Width = 81
    Height = 21
    DataField = 'porta_email'
    DataSource = DS_Conf_Email
    ReadOnly = True
    TabOrder = 7
  end
  object btnAlterar: TButton
    Left = 249
    Top = 295
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 9
    OnClick = btnAlterarClick
  end
  object btnSalvar: TButton
    Left = 330
    Top = 295
    Width = 75
    Height = 25
    Caption = 'Salvar'
    Enabled = False
    TabOrder = 8
    OnClick = btnSalvarClick
  end
  object DBCBox_ServidoresEmail: TDBComboBox
    Left = 8
    Top = 224
    Width = 161
    Height = 21
    DataField = 'servidor_email'
    DataSource = DS_Conf_Email
    Items.Strings = (
      'Gmail')
    TabOrder = 5
    OnExit = DBCBox_ServidoresEmailExit
  end
  object DBCBox_AutoNotificar: TDBCheckBox
    Left = 8
    Top = 303
    Width = 161
    Height = 17
    Caption = 'Notificar Automaticamente'
    DataField = 'auto_notificar'
    DataSource = DS_Conf_Email
    TabOrder = 10
  end
  object DBCBox_AutoApagarContas: TDBCheckBox
    Left = 8
    Top = 280
    Width = 235
    Height = 17
    Caption = 'Apagar Contas Vencidas Automaticamente'
    DataField = 'auto_apagar'
    DataSource = DS_Conf_Email
    TabOrder = 11
  end
  object DS_Conf_Email: TDataSource
    AutoEdit = False
    DataSet = Dados.FDT_Conf_Email
    Left = 328
    Top = 8
  end
end
