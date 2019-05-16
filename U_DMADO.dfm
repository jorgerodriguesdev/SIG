object F_DMADO: TF_DMADO
  OldCreateOrder = False
  Height = 522
  Width = 767
  object Conexao: TADOConnection
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 32
    Top = 16
  end
  object Q_CRequisicao: TADOQuery
    Connection = Conexao
    Parameters = <>
    SQL.Strings = (
      'select * from C_REQUISICAO'
      'where CODIGO<1')
    Left = 96
    Top = 88
  end
  object Q_DRequisicao: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    BeforePost = Q_DRequisicaoBeforePost
    Parameters = <>
    SQL.Strings = (
      'select * from D_REQUISICAO')
    Left = 96
    Top = 152
    object Q_DRequisicaoDESCRICAO: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCRICAO'
      LookupDataSet = T_Produto
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODPROD'
      Size = 50
      Lookup = True
    end
    object Q_DRequisicaoCODREQ: TIntegerField
      FieldName = 'CODREQ'
    end
    object Q_DRequisicaoQTDE: TIntegerField
      FieldName = 'QTDE'
    end
    object Q_DRequisicaoVLRUNITARIO: TFloatField
      FieldName = 'VLRUNITARIO'
      currency = True
    end
    object Q_DRequisicaoVLRTOTAL: TFloatField
      FieldName = 'VLRTOTAL'
      currency = True
    end
    object Q_DRequisicaoCODPROD: TStringField
      FieldName = 'CODPROD'
      Size = 13
    end
  end
  object S_DRequisicao: TDataSource
    DataSet = Q_DRequisicao
    Left = 176
    Top = 152
  end
  object Q_Produto: TADOQuery
    Connection = Conexao
    Parameters = <>
    SQL.Strings = (
      'select * from PRODUTO')
    Left = 96
    Top = 216
    object Q_ProdutoCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 13
    end
    object Q_ProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object Q_ProdutoVLRCOMPRA: TFloatField
      FieldName = 'VLRCOMPRA'
    end
    object Q_ProdutoVLRVENDA: TFloatField
      FieldName = 'VLRVENDA'
    end
    object Q_ProdutoESTOQUE: TIntegerField
      FieldName = 'ESTOQUE'
    end
    object Q_ProdutoCRITICO: TIntegerField
      FieldName = 'CRITICO'
    end
    object Q_ProdutoAUDITORIA: TStringField
      FieldName = 'AUDITORIA'
      Size = 50
    end
    object Q_ProdutoCODFORN: TIntegerField
      FieldName = 'CODFORN'
    end
    object Q_ProdutoCODUND: TIntegerField
      FieldName = 'CODUND'
    end
  end
  object S_Produto: TDataSource
    DataSet = Q_Produto
    Left = 176
    Top = 216
  end
  object Q_AtualizaCReq: TADOQuery
    Connection = Conexao
    Parameters = <
      item
        Name = 'CODDEPTO'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CODFUNC'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'DATAREQ'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'CODIGO'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'update C_REQUISICAO set'
      'CODDEPTO=:CODDEPTO,'
      'CODFUNC=:CODFUNC,'
      'DATAREQ=:DATAREQ'
      'where CODIGO=:CODIGO')
    Left = 96
    Top = 288
  end
  object T_Produto: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    TableName = 'PRODUTO'
    Left = 16
    Top = 152
    object T_ProdutoCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 13
    end
    object T_ProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object T_ProdutoVLRCOMPRA: TFloatField
      FieldName = 'VLRCOMPRA'
    end
    object T_ProdutoVLRVENDA: TFloatField
      FieldName = 'VLRVENDA'
    end
    object T_ProdutoESTOQUE: TIntegerField
      FieldName = 'ESTOQUE'
    end
    object T_ProdutoCRITICO: TIntegerField
      FieldName = 'CRITICO'
    end
    object T_ProdutoAUDITORIA: TStringField
      FieldName = 'AUDITORIA'
      Size = 50
    end
    object T_ProdutoCODFORN: TIntegerField
      FieldName = 'CODFORN'
    end
    object T_ProdutoCODUND: TIntegerField
      FieldName = 'CODUND'
    end
  end
  object T_Fornecedor: TADOTable
    Connection = Conexao
    TableName = 'FORNECEDOR'
    Left = 256
    Top = 152
    object T_FornecedorCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object T_FornecedorNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object T_FornecedorENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object T_FornecedorEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 255
    end
    object T_FornecedorBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object T_FornecedorCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object T_FornecedorCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object T_FornecedorESTADO: TStringField
      FieldName = 'ESTADO'
      FixedChar = True
      Size = 2
    end
    object T_FornecedorFONE: TStringField
      FieldName = 'FONE'
      Size = 10
    end
    object T_FornecedorCELULAR: TStringField
      FieldName = 'CELULAR'
      Size = 10
    end
    object T_FornecedorCPF: TStringField
      FieldName = 'CPF'
      Size = 11
    end
    object T_FornecedorOBS: TStringField
      FieldName = 'OBS'
      Size = 255
    end
    object T_FornecedorRG: TStringField
      FieldName = 'RG'
    end
    object T_FornecedorORGAORG: TStringField
      FieldName = 'ORGAORG'
      Size = 10
    end
    object T_FornecedorDESDE: TDateField
      FieldName = 'DESDE'
    end
    object T_FornecedorCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object T_FornecedorINSEST: TStringField
      FieldName = 'INSEST'
    end
    object T_FornecedorFAX: TStringField
      FieldName = 'FAX'
      Size = 10
    end
    object T_FornecedorCONTATO: TStringField
      FieldName = 'CONTATO'
    end
    object T_FornecedorAUDITORIA: TStringField
      FieldName = 'AUDITORIA'
      Size = 50
    end
  end
  object Q_CCotacao: TADOQuery
    Connection = Conexao
    Parameters = <>
    SQL.Strings = (
      'select * from C_COTACAO'
      'where CODIGO<1')
    Left = 336
    Top = 88
  end
  object S_DCotacao: TDataSource
    DataSet = Q_DCotacao
    Left = 416
    Top = 152
  end
  object Q_AtualizaCCot: TADOQuery
    Connection = Conexao
    Parameters = <
      item
        Name = 'DATACOT'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = Null
      end
      item
        Name = 'FORN1'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'FORN2'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'FORN3'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ENTREGA1'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'ENTREGA2'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'ENTREGA3'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'CONDICAO1'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'CONDICAO2'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'CONDICAO3'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'DESCONTO1'
        DataType = ftFloat
        Size = -1
        Value = Null
      end
      item
        Name = 'DESCONTO2'
        DataType = ftFloat
        Size = -1
        Value = Null
      end
      item
        Name = 'DESCONTO3'
        DataType = ftFloat
        Size = -1
        Value = Null
      end
      item
        Name = 'TOTAL1'
        DataType = ftFloat
        Size = -1
        Value = Null
      end
      item
        Name = 'TOTAL2'
        DataType = ftFloat
        Size = -1
        Value = Null
      end
      item
        Name = 'TOTAL3'
        DataType = ftFloat
        Size = -1
        Value = Null
      end
      item
        Name = 'CODIGO'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'update C_COTACAO set'
      'DATACOT=:DATACOT,'
      'FORN1=:FORN1,'
      'FORN2=:FORN2,'
      'FORN3=:FORN3,'
      'ENTREGA1=:ENTREGA1,'
      'ENTREGA2=:ENTREGA2,'
      'ENTREGA3=:ENTREGA3,'
      'CONDICAO1=:CONDICAO1,'
      'CONDICAO2=:CONDICAO2,'
      'CONDICAO3=:CONDICAO3,'
      'DESCONTO1=:DESCONTO1,'
      'DESCONTO2=:DESCONTO2,'
      'DESCONTO3=:DESCONTO3,'
      'TOTAL1=:TOTAL1,'
      'TOTAL2=:TOTAL2,'
      'TOTAL3=:TOTAL3'
      'where CODIGO=:CODIGO')
    Left = 336
    Top = 216
  end
  object Q_DCotacao: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    BeforePost = Q_DCotacaoBeforePost
    Parameters = <>
    SQL.Strings = (
      'select * from D_COTACAO')
    Left = 336
    Top = 152
    object Q_DCotacaoCODCOTA: TIntegerField
      FieldName = 'CODCOTA'
    end
    object Q_DCotacaoCODREQ: TIntegerField
      FieldName = 'CODREQ'
    end
    object Q_DCotacaoCODPRODREQ: TStringField
      FieldName = 'CODPRODREQ'
      Size = 13
    end
    object Q_DCotacaoQTDE: TIntegerField
      FieldName = 'QTDE'
    end
    object Q_DCotacaoUNIT1: TFloatField
      FieldName = 'UNIT1'
    end
    object Q_DCotacaoUNIT2: TFloatField
      FieldName = 'UNIT2'
    end
    object Q_DCotacaoUNIT3: TFloatField
      FieldName = 'UNIT3'
    end
    object Q_DCotacaoTOTAL1: TFloatField
      FieldName = 'TOTAL1'
    end
    object Q_DCotacaoTOTAL2: TFloatField
      FieldName = 'TOTAL2'
    end
    object Q_DCotacaoTOTAL3: TFloatField
      FieldName = 'TOTAL3'
    end
    object Q_DCotacaoDESCRICAO: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCRICAO'
      LookupDataSet = T_Produto
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODPRODREQ'
      Size = 50
      Lookup = True
    end
  end
  object Q_ImportaReq: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from D_REQUISICAO'
      'where TICK is null')
    Left = 336
    Top = 280
    object Q_ImportaReqCODREQ: TIntegerField
      FieldName = 'CODREQ'
    end
    object Q_ImportaReqCODPROD: TStringField
      FieldName = 'CODPROD'
      Size = 13
    end
    object Q_ImportaReqQTDE: TIntegerField
      FieldName = 'QTDE'
    end
    object Q_ImportaReqVLRUNITARIO: TFloatField
      FieldName = 'VLRUNITARIO'
    end
    object Q_ImportaReqVLRTOTAL: TFloatField
      FieldName = 'VLRTOTAL'
    end
    object Q_ImportaReqDESCRICAO: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCRICAO'
      LookupDataSet = T_Produto
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODPROD'
      Size = 50
      Lookup = True
    end
    object Q_ImportaReqTICK: TStringField
      FieldName = 'TICK'
      FixedChar = True
      Size = 1
    end
  end
  object S_ImportaReq: TDataSource
    DataSet = Q_ImportaReq
    Left = 416
    Top = 280
  end
  object S_DConfCotacao: TDataSource
    DataSet = Q_DConfCotacao
    Left = 432
    Top = 344
  end
  object Q_DConfCotacao: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    BeforePost = Q_DConfCotacaoBeforePost
    Parameters = <>
    SQL.Strings = (
      'select * from D_COTACAO')
    Left = 336
    Top = 344
    object Q_DConfCotacaoCODCOTA: TIntegerField
      FieldName = 'CODCOTA'
    end
    object Q_DConfCotacaoCODREQ: TIntegerField
      FieldName = 'CODREQ'
    end
    object Q_DConfCotacaoCODPRODREQ: TStringField
      FieldName = 'CODPRODREQ'
      Size = 13
    end
    object Q_DConfCotacaoQTDE: TIntegerField
      FieldName = 'QTDE'
    end
    object Q_DConfCotacaoUNIT1: TFloatField
      FieldName = 'UNIT1'
    end
    object Q_DConfCotacaoUNIT2: TFloatField
      FieldName = 'UNIT2'
    end
    object Q_DConfCotacaoUNIT3: TFloatField
      FieldName = 'UNIT3'
    end
    object Q_DConfCotacaoTOTAL1: TFloatField
      FieldName = 'TOTAL1'
    end
    object Q_DConfCotacaoTOTAL2: TFloatField
      FieldName = 'TOTAL2'
    end
    object Q_DConfCotacaoTOTAL3: TFloatField
      FieldName = 'TOTAL3'
    end
    object Q_DConfCotacaoDESCRICAO: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCRICAO'
      LookupDataSet = T_Produto
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODPRODREQ'
      Size = 50
      Lookup = True
    end
  end
  object Q_Consultas: TADOQuery
    Connection = Conexao
    Parameters = <>
    Left = 96
    Top = 16
  end
  object Q_CPedido: TADOQuery
    Connection = Conexao
    Parameters = <>
    SQL.Strings = (
      'select * from C_PEDIDO'
      'where CODIGO<1')
    Left = 560
    Top = 96
  end
  object Q_DPedido: TADOQuery
    Connection = Conexao
    BeforePost = Q_DPedidoBeforePost
    Parameters = <>
    SQL.Strings = (
      'select * from D_PEDIDO')
    Left = 560
    Top = 152
    object Q_DPedidoCODPED: TIntegerField
      FieldName = 'CODPED'
    end
    object Q_DPedidoCODREQ: TIntegerField
      FieldName = 'CODREQ'
    end
    object Q_DPedidoCODCOT: TIntegerField
      FieldName = 'CODCOT'
    end
    object Q_DPedidoQTDE: TIntegerField
      FieldName = 'QTDE'
    end
    object Q_DPedidoVLRUNITARIO: TFloatField
      FieldName = 'VLRUNITARIO'
    end
    object Q_DPedidoVLRTOTAL: TFloatField
      FieldName = 'VLRTOTAL'
    end
    object Q_DPedidoDESCRICAO: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCRICAO'
      LookupDataSet = T_Produto
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODPROD'
      Size = 50
      Lookup = True
    end
    object Q_DPedidoCODPROD: TStringField
      FieldName = 'CODPROD'
      Size = 13
    end
  end
  object S_DPedido: TDataSource
    DataSet = Q_DPedido
    Left = 632
    Top = 152
  end
  object Q_AtualizaCPed: TADOQuery
    Connection = Conexao
    Parameters = <
      item
        Name = 'CODCOT'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'DATAPED'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'ENTREGA'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'COBRANCA'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
        Size = -1
        Value = Null
      end
      item
        Name = 'DESCONTO'
        DataType = ftFloat
        Size = -1
        Value = Null
      end
      item
        Name = 'TOTAL'
        DataType = ftFloat
        Size = -1
        Value = Null
      end
      item
        Name = 'CODFORN'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'ESCOLHIDO'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'CODIGO'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'update C_PEDIDO set'
      'CODCOT=:CODCOT,'
      'DATAPED=:DATAPED,'
      'ENTREGA=:ENTREGA,'
      'COBRANCA=:COBRANCA,'
      'VALOR=:VALOR,'
      'DESCONTO=:DESCONTO,'
      'TOTAL=:TOTAL,'
      'CODFORN=:CODFORN,'
      'ESCOLHIDO=:ESCOLHIDO'
      'where CODIGO=:CODIGO')
    Left = 560
    Top = 216
  end
  object Q_ImportaCot: TADOQuery
    Connection = Conexao
    Parameters = <
      item
        Name = 'CODCOT'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from D_COTACAO'
      'where TICK is null'
      'and CODCOTA=:CODCOT')
    Left = 560
    Top = 280
    object Q_ImportaCotCODCOTA: TIntegerField
      FieldName = 'CODCOTA'
    end
    object Q_ImportaCotCODREQ: TIntegerField
      FieldName = 'CODREQ'
    end
    object Q_ImportaCotCODPRODREQ: TStringField
      FieldName = 'CODPRODREQ'
      Size = 13
    end
    object Q_ImportaCotQTDE: TIntegerField
      FieldName = 'QTDE'
    end
    object Q_ImportaCotUNIT1: TFloatField
      FieldName = 'UNIT1'
    end
    object Q_ImportaCotUNIT2: TFloatField
      FieldName = 'UNIT2'
    end
    object Q_ImportaCotUNIT3: TFloatField
      FieldName = 'UNIT3'
    end
    object Q_ImportaCotTOTAL1: TFloatField
      FieldName = 'TOTAL1'
    end
    object Q_ImportaCotTOTAL2: TFloatField
      FieldName = 'TOTAL2'
    end
    object Q_ImportaCotTOTAL3: TFloatField
      FieldName = 'TOTAL3'
    end
    object Q_ImportaCotTICK: TStringField
      FieldName = 'TICK'
      FixedChar = True
      Size = 1
    end
    object Q_ImportaCotDESCRICAO: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCRICAO'
      LookupDataSet = T_Produto
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODPRODREQ'
      Size = 50
      Lookup = True
    end
  end
  object S_ImportaCot: TDataSource
    DataSet = Q_ImportaCot
    Left = 632
    Top = 280
  end
  object SP_CRequisicao: TADOStoredProc
    Connection = Conexao
    ProcedureName = 'SP_GEN_C_REQUISICAO_ID'
    Parameters = <>
    Left = 336
    Top = 16
    object SP_CRequisicaoID: TIntegerField
      FieldName = 'ID'
    end
  end
  object SP_CCotacao: TADOStoredProc
    Connection = Conexao
    ProcedureName = 'SP_GEN_C_COTACAO_ID'
    Parameters = <>
    Left = 432
    Top = 16
    object IntegerField1: TIntegerField
      FieldName = 'ID'
    end
  end
  object SP_CPedido: TADOStoredProc
    Connection = Conexao
    ProcedureName = 'SP_GEN_C_PEDIDO_ID'
    Parameters = <>
    Left = 528
    Top = 16
    object IntegerField2: TIntegerField
      FieldName = 'ID'
    end
  end
  object Q_CVenda: TADOQuery
    Connection = Conexao
    Parameters = <>
    SQL.Strings = (
      'select * from C_VENDA'
      'where CODIGO<1')
    Left = 40
    Top = 416
  end
  object Q_DVenda: TADOQuery
    Connection = Conexao
    BeforePost = Q_DVendaBeforePost
    OnCalcFields = Q_DVendaCalcFields
    Parameters = <>
    SQL.Strings = (
      'select * from D_VENDA')
    Left = 120
    Top = 416
    object Q_DVendaCODVENDA: TIntegerField
      FieldName = 'CODVENDA'
    end
    object Q_DVendaCODPRO: TStringField
      FieldName = 'CODPRO'
      Size = 13
    end
    object Q_DVendaQTDE: TIntegerField
      FieldName = 'QTDE'
    end
    object Q_DVendaVLRUNITARIO: TFloatField
      FieldName = 'VLRUNITARIO'
    end
    object Q_DVendaVLRTOTAL: TFloatField
      FieldName = 'VLRTOTAL'
    end
    object Q_DVendaDESCRICAO: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCRICAO'
      LookupDataSet = T_Produto
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODPRO'
      Size = 50
      Lookup = True
    end
  end
  object S_DVenda: TDataSource
    DataSet = Q_DVenda
    Left = 184
    Top = 416
  end
  object SP_CVenda: TADOStoredProc
    Connection = Conexao
    ProcedureName = 'SP_GEN_C_VENDA_ID'
    Parameters = <>
    Left = 616
    Top = 16
    object IntegerField3: TIntegerField
      FieldName = 'ID'
    end
  end
  object Q_AtualizaCVen: TADOQuery
    Connection = Conexao
    Parameters = <
      item
        Name = 'DATAVENDA'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = Null
      end
      item
        Name = 'CODFUNC'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'TIPOPGTO'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'CFOP'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'CODCLI'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'CODCARTAO'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'VALOR'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 53
        Size = 8
        Value = Null
      end
      item
        Name = 'DESCONTO'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 53
        Size = 8
        Value = Null
      end
      item
        Name = 'TOTAL'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 53
        Size = 8
        Value = Null
      end
      item
        Name = 'NUMPARCELAS'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'PRIVENC'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = Null
      end
      item
        Name = 'NUMNOTA'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'CODIGO'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'update C_VENDA set'
      'DATAVENDA=:DATAVENDA,'
      'CODFUNC=:CODFUNC,'
      'TIPOPGTO=:TIPOPGTO,'
      'CFOP=:CFOP,'
      'CODCLI=:CODCLI,'
      'CODCARTAO=:CODCARTAO,'
      'VALOR=:VALOR,'
      'DESCONTO=:DESCONTO,'
      'TOTAL=:TOTAL,'
      'NUMPARCELAS=:NUMPARCELAS,'
      'PRIVENC=:PRIVENC,'
      'NUMNOTA=:NUMNOTA'
      'where CODIGO=:CODIGO')
    Left = 264
    Top = 416
  end
  object T_Cartao: TADOTable
    Connection = Conexao
    TableName = 'CARTAO'
    Left = 416
    Top = 416
    object T_CartaoCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object T_CartaoNOME: TStringField
      FieldName = 'NOME'
    end
    object T_CartaoTAXA: TFloatField
      FieldName = 'TAXA'
    end
  end
  object T_TipoPgto: TADOTable
    Connection = Conexao
    TableName = 'TIPO_PGTO'
    Left = 504
    Top = 416
    object T_TipoPgtoCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object T_TipoPgtoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
  end
  object SP_SomaVenda: TADOStoredProc
    Connection = Conexao
    CursorType = ctStatic
    ProcedureName = 'SOMA_VENDA'
    Parameters = <
      item
        Name = 'CODIGO'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 4
        Value = Null
      end>
    Left = 224
    Top = 16
    object SP_SomaVendaSOMA: TFloatField
      FieldName = 'SOMA'
    end
  end
end
