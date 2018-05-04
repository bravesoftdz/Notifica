unit uFormConta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.Mask, Vcl.ExtCtrls,
  //Units Necess�rias
  IniFiles,
  IdComponent,
  IdTCPConnection,
  IdTCPClient,
  IdHTTP,
  IdBaseComponent,
  IdMessage,
  IdExplicitTLSClientServerBase,
  IdMessageClient,
  IdSMTPBase,
  IdSMTP,
  IdIOHandler,
  IdIOHandlerSocket,
  IdIOHandlerStack,
  IdSSL,
  IdSSLOpenSSL,
  IdAttachmentFile,
  IdText, Vcl.ComCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxDBEdit;

type
  TFormConta = class(TForm)
    DBEdt_CodConta: TDBEdit;
    DBEdt_CodCliente: TDBEdit;
    DBEdt_ValorConta: TDBEdit;
    DBEdt_Notificado: TDBEdit;
    DBEdt_DtCadastro: TDBEdit;
    DBLookupCB_NomeCliente: TDBLookupComboBox;
    DS_Contas: TDataSource;
    lblCodConta: TLabel;
    lblCodCliente: TLabel;
    lblNomeCliente: TLabel;
    lblValorConta: TLabel;
    lblDtVencimento: TLabel;
    lblDtNotificar: TLabel;
    lblNotificado: TLabel;
    lblDtCadastro: TLabel;
    DBEdt_CaminhoBoleto: TDBEdit;
    DBEdt_CaminhoNF: TDBEdit;
    lblCaminhoBoleto: TLabel;
    lblCaminhoNF: TLabel;
    btnAnexoBoleto: TButton;
    btnAnexoNF: TButton;
    BuscaArquivo: TOpenDialog;
    lblMensagem: TLabel;
    btnGerarMensagem: TButton;
    DBEdt_Situacao: TDBEdit;
    lblSituacao: TLabel;
    btnNotificar: TButton;
    DBMemo_Mensagem: TDBMemo;
    DBNavigator2: TDBNavigator;
    btnNovo: TButton;
    btnSalvar: TButton;
    btnExcluir: TButton;
    btnCancelar: TButton;
    btnEditar: TButton;
    cxDBDateEdt_DtNotificar: TcxDBDateEdit;
    cxDBDateEdt_DtVencimento: TcxDBDateEdit;
    DS_Config: TDataSource;
    procedure btnAnexoBoletoClick(Sender: TObject);
    procedure btnAnexoNFClick(Sender: TObject);
    procedure btnGerarMensagemClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnNotificarClick(Sender: TObject);
    procedure DBEdt_ValorContaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    procedure Salvar;
    procedure Novo;
    procedure Editar;
    procedure Cancelar;
    procedure Excluir;
  public
    { Public declarations }
    function EnviarEmail(const AAssunto, ADestino, AAnexo, AAnexo2: String; ACorpo: TStrings): Boolean;

  end;

var
  FormConta: TFormConta;

implementation

{$R *.dfm}

uses dmDados, uFormClientes, uFormPrincipal, uFormNotificar;

procedure TFormConta.btnAnexoBoletoClick(Sender: TObject);
begin
  BuscaArquivo.Execute;
  DBEdt_CaminhoBoleto.Text := BuscaArquivo.FileName;
end;

procedure TFormConta.btnAnexoNFClick(Sender: TObject);
begin
  BuscaArquivo.Execute;
  DBEdt_CaminhoNF.Text := BuscaArquivo.FileName;
end;

procedure TFormConta.btnCancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TFormConta.btnEditarClick(Sender: TObject);
begin
  Editar;
end;

procedure TFormConta.btnExcluirClick(Sender: TObject);
begin
  Excluir;
end;


procedure TFormConta.btnGerarMensagemClick(Sender: TObject);
var
  ValorConta, DtVencimento, NomeCliente, Usuario : String;
begin
  ValorConta := DBEdt_ValorConta.Text;
  DtVencimento := cxDBDateEdt_DtVencimento.Text;
  NomeCliente := DBLookupCB_NomeCliente.Text;
  Usuario := DS_Config.DataSet.FieldByName('nome_usuario').Text;
  //DS_Registro.DataSet.FieldByName('empresa').Text;

  DBMemo_Mensagem.Lines.Add('Caro cliente '+NomeCliente+',');
  DBMemo_Mensagem.Lines.Add('');
  DBMemo_Mensagem.Lines.Add('Gostar�amos de inform�-lo que o boleto no valor de '+ValorConta+' com vencimento no dia '+DtVencimento+' est� dispon�vel em anexo, junto com a Nota Fiscal. ');
  DBMemo_Mensagem.Lines.Add('');
  DBMemo_Mensagem.Lines.Add('');
  DBMemo_Mensagem.Lines.Add('Este � um email autom�tico, favor n�o responder. ');
  DBMemo_Mensagem.Lines.Add('');
  DBMemo_Mensagem.Lines.Add('Atenciosamente, '+Usuario+'.');

