CREATE TABLE [comm].[CRM_Archive](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ICMRunId] [int] NULL,
	[RecordId] [int] NULL,
	[OnyxID] [varchar](18),
	[fi_SalutationLetter] [varchar](220) NULL,
	[FirstName] [varchar](100) NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](100) NULL,
	[Suffix] [varchar](60) NULL,
	[Client_Name] [varchar](255) NULL,
	[User_Type] [varchar](4000) NULL,
	[User_SubType] [varchar](4000) NULL,
	[vchOSP] [varchar](400) NULL,
	[E_Code_Dt] [varchar](4000) NULL,
 	[CreatedBy] [varchar](100) NULL,
	[CreatedOnDateTime] [datetime] NULL,
	CONSTRAINT [PK_CRM_Archive] PRIMARY KEY ([Id])
) ON [PRIMARY]
GO
