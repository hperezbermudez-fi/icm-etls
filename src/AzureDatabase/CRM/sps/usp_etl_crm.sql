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
				TRIM([Country_CD]) AS Country_CD,
				TRIM([SourceID]) AS SourceID,
				CONVERT(VARCHAR, [OID_LOA_Dt], 101) AS [OID_LOA_Dt],
				CONVERT(VARCHAR, [OID_FTD], 101) AS [OID_FTD],
				TRIM([vchOSP]) AS vchOSP,
				TRIM([vchIC]) AS vchIC,
				TRIM(STR([Relationship_Value], 9, 5)) AS [Relationship_Value],
				TRIM([chResidentCountry]) AS chResidentCountry,
				TRIM([vchServiceCountry]) AS vchServiceCountry,
				TRIM([E_Code_Dt]) AS E_Code_Dt,
				CONVERT(VARCHAR, [ChgToFormerClient_Dt], 101) AS [ChgToFormerClient_Dt],
				TRIM([IRIS_EnvelopeSalutation]) AS IRIS_EnvelopeSalutation,
				TRIM([IRIS_LetterSalutation]) AS IRIS_LetterSalutation,
				TRIM([AOR_Address1]) AS AOR_Address1,
				TRIM([AOR_Address2]) AS AOR_Address2,
				TRIM([AOR_Address3]) AS AOR_Address3,
				TRIM([AOR_City]) AS AOR_City,
				TRIM([AOR_Region]) AS AOR_Region,
				TRIM([AOR_PostCode]) AS AOR_PostCode,
				TRIM([AOR_Country]) AS AOR_Country,
				TRIM([SecureEmail]) AS SecureEmail,
				TRIM([NonSecureEmail]) AS NonSecureEmail,
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
				[Country_CD],
				[SourceID],
				[OID_LOA_Dt],
				[OID_FTD],
				[vchOSP],
				[vchIC],
				[Relationship_Value],
				[chResidentCountry],
				[vchServiceCountry],
				[E_Code_Dt],
				[ChgToFormerClient_Dt],
				[IRIS_EnvelopeSalutation],
				[IRIS_LetterSalutation],
				[AOR_Address1],
				[AOR_Address2],
				[AOR_Address3],
				[AOR_City],
				[AOR_Region],
				[AOR_PostCode],
				[AOR_Country],
				[SecureEmail],
				[NonSecureEmail]
        From #TmpCRMArchive

		-- Archive Transformed Data
        INSERT INTO comm.CRM_Archive
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
				[Country_CD],
				[SourceID],
				[OID_LOA_Dt],
				[OID_FTD],
				[vchOSP],
				[vchIC],
				[Relationship_Value],
				[chResidentCountry],
				[vchServiceCountry],
				[E_Code_Dt],
				[ChgToFormerClient_Dt],
				[IRIS_EnvelopeSalutation],
				[IRIS_LetterSalutation],
				[AOR_Address1],
				[AOR_Address2],
				[AOR_Address3],
				[AOR_City],
				[AOR_Region],
				[AOR_PostCode],
				[AOR_Country],
				[SecureEmail],
				[NonSecureEmail],
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
