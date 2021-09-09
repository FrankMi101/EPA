CREATE TABLE [dbo].[EPA_sys_appraisalCycle] (
    [IDs]            INT           NOT NULL,
    [Appraisal_Code] VARCHAR (20)  NOT NULL,
    [Cycle]          VARCHAR (20)  NOT NULL,
    [Cycle_Code]     VARCHAR (10)  NOT NULL,
    [Full_Name]      VARCHAR (50)  NULL,
    [comments]       VARCHAR (500) NULL,
    [Active_Sign]    BIT           NULL,
    [lu_Function]    VARCHAR (50)  NULL,
    [lu_Date]        DATETIME      NULL,
    [lu_User]        VARCHAR (50)  NULL,
    CONSTRAINT [PK_EPA_sys_appraisalCycle] PRIMARY KEY CLUSTERED ([Appraisal_Code] ASC, [Cycle] ASC, [Cycle_Code] ASC)
);