end;

procedure TFormConta.btnNotificarClick(Sender: TObject);
var
  Assunto, Para : String;
begin
  Assunto := DS_Config.DataSet.FieldByName('assunto_email').Text;
  Para := Dados.FDT_Clientescli_email.Value;

  if EnviarEmail(Assunto, Para, DBEdt_CaminhoBoleto.Text,DBEdt_CaminhoNF.Text,DBMemo_Mensagem.Lines) then
    //ShowMessage('Enviado com sucesso!')
  else
    ShowMessage('N�o foi possivel enviar o email!');

end;


procedure TFormConta.btnNovoClick(Sender: TObject);
begin
  Novo;
end;

procedure TFormConta.btnSalvarClick(Sender: TObject);
begin
  Salvar;
end;

procedure TFormConta.Cancelar;
begin
  ShowMessage('As altera��es feitas ser�o canceladas!');

  try
    DS_Contas.DataSet.Cancel;
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

procedure TFormConta.DBEdt_ValorContaExit(Sender: TObject);
begin
  //Formata o Campo no Formato de Moeda
  DBEdt_ValorConta.Field.Text := FormatFloat('R$ ,0.00', StrToFloat(DBEdt_ValorConta.Text));
end;

procedure TFormConta.Editar;
begin
  DBNavigator2.Enabled := False;
  btnNovo.Enabled      := False;
  btnSalvar.Enabled    := True;
  btnEditar.Enabled    := False;
  btnExcluir.Enabled   := True;
  btnCancelar.Enabled  := True;

  cxDBDateEdt_DtVencimento.SetFocus;

  try
    DS_Contas.DataSet.Edit;
  except
    on E:Exception do
      ShowMessage('Ocorreu um erro! '+e.Message);
  end;
end;


function TFormConta.EnviarEmail(const AAssunto, ADestino, AAnexo,
  AAnexo2: String; ACorpo: TStrings): Boolean;
var
  IniFile              : TIniFile;
  sFrom                : String;
  sBccList             : String;
  sHost                : String;
  iPort                : Integer;
  sUserName            : String;
  sPassword            : String;

  idMsg                : TIdMessage;
  IdText               : TIdText;
  idSMTP               : TIdSMTP;
  IdSSLIOHandlerSocket : TIdSSLIOHandlerSocketOpenSSL;
begin

  try
    try

      FormNotificar.Show;
      FormNotificar.Caption := 'Aguarde... Enviado emails';
      FormNotificar.BarraDeProgresso.Position := 4;

      //Cria��o e leitura do arquivo INI com as configura��es
      IniFile                          := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Config.wn');
      sFrom                            := IniFile.ReadString('Email' , 'From'     , sFrom);
      sBccList                         := IniFile.ReadString('Email' , 'BccList'  , sBccList);
      sHost                            := IniFile.ReadString('Email' , 'Host'     , sHost);
      iPort                            := IniFile.ReadInteger('Email', 'Port'     , iPort);
      sUserName                        := IniFile.ReadString('Email' , 'UserName' , sUserName);
      sPassword                        := IniFile.ReadString('Email' , 'Password' , sPassword);

      FormNotificar.BarraDeProgresso.Position := 10;

     //Configura os par�metros necess�rios para SSL
      IdSSLIOHandlerSocket                   := TIdSSLIOHandlerSocketOpenSSL.Create(Self);
      IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
      IdSSLIOHandlerSocket.SSLOptions.Mode  := sslmClient;


      FormNotificar.BarraDeProgresso.Position := 14;

      //Vari�vel referente a mensagem
      idMsg                            := TIdMessage.Create(Self);
      idMsg.CharSet                    := 'utf-8';
      idMsg.Encoding                   := meMIME;
      idMsg.From.Name                  := DS_Config.DataSet.FieldByName('nome_usuario').Text;
      idMsg.From.Address               := sFrom;
      idMsg.Priority                   := mpNormal;
      idMsg.Subject                    := AAssunto;


      FormNotificar.BarraDeProgresso.Position := 22;

      //Add Destinat�rio(s)
      idMsg.Recipients.Add;
      idMsg.Recipients.EMailAddresses := ADestino;
      //idMsg.CCList.EMailAddresses      := '';
      idMsg.BccList.EMailAddresses    := sBccList;
      idMsg.BccList.EMailAddresses    := DS_Config.DataSet.FieldByName('email_secundario').Text; //C�pia Oculta


      FormNotificar.BarraDeProgresso.Position := 30;

      //Vari�vel do texto
      idText := TIdText.Create(idMsg.MessageParts);
      idText.Body.Add(ACorpo.Text);
      idText.ContentType := 'text/html; text/plain; charset=iso-8859-1';


      FormNotificar.BarraDeProgresso.Position := 35;

      //Prepara o Servidor
      IdSMTP                           := TIdSMTP.Create(Self);
      IdSMTP.IOHandler                 := IdSSLIOHandlerSocket;
      IdSMTP.UseTLS                    := utUseImplicitTLS;
      IdSMTP.AuthType                  := satDefault;
      IdSMTP.Host                      := sHost;
      IdSMTP.AuthType                  := satDefault;
      IdSMTP.Port                      := iPort;
      IdSMTP.Username                  := sUserName;
      IdSMTP.Password                  := sPassword;


      FormNotificar.BarraDeProgresso.Position := 45;

      //Conecta e Autentica
      IdSMTP.Connect;
      IdSMTP.Authenticate;

      FormNotificar.BarraDeProgresso.Position := 50;
      FormNotificar.BarraDeProgresso.Position := 60;
      FormNotificar.BarraDeProgresso.Position := 70;

      if AAnexo <> EmptyStr then
        if FileExists(AAnexo) then
            TIdAttachmentFile.Create(idMsg.MessageParts, AAnexo);

      //FormNotificar.BarraDeProgresso.Position := 80;

      if AAnexo2 <> EmptyStr then
        if FileExists(AAnexo2) then
            TIdAttachmentFile.Create(idMsg.MessageParts, AAnexo2);

      FormNotificar.BarraDeProgresso.Position :=87;
      FormNotificar.BarraDeProgresso.Position := 92;
      FormNotificar.BarraDeProgresso.Position := 96;

      //Se a conex�o foi bem sucedida, envia a mensagem
      if IdSMTP.Connected then
      begin
        try
          IdSMTP.Send(idMsg);
        except on E:Exception do
          begin
            ShowMessage('Erro ao tentar enviar: ' + E.Message);
          end;
        end;
      end;


      //Depois de tudo pronto, desconecta do servidor SMTP
      if IdSMTP.Connected then
        IdSMTP.Disconnect;


      Result := True;

      FormNotificar.BarraDeProgresso.Position := 100;

    finally
      IniFile.Free;

      UnLoadOpenSSLLibrary;

      FreeAndNil(idMsg);
      FreeAndNil(IdSSLIOHandlerSocket);
      FreeAndNil(idSMTP);

      FormNotificar.Close;

    end;

  except on e:Exception do
    begin
      Result := False;
    end;
  end;

