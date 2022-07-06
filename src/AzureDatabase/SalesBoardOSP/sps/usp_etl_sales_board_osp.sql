
-- =============================================
-- Author: Hardys Perez
-- Create Date: 6/29/2022
-- Description: Transform, output and archive SalesBoardOSP

CREATE PROCEDURE [comm].[usp_etl_sales_board_osp]
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
		DROP TABLE If Exists #TmpSalesBoardOSP
 
		-- Populate temp table 
        SELECT  @ICMRunId AS [ICMRunId],
                @RecordId AS [RecordId],
				[CID],
				TRIM([Board]) AS [Board],
				TRIM([moneyType]) AS [Type],
				TRIM([OSPCode]) AS [OSP_Code],
				TRIM(STR([Amount], 9, 5)) AS [Amount],
				CONVERT(VARCHAR, [SignDate], 101) AS [Sign Date],
				CONVERT(VARCHAR, [EntryDate], 101) AS [Entry Date],
				TRIM(@CreatedByName) AS [CreatedByName],
                GETDATE() AS [CreatedOnDateTime]
		INTO #TmpSalesBoardOSP
        FROM [comm].[SalesBoardOSP]

		-- Output transformed data (only selected columns)
        SELECT  [CID],
				[Board],
                [Type],
				[OSP_Code],
				[Amount],
				[Sign Date],
				[Entry Date]
        From #TmpSalesBoardOSP

		-- Archive Transformed Data
        INSERT INTO comm.SalesBoardOSP_Archive
        (
				[ICMRunId],
                [RecordId],
				[CID],
				[Board],
				[Type],
				[OSP_Code],
				[Amount],
				[Sign Date],
				[Entry Date],
				[CreatedByName],
                [CreatedOnDateTime]
        )
        SELECT  [ICMRunId],
                [RecordId],
				[CID],
				[Board],
				[Type],
				[OSP_Code],
				[Amount],
				[Sign Date],
				[Entry Date],
				[CreatedByName],
                [CreatedOnDateTime]
        FROM #TmpSalesBoardOSP

		-- Remove Temp Table
        DROP TABLE #TmpSalesBoardOSP
        COMMIT TRANSACTION

    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK;
        THROW
    END CATCH
END
GO


