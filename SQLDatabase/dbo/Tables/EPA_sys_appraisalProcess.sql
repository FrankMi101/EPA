CREATE TABLE [dbo].[EPA_sys_appraisalProcess] (
    [IDs]                   INT           NOT NULL,
    [Appraisal_Code]        VARCHAR (20)  NOT NULL,
    [Appraisal_Process]     VARCHAR (50)  NOT NULL,
    [Appraisal_ProcessStep] VARCHAR (50)  NOT NULL,
    [Appraisal_ProcessName] VARCHAR (100) NULL,
    [Appraisal_ProcessSign] VARCHAR (50)  NULL,
    [comments]              VARCHAR (500) NULL,
    [Active_Sign]           BIT           NULL,
    [lu_Function]           VARCHAR (50)  NULL,
    [lu_Date]               DATETIME      NULL,
    [lu_User]               VARCHAR (50)  NULL,
    CONSTRAINT [PK_EPA_sys_appraisalProcess] PRIMARY KEY CLUSTERED ([Appraisal_Code] ASC, [Appraisal_Process] ASC, [Appraisal_ProcessStep] ASC)
);

