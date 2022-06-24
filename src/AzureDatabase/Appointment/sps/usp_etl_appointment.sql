
-- =============================================
-- Author: Hardys Perez
-- Create Date: 6/23/2022
-- Description: Transform, output and archive Appointment

CREATE PROCEDURE [comm].[usp_etl_appointment]
(
    @ICMRunId INT,
    @RecordId INT
)
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @ErrorSeverity NVARCHAR(1000)
    DECLARE @ErrorState NVARCHAR(1000)
    DECLARE @CreatedByName NVARCHAR(155)

    SET @CreatedByName = SYSTEM_USER
    BEGIN TRY
        BEGIN TRANSACTION
		DROP TABLE If Exists #TmpAppoinmentArchive
 
		-- Populate temp table 
        SELECT  @ICMRunId AS [ICMRunId],
                @RecordId AS [RecordId],
				[Onyx_id],
				[App_id],
				TRIM([OSP_ID]) AS [OSP_ID],
				TRIM([SetupBy_ID]) AS [SetupBy_ID],
				CONVERT(VARCHAR, [Entry_date], 101) AS [Entry_date],
				CONVERT(VARCHAR, [Set_date], 101) AS [Set_date],
				CONVERT(VARCHAR, [App_Date], 101) AS [App_Date],
				TRIM([App_status_cd]) AS  [App_status_cd],
				TRIM([App_status]) AS [App_status],
				TRIM([App_type_cd]) AS [App_type_cd],
				TRIM([App_type]) AS [App_type],
				[Accepted_flag],
				[Aetl_approved],
				[Aatl_id],
				[Origination_id],
				[Rule_id],
				TRIM([Origination_Type]) AS [Origination_Type],
				TRIM([Origination_Code]) AS [Origination_Code],
                CONVERT(VARCHAR, [MovedToHeld_Dt], 101) AS [MovedToHeld_Dt],
				TRIM(@CreatedByName) AS CreatedByName,
                GETDATE() AS CreatedOnDateTime
		INTO #TmpAppoinmentArchive
        FROM [comm].[Appointment]

		-- Output transformed data (only selected columns)
        SELECT  [Onyx_id],
				[App_id],
				[OSP_ID],
				[SetupBy_ID],
				[Entry_date],
				[Set_date],
				[App_Date],
				[App_status_cd],
				[App_status],
				[App_type_cd],
				[App_type],
				[Accepted_flag],
				[Aetl_approved],
				[Aatl_id],
				[Origination_id],
				[Rule_id],
				[Origination_Type],
				[Origination_Code],
                [MovedToHeld_Dt]
        From #TmpAppoinmentArchive

		-- Archive Transformed Data
        INSERT INTO comm.Appointment_Archive
        SELECT  [ICMRunId],
                [RecordId],
				[Onyx_id],
				[App_id],
				[OSP_ID],
				[SetupBy_ID],
				[Entry_date],
				[Set_date],
				[App_Date],
				[App_status_cd],
				[App_status],
				[App_type_cd],
				[App_type],
				[Accepted_flag],
				[Aetl_approved],
				[Aatl_id],
				[Origination_id],
				[Rule_id],
				[Origination_Type],
				[Origination_Code],
                [MovedToHeld_Dt],
                [CreatedOnDateTime]
        FROM #TmpAppoinmentArchive

		-- Remove Temp Table
        DROP TABLE #TmpAppoinmentArchive
        COMMIT TRANSACTION

    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK;
        THROW
    END CATCH
END
GO


