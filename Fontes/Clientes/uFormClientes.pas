unit uFormClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TFormClientes = class(TForm)
    Panel_Superior: TPanel;
    Panel_Centro: TPanel;
    Panel_Inferior: TPanel;
    DBGrid_Clientes: TDBGrid;
    DS_Clientes: TDataSource;
    DBEdt_CodCliente: TDBEdit;
    DBEdt_NomeCliente: TDBEdit;
    DBEdt_Email: TDBEdit;
    DBEdt_Telefone: TDBEdit;
    lblCodCliente: TLabel;
    lblNomeCliente: TLabel;
    lblEmail: TLabel;
    lblTelefone: TLabel;
    DBNavigator2: TDBNavigator;
    btnNovo: TButton;
    btnSalvar: TButton;
    btnExcluir: TButton;
    btnCancelar: TButton;
    btnEditar: TButton;
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    procedure Novo;
    procedure Salvar;
    procedure Editar;
    procedure Excluir;
    procedure Cancelar;
  public
    { Public declarations }
  end;

var
  FormClientes: TFormClientes;

implementation

{$R *.dfm}

uses uEnviarEmailGmail;

procedure TFormClientes.btnCancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TFormClientes.btnEditarClick(Sender: TObject);
begin
  Editar;
end;

procedure TFormClientes.btnExcluirClick(Sender: TObject);
begin
  Excluir;
end;

procedure TFormClientes.btnNovoClick(Sender: TObject);
begin
  Novo;
end;

procedure TFormClientes.btnSalvarClick(Sender: TObject);
begin
  Salvar;
end;

procedure TFormClientes.Cancelar;
begin

  ShowMessage('As altera��es feitas ser�o canceladas1');

  try
    DS_Clientes.DataSet.Cancel;
  except
    on E:Exception do
      ShowMessage('Ocorreu um erro ao cancelar as altera��es! '+e.Message);
  end;

  DBNavigator2.Enabled := True;
  btnNovo.Enabled      := True;
  btnSalvar.Enabled    := False;
  btnEditar.Enabled    := False;
  btnExcluir.Enabled   := False;
  btnCancelar.Enabled  := False;

end;

procedure TFormClientes.Editar;
begin
  DBNavigator2.Enabled := False;
  btnNovo.Enabled      := False;
  btnSalvar.Enabled    := True;
  btnEditar.Enabled    := False;
  btnExcluir.Enabled   := True;
  btnCancelar.Enabled  := True;

  DBEdt_NomeCliente.SetFocus;

  try
    DS_Clientes.DataSet.Edit;
  except
    on E:Exception do
      ShowMessage('Ocorreu um erro! '+e.Message);
  end;

end;

procedure TFormClientes.Excluir;
begin

  ShowMessage('O registro sera exclu�do permanentemente!');

  try
    DS_Clientes.DataSet.Delete;
  except
    on E:Exception do
      ShowMessage('N�o foi poss�vel excluir o registro! '+e.Message);
  end;

  DBNavigator2.Enabled := True;
  btnNovo.Enabled      := True;
  btnSalvar.Enabled    := False;
  btnEditar.Enabled    := False;
  btnExcluir.Enabled   := False;
  btnCancelar.Enabled  := False;

end;

procedure TFormClientes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TFormClientes.FormShow(Sender: TObject);
begin
  DBNavigator2.Enabled := True;
  btnNovo.Enabled      := True;
  btnSalvar.Enabled    := False;
  btnEditar.Enabled    := True;
  btnExcluir.Enabled   := False;
  btnCancelar.Enabled  := False;
end;

procedure TFormClientes.Novo;
begin
  DBNavigator2.Enabled := False;
  btnNovo.Enabled      := False;
  btnSalvar.Enabled    := True;
  btnEditar.Enabled    := False;
  btnExcluir.Enabled   := False;
  btnCancelar.Enabled  := True;

  DBEdt_NomeCliente.SetFocus;

  try
    DS_Clientes.DataSet.Append;
  except
    on E:exception do
     ShowMessage('Erro'+e.Message);
  end;

end;

procedure TFormClientes.Salvar;
begin

  if DBEdt_NomeCliente.Text = '' then
    begin
      ShowMessage('Digite o nome do cliente!');
      DBEdt_NomeCliente.SetFocus;
      Exit;
    end;

  if DBEdt_Email.Text = '' then
    begin
      ShowMessage('Digite o email do cliente!');
      DBEdt_Email.SetFocus;
      Exit;
    end;

  if DBEdt_Telefone.Text = '' then
    begin
      ShowMessage('Informe o telefone do cliente!');
      DBEdt_Telefone.SetFocus;
      Exit;
    end;

  try
    DS_Clientes.DataSet.Post;
  except
    on E:Exception do
      ShowMessage('N�o foi poss�vel salvar o registro! '+e.Message);
  end;

  DBNavigator2.Enabled := True;
  btnNovo.Enabled      := True;
  btnSalvar.Enabled    := False;
  btnEditar.Enabled    := True;
  btnExcluir.Enabled   := False;
  btnCancelar.Enabled  := False;

end;

end.
