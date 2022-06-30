--[comm].[COMM110_Commissions_Extract]

CREATE TABLE [comm].[QTRBillingFile]
(
	[FIN] [varchar](20) NULL,
	[CID] [varchar](32) NULL,
	[BUSINESSUNITID] [varchar](32) NULL,
	[INVOICEID] [numeric](18, 0) NULL,
	[GENERATEDINVOICEID] [varchar](40) NOT NULL,
	[GENERATEDDATE] [datetime] NOT NULL,
	[STARTDATE] [datetime] NOT NULL,
	[ENDDATE] [datetime] NOT NULL,
	[INVOICEDATE] [datetime] NOT NULL,
	[BILLINGGROUPNAME] [varchar](64) NULL,
	[BASE_ISOCURRENCYCODE] [char](3) NOT NULL,
	[FEETYPENAME] [varchar](60) NOT NULL,
	[CONTRIBWITHDRAWFLAG] [bit] NULL,
	[Remit_Amt] [numeric](38, 2) NULL,
	[Total_Input_Amount] [numeric](38, 2) NULL,
	[WORKFLOWSTATUS] [varchar](64) NULL,
	[Report_Filter_Start] [datetime] NULL,
	[Report_Filter_End] [datetime] NULL,
	[SOURCE] [varchar](256) NULL,
) ON [PRIMARY]