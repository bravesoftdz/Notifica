object Dados: TDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 271
  Width = 444
  object FDCon_Dados: TFDConnection
    Params.Strings = (
      'Database=C:\WN\Projetos\wnNotificaCliente\BD\Dados'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    AfterConnect = FDCon_DadosAfterConnect
    BeforeConnect = FDCon_DadosBeforeConnect
    Left = 112
    Top = 40
  end
  object FDQ_Clientes: TFDQuery
    Connection = FDCon_Dados
    SQL.Strings = (
      'create table if not exists Clientes'
      '('
      ' id_cliente Integer primary key autoincrement,'
      ' nome_cliente varchar(50),'
      ' cli_email varchar(50),'
      ' cli_telefone varchar(12)'
      ')')
    Left = 72
    Top = 112
  end
  object FDQ_Contas: TFDQuery
    Connection = FDCon_Dados
    SQL.Strings = (
      'create table if not exists Contas'
      '('
      ' id_conta Integer primary key autoincrement,'
      ' id_cliente int,'
      ' dt_cadastro varchar(10),'
      ' valor_conta varchar(50),'
      ' dt_vencimento varchar(10),'
      ' dt_notificar varchar(10),'
      ' cliente_notificado varchar(10),'
      ' caminho_boleto varchar(300),'
      ' caminho_nf varchar(300),'
      ' situacao_atual varchar(50),'
      ' pode_notificar char(1),'
      ' mensagem varchar(1000)'
      ')'
      '')
    Left = 160
    Top = 112
  end
  object FDT_Clientes: TFDTable
    Active = True
    IndexFieldNames = 'id_cliente'
    Connection = FDCon_Dados
    UpdateOptions.UpdateTableName = 'Clientes'
    TableName = 'Clientes'
    Left = 72
    Top = 184
    object FDT_Clientesid_cliente: TFDAutoIncField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'id_cliente'
      Origin = 'id_cliente'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDT_Clientesnome_cliente: TStringField
      DisplayLabel = 'Nome do cliente'
      FieldName = 'nome_cliente'
      Origin = 'nome_cliente'
      Size = 50
    end
    object FDT_Clientescli_email: TStringField
      DisplayLabel = 'Email'
      FieldName = 'cli_email'
      Origin = 'cli_email'
      Size = 50
    end
    object FDT_Clientescli_telefone: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'cli_telefone'
      Origin = 'cli_telefone'
      Size = 12
    end
  end
  object FDT_Contas: TFDTable
    Active = True
    IndexFieldNames = 'id_conta'
    Connection = FDCon_Dados
    UpdateOptions.UpdateTableName = 'Contas'
    TableName = 'Contas'
    Left = 160
    Top = 184
    object FDT_Contasid_conta: TFDAutoIncField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'id_conta'
      Origin = 'id_conta'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDT_Contasid_cliente: TIntegerField
      DisplayLabel = 'C'#243'd. Cliente'
      FieldName = 'id_cliente'
      Origin = 'id_cliente'
    end
    object FDT_Contasdt_cadastro: TStringField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'dt_cadastro'
      Origin = 'dt_cadastro'
      Size = 10
    end
    object FDT_Contasvalor_conta: TStringField
      DisplayLabel = 'Valor'
      FieldName = 'valor_conta'
      Origin = 'valor_conta'
      Size = 50
    end
    object FDT_Contasdt_vencimento: TStringField
      DisplayLabel = 'Dt. Vencimento'
      FieldName = 'dt_vencimento'
      Origin = 'dt_vencimento'
      EditMask = '!99/99/0000;1;_'
      Size = 10
    end
    object FDT_Contasdt_notificar: TStringField
      DisplayLabel = 'Dt. para Notificar'
      FieldName = 'dt_notificar'
      Origin = 'dt_notificar'
      EditMask = '!99/99/0000;1;_'
      Size = 10
    end
    object FDT_Contascliente_notificado: TStringField
      DisplayLabel = 'Notificado'
      FieldName = 'cliente_notificado'
      Origin = 'cliente_notificado'
      Size = 10
    end
    object FDT_Contascaminho_boleto: TStringField
      DisplayLabel = 'Caminho do boleto'
      FieldName = 'caminho_boleto'
      Origin = 'caminho_boleto'
      Size = 300
    end
    object FDT_Contascaminho_nf: TStringField
      DisplayLabel = 'Caminho da NF'
      FieldName = 'caminho_nf'
      Origin = 'caminho_nf'
      Size = 300
    end
    object FDT_Contassituacao_atual: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'situacao_atual'
      Origin = 'situacao_atual'
      Size = 50
    end
    object FDT_Contaspode_notificar: TStringField
      DisplayLabel = 'Notificar Hoje'
      FieldName = 'pode_notificar'
      Origin = 'pode_notificar'
      FixedChar = True
      Size = 1
    end
    object FDT_Contasmensagem: TStringField
      DisplayLabel = 'Mensagem'
      FieldName = 'mensagem'
      Origin = 'mensagem'
      Size = 1000
    end
    object FDT_ContasNomeCliente: TStringField
      DisplayLabel = 'Nome do Cliente'
      FieldKind = fkLookup
      FieldName = 'NomeCliente'
      LookupDataSet = FDT_Clientes
      LookupKeyFields = 'id_cliente'
      LookupResultField = 'nome_cliente'
      KeyFields = 'id_cliente'
      Size = 50
      Lookup = True
    end
  end
  object FDQ_Registro: TFDQuery
    Connection = FDCon_Dados
    SQL.Strings = (
      'create table if not exists Registro'
      '('
      ' id_registro int,'
      ' dt_registro varchar(10),'
      ' empresa varchar(100),'
      ' email_empresa varchar(100),'
      ' telefone varchar(15),'
      ' dt_inicio_uso varchar(10),'
      ' status_registro varchar(50),'
      ' local_instalacao varchar(100)'
      ')')
    Left = 248
    Top = 112
  end
  object FDT_Registro: TFDTable
    Active = True
    Connection = FDCon_Dados
    UpdateOptions.UpdateTableName = 'Registro'
    TableName = 'Registro'
    Left = 248
    Top = 184
    object FDT_Registroid_registro: TIntegerField
      DisplayLabel = 'C'#243'd. Registro'
      FieldName = 'id_registro'
      Origin = 'id_registro'
    end
    object FDT_Registrodt_registro: TStringField
      DisplayLabel = 'Dt. Registro'
      FieldName = 'dt_registro'
      Origin = 'dt_registro'
      Size = 10
    end
    object FDT_Registroempresa: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'empresa'
      Origin = 'empresa'
      Size = 100
    end
    object FDT_Registroemail_empresa: TStringField
      DisplayLabel = 'Email'
      FieldName = 'email_empresa'
      Origin = 'email_empresa'
      Size = 100
    end
    object FDT_Registrotelefone: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'telefone'
      Origin = 'telefone'
      Size = 15
    end
    object FDT_Registrodt_inicio_uso: TStringField
      DisplayLabel = 'Dt. Inicio Uso'
      FieldName = 'dt_inicio_uso'
      Origin = 'dt_inicio_uso'
      Size = 10
    end
    object FDT_Registrostatus_registro: TStringField
      DisplayLabel = 'Status do Registro'
      FieldName = 'status_registro'
      Origin = 'status_registro'
      Size = 50
    end
    object FDT_Registrolocal_instalacao: TStringField
      DisplayLabel = 'Local de Instala'#231#227'o'
      FieldName = 'local_instalacao'
      Origin = 'local_instalacao'
      Size = 100
    end
  end
  object FDQ_ConfigEmail: TFDQuery
    Connection = FDCon_Dados
    SQL.Strings = (
      'create table if not exists ConfigEmail'
      '('
      ' id_conf integer,'
      ' nome_usuario varchar(100),'
      ' email_usuario varchar(100),'
      ' email_secundario varchar(100),'
      ' senha_email varchar(50),'
      ' servidor_email varchar(50),'
      ' host_email varchar(100),'
      ' porta_email varchar(50),'
      ' assunto_email varchar(100),'
      ' auto_notificar varchar(10),'
      ' auto_apagar varchar(10)'
      ')')
    Left = 344
    Top = 112
  end
  object FDT_Conf_Email: TFDTable
    Active = True
    IndexFieldNames = 'id_conf'
    Connection = FDCon_Dados
    UpdateOptions.UpdateTableName = 'ConfigEmail'
    TableName = 'ConfigEmail'
    Left = 344
    Top = 184
    object FDT_Conf_Emailid_conf: TIntegerField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'id_conf'
      Origin = 'id_conf'
    end
    object FDT_Conf_Emailnome_usuario: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'nome_usuario'
      Origin = 'nome_usuario'
      Size = 100
    end
    object FDT_Conf_Emailemail_usuario: TStringField
      DisplayLabel = 'Email'
      FieldName = 'email_usuario'
      Origin = 'email_usuario'
      Size = 100
    end
    object FDT_Conf_Emailemail_secundario: TStringField
      DisplayLabel = 'Email Secund'#225'rio'
      FieldName = 'email_secundario'
      Origin = 'email_secundario'
      Size = 100
    end
    object FDT_Conf_Emailsenha_email: TStringField
      DisplayLabel = 'Senha'
      FieldName = 'senha_email'
      Origin = 'senha_email'
      Size = 50
    end
    object FDT_Conf_Emailservidor_email: TStringField
      DisplayLabel = 'Servidor de Email'
      FieldName = 'servidor_email'
      Origin = 'servidor_email'
      Size = 50
    end
    object FDT_Conf_Emailhost_email: TStringField
      DisplayLabel = 'Host'
      FieldName = 'host_email'
      Origin = 'host_email'
      Size = 100
    end
    object FDT_Conf_Emailporta_email: TStringField
      DisplayLabel = 'Porta'
      FieldName = 'porta_email'
      Origin = 'porta_email'
      Size = 50
    end
    object FDT_Conf_Emailassunto_email: TStringField
      DisplayLabel = 'Assunto'
      FieldName = 'assunto_email'
      Origin = 'assunto_email'
      Size = 100
    end
    object FDT_Conf_Emailauto_notificar: TStringField
      FieldName = 'auto_notificar'
      Origin = 'auto_notificar'
      Size = 10
    end
    object FDT_Conf_Emailauto_apagar: TStringField
      FieldName = 'auto_apagar'
      Origin = 'auto_apagar'
      Size = 10
    end
  end
end
