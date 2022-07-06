--[comm].[VcsuSplits] 

CREATE TABLE [comm].[ConfirmedSplit](
	[OnyxID] [int] NULL,
	[EffectiveDate] [datetime] NULL,
	[EffectiveEndDate] [datetime] NULL,
	[Percentage] [decimal](18, 2) NOT NULL,
	[EmployeeID] [int] NOT NULL
)
