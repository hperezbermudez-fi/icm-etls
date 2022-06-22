

-- =============================================
-- Author: Hardys Perez
-- Create Date: 6/13/2022
-- Description: Transform, output and archive HRER

CREATE PROCEDURE [comm].[usp_etl_hrer]
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
		DROP TABLE If Exists #TmpHRERArchive
 
		-- Populate temp table 
        SELECT  @ICMRunId AS ICMRunId
                ,@RecordId AS RecordID
				,[EmployeeID] AS HR_Employee_ID
				,TRIM([PreferredFullName]) AS HR_Employee_FullName --?
				,TRIM([PreferredLastName] + ',' + [PreferredFirstName]) AS HR_Payroll_FullName
				,[ADFileNoAsInteger] AS HR_ADP_ID --Doubt
				,TRIM([LocationID]) AS HR_LocationID
				,TRIM([LocationName]) AS HR_LocationName
				,TRIM([CostCenter]) AS HR_Employee_CostCenter
				,TRIM([Active]) AS HR_Employee_Status  --Doubt
                ,TRIM([NetworkUser]) AS HR_Network_UserID
				,TRIM([OnyxUserID]) AS HR_Onyx_UserID
				,TRIM([ManagerRole]) AS HR_ManagerRole
				,TRIM([BusinessTitle]) AS HR_BusinessTitle
				,TRIM([JobFamilyGroup]) AS HR_JobFamilyGroup
				,TRIM([JobFamily]) AS HR_JobFamily
				,CONVERT(VARCHAR, [HireDate], 101) AS HR_StartDate
				,CONVERT(VARCHAR, [PaythroughDate], 101) AS HR_TermDate
                ,TRIM(@CreatedByName) AS CreatedByName
				,GETDATE() AS CreatedOnDateTime
		INTO #TmpHRERArchive
        FROM [comm].[HRER]
		

		-- Output transformed data (only selected columns)
        SELECT   HR_Employee_ID
				,HR_Employee_FullName 
				,HR_Payroll_FullName 
				,HR_ADP_ID 
				,HR_LocationID
				,HR_LocationName
				,HR_Employee_CostCenter
				,HR_Employee_Status
                ,HR_Network_UserID
				,HR_Onyx_UserID
				,HR_ManagerRole
				,HR_BusinessTitle
				,HR_JobFamilyGroup
				,HR_JobFamily
				,HR_StartDate
				,HR_TermDate
        From #TmpHRERArchive

		-- Archive Transformed Data
        INSERT INTO [comm].HRER_Archive
		(
				 ICMRunId
                ,RecordId
                ,HR_Employee_ID
				,HR_Employee_FullName 
				,HR_Payroll_FullName 
				,HR_ADP_ID 
				,HR_LocationID
				,HR_LocationName
				,HR_Employee_CostCenter
				,HR_Employee_Status
                ,HR_Network_UserID
				,HR_Onyx_UserID
				,HR_ManagerRole
				,HR_BusinessTitle
				,HR_JobFamilyGroup
				,HR_JobFamily
				,HR_StartDate
				,HR_TermDate
				,CreatedByName
                ,CreatedOnDateTime
		)
        SELECT   ICMRunId
                ,RecordId
                ,HR_Employee_ID
				,HR_Employee_FullName 
				,HR_Payroll_FullName 
				,HR_ADP_ID 
				,HR_LocationID
				,HR_LocationName
				,HR_Employee_CostCenter
				,HR_Employee_Status
                ,HR_Network_UserID
				,HR_Onyx_UserID
				,HR_ManagerRole
				,HR_BusinessTitle
				,HR_JobFamilyGroup
				,HR_JobFamily
				,HR_StartDate
				,HR_TermDate
				,CreatedByName
                ,CreatedOnDateTime
        FROM #TmpHRERArchive

		-- Remove Temp Table
        DROP TABLE #TmpHRERArchive
        COMMIT TRANSACTION

    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK;
        THROW
    END CATCH
END