CREATE TABLE [dbo].[EPA_Appr_Comments_Bak] (
    [School_Year]    VARCHAR (8)    NOT NULL,
    [School_Code]    VARCHAR (8)    NOT NULL,
    [EmployeeID]     VARCHAR (20)   NOT NULL,
    [SessionID]      VARCHAR (20)   NOT NULL,
    [ItemCode]       VARCHAR (10)   NOT NULL,
    [category]       VARCHAR (10)   NULL,
    [Appraisal_Note] VARCHAR (5000) NULL,
    [action_User]    VARCHAR (20)   NULL,
    [action_date]    SMALLDATETIME  NULL,
    [lu_function]    VARCHAR (50)   NULL,
    [lu_date]        SMALLDATETIME  NULL,
    [lu_user]        VARCHAR (20)   NULL
);

