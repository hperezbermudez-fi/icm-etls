--Comm.COMM_CRM_Relationship_Details_All

CREATE TABLE [comm].[CRM](
	[OnyxID] [varchar](18) NOT NULL,
	[fi_SalutationLetter] [varchar](220) NULL,
	[FirstName] [varchar](100) NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](100) NULL,
	[Suffix] [varchar](60) NULL,
	[Client_Name] [varchar](255) NULL,
	[User_Type] [varchar](4000) NULL,
	[User_SubType] [varchar](4000) NULL,
	[vchOSP] [varchar](400) NULL,
	[E_Code_Dt] [varchar](4000) NULL
) ON [PRIMARY]
GO
