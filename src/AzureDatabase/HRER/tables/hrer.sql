--[comm].[VWCommisionsDBWorkers]

CREATE TABLE [comm].[HRER] (
    [EmployeeID]         INT            NOT NULL,
    [PreferredFirstName] NVARCHAR (200) NULL,
    [PreferredLastName]  NVARCHAR (200) NULL,
    [PreferredFullName]  NVARCHAR (100) NULL,
    [ADPFileNo]          NVARCHAR (30)  NULL,
    [ADFileNoAsInteger]  INT            NULL,
    [LocationID]         NVARCHAR (100) NULL,
    [LocationName]       NVARCHAR (100) NULL,
    [LocationState]      NVARCHAR (100) NULL,
    [CostCenter]         NVARCHAR (30)  NULL,
    [EmailAddress]       VARCHAR (120)  NULL,
    [NetworkUser]        NVARCHAR (100) NULL,
    [OnyxUserID]         NVARCHAR (50)  NULL,
    [AD_User]            NVARCHAR (50)  NULL,
    [Active]             NVARCHAR (10)  NULL,
    [ManagerRole]        VARCHAR (11)   NULL,
    [BusinessTitle]      NVARCHAR (150) NULL,
    [JobFamilyGroup]     NVARCHAR (69)  NULL,
    [JobFamily]          NVARCHAR (61)  NULL,
    [HireDate]           DATETIME       NULL,
    [FinanceHireDate]    DATETIME       NULL,
    [PaythroughDate]     DATETIME       NULL,
    [Homestate]          NVARCHAR (200) NULL,
    [HomeCountry]        NVARCHAR (200) NULL,
    PRIMARY KEY CLUSTERED ([EmployeeID] ASC)
);