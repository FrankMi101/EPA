CREATE TABLE [dbo].[EPA_sys_appraisalPhase] (
    [IDs]                 INT           NOT NULL,
    [Appraisal_Code]      VARCHAR (20)  NOT NULL,
    [Appraisal_Phase]     VARCHAR (50)  NOT NULL,
    [Appraisal_PhaseName] VARCHAR (50)  NULL,
    [Appraisal_passSign]  VARCHAR (50)  NULL,
    [Appraisal_PhaseStep] INT           NULL,
    [comments]            VARCHAR (500) NULL,
    [Active]              BIT           NULL,
    [lu_Function]         VARCHAR (50)  NULL,
    [lu_Date]             DATETIME      NULL,
    [lu_User]             VARCHAR (50)  NULL,
    CONSTRAINT [PK_EPA_sys_appraisalPhase] PRIMARY KEY CLUSTERED ([Appraisal_Code] ASC, [Appraisal_Phase] ASC)
);

