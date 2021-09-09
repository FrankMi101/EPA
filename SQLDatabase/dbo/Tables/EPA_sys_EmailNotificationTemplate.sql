CREATE TABLE [dbo].[EPA_sys_EmailNotificationTemplate] (
    [IDs]            INT            IDENTITY (1, 1) NOT NULL,
    [Category]       VARCHAR (10)   NOT NULL,
    [NoticeFor]      VARCHAR (10)   NOT NULL,
    [NoticeType]     VARCHAR (30)   NOT NULL,
    [NoticeApprArea] VARCHAR (10)   NOT NULL,
    [NoticeGo]       VARCHAR (15)   NOT NULL,
    [NoticeFrom]     VARCHAR (15)   NOT NULL,
    [NoticePurpose]  VARCHAR (250)  NULL,
    [Subject]        VARCHAR (250)  NULL,
    [Template]       VARCHAR (1000) NULL,
    [active]         VARCHAR (10)   NULL,
    [lu_function]    VARCHAR (50)   NULL,
    [lu_date]        DATETIME       NULL,
    [lu_user]        VARCHAR (20)   NULL,
    CONSTRAINT [PK_EPA_sys_EmailNotificationTemplate] PRIMARY KEY CLUSTERED ([Category] ASC, [NoticeFor] ASC, [NoticeType] ASC, [NoticeApprArea] ASC, [NoticeGo] ASC, [NoticeFrom] ASC)
);

