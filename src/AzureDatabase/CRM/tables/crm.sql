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
	[Country_CD] [varchar](4) NULL,
	[SourceID] [varchar](4000) NULL,
	[OID_LOA_Dt] [datetime] NULL,
	[OID_FTD] [datetime] NULL,
	[vchOSP] [varchar](400) NULL,
	[vchIC] [varchar](400) NULL,
	[Relationship_Value] [money] NULL,
	[chResidentCountry] [varchar](4) NULL,
	[vchServiceCountry] [varchar](160) NULL,
	[E_Code_Dt] [varchar](4000) NULL,
	[ChgToFormerClient_Dt] [datetime] NULL,
	[IRIS_EnvelopeSalutation] [varchar](100) NULL,
	[IRIS_LetterSalutation] [varchar](220) NULL,
	[AOR_Address1] [varchar](4000) NULL,
	[AOR_Address2] [varchar](4000) NULL,
	[AOR_Address3] [varchar](4000) NULL,
	[AOR_City] [varchar](4000) NULL,
	[AOR_Region] [varchar](4000) NULL,
	[AOR_PostCode] [varchar](50) NULL,
	[AOR_Country] [varchar](4000) NULL,
	[SecureEmail] [varchar](250) NULL,
	[NonSecureEmail] [varchar](250) NULL
	,CONSTRAINT [PK_CRM] PRIMARY KEY ([OnyxID])
) ON [PRIMARY]
GO
