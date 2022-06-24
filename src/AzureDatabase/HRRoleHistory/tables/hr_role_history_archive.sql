CREATE TABLE [comm].[HRRoleHistory_Archive](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ICMRunId] [int] NULL,
	[RecordId] [int] NULL,
	[PayeeID] [int] NULL,
	[Role] varchar(50) NULL,
	[EffectiveStartDate] varchar(50) NULL,
	[EffectiveEndDate] varchar(50) NULL,
	[SalesStartDate] varchar(50) NULL,
	[CreatedBy] [varchar](100) NULL,
	[CreatedOnDateTime] [datetime] NULL,
	CONSTRAINT [PK_HR_Role_History_Archive] PRIMARY KEY ([Id])
) ON [PRIMARY]
GO
