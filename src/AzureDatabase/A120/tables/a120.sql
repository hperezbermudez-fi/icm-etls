--[comm].[Commission_FIN_Accounts_All]

CREATE TABLE [comm].[A120](
	[FIN] [varchar](10), --Primary Key?
	[ai_fin_acct_no] [int] NULL,
	[Short_Name] [varchar](100) NULL,
	[FIN_Status] [varchar](100) NULL,
	[OSP_CD] [varchar](50) NULL,
	[LOA_Dt] [date] NULL,
	[Open_Dt] [date] NULL,
	--Missing FirstTradeDate
	[IPD] [date] NULL,
	[TERM_Dt] [date] NULL,
	[Close_Dt] [date] NULL,
	[Reconcile_Dt] [date] NULL,
	[Created_Dt] [date] NULL,
	[AA_Flag] [char](3) NULL,
	[Base] [varchar](100) NULL,
	[Fee_CD] [varchar](50) NULL,
	[FI_Company_ID] [varchar](10) NULL,
	[Reporting_Country] [varchar](10) NULL,
	[Resident_Country] [varchar](10) NULL,
	[Taxing_Country] [varchar](10) NULL,
	[Acct_Class] [varchar](10) NULL,
	PRIMARY KEY CLUSTERED ([FIN] ASC)
);