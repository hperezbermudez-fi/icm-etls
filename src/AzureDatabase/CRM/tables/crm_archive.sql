﻿CREATE TABLE [comm].[CRM_Archive](
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
	[Country_CD] [varchar](4) NULL,
	[SourceID] [varchar](4000) NULL,
	[OID_LOA_Dt] varchar(50) NULL,
	[OID_FTD] varchar(50) NULL,
	[vchOSP] [varchar](400) NULL,
	[vchIC] [varchar](400) NULL,
	[Relationship_Value] varchar(50) NULL,
	[chResidentCountry] [varchar](4) NULL,
	[vchServiceCountry] [varchar](160) NULL,
	[E_Code_Dt] [varchar](4000) NULL,
	[ChgToFormerClient_Dt] varchar(50) NULL,
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
	[NonSecureEmail] [varchar](250) NULL,
	[CreatedBy] [varchar](100) NULL,
	[CreatedOnDateTime] [datetime] NULL,
	CONSTRAINT [PK_CRM_Archive] PRIMARY KEY ([Id])
) ON [PRIMARY]
GO