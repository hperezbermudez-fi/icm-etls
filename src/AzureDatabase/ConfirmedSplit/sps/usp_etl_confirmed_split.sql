
-- =============================================
-- Author: Hardys Perez
-- Create Date: 7/06/2022
-- Description: Transform, output and archive ConfimedSplits

CREATE PROCEDURE [comm].[usp_etl_confirmed_split]
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
		DROP TABLE If Exists #TmpConfirmedSplit
 
		-- Populate temp table 
        SELECT  @ICMRunId AS [ICMRunId],
                @RecordId AS [RecordId],
				[OnyxID] AS [ClientID],
				CONVERT(VARCHAR, [EffectiveDate], 101) AS [EffectiveDate],
				CONVERT(VARCHAR, [EffectiveEndDate], 101) AS [EffectiveEndDate],
				TRIM(STR([Percentage], 18, 2)) AS [Percentage],
				[EmployeeID],
				TRIM(@CreatedByName) AS CreatedByName,
                GETDATE() AS CreatedOnDateTime
		INTO #TmpConfirmedSplit
        FROM [comm].[ConfirmedSplit]

		-- Output transformed data (only selected columns)
        SELECT	ClientID,
				[EffectiveDate],
				[EffectiveEndDate],
				[EmployeeID],
				[Percentage]				
        From #TmpConfirmedSplit

		-- Archive Transformed Data
        INSERT INTO comm.ConfirmedSplit_Archive
        (
                [ICMRunId],
                [RecordId],
			    [ClientID],
			    [EffectiveDate],
			    [EffectiveEndDate],
			    [EmployeeID],
			    [Percentage],	
			    [CreatedByName],
                [CreatedOnDateTime]
        )
        SELECT  [ICMRunId],
                [RecordId],
				[ClientID],
				[EffectiveDate],
				[EffectiveEndDate],
				[EmployeeID],
				[Percentage],	
				[CreatedByName],
                [CreatedOnDateTime]
        FROM #TmpConfirmedSplit

		-- Remove Temp Table
        DROP TABLE #TmpConfirmedSplit
        COMMIT TRANSACTION

    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK;
        THROW
    END CATCH
END
GO


