:r .\tables\appointment.sql
:r .\tables\appointment_archive.sql

:r .\sps\usp_etl_appointment.sql
:r .\sps\usp_pre_appointment.sql

DECLARE @RecordID INT = 2;
DECLARE @FolderID INT = 22;

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
    ,'Appointment'
    ,'Appointment'
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
           ,'COMM_Topaz_Appointments_All'
           ,'comm'
           ,'Appointment'
           ,'[comm].usp_pre'
           ,'[comm].usp_post'
           ,'[comm].usp_pre_appointment' --Truncate the table
           ,'[comm].usp_post'
           ,'[comm].usp_etl_appointment'
           ,'[comm].usp_pre_export'
           ,'[comm].usp_post_export'
           ,'Appointment'
           ,'Appointment_{ICMRunId}_yyyyMMdd_hhmmss.psv'
           ,NULL
           ,NULL
           ,NULL
           ,NULL)
GO