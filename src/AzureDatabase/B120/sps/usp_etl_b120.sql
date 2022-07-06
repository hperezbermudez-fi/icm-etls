
-- =============================================
-- Author: Hardys Perez
-- Create Date: 6/27/2022
-- Description: Transform, output and archive A120

CREATE PROCEDURE [comm].[usp_etl_b120]
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
		DROP TABLE If Exists #TmpB120Archive
 
		-- Populate temp table 
        SELECT  @ICMRunId AS ICMRunId,
                @RecordId AS RecordId,
				TRIM([transaction_reference_number]) AS [TxnID],
				'' AS [Txn_Source],
				TRIM([Acct_Type]) AS [Acct_Type],
				TRIM([FIN]) AS [FIN],
				TRIM([Trans_Code]) AS [Trans_Code],
				TRIM([Trans_Curr]) AS [Trans_Curr],
				'' AS [TransFxRate],
				'' AS [FxRate],
				CONVERT(VARCHAR, [Trans_Date], 101) AS [Trans_Date],
				TRIM(STR([Trans_Amt_Net], 9, 5)) AS [Trans_Amt_Net],
				TRIM(STR([Internal_Trans], 9, 5)) AS [Internal_Trans],
				TRIM(@CreatedByName) AS CreatedByName,
                GETDATE() AS CreatedOnDateTime
		INTO #TmpB120Archive
        FROM [comm].[B120]

		-- Output transformed data (only selected columns)
        SELECT  [TxnID],
				[Txn_Source],
				[Acct_Type],
				[FIN],
				[Trans_Code],
				[Trans_Curr],
				[TransFxRate],
				[FxRate],
				[Trans_Date],
				[Trans_Amt_Net],
				[Internal_Trans]
        From #TmpB120Archive

		-- Archive Transformed Data
        INSERT INTO comm.B120_Archive
		(
				[ICMRunId],
                [RecordId],
				[TxnID],
				[Txn_Source],
				[Acct_Type],
				[FIN],
				[Trans_Code],
				[Trans_Curr],
				[TransFxRate],
				[FxRate],
				[Trans_Date],
				[Trans_Amt_Net],
				[Internal_Trans],
				[CreatedByName],
                [CreatedOnDateTime]
		)
        SELECT  [ICMRunId],
                [RecordId],
				[TxnID],
				[Txn_Source],
				[Acct_Type],
				[FIN],
				[Trans_Code],
				[Trans_Curr],
				[TransFxRate],
				[FxRate],
				[Trans_Date],
				[Trans_Amt_Net],
				[Internal_Trans],
				[CreatedByName],
                [CreatedOnDateTime]
        FROM #TmpB120Archive

		-- Remove Temp Table
        DROP TABLE #TmpB120Archive
        COMMIT TRANSACTION

    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK;
        THROW
    END CATCH
END
GO


