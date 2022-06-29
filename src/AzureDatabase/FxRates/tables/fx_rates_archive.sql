CREATE TABLE [comm].[FxRates_Archive](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ICMRunId] [int] NULL,
	[RecordId] [int] NULL,
	[From] [varchar](50) NULL,
	[To] [varchar](50) NULL,
	[Date] [varchar](50) NULL,
	[Rate] [varchar](50) NULL,
	[CreatedByName] [nvarchar](100) NULL,
	[CreatedOnDateTime] [datetime] NULL,
 CONSTRAINT [PK_FxRates_Archive] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO