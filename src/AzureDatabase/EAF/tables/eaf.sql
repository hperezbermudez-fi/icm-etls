--CREATE VIEW  [comm].[VCOMM_EAF] 

CREATE Table [comm].[EAF](  
	 [RecordId]  [nvarchar](150) not null,
	 [vchFinNo] [nvarchar](32) null,
	 [RunDate] [date] null, 
	 [RunType] [char](3) null,
	 [BillingRateAmount][float] null,
	 [QtrEndDate] [date] null,
	 [CreatedBy] [varchar](150) null,
 CONSTRAINT [PK_EAF] PRIMARY KEY CLUSTERED 
(
	[RecordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
