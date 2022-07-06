
-- =============================================
-- Author: Hardys Perez
-- Create Date: 6/16/2022
-- Description: Transform, output and archive HR Role History

CREATE PROCEDURE [comm].[usp_etl_hr_role_history]
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
		DROP TABLE If Exists #TmpHRRoleHistory
 
		-- Populate temp table 
        SELECT  @ICMRunId AS [ICMRunId],
                @RecordId AS [RecordId],
				CAST([SP_UserId] AS Int) AS [PayeeID],
				TRIM([SP_Role]) AS [Role],
				CONVERT(VARCHAR, [SP_Role_StartDt], 101) AS [EffectiveStartDate],
				CONVERT(VARCHAR, [SP_Role_EndDt], 101) AS [EffectiveEndDate],
				CONVERT(VARCHAR, [SP_StartDt], 101) AS [SalesStartDate],
				TRIM(@CreatedByName) AS CreatedByName,
                GETDATE() AS CreatedOnDateTime
		INTO #TmpHRRoleHistory
        FROM [comm].[HRRoleHistory]

		-- Output transformed data (only selected columns)
        SELECT   
				[PayeeID],
				[Role],
				[EffectiveStartDate],
				[EffectiveEndDate],
				[SalesStartDate]
        From #TmpHRRoleHistory

		-- Archive Transformed Data
        INSERT INTO comm.HRRoleHistory_Archive
        (
                [ICMRunId],
                [RecordId],
				[PayeeID],
				[Role],
				[EffectiveStartDate],
				[EffectiveEndDate],
				[SalesStartDate],
				[CreatedByName],
                [CreatedOnDateTime]
        )
        SELECT  [ICMRunId],
                [RecordId],
				[PayeeID],
				[Role],
				[EffectiveStartDate],
				[EffectiveEndDate],
				[SalesStartDate],
				[CreatedByName],
                [CreatedOnDateTime]
        FROM #TmpHRRoleHistory

		-- Remove Temp Table
        DROP TABLE #TmpHRRoleHistory
        COMMIT TRANSACTION

    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK;
        THROW
    END CATCH
END
GO


