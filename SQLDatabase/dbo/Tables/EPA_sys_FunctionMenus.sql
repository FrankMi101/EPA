CREATE TABLE [dbo].[EPA_sys_FunctionMenus] (
    [IDs]            INT            NOT NULL,
    [CategoryID]     VARCHAR (30)   NOT NULL,
    [GroupID]        VARCHAR (30)   NOT NULL,
    [ItemID]         VARCHAR (30)   NOT NULL,
    [TitleID]        VARCHAR (30)   NULL,
    [Title]          VARCHAR (200)  NULL,
    [PageID]         VARCHAR (100)  NULL,
    [TargetID]       VARCHAR (50)   NULL,
    [Title2]         VARCHAR (500)  NULL,
    [Help_Text]      VARCHAR (2000) NULL,
    [Appraisal_Code] VARCHAR (20)   NULL,
    [comments]       VARCHAR (500)  NULL,
    [lu_Function]    VARCHAR (50)   NULL,
    [lu_Date]        DATETIME       NULL,
    [lu_User]        VARCHAR (50)   NULL
);

