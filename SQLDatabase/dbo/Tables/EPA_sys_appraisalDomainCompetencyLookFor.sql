CREATE TABLE [dbo].[EPA_sys_appraisalDomainCompetencyLookFor] (
    [RowNo]                  BIGINT        NULL,
    [IDs]                    INT           IDENTITY (1, 1) NOT NULL,
    [Appraisal_Code]         VARCHAR (20)  NOT NULL,
    [Appraisal_Domain]       INT           NOT NULL,
    [Appraisal_Competency]   INT           NOT NULL,
    [Appraisal_LookFors]     INT           NOT NULL,
    [Appraisal_LookForsName] VARCHAR (500) NULL,
    [LookFors_Sign]          VARCHAR (50)  NULL,
    [comments]               VARCHAR (500) NULL,
    [Active]                 BIT           NULL,
    [lu_Function]            VARCHAR (50)  NULL,
    [lu_Date]                DATETIME      NULL,
    [lu_User]                VARCHAR (50)  NULL,
    CONSTRAINT [PK_EPA_sys_appraisalDomainCompetencyLookFor] PRIMARY KEY CLUSTERED ([Appraisal_Domain] ASC, [Appraisal_Competency] ASC, [Appraisal_LookFors] ASC)
);

