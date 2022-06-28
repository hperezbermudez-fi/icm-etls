:r .\tables\funding_board.sql
:r .\tables\funding_board_archive.sql

:r .\sps\usp_etl_funding_board.sql
:r .\sps\usp_pre_funding_board.sql

DECLARE @RecordID INT = 9;
DECLARE @FolderID INT = 29;

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
    ,'FundingBoard'
    ,'FundingBoard'
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
           ,'VCOMM_FundingBoard'
           ,'comm'
           ,'FundingBoard'
           ,'[comm].usp_pre'
           ,'[comm].usp_post'
           ,'[comm].usp_pre_funding_board' --Truncate the table
           ,'[comm].usp_post'
           ,'[comm].usp_etl_funding_board'
           ,'[comm].usp_pre_export'
           ,'[comm].usp_post_export'
           ,'FundingBoard'
           ,'FundingBoard_{ICMRunId}_yyyyMMdd_hhmmss.psv'
           ,NULL
           ,NULL
           ,NULL
           ,NULL)
GO