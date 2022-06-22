-- =============================================
-- Author:		Hardys Perez
-- Create date: 06/13/2022
-- Description:	Prepare the table before exporting the file
-- =============================================

CREATE PROCEDURE [comm].[usp_pre_export]
	@RecordId int,
	@ICMRunId int
AS
	SET NOCOUNT ON;
RETURN 0
GO