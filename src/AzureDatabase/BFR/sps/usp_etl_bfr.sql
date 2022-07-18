
-- =============================================
-- Author: Hardys Perez
-- Create Date: 07/14/2022
-- Description: Transform, output and archive BFR

CREATE PROCEDURE [comm].[usp_etl_bfr]
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
		DROP TABLE If Exists #TmpBFRArchive
 
		-- Populate temp table 
        SELECT  @ICMRunId AS ICMRunId,
                @RecordId AS RecordId,
				Trim([CID]) AS [Customer],
				CONVERT(VARCHAR, [RunDate], 101) AS [RunDate],
				CONVERT(VARCHAR, [QtrEndDate], 101) AS [MonthEnd],
				TRIM(STR([BillingRateAmount], 9, 5)) AS [BillingRateAmount],
				TRIM(@CreatedByName) AS CreatedByName,
                GETDATE() AS CreatedOnDateTime
		INTO #TmpBFRArchive
        FROM [comm].[BFR]

		-- Output transformed data (only selected columns)
        SELECT  [Customer],
				[MonthEnd],
				[RunDate],
				[dBillingRateAmount]
        From #TmpBFRArchive

		-- Archive Transformed Data
        INSERT INTO comm.BFR_Archive
		(
				[ICMRunId],
                [RecordId],
				[Customer],
				[MonthEnd],
				[RunDate],
				[dBillingRateAmount],
				[CreatedByName],
                [CreatedOnDateTime]
		)
        SELECT  [ICMRunId],
                [RecordId],
				[Customer],
				[MonthEnd],
				[RunDate],
				[dBillingRateAmount],
				[CreatedByName],
                [CreatedOnDateTime]
        FROM #TmpBFRArchive

		-- Remove Temp Table
        DROP TABLE #TmpBFRArchive
        COMMIT TRANSACTION

    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK;
        THROW
    END CATCH
END
GO


