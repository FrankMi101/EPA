CREATE TABLE [dbo].[EPA_sys_appraisalProcessDetail] (
    [IDs]                              INT           NOT NULL,
    [Appraisal_Code]                   VARCHAR (20)  NOT NULL,
    [Appraisal_Process]                VARCHAR (50)  NOT NULL,
    [Appraisal_ProcessDetail]          VARCHAR (50)  NOT NULL,
    [Appraisal_ProcessStep]            VARCHAR (50)  NOT NULL,
    [Appraisal_ProcessDetailName]      VARCHAR (200) NULL,
    [Appraisal_ProcessDetailNameLong]  VARCHAR (500) NULL,
    [Appraisal_ProcessSign]            VARCHAR (50)  NULL,
    [Appraisal_ProcessDetailIndicator] VARCHAR (50)  NULL,
    [Comments]                         VARCHAR (500) NULL,
    [Active_Sign]                      BIT           NULL,
    [lu_Function]                      VARCHAR (50)  NULL,
    [lu_Date]                          DATETIME      NULL,
    [lu_User]                          VARCHAR (50)  NULL,
    CONSTRAINT [PK_EPA_sys_appraisalProcessDetail] PRIMARY KEY CLUSTERED ([Appraisal_Code] ASC, [Appraisal_Process] ASC, [Appraisal_ProcessDetail] ASC, [Appraisal_ProcessStep] ASC)
);

