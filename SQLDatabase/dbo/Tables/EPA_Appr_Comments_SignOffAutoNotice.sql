CREATE TABLE [dbo].[EPA_Appr_Comments_SignOffAutoNotice] (
    [School_Year] VARCHAR (8)   NOT NULL,
    [School_Code] VARCHAR (8)   NOT NULL,
    [EmployeeID]  VARCHAR (20)  NOT NULL,
    [SessionID]   VARCHAR (20)  NOT NULL,
    [Category]    NCHAR (10)    NOT NULL,
    [ItemArea]    VARCHAR (10)  NOT NULL,
    [Action]      VARCHAR (20)  NULL,
    [Role]        VARCHAR (20)  NULL,
    [lu_function] VARCHAR (50)  NULL,
    [lu_date]     SMALLDATETIME NULL,
    [lu_user]     VARCHAR (20)  NULL
);

