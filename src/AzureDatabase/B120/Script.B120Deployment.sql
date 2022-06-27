:r .\tables\B120.sql
:r .\tables\B120_archive.sql

:r .\sps\usp_etl_B120.sql
:r .\sps\usp_pre_B120.sql

DECLARE @RecordID INT = 3;
DECLARE @FolderID INT = 20;

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
    ,'B120'
    ,'B120'
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
           ,'VCOMM_FIN_Transactions_Managed'
           ,'comm'
           ,'B120'
           ,'[comm].usp_pre'
           ,'[comm].usp_post'
           ,'[comm].usp_pre_b120' --Truncate the table
           ,'[comm].usp_post'
           ,'[comm].usp_etl_b120'
           ,'[comm].usp_pre_export'
           ,'[comm].usp_post_export'
           ,'Transaction'
           ,'Transaction_{ICMRunId}_yyyyMMdd_hhmmss.psv'
           ,NULL
           ,NULL
           ,NULL
           ,NULL)
GO