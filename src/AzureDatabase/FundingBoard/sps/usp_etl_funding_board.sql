
-- =============================================
-- Author: Hardys Perez
-- Create Date: 6/28/2022
-- Description: Transform, output and archive FundingBoard

CREATE PROCEDURE [comm].[usp_etl_funding_board]
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
		DROP TABLE If Exists #TmpFundingBoard
 
		-- Populate temp table 
        SELECT  @ICMRunId AS ICMRunId,
                @RecordId AS RecordId,
				TRIM([OSPId]) AS [OSP ID],
				CONVERT(VARCHAR, [AsOfDate], 101) AS [Report Date],
				TRIM(STR([MTD], 9, 5)) AS [MTD],
				TRIM(STR([YTD], 9, 5)) AS [YTD],
				TRIM(STR([FYTD], 9, 5)) AS [FYTD],
				TRIM(@CreatedByName) AS CreatedByName,
                GETDATE() AS CreatedOnDateTime
		INTO #TmpFundingBoard
        FROM [comm].[FundingBoard]

		-- Output transformed data (only selected columns)
        SELECT  [OSP ID],
				[Report Date],
				[MTD],
				[YTD],
				[FYTD]
        From #TmpFundingBoard

		-- Archive Transformed Data
        INSERT INTO comm.FundingBoard_Archive
        (
                [ICMRunId],
                [RecordId],
				[OSP ID],
				[Report Date],
				[MTD],
				[YTD],
				[FYTD],
				[CreatedByName],
                [CreatedOnDateTime]
        )
        SELECT  [ICMRunId],
                [RecordId],
				[OSP ID],
				[Report Date],
				[MTD],
				[YTD],
				[FYTD],
				[CreatedByName],
                [CreatedOnDateTime]
        FROM #TmpFundingBoard

		-- Remove Temp Table
        DROP TABLE #TmpFundingBoard
        COMMIT TRANSACTION

    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK;
        THROW
    END CATCH
END
GO


