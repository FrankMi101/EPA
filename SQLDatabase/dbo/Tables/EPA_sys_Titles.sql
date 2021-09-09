CREATE TABLE [dbo].[EPA_sys_Titles] (
    [IDs]         INT           NOT NULL,
    [App_ID]      VARCHAR (30)  NOT NULL,
    [App_Area]    VARCHAR (30)  NOT NULL,
    [App_Step]    VARCHAR (30)  NULL,
    [App_Domain]  VARCHAR (30)  NULL,
    [App_Page]    VARCHAR (30)  NULL,
    [App_Item]    VARCHAR (30)  NULL,
    [Title]       VARCHAR (200) NULL,
    [Title2]      VARCHAR (500) NULL,
    [Active]      VARCHAR (10)  NULL,
    [lu_Function] VARCHAR (50)  NULL,
    [lu_Date]     DATETIME      NULL,
    [lu_User]     VARCHAR (50)  NULL
);

