:r .\tables\confirmed_split.sql
:r .\tables\confirmed_split_archive.sql

:r .\sps\usp_etl_confirmed_split.sql
:r .\sps\usp_confirmed_split.sql

DECLARE @RecordID INT = 14;
DECLARE @FolderID INT = 6;

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
    ,'ConfirmedSplit'
    ,'ConfirmedSplit'
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
           ,'VcsuSplits'
           ,'comm'
           ,'ConfirmedSplit'
           ,'[comm].usp_pre'
           ,'[comm].usp_post'
           ,'[comm].usp_pre_confirmed_split' --Truncate the table
           ,'[comm].usp_post'
           ,'[comm].usp_etl_confirmed_split'
           ,'[comm].usp_pre_export'
           ,'[comm].usp_post_export'
           ,'ConfirmedSplit'
           ,'ConfirmedSplit_{ICMRunId}_yyyyMMdd_hhmmss.psv'
           ,NULL
           ,NULL
           ,NULL
           ,NULL)
GO