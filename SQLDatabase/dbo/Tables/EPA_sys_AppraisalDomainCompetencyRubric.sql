CREATE TABLE [dbo].[EPA_sys_AppraisalDomainCompetencyRubric] (
    [DomainID]             INT           NOT NULL,
    [Competency_ID]        INT           NOT NULL,
    [Competency]           VARCHAR (250) NULL,
    [CompetencyS]          VARCHAR (250) NULL,
    [CompetencyN]          VARCHAR (250) NULL,
    [RubricType]           VARCHAR (20)  NULL,
    [Status]               BIT           NULL,
    [Inactive_Date]        DATETIME      NULL,
    [NewTeacherC]          VARCHAR (8)   NULL,
    [last_update_function] VARCHAR (50)  NULL,
    [last_update_date]     DATETIME      NULL,
    [last_update_user]     VARCHAR (20)  NULL,
    CONSTRAINT [PK_EPA_sys_AppraisalDomainCompetencyRubric] PRIMARY KEY CLUSTERED ([DomainID] ASC, [Competency_ID] ASC)
);

