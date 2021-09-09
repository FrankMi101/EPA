CREATE TABLE [dbo].[EPA_sys_appraisalCompetency_test] (
    [IDs]                      INT           IDENTITY (1, 1) NOT NULL,
    [Appraisal_Code]           VARCHAR (20)  NOT NULL,
    [Appraisal_Domain]         VARCHAR (50)  NOT NULL,
    [Appraisal_Competency]     VARCHAR (50)  NOT NULL,
    [Appraisal_CompetencyName] VARCHAR (500) NULL,
    [Competency_Sign]          VARCHAR (50)  NULL,
    [comments]                 VARCHAR (500) NULL,
    [lu_Function]              VARCHAR (50)  NULL,
    [lu_Date]                  DATETIME      NULL,
    [lu_User]                  VARCHAR (50)  NULL,
    CONSTRAINT [PK_upa_sys_appraisalCompetency] PRIMARY KEY CLUSTERED ([Appraisal_Code] ASC, [Appraisal_Domain] ASC, [Appraisal_Competency] ASC)
);

