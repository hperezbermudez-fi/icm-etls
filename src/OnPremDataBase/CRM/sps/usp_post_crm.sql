-- =============================================
-- Author:		Hardys Perez
-- Create date: 06/08/2022
-- Description:	Set the Process Status to Completed
-- =============================================

CREATE PROCEDURE [comm].[usp_post_crm]
	@RecordId int,
	@ICMRunId int
AS
BEGIN
	SET NOCOUNT ON;

	Update [comm].[AZConfigOnPrem]
	Set ProcessStatusId  = 3 -- Completed
	Where RecordId = @RecordId
END
RETURN 0
GO