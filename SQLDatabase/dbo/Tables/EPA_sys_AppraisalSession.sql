CREATE TABLE [dbo].[EPA_sys_AppraisalSession] (
    [IDs]         INT           IDENTITY (1, 1) NOT NULL,
    [Code]        VARCHAR (20)  NOT NULL,
    [Name]        VARCHAR (250) NOT NULL,
    [Comments]    VARCHAR (500) NULL,
    [Active]      BIT           NULL,
    [lu_Function] VARCHAR (50)  NULL,
    [lu_Date]     DATETIME      NULL,
    [lu_User]     VARCHAR (50)  NULL
);

