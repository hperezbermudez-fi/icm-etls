-- =============================================
-- Author: Baiju Nagori
-- Create Date: 6/7/2022
-- Description: Transform, output and archive FxRates



-- EXEC [comm].[usp_Etl_FxRates] @ICMRunId = 1, @RecordId = 1
-- =============================================
CREATE PROCEDURE [comm].[usp_Etl_FxRates]
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

		DROP TABLE If Exists #FxRatesArchive

		-- Create temporary table to hold transformed data
        CREATE TABLE #FxRatesArchive
        (
            [ICMRunId] [int],
            [RecordId] [int],
            [From] [varchar](50),
            [To] [varchar](50),
            [Date] [varchar](50),
            [Rate] [varchar](50),
            CreatedOnDateTime datetime
        )


		-- Populate temp table 
        INSERT INTO #FxRatesArchive
        SELECT @ICMRunId,
               @RecordId,
               TRIM([FxFrom]) AS [From],
               TRIM([FxTo]) AS [To],
               CONVERT(VARCHAR, [FxDate], 101) AS [Date],
               TRIM(STR([FxRate], 9, 5)) AS [Rate],
               GETDATE() AS CreatedOnDateTime
        FROM [comm].[FxRates]



		-- Output transformed data (only selected columns)
        SELECT [From],
               [To],
               [Date],
               [Rate]
        From #FxRatesArchive


		-- Archive Transformed Data
        INSERT INTO comm.FxRates_Archive
        (
            ICMRunId,
            RecordId,
            [From],
            [To],
            [Date],
            Rate,
            CreatedByName,
            CreatedOnDateTime
        )
        SELECT @ICMRunId,
               @RecordId,
               [From],
               [To],
               [Date],
               [Rate],
               @CreatedByName,
               CreatedOnDateTime
        FROM #FxRatesArchive


		-- Remove Temp Table
        DROP TABLE #FxRatesArchive



        COMMIT TRANSACTION



    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK;
        THROW
    END CATCH




END
GO


