object FormRegistro: TFormRegistro
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Registro'
  ClientHeight = 162
  ClientWidth = 406
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
  object lblUsuario: TLabel
    Left = 8
    Top = 21
    Width = 36
    Height = 13
    Caption = 'Usu'#225'rio'
  end
  object lblEmail: TLabel
    Left = 8
    Top = 69
    Width = 24
    Height = 13
    Caption = 'Email'
  end
  object lblTelefone: TLabel
    Left = 263
    Top = 69
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object lblStatusRegistro: TLabel
    Left = 8
    Top = 133
    Width = 3
    Height = 13
  end
  object btnRegistrar: TButton
    Left = 256
    Top = 128
    Width = 137
    Height = 25
    Caption = 'Registrar'
    TabOrder = 3
    OnClick = btnRegistrarClick
  end
  object edtUsuario: TEdit
    Left = 8
    Top = 40
    Width = 390
    Height = 21
    TabOrder = 0
  end
  object edtEmail: TEdit
    Left = 8
    Top = 88
    Width = 249
    Height = 21
    TabOrder = 1
  end
  object edtTelefone: TEdit
    Left = 263
    Top = 88
    Width = 135
    Height = 21
    TabOrder = 2
  end
  object DS_Registro: TDataSource
    AutoEdit = False
    DataSet = Dados.FDT_Registro
    Left = 216
    Top = 8
  end
end
