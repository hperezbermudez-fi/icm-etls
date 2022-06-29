:r .\tables\fx_rates.sql
:r .\tables\fx_rates_archive.sql

:r .\sps\usp_etl_fx_rates.sql
:r .\sps\usp_pre_fx_rates.sql

DECLARE @RecordID INT = 10;
DECLARE @FolderID INT = 13;

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
    ,'FxRates'
    ,'FxRates'
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
           ,'COMM_FIN_FxRates_All'
           ,'comm'
           ,'FxRates'
           ,'[comm].usp_pre'
           ,'[comm].usp_post'
           ,'[comm].usp_pre_FxRates' --Truncate the table
           ,'[comm].usp_post'
           ,'[comm].usp_etl_FxRates'
           ,'[comm].usp_pre_export'
           ,'[comm].usp_post_export'
           ,'FxRates'
           ,'FxRates_{ICMRunId}_yyyyMMdd_hhmmss.psv'
           ,NULL
           ,NULL
           ,NULL
           ,NULL)
GO