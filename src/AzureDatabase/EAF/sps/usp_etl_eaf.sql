
-- =============================================
-- Author: Hardys Perez
-- Create Date: 07/13/2022
-- Description: Transform, output and archive EAF

CREATE PROCEDURE [comm].[usp_etl_eaf]
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
		DROP TABLE If Exists #TmpEAFArchive
 
		-- Populate temp table 
        SELECT  @ICMRunId AS ICMRunId,
                @RecordId AS RecordId,
				Trim([RecordID]) AS [RecordIDKey],
				Trim([vchFinNo]) AS [CID],
				Trim([RunType]) AS [RunType],
				CONVERT(VARCHAR, [RunDate], 101) AS [RunDate],
				CONVERT(VARCHAR, [QtrEndDate], 101) AS [MonthEnd],
				TRIM(STR([BillingRateAmount], 9, 5)) AS [BillingRateAmount],
				TRIM(@CreatedByName) AS CreatedByName,
                GETDATE() AS CreatedOnDateTime
		INTO #TmpEAFArchive
        FROM [comm].[EAF]

		-- Output transformed data (only selected columns)
        SELECT  [RecordIDKey] AS [RecordID],
				[CID],
				[MonthEnd],
				[RunDate],
				[RunType],
				[dBillingRateAmount]
        From #TmpEAFArchive

		-- Archive Transformed Data
        INSERT INTO comm.EAF_Archive
		(
				[ICMRunId],
                [RecordId],
				[RecordIDKey],
				[CID],
				[MonthEnd],
				[RunDate],
				[RunType],
				[dBillingRateAmount],
				[CreatedByName],
                [CreatedOnDateTime]
		)
        SELECT  [ICMRunId],
                [RecordId],
				[RecordIDKey],
				[CID],
				[MonthEnd],
				[RunDate],
				[RunType],
				[dBillingRateAmount],
				[CreatedByName],
                [CreatedOnDateTime]
        FROM #TmpEAFArchive

		-- Remove Temp Table
        DROP TABLE #TmpEAFArchive
        COMMIT TRANSACTION

    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK;
        THROW
    END CATCH
END
GO


