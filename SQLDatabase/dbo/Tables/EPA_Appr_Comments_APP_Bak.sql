CREATE TABLE [dbo].[EPA_Appr_Comments_APP_Bak] (
    [School_Year]    VARCHAR (8)    NOT NULL,
    [School_Code]    VARCHAR (8)    NOT NULL,
    [EmployeeID]     VARCHAR (20)   NOT NULL,
    [SessionID]      VARCHAR (20)   NOT NULL,
    [ItemCode]       VARCHAR (10)   NOT NULL,
    [SequenceNo]     INT            NOT NULL,
    [Goals]          VARCHAR (1000) NULL,
    [StrategyAction] VARCHAR (1000) NULL,
    [Practices]      VARCHAR (1000) NULL,
    [Indicators]     VARCHAR (1000) NULL,
    [Results]        VARCHAR (1000) NULL,
    [Action_User]    VARCHAR (50)   NULL,
    [Action_Date]    SMALLDATETIME  NULL,
    [lu_function]    VARCHAR (50)   NULL,
    [lu_date]        SMALLDATETIME  NULL,
    [lu_user]        VARCHAR (20)   NULL
);

