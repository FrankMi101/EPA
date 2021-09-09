CREATE TABLE [dbo].[EPA_sys_appraisalDomainCompetency] (
    [IDs]                      INT           IDENTITY (1, 1) NOT NULL,
    [Appraisal_Code]           VARCHAR (20)  NOT NULL,
    [Appraisal_Domain]         INT           NOT NULL,
    [Appraisal_Competency]     INT           NOT NULL,
    [Appraisal_CompetencyName] VARCHAR (500) NULL,
    [Competency_Sign]          VARCHAR (50)  NULL,
    [Evidence_Level]           VARCHAR (2)   NULL,
    [comments]                 VARCHAR (500) NULL,
    [Active]                   BIT           NULL,
    [TPA]                      BIT           NULL,
    [NTP]                      BIT           NULL,
    [LTO]                      BIT           NULL,
    [lu_Function]              VARCHAR (50)  NULL,
    [lu_Date]                  DATETIME      NULL,
    [lu_User]                  VARCHAR (50)  NULL,
    CONSTRAINT [PK_upa_sys_appraisalDomainCompetency] PRIMARY KEY CLUSTERED ([Appraisal_Code] ASC, [Appraisal_Domain] ASC, [Appraisal_Competency] ASC)
);

