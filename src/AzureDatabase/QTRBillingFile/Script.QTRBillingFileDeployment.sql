:r .\tables\qtr_billing_file.sql
:r .\tables\qtr_billing_file_archive.sql

:r .\sps\usp_etl_qtr_billing_file.sql
:r .\sps\usp_pre_qtr_billing_file.sql

DECLARE @RecordID INT = 14;
DECLARE @FolderID INT = 31;

INSERT INTO [comm].[VaricentApiConfiguration]
(
    [RecordId]
    ,[FileType]
    ,[FolderName]
    ,[FolderId]
)
VALUES
(
    @RecordID
    ,'QTRBillingFile'
    ,'QTRBillingFile'
    ,@FolderID
)

INSERT INTO [comm].[ConfigOnAzure]
           ([RecordId]
           ,[OnPremSchemaName]
           ,[OnPremViewName]
           ,[AzureSchemaName]
           ,[AzureTableName]
           ,[PreOnPremSP]
           ,[PostOnPremSP]
           ,[PreAzureSP]
           ,[PostAzureSP]
           ,[ExportSP]
           ,[PreExportSP]
           ,[PostExportSP]
           ,[ExportedFileNamePrefix]
           ,[ExportedFileNamePattern]
           ,[ProcessStatus]
           ,[LastRunId]
           ,[StartTime]
           ,[LastProcessedTime])
     VALUES
           (@RecordID
           ,'comm'
           ,'VCOMM110_Commissions_Extract'
           ,'comm'
           ,'QTRBillingFile'
           ,'[comm].usp_pre'
           ,'[comm].usp_post'
           ,'[comm].usp_pre_qtr_billing_file' --Truncate the table
           ,'[comm].usp_post'
           ,'[comm].usp_etl_qtr_billing_file'
           ,'[comm].usp_pre_export'
           ,'[comm].usp_post_export'
           ,'QTRBillingFile'
           ,'QTRBillingFile_{ICMRunId}_yyyyMMdd_hhmmss.psv'
           ,NULL
           ,NULL
           ,NULL
           ,NULL)
GO