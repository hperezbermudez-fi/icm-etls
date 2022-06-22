:r .\tables\A120.sql
:r .\tables\A120_archive.sql

:r .\sps\usp_etl_A120.sql
:r .\sps\usp_pre_A120.sql

DECLARE @RecordID INT = 1;
DECLARE @FolderID INT = 19;

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
    ,'A120'
    ,'A120'
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
           ,'VCOMM_FIN_Accounts_All'
           ,'comm'
           ,'A120'
           ,'[comm].usp_pre'
           ,'[comm].usp_post'
           ,'[comm].usp_pre_a120' --Truncate the table
           ,'[comm].usp_post'
           ,'[comm].usp_etl_a120'
           ,'[comm].usp_pre_export'
           ,'[comm].usp_post_export'
           ,'Account'
           ,'Account_{ICMRunId}_yyyyMMdd_hhmmss.psv'
           ,NULL
           ,NULL
           ,NULL
           ,NULL)
GO