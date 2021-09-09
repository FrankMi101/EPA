CREATE TABLE [dbo].[EPA_Org_EmployeeList] (
    [IDs]               INT           IDENTITY (1, 1) NOT NULL,
    [UserID]            VARCHAR (20)  NOT NULL,
    [Employee_ID]       VARCHAR (20)  NOT NULL,
    [FullName]          VARCHAR (50)  NULL,
    [FirstName]         VARCHAR (50)  NULL,
    [LastName]          VARCHAR (50)  NULL,
    [Gender]            VARCHAR (2)   NULL,
    [eMail]             VARCHAR (50)  NULL,
    [Employee_Position] VARCHAR (150) NULL,
    [Position_Type]     VARCHAR (30)  NULL,
    [Employee_Status]   VARCHAR (20)  NULL,
    [Assignment]        VARCHAR (250) NULL,
    [TimeType]          VARCHAR (10)  NULL,
    [Start_Date]        SMALLDATETIME NULL,
    [End_Date]          SMALLDATETIME NULL,
    [Unit_ID]           VARCHAR (8)   NULL,
    [Comments]          VARCHAR (250) NULL,
    [lu_function]       VARCHAR (50)  NULL,
    [lu_date]           SMALLDATETIME NULL,
    [lu_user]           VARCHAR (20)  NULL,
    CONSTRAINT [PK_EPA_Org_EmployeeList] PRIMARY KEY CLUSTERED ([Employee_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [EPA_Org_EmployeeList_indexUserID]
    ON [dbo].[EPA_Org_EmployeeList]([UserID] ASC, [FullName] ASC);


GO
CREATE NONCLUSTERED INDEX [EPA_Org_EmployeeList_indexPosition]
    ON [dbo].[EPA_Org_EmployeeList]([Employee_Position] ASC, [UserID] ASC);


GO
CREATE NONCLUSTERED INDEX [EPA_Org_EmployeeList_indexUnit]
    ON [dbo].[EPA_Org_EmployeeList]([Unit_ID] ASC, [Employee_ID] ASC, [UserID] ASC);

