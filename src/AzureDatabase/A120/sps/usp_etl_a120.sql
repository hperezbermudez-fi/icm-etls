
-- =============================================
-- Author: Hardys Perez
-- Create Date: 6/21/2022
-- Description: Transform, output and archive A120

CREATE PROCEDURE [comm].[usp_etl_a120]
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
		DROP TABLE If Exists #TmpA120Archive
 
		-- Populate temp table 
        SELECT  @ICMRunId AS ICMRunId,
                @RecordId AS RecordId,
				TRIM([FIN]) AS [FIN],
				[ai_fin_acct_no],
				TRIM([Short_Name]) AS [Short_Name],
				TRIM([FIN_Status]) AS [FIN_Status],
				TRIM([OSP_CD]) AS [OSP_CD],
				CONVERT(VARCHAR, [LOA_Dt], 101) AS [LOA_Dt],
				CONVERT(VARCHAR, [Open_Dt], 101) AS [Open_Dt],
				--Missing FirstTradeDate
				CONVERT(VARCHAR, [IPD], 101) AS [IPD],
				CONVERT(VARCHAR, [TERM_Dt], 101) AS [TERM_Dt],
				CONVERT(VARCHAR, [Close_Dt], 101) AS [Close_Dt],
				CONVERT(VARCHAR, [Reconcile_Dt], 101) AS [Reconcile_Dt],
				CONVERT(VARCHAR, [Created_Dt], 101) AS [Created_Dt],
				TRIM([AA_Flag]) AS [AA_Flag],
				TRIM([Base]) AS [Base],
				TRIM([Fee_CD]) AS [Fee_CD],
				TRIM([FI_Company_ID]) AS [FI_Company_ID],
				TRIM([Reporting_Country]) AS [Reporting_Country],
				TRIM([Resident_Country]) AS [Resident_Country],
				TRIM([Taxing_Country]) AS [Taxing_Country],
				TRIM([Acct_Class]) AS [Acct_Class],
				TRIM(@CreatedByName) AS CreatedByName,
                GETDATE() AS CreatedOnDateTime
		INTO #TmpA120Archive
        FROM [comm].[A120]

		-- Output transformed data (only selected columns)
        SELECT  [FIN],
				[ai_fin_acct_no],
				[Short_Name],
				[FIN_Status],
				[OSP_CD],
				[LOA_Dt],
				[Open_Dt],
				--Missing FirstTradeDate
				[IPD],
				[TERM_Dt],
				[Close_Dt],
				[Reconcile_Dt],
				[Created_Dt],
				[AA_Flag],
				[Base],
				[Fee_CD],
				[FI_Company_ID],
				[Reporting_Country],
				[Resident_Country],
				[Taxing_Country],
				[Acct_Class]
        From #A120CRMArchive

		-- Archive Transformed Data
        INSERT INTO comm.A120_Archive
        SELECT  [ICMRunId],
                [RecordId],
				[FIN],
				[ai_fin_acct_no],
				[Short_Name],
				[FIN_Status],
				[OSP_CD],
				[LOA_Dt],
				[Open_Dt],
				--Missing FirstTradeDate
				[IPD],
				[TERM_Dt],
				[Close_Dt],
				[Reconcile_Dt],
				[Created_Dt],
				[AA_Flag],
				[Base],
				[Fee_CD],
				[FI_Company_ID],
				[Reporting_Country],
				[Resident_Country],
				[Taxing_Country],
				[Acct_Class]
				[CreatedByName],
                [CreatedOnDateTime]
        FROM #TmpA120Archive

		-- Remove Temp Table
        DROP TABLE #TmpA120Archive
        COMMIT TRANSACTION

    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK;
        THROW
    END CATCH
END
GO


