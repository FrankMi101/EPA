CREATE TABLE [dbo].[EPA_Appr_Assignment] (
    [School_Year] VARCHAR (8)   NOT NULL,
    [School_Code] VARCHAR (8)   NOT NULL,
    [EmployeeID]  VARCHAR (20)  NOT NULL,
    [SessionID]   VARCHAR (20)  NOT NULL,
    [ItemCode]    VARCHAR (10)  NOT NULL,
    [Category]    VARCHAR (10)  NOT NULL,
    [Assignment]  VARCHAR (250) NULL,
    [LengthMonth] VARCHAR (10)  NULL,
    [Start_Date]  SMALLDATETIME NOT NULL,
    [End_Date]    SMALLDATETIME NOT NULL,
    [lu_function] VARCHAR (50)  NULL,
    [lu_date]     SMALLDATETIME NULL,
    [lu_user]     VARCHAR (20)  NULL,
    CONSTRAINT [PK_EPA_Appr_Assignment] PRIMARY KEY CLUSTERED ([School_Year] ASC, [School_Code] ASC, [EmployeeID] ASC, [SessionID] ASC, [ItemCode] ASC, [Category] ASC, [Start_Date] ASC, [End_Date] ASC)
);

