:r .\tables\hrer.sql
:r .\tables\hrer_archive.sql

:r .\sps\usp_etl_hrer.sql
:r .\sps\usp_pre_hrer.sql

DECLARE @RecordID INT = 12;
DECLARE @FolderID INT = 16;

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
    ,'HRER'
    ,'HRER'
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
           ,'VWCommisionsDBWorkers'
           ,'comm'
           ,'HRER'
           ,'[comm].usp_pre'
           ,'[comm].usp_post'
           ,'[comm].usp_pre_hrer' --Truncate the table
           ,'[comm].usp_post'
           ,'[comm].usp_etl_hrer'
           ,'[comm].usp_pre_export'
           ,'[comm].usp_post_export'
           ,'Employee'
           ,'Employee_{ICMRunId}_yyyyMMdd_hhmmss.psv'
           ,NULL
           ,NULL
           ,NULL
           ,NULL)
GO