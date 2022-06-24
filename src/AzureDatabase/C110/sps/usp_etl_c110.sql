
-- =============================================
-- Author: Hardys Perez
-- Create Date: 6/22/2022
-- Description: Transform, output and archive C110

CREATE PROCEDURE [comm].[usp_etl_c110]
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
		DROP TABLE If Exists #TmpC110Archive
 
		-- Populate temp table 
        SELECT  @ICMRunId AS ICMRunId,
                @RecordId AS RecordId,
				TRIM([RecordID]) AS RecordIDKey,
				TRIM([FIN]) AS FIN,
				CONVERT(VARCHAR, [valuation_dt], 101) AS [valuation_dt],
 				TRIM(STR([Base_MV_AUM], 9, 5)) AS [Base_MV_AUM],
				TRIM(STR([Base_MV_overall], 9, 5)) AS [Base_MV_overall],
				TRIM(STR([Base_MV_cash], 9, 5)) AS [Base_MV_cash],
				TRIM(@CreatedByName) AS CreatedByName,
                GETDATE() AS CreatedOnDateTime
		INTO #TmpC110Archive
        FROM [comm].[C110]

		-- Output transformed data (only selected columns)
        SELECT  [RecordIDKey] AS RecordID,
				[FIN],
				[valuation_dt],
 				[Base_MV_AUM],
				[Base_MV_overall],
				[Base_MV_cash]
        From #TmpC110Archive

		-- Archive Transformed Data
        INSERT INTO comm.C110_Archive
        SELECT  [ICMRunId],
                [RecordId],
				[RecordIDKey],
				[FIN],
				[valuation_dt],
 				[Base_MV_AUM],
				[Base_MV_overall],
				[Base_MV_cash]
				[CreatedByName],
                [CreatedOnDateTime]
        FROM #TmpC110Archive

		-- Remove Temp Table
        DROP TABLE #TmpC110Archive
        COMMIT TRANSACTION

    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK;
        THROW
    END CATCH
END
GO


