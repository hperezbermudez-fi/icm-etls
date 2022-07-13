:r .\tables\EAF.sql
:r .\tables\EAF_archive.sql

:r .\sps\usp_etl_EAF.sql
:r .\sps\usp_pre_EAF.sql

DECLARE @RecordID INT = 8;
DECLARE @FolderID INT = 27;

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
    ,'EAF'
    ,'EAF'
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
           ,'VCOMM_EAF'
           ,'comm'
           ,'EAF'
           ,'[comm].usp_pre'
           ,'[comm].usp_post'
           ,'[comm].usp_pre_EAF' --Truncate the table
           ,'[comm].usp_post'
           ,'[comm].usp_etl_EAF'
           ,'[comm].usp_pre_export'
           ,'[comm].usp_post_export'
           ,'EAF'
           ,'EAF_{ICMRunId}_yyyyMMdd_hhmmss.psv'
           ,NULL
           ,NULL
           ,NULL
           ,NULL)
GO