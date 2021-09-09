CREATE TABLE [dbo].[EPA_Appr_Comments_OBS] (
    [School_Year]    VARCHAR (8)    NOT NULL,
    [School_Code]    VARCHAR (8)    NOT NULL,
    [EmployeeID]     VARCHAR (20)   NOT NULL,
    [SessionID]      VARCHAR (20)   NOT NULL,
    [Appraisal_Code] VARCHAR (10)   NOT NULL,
    [Appraisal_Note] VARCHAR (5000) NULL,
    [lu_function]    VARCHAR (50)   NULL,
    [lu_date]        SMALLDATETIME  NULL,
    [lu_user]        VARCHAR (20)   NULL
);

