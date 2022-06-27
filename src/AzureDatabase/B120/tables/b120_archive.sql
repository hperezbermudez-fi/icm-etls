--TxnID_Source  will be blank
--TransFxRate  blank
--FxRate   Blank  

CREATE TABLE [comm].[B120_Archive](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ICMRunId] [int] NULL,
	[RecordId] [int] NULL,
	[TxnID] [varchar](50),
	[Txn_Source] [varchar](20), --Blank
	[Acct_Type] [varchar](50),
	[FIN] [varchar](20),
	[Trans_Code] [varchar](10),
	[Trans_Curr] [varchar](4),
	[TransFxRate] [varchar](25), --Blank
	[FxRate] [varchar](20), --Blank
	[Trans_Date] [varchar](50),
	[Trans_Amt_Net] [varchar](25),
	[Internal_Trans] [varchar](25),
	[CreatedByName] [varchar](100) NULL,
	[CreatedOnDateTime] [datetime] NULL,
 CONSTRAINT [PK_B120_Archive] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO