:r .\tables\BFR.sql
:r .\tables\BFR_archive.sql

:r .\sps\usp_etl_BFR.sql
:r .\sps\usp_pre_BFR.sql

DECLARE @RecordID INT = 4;
DECLARE @FolderID INT = 28;

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
    ,'BFR'
    ,'BFR'
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
           ,'VCOMM_BFR'
           ,'comm'
           ,'BFR'
           ,'[comm].usp_pre'
           ,'[comm].usp_post'
           ,'[comm].usp_pre_BFR' --Truncate the table
           ,'[comm].usp_post'
           ,'[comm].usp_etl_BFR'
           ,'[comm].usp_pre_export'
           ,'[comm].usp_post_export'
           ,'BFR'
           ,'BFR_{ICMRunId}_yyyyMMdd_hhmmss.psv'
           ,NULL
           ,NULL
           ,NULL
           ,NULL)
GO