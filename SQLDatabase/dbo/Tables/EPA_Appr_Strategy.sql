CREATE TABLE [dbo].[EPA_Appr_Strategy] (
    [School_Year]       VARCHAR (8)   NOT NULL,
    [School_Code]       VARCHAR (8)   NOT NULL,
    [EmployeeID]        VARCHAR (20)  NOT NULL,
    [SessionID]         VARCHAR (20)  NOT NULL,
    [ItemCode]          VARCHAR (10)  NOT NULL,
    [Goal]              VARCHAR (500) NULL,
    [Strategy]          VARCHAR (500) NULL,
    [Principal_Initail] VARCHAR (10)  NULL,
    [lu_date]           SMALLDATETIME NULL,
    [lu_user]           VARCHAR (20)  NULL,
    [lu_function]       VARCHAR (50)  NULL,
    CONSTRAINT [PK_EPA_Appr_Strategy] PRIMARY KEY CLUSTERED ([School_Year] ASC, [School_Code] ASC, [EmployeeID] ASC, [SessionID] ASC, [ItemCode] ASC)
);

