CREATE TABLE [dbo].[EPA_Appr_Comments_DomainCompetency_Bak] (
    [School_Year]    VARCHAR (8)    NOT NULL,
    [School_Code]    VARCHAR (8)    NOT NULL,
    [EmployeeID]     VARCHAR (20)   NOT NULL,
    [SessionID]      VARCHAR (20)   NOT NULL,
    [ItemCode]       VARCHAR (10)   NOT NULL,
    [DomainID]       VARCHAR (3)    NOT NULL,
    [CompetencyID]   VARCHAR (3)    NOT NULL,
    [Rate]           VARCHAR (10)   NULL,
    [Appraisal_Note] VARCHAR (2000) NULL,
    [Category]       VARCHAR (10)   NULL,
    [action_User]    VARCHAR (50)   NULL,
    [action_Date]    SMALLDATETIME  NULL,
    [lu_function]    VARCHAR (50)   NULL,
    [lu_date]        SMALLDATETIME  NULL,
    [lu_user]        VARCHAR (20)   NULL
);

