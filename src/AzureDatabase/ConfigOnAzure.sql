CREATE TABLE [dbo].[ConfigOnAzure](
	[RecordId] [int] NOT NULL,
	[OnPremSchemaName] [varchar](50) NULL,
	[OnPremViewName] [varchar](50) NULL,
	[AzureSchemaName] [varchar](50) NULL,
	[AzureTableName] [varchar](50) NULL,
	[PreOnPremSP] [varchar](50) NULL,
	[PostOnPremSP] [varchar](50) NULL,
	[PreAzureSP] [varchar](50) NULL,
	[PostAzureSP] [varchar](50) NULL,
	[ExportSP] [varchar](50) NULL,
	[PreExportSP] [varchar](50) NULL,
	[PostExportSP] [varchar](50) NULL,
	[ExportedFileNamePrefix] [varchar](100) NULL,
	[ExportedFileNamePattern] [varchar](100) NULL,
	[ProcessStatus] [int] NULL,
	[LastRunId] [int] NULL,
	[StartTime] [datetime] NULL,
	[LastProcessedTime] [datetime] NULL,
 CONSTRAINT [PK_ConfigOnAzure] PRIMARY KEY CLUSTERED 
(
	[RecordId] ASC
)
) ON [PRIMARY]
GO