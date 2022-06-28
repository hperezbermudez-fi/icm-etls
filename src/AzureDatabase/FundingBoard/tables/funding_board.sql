--[comm].[VCOMM_FundingBoard]

CREATE TABLE [comm].[FundingBoard](
	[OSP_Trim] [varchar](255) NULL,
	[OSPId] [varchar](255) NULL,
	[DateOSPId] [varchar](296) NOT NULL,
	[MTD] [float] NULL,
	[YTD] [float] NULL,
	[FYTD] [float] NULL,
	[AsOfDate] [datetime] NULL
);