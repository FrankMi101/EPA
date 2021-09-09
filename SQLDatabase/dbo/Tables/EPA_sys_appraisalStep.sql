CREATE TABLE [dbo].[EPA_sys_appraisalStep] (
    [IDs]                 INT           NOT NULL,
    [Appraisal_Code]      VARCHAR (20)  NOT NULL,
    [Appraisal_Step]      VARCHAR (50)  NOT NULL,
    [Appraisal_StepName]  VARCHAR (50)  NULL,
    [Appraisal_StepOrder] INT           NULL,
    [Active]              BIT           NULL,
    [comments]            VARCHAR (200) NULL,
    [lu_Function]         VARCHAR (50)  NULL,
    [lu_Date]             DATETIME      NULL,
    [lu_User]             VARCHAR (50)  NULL
);

