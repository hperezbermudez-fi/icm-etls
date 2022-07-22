--[comm].[VCOMM_SalesBoardAE]

CREATE TABLE [comm].[SalesBoard](
	[Id] [int] NOT NULL,
	[CID] [int] NOT NULL,
	[Board] [varchar](100) NULL,
	[moneyType] [varchar](50) NULL,
	[OSPCode] [varchar](255) NULL,
	[Amount] [money] NULL,
	[SignDate] [datetime] NOT NULL,
	[EntryDate] [datetime] NULL,
 CONSTRAINT [PK_COMM_SalesBoardOSP_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO