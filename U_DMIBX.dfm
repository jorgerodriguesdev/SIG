object F_DMIBX: TF_DMIBX
  OldCreateOrder = False
  Height = 371
  Width = 360
  object Conexao: TIBDatabase
    DatabaseName = 'C:\Documents and Settings\Albert\Desktop\SisCom\dados\SISCOM.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    Left = 40
    Top = 24
  end
  object Transacao: TIBTransaction
    DefaultDatabase = Conexao
    Left = 112
    Top = 24
  end
  object S_DNFE: TDataSource
    DataSet = Q_DNFE
    Left = 104
    Top = 152
  end
  object Q_AtualizaCNFE: TIBQuery
    Database = Conexao
    Transaction = Transacao
    SQL.Strings = (
      'update C_NFE set'
      'CODFORN=:CODFORN,'
      'EMISSAO=:EMISSAO,'
      'ENTRADA=:ENTRADA,'
      'TOTAL=:TOTAL'
      'where NUMERO=:NUMERO')
    Left = 40
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODFORN'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'EMISSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'ENTRADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'TOTAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NUMERO'
        ParamType = ptUnknown
      end>
  end
  object S_Produto: TDataSource
    DataSet = Q_Produto
    Left = 104
    Top = 280
  end
  object Q_DNFE: TIBDataSet
    Database = Conexao
    Transaction = Transacao
    AfterPost = Q_DNFEAfterPost
    DeleteSQL.Strings = (
      'delete from D_NFE'
      'where'
      '  NUMNOTA = :OLD_NUMNOTA and'
      '  CODPRO = :OLD_CODPRO')
    InsertSQL.Strings = (
      'insert into D_NFE'
      '  (NUMNOTA, CODPRO, QTDE, VLRUNITARIO, VLRTOTAL)'
      'values'
      '  (:NUMNOTA, :CODPRO, :QTDE, :VLRUNITARIO, :VLRTOTAL)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMNOTA,'
      '  CODPRO,'
      '  QTDE,'
      '  VLRUNITARIO,'
      '  VLRTOTAL'
      'from D_NFE '
      'where'
      '  NUMNOTA = :NUMNOTA and'
      '  CODPRO = :CODPRO')
    SelectSQL.Strings = (
      'select * from D_NFE')
    ModifySQL.Strings = (
      'update D_NFE'
      'set'
      '  NUMNOTA = :NUMNOTA,'
      '  CODPRO = :CODPRO,'
      '  QTDE = :QTDE,'
      '  VLRUNITARIO = :VLRUNITARIO,'
      '  VLRTOTAL = :VLRTOTAL'
      'where'
      '  NUMNOTA = :OLD_NUMNOTA and'
      '  CODPRO = :OLD_CODPRO')
    Left = 32
    Top = 152
    object Q_DNFENUMNOTA: TIntegerField
      FieldName = 'NUMNOTA'
      Origin = 'D_NFE.NUMNOTA'
      Required = True
    end
    object Q_DNFECODPRO: TIBStringField
      FieldName = 'CODPRO'
      Origin = 'D_NFE.CODPRO'
      Required = True
      Size = 13
    end
    object Q_DNFEQTDE: TIntegerField
      FieldName = 'QTDE'
      Origin = 'D_NFE.QTDE'
    end
    object Q_DNFEVLRUNITARIO: TFloatField
      FieldName = 'VLRUNITARIO'
      Origin = 'D_NFE.VLRUNITARIO'
    end
    object Q_DNFEVLRTOTAL: TFloatField
      FieldName = 'VLRTOTAL'
      Origin = 'D_NFE.VLRTOTAL'
    end
  end
  object Q_CNFE: TIBDataSet
    Database = Conexao
    Transaction = Transacao
    DeleteSQL.Strings = (
      'delete from C_NFE'
      'where'
      '  NUMERO = :OLD_NUMERO')
    InsertSQL.Strings = (
      'insert into C_NFE'
      '  (NUMERO, CODFORN, CFOP, EMISSAO, ENTRADA, TOTAL, AUDITORIA)'
      'values'
      
        '  (:NUMERO, :CODFORN, :CFOP, :EMISSAO, :ENTRADA, :TOTAL, :AUDITO' +
        'RIA)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO,'
      '  CODFORN,'
      '  CFOP,'
      '  EMISSAO,'
      '  ENTRADA,'
      '  TOTAL,'
      '  AUDITORIA'
      'from C_NFE '
      'where'
      '  NUMERO = :NUMERO')
    SelectSQL.Strings = (
      'select * from C_NFE')
    ModifySQL.Strings = (
      'update C_NFE'
      'set'
      '  NUMERO = :NUMERO,'
      '  CODFORN = :CODFORN,'
      '  CFOP = :CFOP,'
      '  EMISSAO = :EMISSAO,'
      '  ENTRADA = :ENTRADA,'
      '  TOTAL = :TOTAL,'
      '  AUDITORIA = :AUDITORIA'
      'where'
      '  NUMERO = :OLD_NUMERO')
    Left = 32
    Top = 96
    object Q_CNFENUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'C_NFE.NUMERO'
      Required = True
    end
    object Q_CNFECODFORN: TIntegerField
      FieldName = 'CODFORN'
      Origin = 'C_NFE.CODFORN'
    end
    object Q_CNFECFOP: TIntegerField
      FieldName = 'CFOP'
      Origin = 'C_NFE.CFOP'
    end
    object Q_CNFEEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'C_NFE.EMISSAO'
    end
    object Q_CNFEENTRADA: TDateField
      FieldName = 'ENTRADA'
      Origin = 'C_NFE.ENTRADA'
    end
    object Q_CNFETOTAL: TFloatField
      FieldName = 'TOTAL'
      Origin = 'C_NFE.TOTAL'
    end
    object Q_CNFEAUDITORIA: TIBStringField
      FieldName = 'AUDITORIA'
      Origin = 'C_NFE.AUDITORIA'
      Size = 50
    end
  end
  object Q_Produto: TIBDataSet
    Database = Conexao
    Transaction = Transacao
    DeleteSQL.Strings = (
      'delete from PRODUTO'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into PRODUTO'
      '  (CODIGO, DESCRICAO, VLRCOMPRA, VLRVENDA, ESTOQUE, CRITICO, '
      'AUDITORIA, '
      '   CODFORN, CODUND)'
      'values'
      
        '  (:CODIGO, :DESCRICAO, :VLRCOMPRA, :VLRVENDA, :ESTOQUE, :CRITIC' +
        'O, '
      ':AUDITORIA, '
      '   :CODFORN, :CODUND)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  DESCRICAO,'
      '  VLRCOMPRA,'
      '  VLRVENDA,'
      '  ESTOQUE,'
      '  CRITICO,'
      '  AUDITORIA,'
      '  CODFORN,'
      '  CODUND'
      'from PRODUTO '
      'where'
      '  CODIGO = :CODIGO')
    SelectSQL.Strings = (
      'select * from PRODUTO')
    ModifySQL.Strings = (
      'update PRODUTO'
      'set'
      '  CODIGO = :CODIGO,'
      '  DESCRICAO = :DESCRICAO,'
      '  VLRCOMPRA = :VLRCOMPRA,'
      '  VLRVENDA = :VLRVENDA,'
      '  ESTOQUE = :ESTOQUE,'
      '  CRITICO = :CRITICO,'
      '  AUDITORIA = :AUDITORIA,'
      '  CODFORN = :CODFORN,'
      '  CODUND = :CODUND'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 40
    Top = 280
    object Q_ProdutoCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = 'PRODUTO.CODIGO'
      Required = True
      Size = 13
    end
    object Q_ProdutoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'PRODUTO.DESCRICAO'
      Size = 50
    end
    object Q_ProdutoVLRCOMPRA: TFloatField
      FieldName = 'VLRCOMPRA'
      Origin = 'PRODUTO.VLRCOMPRA'
    end
    object Q_ProdutoVLRVENDA: TFloatField
      FieldName = 'VLRVENDA'
      Origin = 'PRODUTO.VLRVENDA'
    end
    object Q_ProdutoESTOQUE: TIntegerField
      FieldName = 'ESTOQUE'
      Origin = 'PRODUTO.ESTOQUE'
    end
    object Q_ProdutoCRITICO: TIntegerField
      FieldName = 'CRITICO'
      Origin = 'PRODUTO.CRITICO'
    end
    object Q_ProdutoAUDITORIA: TIBStringField
      FieldName = 'AUDITORIA'
      Origin = 'PRODUTO.AUDITORIA'
      Size = 50
    end
    object Q_ProdutoCODFORN: TIntegerField
      FieldName = 'CODFORN'
      Origin = 'PRODUTO.CODFORN'
    end
    object Q_ProdutoCODUND: TIntegerField
      FieldName = 'CODUND'
      Origin = 'PRODUTO.CODUND'
    end
  end
  object Q_Atualiza: TIBSQL
    Database = Conexao
    Transaction = Transacao
    Left = 240
    Top = 72
  end
end
