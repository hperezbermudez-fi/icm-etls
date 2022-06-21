
CREATE TABLE [comm].[A120_Archive](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ICMRunId] [int] NULL,
	[RecordId] [int] NULL,
	[FIN] [varchar](10), 
	[ai_fin_acct_no] [int] NULL,
	[Short_Name] [varchar](100) NULL,
	[FIN_Status] [varchar](100) NULL,
	[OSP_CD] [varchar](50) NULL,
	[LOA_Dt] [varchar](50) NULL,
	[Open_Dt] [varchar](50) NULL,
	--Missing FirstTradeDate
	[IPD] [date] NULL,
	[TERM_Dt] [varchar](50) NULL,
	[Close_Dt] [varchar](50) NULL,
	[Reconcile_Dt] [varchar](50) NULL,
	[Created_Dt] [varchar](50) NULL,
	[AA_Flag] [char](3) NULL,
	[Base] [varchar](100) NULL,
	[Fee_CD] [varchar](50) NULL,
	[FI_Company_ID] [varchar](10) NULL,
	[Reporting_Country] [varchar](10) NULL,
	[Resident_Country] [varchar](10) NULL,
	[Taxing_Country] [varchar](10) NULL,
	[Acct_Class] [varchar](10) NULL,

	[CreatedByName] [varchar](100) NULL,
	[CreatedOnDateTime] [datetime] NULL,
 CONSTRAINT [PK_A120_Archive] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO