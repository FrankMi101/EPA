CREATE TABLE [dbo].[EPA_Appr_Comments_DomainCompetency] (
    [School_Year]    VARCHAR (8)    NOT NULL,
    [School_Code]    VARCHAR (8)    NOT NULL,
    [EmployeeID]     VARCHAR (20)   NOT NULL,
    [SessionID]      VARCHAR (20)   NOT NULL,
    [ItemCode]       VARCHAR (10)   NOT NULL,
    [DomainID]       INT            NOT NULL,
    [CompetencyID]   INT            NOT NULL,
    [Category]       VARCHAR (10)   NOT NULL,
    [Rate]           VARCHAR (10)   NULL,
    [Appraisal_Note] VARCHAR (2000) NULL,
    [lu_function]    VARCHAR (50)   NULL,
    [lu_date]        SMALLDATETIME  NULL,
    [lu_user]        VARCHAR (20)   NULL,
    CONSTRAINT [PK_EPA_Appr_Comments_DomainCompetency] PRIMARY KEY CLUSTERED ([School_Year] ASC, [School_Code] ASC, [EmployeeID] ASC, [SessionID] ASC, [ItemCode] ASC, [DomainID] ASC, [CompetencyID] ASC, [Category] ASC)
);

