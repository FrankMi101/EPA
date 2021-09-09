CREATE TABLE [dbo].[EPA_sys_Helps] (
    [IDs]         INT            NOT NULL,
    [App_ID]      VARCHAR (30)   NOT NULL,
    [App_Area]    VARCHAR (30)   NOT NULL,
    [App_Step]    VARCHAR (30)   NULL,
    [App_Domain]  VARCHAR (30)   NULL,
    [App_Page]    VARCHAR (30)   NULL,
    [App_Item]    VARCHAR (30)   NULL,
    [HelpS]       VARCHAR (200)  NULL,
    [HelpL]       VARCHAR (2000) NULL,
    [Active]      VARCHAR (10)   NULL,
    [lu_Function] VARCHAR (50)   NULL,
    [lu_Date]     DATETIME       NULL,
    [lu_User]     VARCHAR (50)   NULL
);

