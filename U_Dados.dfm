object F_Dados: TF_Dados
  OldCreateOrder = False
  Left = 196
  Top = 116
  Height = 366
  Width = 522
  object Z_SisCom: TZConnection
    Protocol = 'mysql-4.0'
    HostName = 'localhost'
    Database = 'siscom'
    Left = 24
    Top = 16
  end
  object T_Unidade: TZTable
    Connection = Z_SisCom
    AfterInsert = T_UnidadeAfterInsert
    AfterPost = T_UnidadeAfterPost
    TableName = 'UNIDADE'
    Left = 88
    Top = 16
  end
  object S_Unidade: TDataSource
    DataSet = T_Unidade
    Left = 152
    Top = 16
  end
  object Sq_Unidade: TZSequence
    Connection = Z_SisCom
    SequenceName = 'GEN_UNIDADE_ID'
    Left = 32
    Top = 264
  end
  object Q_Produto: TZQuery
    Connection = Z_SisCom
    SQL.Strings = (
      'SELECT * FROM PRODUTO')
    Params = <>
    Left = 256
    Top = 16
    object Q_Produtocodigo: TStringField
      FieldName = 'codigo'
      Required = True
      Size = 13
    end
    object Q_Produtocodund: TLargeintField
      FieldName = 'codund'
      Required = True
    end
    object Q_Produtocodforn: TLargeintField
      FieldName = 'codforn'
      Required = True
    end
    object Q_Produtodescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
    object Q_Produtovlrcompra: TFloatField
      FieldName = 'vlrcompra'
    end
    object Q_Produtovlrvenda: TFloatField
      FieldName = 'vlrvenda'
      currency = True
    end
    object Q_Produtoestoque: TLargeintField
      FieldName = 'estoque'
    end
    object Q_Produtocritico: TLargeintField
      FieldName = 'critico'
    end
    object Q_Produtoauditoria: TStringField
      FieldName = 'auditoria'
      Size = 50
    end
  end
  object S_Produto: TDataSource
    DataSet = Q_Produto
    Left = 320
    Top = 16
  end
  object Q_Funcionario: TZQuery
    Connection = Z_SisCom
    AfterInsert = Q_FuncionarioAfterInsert
    SQL.Strings = (
      'SELECT * FROM FUNCIONARIO')
    Params = <>
    Left = 256
    Top = 72
    object Q_Funcionariocodigo: TLargeintField
      FieldName = 'codigo'
    end
    object Q_Funcionariocoddpto: TLargeintField
      FieldName = 'coddpto'
      Required = True
    end
    object Q_Funcionarionome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object Q_Funcionarioendereco: TStringField
      FieldName = 'endereco'
      Size = 50
    end
    object Q_Funcionarioemail: TStringField
      FieldName = 'email'
      Size = 255
    end
    object Q_Funcionariobairro: TStringField
      FieldName = 'bairro'
      Size = 30
    end
    object Q_Funcionariocidade: TStringField
      FieldName = 'cidade'
      Size = 30
    end
    object Q_Funcionariocep: TStringField
      FieldName = 'cep'
      Size = 8
    end
    object Q_Funcionarioestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
    object Q_Funcionariofone: TStringField
      FieldName = 'fone'
      EditMask = '(##)####-####;0;_'
      Size = 10
    end
    object Q_Funcionariocelular: TStringField
      FieldName = 'celular'
      Size = 10
    end
    object Q_Funcionariocpf: TStringField
      FieldName = 'cpf'
      Size = 11
    end
    object Q_Funcionariorg: TStringField
      FieldName = 'rg'
    end
    object Q_Funcionarioorgaorg: TStringField
      FieldName = 'orgaorg'
      Size = 10
    end
    object Q_Funcionarioposse: TDateField
      FieldName = 'posse'
    end
    object Q_Funcionariocargo: TStringField
      FieldName = 'cargo'
    end
    object Q_Funcionariocomissao: TFloatField
      FieldName = 'comissao'
    end
    object Q_Funcionariologin: TStringField
      FieldName = 'login'
      Size = 10
    end
    object Q_Funcionariosenha: TStringField
      FieldName = 'senha'
      Size = 10
    end
    object Q_Funcionarioauditoria: TStringField
      FieldName = 'auditoria'
      Size = 50
    end
    object Q_Funcionarioactotal: TStringField
      FieldName = 'actotal'
      Size = 1
    end
  end
  object S_Funcionario: TDataSource
    DataSet = Q_Funcionario
    Left = 328
    Top = 72
  end
  object Sq_Funcionario: TZSequence
    Connection = Z_SisCom
    SequenceName = 'GEN_FUNCIONARIO_ID'
    Left = 120
    Top = 264
  end
  object Q_NivelAcesso: TZQuery
    Connection = Z_SisCom
    SQL.Strings = (
      'SELECT * FROM NIVELACESSO')
    Params = <>
    Left = 256
    Top = 136
  end
  object S_NivelAcesso: TDataSource
    DataSet = Q_NivelAcesso
    Left = 336
    Top = 136
  end
  object Q_ConsFunc: TZReadOnlyQuery
    Connection = Z_SisCom
    AfterScroll = Q_ConsFuncAfterScroll
    SQL.Strings = (
      'SELECT * FROM FUNCIONARIO')
    Params = <>
    Left = 336
    Top = 248
  end
  object S_ConsFunc: TDataSource
    DataSet = Q_ConsFunc
    Left = 416
    Top = 248
  end
  object Q_Banco: TZQuery
    Connection = Z_SisCom
    AfterInsert = Q_BancoAfterInsert
    SQL.Strings = (
      'SELECT * FROM BANCO')
    Params = <>
    Left = 80
    Top = 80
  end
  object S_Banco: TDataSource
    DataSet = Q_Banco
    Left = 152
    Top = 80
  end
  object Sq_Banco: TZSequence
    Connection = Z_SisCom
    SequenceName = 'GEN_BANCO_ID'
    Left = 208
    Top = 264
  end
end
