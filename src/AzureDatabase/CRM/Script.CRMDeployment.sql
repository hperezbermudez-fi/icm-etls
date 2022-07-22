:r .\tables\crm.sql
:r .\tables\crm_archive.sql

:r .\sps\usp_etl_crm.sql
:r .\sps\usp_post_crm.sql
:r .\sps\usp_post_export_crm.sql
:r .\sps\usp_pre_crm.sql
:r .\sps\usp_pre_export_crm.sql

INSERT INTO [comm].[VaricentApiConfiguration]
    (
    [RecordId]
    ,[FileType]
    ,[FolderName]
    ,[FolderId]
    )
    VALUES
        (
            7
            ,'CRM'
            ,'CRM'
            ,23
        )
GO

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
           (7
           ,'comm'
           ,'COMM_CRM_Relationship_Details_All'
           ,'comm'
           ,'crm'
           ,'[comm].usp_pre_crm'
           ,'[comm].usp_post_crm'
           ,'[comm].usp_pre_crm'
           ,'[comm].usp_post_crm'
           ,'[comm].usp_etl_crm'
           ,'[comm].usp_pre_export_crm'
           ,'[comm].usp_post_export_crm'
           ,'CRM_FIIG'
           ,'CRM_FIIG_{ICMRunId}_yyyyMMdd_hhmmss.psv'
           ,NULL
           ,NULL
           ,NULL
           ,NULL)
GO