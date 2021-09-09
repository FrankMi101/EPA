CREATE TABLE [dbo].[EPA_sys_AppraisalYearsAvailable] (
    [IDs]              INT           NOT NULL,
    [Appraisal_Code]   VARCHAR (20)  NOT NULL,
    [Years]            INT           NULL,
    [Min_Satisfactory] INT           NULL,
    [Max_Appraisals]   INT           NULL,
    [comments]         VARCHAR (500) NULL,
    [Active_Sign]      BIT           NULL,
    [lu_Function]      VARCHAR (50)  NULL,
    [lu_Date]          DATETIME      NULL,
    [lu_User]          VARCHAR (50)  NULL
);

