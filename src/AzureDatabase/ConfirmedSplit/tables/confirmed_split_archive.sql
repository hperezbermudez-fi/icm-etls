
CREATE TABLE [comm].[ConfirmedSplit_Archive](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ICMRunId] [int] NULL,
	[RecordId] [int] NULL,
	[ClientID] [int] NULL,
	[EffectiveDate] [varchar](50) NULL,
	[EffectiveEndDate] [varchar](50) NULL,
	[EmployeeID] [int] NOT NULL,
	[Percentage] [varchar](25) NOT NULL,
	[CreatedByName] [varchar](100) NULL,
	[CreatedOnDateTime] [datetime] NULL,
 CONSTRAINT [PK_ConfirmedSplit_Archive_Archive] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO