object FormEnviarEmail: TFormEnviarEmail
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'FeedBack'
  ClientHeight = 281
  ClientWidth = 449
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Assunto: TLabel
    Left = 23
    Top = 11
    Width = 39
    Height = 13
    Caption = 'Assunto'
  end
  object Mensagem: TLabel
    Left = 11
    Top = 48
    Width = 51
    Height = 13
    Caption = 'Mensagem'
  end
  object Anexo: TLabel
    Left = 31
    Top = 216
    Width = 31
    Height = 13
    Caption = 'Anexo'
  end
  object Label1: TLabel
    Left = 8
    Top = 255
    Width = 47
    Height = 10
    Caption = 'WN Feedback'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object EDT_Assunto: TEdit
    Left = 68
    Top = 8
    Width = 353
    Height = 21
    TabOrder = 0
    Text = 'Feedback Notifica Cliente v1.2 Beta'
  end
  object edt_Anexo: TEdit
    Left = 68
    Top = 213
    Width = 273
    Height = 21
    TabOrder = 1
  end
  object mem_Mensagem: TMemo
    Left = 68
    Top = 48
    Width = 353
    Height = 145
    TabOrder = 2
  end
  object BTN_Enviar: TButton
    Left = 347
    Top = 240
    Width = 74
    Height = 25
    Caption = 'Enviar'
    TabOrder = 3
    OnClick = BTN_EnviarClick
  end
  object BTN_Anexar: TButton
    Left = 347
    Top = 211
    Width = 75
    Height = 25
    Caption = 'Anexo'
    TabOrder = 4
    OnClick = BTN_AnexarClick
  end
  object OpenDialog1: TOpenDialog
    Left = 24
    Top = 96
  end
end
