object F_DMExpress: TF_DMExpress
  OldCreateOrder = False
  Left = 193
  Top = 115
  Height = 440
  Width = 511
  object Conexao: TSQLConnection
    ConnectionName = 'IBConnection'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      
        'Database=C:\Documents and Settings\Albert\Desktop\SisCom\dados\s' +
        'iscom.fdb'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'Interbase TransIsolation=ReadCommited'
      'Trim Char=False')
    VendorLib = 'gds32.dll'
    Left = 32
    Top = 16
  end
  object Q_Pagamento: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM PAGAMENTO')
    SQLConnection = Conexao
    Left = 128
    Top = 80
  end
  object S_Pagamento: TDataSource
    DataSet = Cds_Pagamento
    Left = 408
    Top = 80
  end
  object Cds_Pagamento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Pr_Pagamento'
    Left = 312
    Top = 80
    object Cds_PagamentoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object Cds_PagamentoNUMDOC: TStringField
      FieldName = 'NUMDOC'
    end
    object Cds_PagamentoCODFORN: TIntegerField
      FieldName = 'CODFORN'
    end
    object Cds_PagamentoCODPED: TIntegerField
      FieldName = 'CODPED'
    end
    object Cds_PagamentoCONTA: TIntegerField
      FieldName = 'CONTA'
    end
    object Cds_PagamentoBANCO: TIntegerField
      FieldName = 'BANCO'
    end
    object Cds_PagamentoTIPOPGTO: TIntegerField
      FieldName = 'TIPOPGTO'
    end
    object Cds_PagamentoVLRTOTAL: TFloatField
      FieldName = 'VLRTOTAL'
    end
    object Cds_PagamentoJURO: TFloatField
      FieldName = 'JURO'
    end
    object Cds_PagamentoMULTA: TFloatField
      FieldName = 'MULTA'
    end
    object Cds_PagamentoDESCONTO: TFloatField
      FieldName = 'DESCONTO'
    end
    object Cds_PagamentoVLRPAGO: TFloatField
      FieldName = 'VLRPAGO'
    end
    object Cds_PagamentoCHEQUE: TStringField
      FieldName = 'CHEQUE'
      Size = 6
    end
    object Cds_PagamentoNOMINAL: TStringField
      FieldName = 'NOMINAL'
      Size = 50
    end
    object Cds_PagamentoLANCAMENTO: TDateField
      FieldName = 'LANCAMENTO'
    end
    object Cds_PagamentoEMISSAO: TDateField
      FieldName = 'EMISSAO'
    end
    object Cds_PagamentoVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object Cds_PagamentoPAGAMENTO: TDateField
      FieldName = 'PAGAMENTO'
    end
    object Cds_PagamentoDATACHEQUE: TDateField
      FieldName = 'DATACHEQUE'
    end
    object Cds_PagamentoAUDITORIA: TStringField
      FieldName = 'AUDITORIA'
      Size = 50
    end
  end
  object Pr_Pagamento: TDataSetProvider
    DataSet = Q_Pagamento
    Left = 216
    Top = 80
  end
  object T_TipoPgto: TSQLTable
    MaxBlobSize = -1
    SQLConnection = Conexao
    TableName = 'TIPO_PGTO'
    Left = 128
    Top = 144
    object T_TipoPgtoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object T_TipoPgtoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
  end
  object T_PlanoConta: TSQLDataSet
    CommandText = 'PLANO_CONTA'
    CommandType = ctTable
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 128
    Top = 208
    object T_PlanoContaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object T_PlanoContaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
  end
  object Cds_PlanoConta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Pr_PlanoConta'
    Left = 312
    Top = 208
  end
  object Pr_PlanoConta: TDataSetProvider
    DataSet = T_PlanoConta
    Left = 216
    Top = 208
  end
  object S_PlanoConta: TDataSource
    DataSet = Cds_PlanoConta
    Left = 408
    Top = 208
  end
  object QSP_Pagamento: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select ID from SP_GEN_PAGAMENTO_ID')
    SQLConnection = Conexao
    Left = 128
    Top = 24
  end
  object Q_Recebimento: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM RECEBIMENTO')
    SQLConnection = Conexao
    Left = 128
    Top = 304
  end
  object Pr_Recebimento: TDataSetProvider
    DataSet = Q_Recebimento
    Left = 216
    Top = 304
  end
  object Cds_Recebimento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Pr_Recebimento'
    OnReconcileError = Cds_RecebimentoReconcileError
    Left = 312
    Top = 304
    object Cds_RecebimentoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object Cds_RecebimentoNUMDOC: TStringField
      FieldName = 'NUMDOC'
    end
    object Cds_RecebimentoCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
    end
    object Cds_RecebimentoBANCO: TIntegerField
      FieldName = 'BANCO'
    end
    object Cds_RecebimentoTIPOPGTO: TIntegerField
      FieldName = 'TIPOPGTO'
    end
    object Cds_RecebimentoVLRTOTAL: TFloatField
      FieldName = 'VLRTOTAL'
    end
    object Cds_RecebimentoJURO: TFloatField
      FieldName = 'JURO'
    end
    object Cds_RecebimentoMULTA: TFloatField
      FieldName = 'MULTA'
    end
    object Cds_RecebimentoDESCONTO: TFloatField
      FieldName = 'DESCONTO'
    end
    object Cds_RecebimentoVLRECEBIDO: TFloatField
      FieldName = 'VLRECEBIDO'
    end
    object Cds_RecebimentoLANCAMENTO: TDateField
      FieldName = 'LANCAMENTO'
    end
    object Cds_RecebimentoEMISSAO: TDateField
      FieldName = 'EMISSAO'
    end
    object Cds_RecebimentoVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object Cds_RecebimentoRECEBIMENTO: TDateField
      FieldName = 'RECEBIMENTO'
    end
    object Cds_RecebimentoAUDITORIA: TStringField
      FieldName = 'AUDITORIA'
      Size = 50
    end
  end
  object S_Recebimento: TDataSource
    DataSet = Cds_Recebimento
    Left = 400
    Top = 304
  end
  object QSP_Recebimento: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select ID from SP_GEN_RECEBIMENTO_ID')
    SQLConnection = Conexao
    Left = 41
    Top = 306
  end
  object Rv_Recebimento: TRvProject
    Engine = RvSystem1
    Left = 232
    Top = 16
  end
  object RvSystem1: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'ReportPrinter Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    Left = 312
    Top = 16
  end
  object RvDs_Recebimento: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = Cds_Recebimento
    Left = 400
    Top = 16
  end
  object Rv_Pagamento: TRvProject
    Engine = RvSystem1
    ProjectFile = 'C:\Documents and Settings\Albert\Desktop\SisCom\Pagamento.rav'
    Left = 240
    Top = 144
  end
  object RvDs_Pagamento: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = Cds_Pagamento
    Left = 424
    Top = 144
  end
  object Rv_PDFPgto: TRvRenderPDF
    DisplayName = 'Adobe Acrobat (PDF)'
    FileExtension = '*.pdf'
    EmbedFonts = False
    ImageQuality = 90
    MetafileDPI = 300
    FontEncoding = feWinAnsiEncoding
    DocInfo.Creator = 'Rave (http://www.nevrona.com/rave)'
    DocInfo.Producer = 'Nevrona Designs'
    Left = 336
    Top = 144
  end
end
