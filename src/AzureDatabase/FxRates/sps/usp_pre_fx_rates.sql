-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [comm].[usp_pre_FxRates] 
	@RecordId int,
	@ICMRunId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Truncate Table [comm].[FxRates]
	
	Update comm.ConfigOnAzure
	Set StartTime = GetDate()
	Where RecordId = @RecordId

END
GO