CREATE TABLE [dbo].[EPA_sys_appraisalRating] (
    [IDs]                INT           NOT NULL,
    [Appraisal_Code]     VARCHAR (20)  NOT NULL,
    [Appraisal_Rate]     VARCHAR (50)  NOT NULL,
    [Rate_Code]          VARCHAR (50)  NULL,
    [Appraisal_RateType] VARCHAR (50)  NULL,
    [Appraisal_passSign] VARCHAR (50)  NULL,
    [Appraisal_Level]    INT           NULL,
    [Active]             BIT           NULL,
    [comments]           VARCHAR (500) NULL,
    [lu_Function]        VARCHAR (50)  NULL,
    [lu_Date]            DATETIME      NULL,
    [lu_User]            VARCHAR (50)  NULL,
    CONSTRAINT [PK_EPA_sys_appraisalRating] PRIMARY KEY CLUSTERED ([Appraisal_Code] ASC, [Appraisal_Rate] ASC)
);

