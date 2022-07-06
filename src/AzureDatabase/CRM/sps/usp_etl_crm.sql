-- =============================================
-- Author: Hardys Perez
-- Create Date: 6/8/2022
-- Description: Transform, output and archive CRM

CREATE PROCEDURE [comm].[usp_etl_crm]
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
		DROP TABLE If Exists #TmpCRMArchive
 
		-- Populate temp table 
        SELECT  @ICMRunId AS ICMRunId,
                @RecordId AS RecordId,
				TRIM([OnyxID]) AS OnyxID,
				TRIM([fi_SalutationLetter]) AS fi_SalutationLetter,
				TRIM([FirstName]) AS FirstName,
				TRIM([MiddleName]) AS [MiddleName],
				TRIM([LastName]) AS LastName,
				TRIM([Suffix]) AS Suffix,
				TRIM([Client_Name]) AS Client_Name,
				TRIM([User_Type]) AS User_Type,
				TRIM([User_SubType]) AS User_SubType,
				TRIM([vchOSP]) AS vchOSP,
				CONVERT(VARCHAR, [E_Code_Dt], 101) AS E_Code_Dt,
				TRIM(@CreatedByName) AS CreatedByName,
                GETDATE() AS CreatedOnDateTime
		INTO #TmpCRMArchive
        FROM [comm].[CRM]

		-- Output transformed data (only selected columns)
        SELECT  [OnyxID],
				[fi_SalutationLetter],
				[FirstName],
				[MiddleName],
				[LastName],
				[Suffix],
				[Client_Name],
				[User_Type],
				[User_SubType],
				[vchOSP],
				[E_Code_Dt]
        From #TmpCRMArchive

		-- Archive Transformed Data
        INSERT INTO comm.CRM_Archive
		(
				[ICMRunId],
                [RecordId],
             	[OnyxID],
				[fi_SalutationLetter],
				[FirstName],
				[MiddleName],
				[LastName],
				[Suffix],
				[Client_Name],
				[User_Type],
				[User_SubType],
				[vchOSP],
				[E_Code_Dt],
				[CreatedBy],
                [CreatedOnDateTime]
		)
        SELECT  [ICMRunId],
                [RecordId],
             	[OnyxID],
				[fi_SalutationLetter],
				[FirstName],
				[MiddleName],
				[LastName],
				[Suffix],
				[Client_Name],
				[User_Type],
				[User_SubType],
				[vchOSP],
				[E_Code_Dt],
				[CreatedByName],
                [CreatedOnDateTime]
        FROM #TmpCRMArchive

		-- Remove Temp Table
        DROP TABLE #TmpCRMArchive
        COMMIT TRANSACTION

    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK;
        THROW
    END CATCH
END