end;

procedure TFormConta.Excluir;
begin
  ShowMessage('O registro sera exclu�do permanentemente!');

  try
    DS_Contas.DataSet.Delete;
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



procedure TFormConta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;

end;

procedure TFormConta.FormShow(Sender: TObject);
begin
  DBNavigator2.Enabled := True;
  btnNovo.Enabled      := True;
  btnSalvar.Enabled    := False;
  btnEditar.Enabled    := True;
  btnExcluir.Enabled   := False;
  btnCancelar.Enabled  := False;
end;

procedure TFormConta.Novo;
begin
  DBNavigator2.Enabled := False;
  btnNovo.Enabled      := False;
  btnSalvar.Enabled    := True;
  btnEditar.Enabled    := False;
  btnExcluir.Enabled   := False;
  btnCancelar.Enabled  := True;

  try
    DS_Contas.DataSet.Append;
  except
    on E:exception do
     ShowMessage('Erro'+e.Message);
  end;
end;

procedure TFormConta.Salvar;
begin
  //cxDBDateEdt_DtVencimento.Text := DateToStr(DtVencimento.Date);

  //Grava a data atual do sistema
  DBEdt_DtCadastro.Text := DateToStr(Date);

  if DBEdt_Notificado.Text = '' then
    DBEdt_Notificado.Text := 'N�O';

  if DBEdt_Situacao.Text = '' then
      //Regista a Situa��o como Aberta
      DBEdt_Situacao.Text := 'ABERTA';

  if DBLookupCB_NomeCliente.Text = '' then
    begin
      ShowMessage('Selecione um cliente!');
      DBLookupCB_NomeCliente.SetFocus;
      Exit;
    end;

  if cxDBDateEdt_DtVencimento.Text = '' then
    begin
      ShowMessage('Informe a data de vencimento!');
      cxDBDateEdt_DtVencimento.SetFocus;
      Exit;
    end;

  if DBEdt_Notificado.Text = '' then
    begin
      ShowMessage('Informe a data para notifica��o!');
      DBEdt_Notificado.SetFocus;
      Exit;
    end;

  if DBEdt_ValorConta.Text = '' then
    begin
      ShowMessage('Digite o valor da conta!');
      DBEdt_ValorConta.SetFocus;
      Exit;
    end;

  {if DBMemo_Mensagem.Lines = '' then
    begin
      ShowMessage('� necess�rio ter uma mensagem para enviar ao cliente!');
      DBMemo_Mensagem.SetFocus;
      Exit;
    end;      }

  try
    DS_Contas.DataSet.Post;
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
