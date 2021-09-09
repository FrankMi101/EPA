CREATE TABLE [dbo].[EPA_sys_appraisalTitleHelp] (
    [IDs]           INT            NOT NULL,
    [ApplicationID] VARCHAR (30)   NOT NULL,
    [CategoryID]    VARCHAR (30)   NOT NULL,
    [PageID]        VARCHAR (30)   NULL,
    [ItemID]        VARCHAR (30)   NULL,
    [Title]         VARCHAR (200)  NULL,
    [Title2]        VARCHAR (500)  NULL,
    [Help_Text]     VARCHAR (2000) NULL,
    [ShowHelp]      VARCHAR (10)   NULL,
    [comments]      VARCHAR (500)  NULL,
    [lu_Function]   VARCHAR (50)   NULL,
    [lu_Date]       DATETIME       NULL,
    [lu_User]       VARCHAR (50)   NULL
);

