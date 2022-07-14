CREATE TABLE [comm].[BFR_Archive](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ICMRunId] [int] NULL,
	[RecordId] [int] NULL,
	[Customer]	   [varchar](32) null,
	[MonthEnd] [varchar](50) null,
	[RunDate]  [varchar] (50) null,
	[dBillingRateAmount] [varchar](50) null,
	[CreatedByName] [varchar](100) NULL,
	[CreatedOnDateTime] [datetime] NULL,
 CONSTRAINT [PK_BFR_Archive] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO