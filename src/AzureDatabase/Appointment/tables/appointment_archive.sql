
CREATE TABLE [comm].[Appointment_Archive](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ICMRunId] [int] NULL,
	[RecordId] [int] NULL,
	[Onyx_id] [int] NULL,
	[App_id] [int] NOT NULL,
	[OSP_ID] [char](10) NULL,
	[SetupBy_ID] [char](10) NULL,
	[Entry_date] [varchar](50) NULL,
	[Set_date] [varchar](50) NULL,
	[App_Date] [varchar](50) NULL,
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
	[MovedToHeld_Dt] [varchar](50) NULL,
	[CreatedByName] [varchar](100) NULL,
	[CreatedOnDateTime] [varchar](50) NULL,
 CONSTRAINT [PK_Appointment_Archive] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO