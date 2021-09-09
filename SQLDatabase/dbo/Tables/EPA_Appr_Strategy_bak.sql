CREATE TABLE [dbo].[EPA_Appr_Strategy_bak] (
    [School_Year]       VARCHAR (8)   NOT NULL,
    [School_Code]       VARCHAR (8)   NOT NULL,
    [SessionID]         VARCHAR (20)  NOT NULL,
    [EmployeeID]        VARCHAR (20)  NOT NULL,
    [ItemCode]          VARCHAR (10)  NOT NULL,
    [Goal]              VARCHAR (500) NULL,
    [Strategy]          VARCHAR (500) NULL,
    [Principal_Initail] VARCHAR (10)  NULL,
    [lu_date]           SMALLDATETIME NULL,
    [lu_user]           VARCHAR (20)  NULL,
    [lu_function]       VARCHAR (50)  NULL,
    [Action_User]       VARCHAR (30)  NULL,
    [Action_Date]       SMALLDATETIME NULL
);

