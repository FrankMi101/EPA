CREATE TABLE [dbo].[EPA_sys_CommentsBank] (
    [IDs]           INT           IDENTITY (1, 1) NOT NULL,
    [DomainID]      INT           NOT NULL,
    [Type]          VARCHAR (10)  NULL,
    [Owner]         VARCHAR (20)  NULL,
    [Shared]        VARCHAR (100) NULL,
    [Comments]      VARCHAR (450) NULL,
    [Status]        BIT           NULL,
    [Inactive_Date] DATETIME      NULL,
    [lu_function]   VARCHAR (50)  NULL,
    [lu_date]       DATETIME      NULL,
    [lu_user]       VARCHAR (20)  NULL,
    [Category_ID]   INT           NULL
);

