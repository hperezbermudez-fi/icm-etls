--CREATE VIEW  [comm].[VCOMM_FIN_Transactions_Managed] 
CREATE TABLE [comm].[B120](
	[transaction_reference_number] [nvarchar](50) NOT NULL,
	[acct_type] [varchar](50) NULL,
	[fin] [varchar](10) NULL,
	[trans_code] [varchar](10) NULL,
	[trans_curr] [char](4) NULL,
	[FxRate_from_base_vFiFxRatesAll_AR] [numeric](19, 13) NULL,
	[trans_date] [date] NULL,
	[trans_amt_net] [decimal](21, 4) NULL,
	[Internal_Trans] [decimal](21, 4) NULL,
 CONSTRAINT [PK_B120] PRIMARY KEY CLUSTERED 
(
	[transaction_reference_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
