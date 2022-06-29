CREATE TABLE [comm].[SalesBoardOSP_Archive](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ICMRunId] [int] NULL,
	[RecordId] [int] NULL,
	[CID] [varchar](20) NOT NULL,
	[Board] [varchar](100) NULL,
	[Type] [varchar](50) NULL,
	[OSP_Code] [varchar](255) NULL,
	[Amount] [varchar](20) NULL,
	[Sign Date] [varchar](50),
	[Entry Date] [varchar](50),
	[CreatedByName] [varchar](100) NULL,
	[CreatedOnDateTime] [datetime] NULL,
 CONSTRAINT [PK_SalesBoardOSP_Archive] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO