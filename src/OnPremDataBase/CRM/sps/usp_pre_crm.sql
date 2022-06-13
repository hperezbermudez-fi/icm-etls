-- =============================================
-- Author:		Hardys Perez
-- Create date: 06/08/2022
-- Description:	Set the Process Status to In Progress
-- =============================================

CREATE PROCEDURE [comm].[usp_pre_crm]
	@RecordId int,
	@ICMRunId int
AS
BEGIN
	SET NOCOUNT ON;

	Update [comm].[AZConfigOnPrem]
	Set ProcessStatusId  = 2 -- in Progress
	Where RecordId = @RecordId
END
RETURN 0
GO