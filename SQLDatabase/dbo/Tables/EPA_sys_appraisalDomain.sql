CREATE TABLE [dbo].[EPA_sys_appraisalDomain] (
    [IDs]                  INT           IDENTITY (1, 1) NOT NULL,
    [Appraisal_Code]       VARCHAR (20)  NOT NULL,
    [Appraisal_Domain]     INT           NOT NULL,
    [Appraisal_DomainName] VARCHAR (200) NULL,
    [Domain_Code]          VARCHAR (50)  NULL,
    [Domain_Sign]          VARCHAR (50)  NULL,
    [comments]             VARCHAR (500) NULL,
    [Active]               BIT           NULL,
    [lu_Function]          VARCHAR (50)  NULL,
    [lu_Date]              DATETIME      NULL,
    [lu_User]              VARCHAR (50)  NULL,
    CONSTRAINT [PK_upa_sys_appraisalDomain] PRIMARY KEY CLUSTERED ([Appraisal_Code] ASC, [Appraisal_Domain] ASC)
);

