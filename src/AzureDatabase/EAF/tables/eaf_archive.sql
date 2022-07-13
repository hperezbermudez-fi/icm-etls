CREATE TABLE [comm].[EAF_Archive](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ICMRunId] [int] NULL,
	[RecordId] [int] NULL,
	[RecordIDKey] [varchar](150) not null,
	[CID]	   [varchar](32) null,
	[MonthEnd] [varchar](50) null,
	[RunDate]  [varchar] (50) null,
	[RunType]  [varchar](3) null,
	[dBillingRateAmount] [varchar](50) null,
	[CreatedByName] [varchar](100) NULL,
	[CreatedOnDateTime] [datetime] NULL,
 CONSTRAINT [PK_EAF_Archive] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO