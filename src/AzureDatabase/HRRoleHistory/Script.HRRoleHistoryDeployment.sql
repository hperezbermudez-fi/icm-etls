:r .\tables\hr_role_history.sql
:r .\tables\hr_role_history_archive.sql

:r .\sps\usp_etl_hr_role_history.sql
:r .\sps\usp_pre_hr_role_history.sql

DECLARE @RecordID INT = 11;
DECLARE @FolderID INT = 17;

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
    ,'HRRoleHistory'
    ,'HRRoleHistory'
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
           ,'VCOMM_Salesperson_Data_All'
           ,'comm'
           ,'HRRoleHistory'
           ,'[comm].usp_pre'
           ,'[comm].usp_post'
           ,'[comm].usp_pre_hr_role_history' --Truncate the table
           ,'[comm].usp_post'
           ,'[comm].usp_etl_hr_role_history'
           ,'[comm].usp_pre_export'
           ,'[comm].usp_post_export'
           ,'EmployeeHistory'
           ,'EmployeeHistory_{ICMRunId}_yyyyMMdd_hhmmss.psv'
           ,NULL
           ,NULL
           ,NULL
           ,NULL)
GO