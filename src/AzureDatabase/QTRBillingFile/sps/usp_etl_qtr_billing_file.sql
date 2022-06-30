
-- =============================================
-- Author: Hardys Perez
-- Create Date: 6/30/2022
-- Description: Transform, output and archive QTRBillingFile

CREATE PROCEDURE [comm].[usp_etl_qtr_billing_file]
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
		DROP TABLE If Exists #TmpQTRBillingFile
 
		-- Populate temp table 
        SELECT  @ICMRunId AS ICMRunId,
                @RecordId AS RecordId,
				TRIM([FIN]) AS [FIN],
				TRIM([CID]) AS [CID],
				TRIM([BUSINESSUNITID]) AS [BUSINESSUNITID],
				TRIM(STR([INVOICEID], 18, 0)) AS [INVOICEID],
				TRIM([GENERATEDINVOICEID]) AS [GENERATEDINVOICEID],
				CONVERT(VARCHAR, [GENERATEDDATE], 101) AS [GENERATEDDATE],
				CONVERT(VARCHAR, [STARTDATE], 101) AS [STARTDATE],
				CONVERT(VARCHAR, [ENDDATE], 101) AS [ENDDATE],
				CONVERT(VARCHAR, [INVOICEDATE], 101) AS [INVOICEDATE],
				TRIM([BILLINGGROUPNAME]) AS [BILLINGGROUPNAME],
				TRIM([BASE_ISOCURRENCYCODE]) AS [BASE_ISOCURRENCYCODE],
				TRIM([FEETYPENAME]) AS [FEETYPENAME],
				[CONTRIBWITHDRAWFLAG] AS [CONTRIBWITHDRAWFLAG],
				TRIM(STR([Remit_Amt], 38, 2)) AS [Remit_Amt],
				TRIM(STR([Total_Input_Amount], 38, 2)) AS [Total_Input_Amount],
				TRIM([WORKFLOWSTATUS]) AS [WORKFLOWSTATUS],
				CONVERT(VARCHAR, [Report_Filter_Start], 101) AS [Report_Filter_Start],
				CONVERT(VARCHAR, [Report_Filter_End], 101) AS [Report_Filter_End],
				TRIM([SOURCE]) AS [SOURCE],
				TRIM(@CreatedByName) AS CreatedByName,
                GETDATE() AS CreatedOnDateTime
		INTO #TmpQTRBillingFile
        FROM [comm].[QTRBillingFile]

		-- Output transformed data (only selected columns)
        SELECT	[FIN],
				[CID],
				[BUSINESSUNITID],
				[INVOICEID],
				[GENERATEDINVOICEID],
				[GENERATEDDATE],
				[STARTDATE],
				[ENDDATE],
				[INVOICEDATE],
				[BILLINGGROUPNAME],
				[BASE_ISOCURRENCYCODE],
				[FEETYPENAME],
				[CONTRIBWITHDRAWFLAG],
				[Remit_Amt],
				[Total_Input_Amount],
				[WORKFLOWSTATUS],
				[Report_Filter_Start],
				[Report_Filter_End],
				[SOURCE]
        From #TmpQTRBillingFile

		-- Archive Transformed Data
        INSERT INTO comm.QTRBillingFile_Archive
        SELECT  [ICMRunId],
                [RecordId],
				[FIN],
				[CID],
				[BUSINESSUNITID],
				[INVOICEID],
				[GENERATEDINVOICEID],
				[GENERATEDDATE],
				[STARTDATE],
				[ENDDATE],
				[INVOICEDATE],
				[BILLINGGROUPNAME],
				[BASE_ISOCURRENCYCODE],
				[FEETYPENAME],
				[CONTRIBWITHDRAWFLAG],
				[Remit_Amt],
				[Total_Input_Amount],
				[WORKFLOWSTATUS],
				[Report_Filter_Start],
				[Report_Filter_End],
				[SOURCE]
				[CreatedByName],
                [CreatedOnDateTime]
        FROM #TmpQTRBillingFile

		-- Remove Temp Table
        DROP TABLE #TmpQTRBillingFile
        COMMIT TRANSACTION

    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK;
        THROW
    END CATCH
END
GO


