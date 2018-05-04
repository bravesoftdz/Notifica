unit uFormRegistro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Data.DB;

type
  TFormRegistro = class(TForm)
    DS_Registro: TDataSource;
    lblUsuario: TLabel;
    lblEmail: TLabel;
    lblTelefone: TLabel;
    btnRegistrar: TButton;
    edtUsuario: TEdit;
    edtEmail: TEdit;
    edtTelefone: TEdit;
    lblStatusRegistro: TLabel;
    procedure btnRegistrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Registro;
  public
    { Public declarations }
  end;

var
  FormRegistro: TFormRegistro;

implementation

{$R *.dfm}

uses uEnviarEmailGmail;

{ TFormRegistro }

procedure TFormRegistro.btnRegistrarClick(Sender: TObject);
begin
    try
      DS_Registro.DataSet.Append;
      Registro;
      DS_Registro.DataSet.Post;
    finally
      ShowMessage('Registrado com sucesso!');
      Self.Close;
    end

end;

procedure TFormRegistro.FormShow(Sender: TObject);
begin
  if DS_Registro.DataSet.FieldByName('status_registro').AsString = 'Registrado' then
    begin
      DS_Registro.DataSet.First;
      edtUsuario.Text := DS_Registro.DataSet.FieldByName('empresa').AsString;
      edtEmail.Text := DS_Registro.DataSet.FieldByName('email_empresa').AsString;
      edtTelefone.Text := DS_Registro.DataSet.FieldByName('telefone').AsString;
      btnRegistrar.Visible := False;
      edtUsuario.Enabled := False;
      edtEmail.Enabled := False;
      edtTelefone.Enabled := False;
      lblStatusRegistro.Caption := DS_Registro.DataSet.FieldByName('status_registro').AsString;
    end
  else
      btnRegistrar.Visible := True;

end;

procedure TFormRegistro.Registro;
var
  DtHoje, Empresa, Email, Telefone, LocalInstalacao : String;
begin
  DtHoje   := DateToStr(Date);
  Empresa  := edtUsuario.Text;
  Email    := edtEmail.Text;
  Telefone := edtTelefone.Text;

  LocalInstalacao := ExtractFilePath(ParamStr(0));

  //DS_Registro.DataSet.FieldByName('id_registro').Text := '000000001';
  DS_Registro.DataSet.FieldByName('dt_registro').Text := DtHoje;
  DS_Registro.DataSet.FieldByName('empresa').Text := Empresa;
  DS_Registro.DataSet.FieldByName('email_empresa').Text := Email;
  DS_Registro.DataSet.FieldByName('telefone').Text := Telefone;
  DS_Registro.DataSet.FieldByName('Dt_inicio_uso').Text := DtHoje;
  DS_Registro.DataSet.FieldByName('status_registro').Text := 'Registrado';
  DS_Registro.DataSet.FieldByName('local_instalacao').Text := LocalInstalacao;

  FormEnviarEmail.EDT_Assunto.Text :='Registro do programa';
  FormEnviarEmail.mem_Mensagem.Lines.Add('Data de inicio de uso: '+DtHoje);
  FormEnviarEmail.mem_Mensagem.Lines.Add('Usu�rio: '+Empresa);
  FormEnviarEmail.mem_Mensagem.Lines.Add('Email: '+Email);
  FormEnviarEmail.mem_Mensagem.Lines.Add('Telefone: '+Telefone);
  FormEnviarEmail.mem_Mensagem.Lines.Add('Local de instala��o: '+DS_Registro.DataSet.FieldByName('local_instalacao').Text);
  FormEnviarEmail.BTN_Enviar.Click;

end;

end.
