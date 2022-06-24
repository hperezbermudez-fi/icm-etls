--[comm].[COMM_Topaz_Appointments_All]

CREATE TABLE [comm].[Appointment](
	[Onyx_id] [int] NULL,
	[App_id] [int] NOT NULL,
	[OSP_ID] [char](10) NULL,
	[SetupBy_ID] [char](10) NULL,
	[Entry_date] [datetime] NULL,
	[Set_date] [datetime] NULL,
	[App_Date] [datetime] NULL,
	[App_status_cd] [char](1) NULL,
	[App_status] [varchar](30) NULL,
	[App_type_cd] [char](2) NULL,
	[App_type] [varchar](30) NULL,
	[Accepted_flag] [char](1) NULL,
	[Aetl_approved] [char](1) NULL,
	[Aatl_id] [int] NULL,
	[Origination_id] [int] NULL,
	[Rule_id] [int] NULL,
	[Origination_Type] [varchar](60) NULL,
	[Origination_Code] [varchar](2) NULL,
	[MovedToHeld_Dt] [datetime] NULL,
 CONSTRAINT [PK_COMM_Appointment_Id] PRIMARY KEY CLUSTERED 
(
	[app_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

