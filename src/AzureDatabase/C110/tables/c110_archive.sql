
CREATE TABLE [comm].[C110_Archive](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ICMRunId] [int] NULL,
	[RecordId] [int] NULL,
	[RecordIDKey] varchar(50) NULL,
	[FIN] [varchar](10) NULL,
	[valuation_dt] varchar(50) NULL,
	[Base_MV_AUM]  varchar(50) NULL,
	[Base_MV_overall]  varchar(50) NULL,
	[Base_MV_cash]  varchar(50) NULL,
	[CreatedByName] [varchar](100) NULL,
	[CreatedOnDateTime] [datetime] NULL,
 CONSTRAINT [PK_C110_Archive] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO