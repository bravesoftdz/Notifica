unit uFormPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Menus, Vcl.StdCtrls, Vcl.ComCtrls, WinInet, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxCore, cxDateUtils, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TFormPrincipal = class(TForm)
    Panel_Superior: TPanel;
    Panel_Centro: TPanel;
    Panel_Inferior: TPanel;
    DBGrid_Contas: TDBGrid;
    DS_Contas: TDataSource;
    Menu: TMainMenu;
    MenuConta: TMenuItem;
    MenuCliente: TMenuItem;
    Configurao1: TMenuItem;
    lblDataAtual: TLabel;
    WN2018: TLabel;
    MenuAjuda: TMenuItem;
    Panel_Botoes: TPanel;
    lblMensagem: TLabel;
    btnApagarVencidas: TButton;
    Ajuda1: TMenuItem;
    MenuRegistro: TMenuItem;
    DS_Registro: TDataSource;
    ReportarErro1: TMenuItem;
    MenuConfiguracao: TMenuItem;
    MenuInserirNovaConta: TMenuItem;
    MenuInserirCliente: TMenuItem;
    MenuContas: TMenuItem;
    MenuClientes: TMenuItem;
    btnNotificacao: TButton;
    DataHoje: TcxDateEdit;
    procedure DBGrid_ContasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_ContasDblClick(Sender: TObject);
    procedure btnProcessarClick(Sender: TObject);
    procedure btnNotificarClick(Sender: TObject);
    procedure btnFeedbackClick(Sender: TObject);
    procedure Configurao1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnVerVencidasClick(Sender: TObject);
    procedure btnVerNotificacaoClick(Sender: TObject);
    procedure btnApagarVencidasClick(Sender: TObject);
    procedure MenuRegistroClick(Sender: TObject);
    procedure ReportarErro1Click(Sender: TObject);
    procedure MenuInserirNovaContaClick(Sender: TObject);
    procedure MenuInserirClienteClick(Sender: TObject);
    procedure btnNotificacaoClick(Sender: TObject);
  private
    { Private declarations }
    procedure VerificarVencidas;
    procedure Notificar;
    procedure VerificarNotificacao;
    procedure ApagarVencidas;
    procedure VerificaRegistro;
    procedure TestaConexaoInternet;
    procedure NotificaClientes;
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

uses uFormClientes, uFormConta, uEnviarEmailGmail, uFormConf,
  uFormRegistro;


procedure TFormPrincipal.ApagarVencidas;
var
  DataAtual : String;
begin
  DataAtual := DateToStr(DataHoje.Date);

  DS_Contas.DataSet.First;
  repeat
    with DBGrid_Contas do
      begin
        if (DS_Contas.DataSet.FieldByName('dt_vencimento').AsString = DataAtual) and (DS_Contas.DataSet.FieldByName('cliente_notificado').AsString ='SIM') then
          DS_Contas.DataSet.Delete
        else
            lblMensagem.Caption := 'Contas vencidas e notificadas foram apagadas!';
      end;
    DS_Contas.DataSet.Next;
  until DS_Contas.DataSet.Eof;


end;

procedure TFormPrincipal.btnApagarVencidasClick(Sender: TObject);
begin
  ApagarVencidas;
end;

procedure TFormPrincipal.btnFeedbackClick(Sender: TObject);
begin
  //FormEnviarEmail := TFormEnviarEmail.Create(Application);
  FormEnviarEmail.ShowModal;
end;

procedure TFormPrincipal.btnNotificarClick(Sender: TObject);
begin
  Notificar;
end;

procedure TFormPrincipal.btnProcessarClick(Sender: TObject);
begin
   VerificarVencidas;
end;

procedure TFormPrincipal.btnVerNotificacaoClick(Sender: TObject);
begin
  VerificarNotificacao;
end;

procedure TFormPrincipal.btnVerVencidasClick(Sender: TObject);
begin
  VerificarVencidas;
end;


procedure TFormPrincipal.btnNotificacaoClick(Sender: TObject);
begin
  NotificaClientes;
end;

procedure TFormPrincipal.Configurao1Click(Sender: TObject);
begin
  //FormConf := TFormConf.Create(Application);
  FormConf.ShowModal;
end;


procedure TFormPrincipal.DBGrid_ContasDblClick(Sender: TObject);
begin
  FormConta.ShowModal;
end;

procedure TFormPrincipal.DBGrid_ContasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  DataAtual : String;
begin
  //Data atual do sistema
  DataAtual := DateToStr(DataHoje.Date);

  with DBGrid_Contas do
    begin
      //Destaca na Grid os registros que vencem na data atual do sistema
      //Os registros vencidos ficam em vermelho
      if DS_Contas.DataSet.FieldByName('dt_vencimento').AsString = DataAtual then
        begin
          if (gdSelected in State) then
            Canvas.Brush.Color := clRed
          else
              begin
                Canvas.Font.Style := [fsBold];
                Canvas.Font.Color := clRed;
              end;
        end;

      Canvas.FillRect(Rect);
      DefaultDrawColumnCell(Rect,DataCol,Column,State);
    end;


end;

procedure TFormPrincipal.FormShow(Sender: TObject);
begin
  DataHoje.Date := Date;
  //TestaConexaoInternet;
  VerificaRegistro;

  FormPrincipal.Caption := 'Notifica v2.0 | ' + DS_Registro.DataSet.FieldByName('empresa').Text;

  if FormConf.DBCBox_AutoNotificar.Checked = True then
    btnNotificacao.Click;

  if FormConf.DBCBox_AutoApagarContas.Checked = True then
    btnApagarVencidas.Click;

end;



procedure TFormPrincipal.MenuInserirClienteClick(Sender: TObject);
begin
  FormClientes.ShowModal;
end;

procedure TFormPrincipal.MenuInserirNovaContaClick(Sender: TObject);
begin
  FormConta.ShowModal;
end;

procedure TFormPrincipal.MenuRegistroClick(Sender: TObject);
begin
  FormRegistro.ShowModal;
end;

procedure TFormPrincipal.NotificaClientes;
var
  DataAtual : String;
  i : Word;
begin
  DataAtual := DateToStr(Date);

  //Se estver conectado a internet
  if InternetGetConnectedState(@i,0) then
    begin
      VerificarVencidas;
      VerificarNotificacao;
      Notificar;
    end
  else
    ShowMessage('Não é possivel notificar, verifique sua conexão com a internet');

end;


procedure TFormPrincipal.Notificar;
var
  DataAtual : String;
begin
  DataAtual := DateToStr(DataHoje.Date);

  DS_Contas.DataSet.First;

  repeat
    with DBGrid_Contas do
      begin
        if DS_Contas.DataSet.FieldByName('cliente_notificado').AsString = 'NÃO' then
          begin
            if DS_Contas.DataSet.FieldByName('pode_notificar').AsString = 'S' then
              begin
                FormConta.btnNotificar.Click;
                DS_Contas.DataSet.Edit;
                DS_Contas.DataSet.FieldByName('cliente_notificado').Text := 'SIM';
              end
            else
              lblMensagem.Caption := 'Não existem registros para notificar!';
          end
      end;

	  DS_Contas.DataSet.Next;

  until DS_Contas.DataSet.Eof;
	  DBGrid_Contas.Update;
end;

procedure TFormPrincipal.ReportarErro1Click(Sender: TObject);
begin
    FormEnviarEmail.ShowModal;
end;

procedure TFormPrincipal.TestaConexaoInternet;
var
  i : Word;
begin
//Declare esta Unit WinInet para usar esta rotina

  if InternetGetConnectedState(@i,0) then
    showmessage('Conectado')
  else
    showmessage('Não Conectado');

end;

procedure TFormPrincipal.VerificaRegistro;
var
  LocalExecutavel : String;
begin
  LocalExecutavel := ExtractFilePath(ParamStr(0));

  if DS_Registro.DataSet.FieldByName('status_registro').AsString = 'Registrado' then
    begin
      if LocalExecutavel <> DS_Registro.DataSet.FieldByName('local_instalacao').AsString then
        begin
          ShowMessage('Foram feitas alterações nos arquivos do programa!');
          Application.Terminate;
        end;
    end
  else
      if DS_Registro.DataSet.FieldByName('status_registro').AsString = '' then
        begin
          FormRegistro.ShowModal;
        end;

end;

procedure TFormPrincipal.VerificarNotificacao;
var
  DataAtual : String;
begin
  DataAtual := DateToStr(DataHoje.Date);

  DS_Contas.DataSet.First;

  repeat
    DS_Contas.DataSet.Edit;
    with DBGrid_Contas do
      begin
        //Se dt_vencimento for a mesma da data atual altera o pode_notificar para S=Sim
        if DS_Contas.DataSet.FieldByName('dt_notificar').AsString = DataAtual then
          DS_Contas.DataSet.FieldByName('pode_notificar').Text := 'S'
        else
          //Caso a data seja diferente ele altera para N=Não
          DS_Contas.DataSet.FieldByName('pode_notificar').Text := 'N';
      end;

    DS_Contas.DataSet.Next;

  until DS_Contas.DataSet.Eof;

  DBGrid_Contas.Update;

end;

procedure TFormPrincipal.VerificarVencidas;
var
  DtHoje : String;
begin
  DtHoje := DateToStr(DataHoje.Date);

  DS_Contas.DataSet.First;
  repeat
    //Abre o Dataset para edição
    DS_Contas.DataSet.Edit;

    with DBGrid_Contas do
		begin
			DS_Contas.DataSet.Edit;
			//Verifica se a dt de vencimento é a mesma da atual
			if (DS_Contas.DataSet.FieldByName('dt_vencimento').AsString = DtHoje) then
				//Muda a situação para vencida
				DS_Contas.DataSet.FieldByName('situacao_atual').Text := 'VENCIDA'
			else
				//Se a dt for diferente apenas altera para Ok
				DS_Contas.DataSet.FieldByName('situacao_atual').Text := 'Ok';
		end;
	DS_Contas.DataSet.Next;
  until DS_Contas.DataSet.Eof ;

  DBGrid_Contas.Update;
end;

end.
