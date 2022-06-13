-- =============================================
-- Author:		Hardys Perez
-- Create date: 06/08/2022
-- Description:	Prepare the crm table before exporting the crm file
-- =============================================

CREATE PROCEDURE [comm].[usp_pre_export_crm]
	@RecordId int,
	@ICMRunId int
AS
	SET NOCOUNT ON;
RETURN 0
GO