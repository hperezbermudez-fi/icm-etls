--[comm].[VCOMM_FIN_Transactions_Managed]

CREATE TABLE [comm].[C110](
	[RecordID] varchar(50) NULL,
	[FIN] [varchar](10) NULL,
	[valuation_dt] [date] NULL,
	[Base_MV_AUM] [decimal](21, 4) NULL,
	[Base_MV_overall] [decimal](21, 4) NULL,
	[Base_MV_cash] [decimal](21, 4) NULL
);