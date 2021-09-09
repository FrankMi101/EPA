CREATE TABLE [dbo].[EPA_sys_EmailNotification] (
    [IDs]          INT           IDENTITY (1, 1) NOT NULL,
    [NoticeType]   VARCHAR (30)  NULL,
    [EmailAddress] VARCHAR (250) NULL,
    [active]       VARCHAR (10)  NULL,
    [lu_function]  VARCHAR (50)  NULL,
    [lu_date]      DATETIME      NULL,
    [lu_user]      VARCHAR (20)  NULL
);

