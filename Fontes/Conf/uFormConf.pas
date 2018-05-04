unit uFormConf;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IniFiles, Data.DB,
  Vcl.Mask, Vcl.DBCtrls;

type
  TFormConf = class(TForm)
    Label7: TLabel;
    DS_Conf_Email: TDataSource;
    DBEdt_NomeUsuario: TDBEdit;
    DBEdt_EmailUsuario: TDBEdit;
    DBEdt_EmailSecundario: TDBEdit;
    DBEdt_Senha: TDBEdit;
    DBEdt_Assunto: TDBEdit;
    DBEdt_Host: TDBEdit;
    DBEdt_Porta: TDBEdit;
    lblSenha: TLabel;
    lblEmailSecundario: TLabel;
    lblAssunto: TLabel;
    lblServidorEmail: TLabel;
    lblPorta: TLabel;
    lblHost: TLabel;
    lblEmailUsuario: TLabel;
    lblNomeUsuario: TLabel;
    btnAlterar: TButton;
    btnSalvar: TButton;
    lblTexto: TLabel;
    DBCBox_ServidoresEmail: TDBComboBox;
    DBCBox_AutoNotificar: TDBCheckBox;
    DBCBox_AutoApagarContas: TDBCheckBox;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBCBox_ServidoresEmailExit(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormConf: TFormConf;

implementation

{$R *.dfm}



procedure TFormConf.btnAlterarClick(Sender: TObject);
begin
  DBEdt_NomeUsuario.Enabled      := True;
  DBEdt_EmailUsuario.Enabled     := True;
  DBEdt_EmailSecundario.Enabled  := True;
  DBEdt_Senha.Enabled            := True;
  DBEdt_Assunto.Enabled          := True;
  DBEdt_Host.Enabled             := True;
  DBEdt_Porta.Enabled            := True;
  DBCBox_ServidoresEmail.Enabled := True;


  DS_Conf_Email.DataSet.Edit;
  btnSalvar.Enabled := True;
  btnAlterar.Enabled := False;
end;

procedure TFormConf.btnSalvarClick(Sender: TObject);
var
  IniFile : TIniFile;
  Email, Senha, Host, EmailSecundario, sFrom : String;
  Porta : Integer;
begin
  if DBEdt_NomeUsuario.Text = '' then
    begin
      ShowMessage('Digite o nome do usuário!');
      DBEdt_NomeUsuario.SetFocus;
      Exit;
    end;

  if DBEdt_EmailUsuario.Text = '' then
    begin
      ShowMessage('Digite o email');
      DBEdt_EmailUsuario.SetFocus;
      Exit;
    end;

  if DBEdt_Senha.Text = '' then
    begin
      ShowMessage('Digite a senha do email!');
      DBEdt_Senha.SetFocus;
      Exit;
    end;

  if DBEdt_Assunto.Text = '' then
    begin
      ShowMessage('Digite o assunto do email');
      DBEdt_Assunto.SetFocus;
      Exit;
    end;

  if DBCBox_ServidoresEmail.Text = '' then
    begin
      ShowMessage('Selecione um servidor de email!');
      DBCBox_ServidoresEmail.SetFocus;
      Exit;
    end;


    try
      DS_Conf_Email.DataSet.Post;
    except
      on E: Exception do
        ShowMessage('Oceorreu um ero ao salvar! '+e.Message);
    end;

  sFrom := DBEdt_EmailUsuario.Text;
  EmailSecundario := DBEdt_EmailSecundario.Text;
  Host := DBEdt_Host.Text;
  Porta := StrToInt(DBEdt_Porta.Text);
  Email := DBEdt_EmailUsuario.Text;
  Senha := DBEdt_Senha.Text;

  //Criação e leitura do arquivo INI com as configurações
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Config.wn');
  //Email    := IniFile.ReadString('Email' , 'From'     , sFrom);
  IniFile.WriteString('Email','BccLista',EmailSecundario);
  IniFile.WriteString('Email' , 'Host'     , Host);
  IniFile.WriteInteger('Email', 'Port'     , Porta);
  IniFile.WriteString('Email' , 'UserName' , Email);
  IniFile.WriteString('Email' , 'Password' , Senha);
  IniFile.WriteString('Email' , 'From'     , sFrom);


  DBEdt_NomeUsuario.Enabled      := False;
  DBEdt_EmailUsuario.Enabled     := False;
  DBEdt_EmailSecundario.Enabled  := False;
  DBEdt_Senha.Enabled            := False;
  DBEdt_Assunto.Enabled          := False;
  DBEdt_Host.Enabled             := False;
  DBEdt_Porta.Enabled            := False;
  DBCBox_ServidoresEmail.Enabled := False;

  btnSalvar.Enabled := False;
  btnAlterar.Enabled := True;
end;


procedure TFormConf.DBCBox_ServidoresEmailExit(Sender: TObject);
begin
  if DBCBox_ServidoresEmail.Text = 'Gmail' then
    begin
      DBEdt_Host.Text := 'smtp.gmail.com';
      DBEdt_Porta.Text := '465';
    end;
end;

procedure TFormConf.FormShow(Sender: TObject);
begin
  DBEdt_NomeUsuario.Enabled      := False;
  DBEdt_EmailUsuario.Enabled     := False;
  DBEdt_EmailSecundario.Enabled  := False;
  DBEdt_Senha.Enabled            := False;
  DBEdt_Assunto.Enabled          := False;
  DBEdt_Host.Enabled             := False;
  DBEdt_Porta.Enabled            := False;
  DBCBox_ServidoresEmail.Enabled := False;
end;

end.
