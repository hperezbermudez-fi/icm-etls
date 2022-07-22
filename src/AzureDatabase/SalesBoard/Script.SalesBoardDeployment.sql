:r .\tables\sales_board.sql
:r .\tables\sales_board_archive.sql

:r .\sps\usp_etl_sales_board.sql
:r .\sps\usp_pre_sales_board.sql

DECLARE @RecordID INT = 18;
DECLARE @FolderID INT = 30;

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
    ,'SalesBoard'
    ,'SalesBoard'
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
           ,'VCOMM_SalesBoardAE'
           ,'comm'
           ,'SalesBoard'
           ,'[comm].usp_pre'
           ,'[comm].usp_post'
           ,'[comm].usp_pre_sales_board' --Truncate the table
           ,'[comm].usp_post'
           ,'[comm].usp_etl_sales_board'
           ,'[comm].usp_pre_export'
           ,'[comm].usp_post_export'
           ,'SalesBoard_FIIG'
           ,'SalesBoard_FIIG_{ICMRunId}_yyyyMMdd_hhmmss.psv'
           ,NULL
           ,NULL
           ,NULL
           ,NULL)
GO