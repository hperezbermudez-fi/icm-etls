:r .\tables\C110.sql
:r .\tables\C110_archive.sql

:r .\sps\usp_etl_C110.sql
:r .\sps\usp_pre_C110.sql

DECLARE @RecordID INT = 5;
DECLARE @FolderID INT = 21;

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
    ,'C110'
    ,'C110'
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
           ,'VCOMM_FIN_AUM_Managed'
           ,'comm'
           ,'C110'
           ,'[comm].usp_pre'
           ,'[comm].usp_post'
           ,'[comm].usp_pre_c110' --Truncate the table
           ,'[comm].usp_post'
           ,'[comm].usp_etl_c110'
           ,'[comm].usp_pre_export'
           ,'[comm].usp_post_export'
           ,'AUM_FIN'
           ,'AUM_FIN_{ICMRunId}_yyyyMMdd_hhmmss.psv'
           ,NULL
           ,NULL
           ,NULL
           ,NULL)
GO