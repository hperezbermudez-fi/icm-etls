-- =============================================
-- Author:		Hardys Perez
-- Create date: 06/08/2022
-- Description:	Set the date once the process has been executed
-- =============================================

CREATE PROCEDURE [comm].[usp_post_crm]
	@RecordId int,
	@ICMRunId int
AS
BEGIN
	SET NOCOUNT ON;

	Update ConfigOnAzure
	Set LastRunId = @ICMRunId,
	LastProcessedTime = GetDate()
	Where RecordId = @RecordId
END
RETURN 0
GO