:r .\tables\sales_board_osp.sql
:r .\tables\sales_board_osp_archive.sql

:r .\sps\usp_etl_sales_board_osp.sql
:r .\sps\usp_pre_sales_board_osp.sql

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
    ,'SalesBoardOSP'
    ,'SalesBoardOSP'
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
           ,'VCOMM_SalesBoardOSP'
           ,'comm'
           ,'SalesBoardOSP'
           ,'[comm].usp_pre'
           ,'[comm].usp_post'
           ,'[comm].usp_pre_sales_board_osp' --Truncate the table
           ,'[comm].usp_post'
           ,'[comm].usp_etl_sales_board_osp'
           ,'[comm].usp_pre_export'
           ,'[comm].usp_post_export'
           ,'SalesBoardOSP'
           ,'SalesBoardOSP_{ICMRunId}_yyyyMMdd_hhmmss.psv'
           ,NULL
           ,NULL
           ,NULL
           ,NULL)
GO