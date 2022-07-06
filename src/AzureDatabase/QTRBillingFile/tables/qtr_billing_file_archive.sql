
CREATE TABLE [comm].[QTRBillingFile_Archive](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ICMRunId] [int] NULL,
	[RecordId] [int] NULL,
	[FIN] [varchar](20) NULL,
	[CID] [varchar](32) NULL,
	[BUSINESSUNITID] [varchar](32) NULL,
	[INVOICEID] [varchar](40) NULL,
	[GENERATEDINVOICEID] [varchar](40) NOT NULL,
	[GENERATEDDATE] [varchar](50) NOT NULL,
	[STARTDATE] [varchar](50) NOT NULL,
	[ENDDATE] [varchar](50) NOT NULL,
	[INVOICEDATE] [varchar](50) NOT NULL,
	[BILLINGGROUPNAME] [varchar](64) NULL,
	[BASE_ISOCURRENCYCODE] [char](3) NOT NULL,
	[FEETYPENAME] [varchar](60) NOT NULL,
	[CONTRIBWITHDRAWFLAG] [varchar](1) NULL,
	[Remit_Amt] [varchar](40) NULL,
	[Total_Input_Amount] [varchar](40) NULL,
	[WORKFLOWSTATUS] [varchar](64) NULL,
	[Report_Filter_Start] [varchar](50) NULL,
	[Report_Filter_End] [varchar](50) NULL,
	[SOURCE] [varchar](256) NULL,
	[CreatedByName] [varchar](100) NULL,
	[CreatedOnDateTime] [datetime] NULL,
 CONSTRAINT [PK_QTRBillingFile_Archive_Archive] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO