
CREATE TABLE [comm].[HRER_Archive](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ICMRunId] [int] NULL,
	[RecordId] [int] NULL,
	[HR_Employee_ID] [int] NOT NULL,
	[HR_Employee_FullName] [nvarchar](200) NULL,
	[HR_Payroll_FullName] [nvarchar](200) NULL,
	[HR_ADP_ID] [int] NULL,
	[HR_LocationID] [nvarchar](100) NULL,
	[HR_LocationName] [nvarchar](100) NULL,
	[HR_Employee_CostCenter] [nvarchar](30) NULL,
	[HR_Network_UserID] [nvarchar](100) NULL,
	[HR_Onyx_UserID] [nvarchar](50) NULL,
	[HR_Employee_Status] [nvarchar](10) NULL,
	[HR_ManagerRole] [varchar](11) NULL,
	[HR_BusinessTitle] [nvarchar](150) NULL,
	[HR_JobFamilyGroup] [nvarchar](69) NULL,
	[HR_JobFamily] [nvarchar](61) NULL,
	[HR_StartDate] [varchar](50) NULL,
	[HR_TermDate] [varchar](50) NULL,
	[CreatedByName] [varchar](100) NULL,
	[CreatedOnDateTime] [datetime] NULL,
 CONSTRAINT [PK_HRER_Archive] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO