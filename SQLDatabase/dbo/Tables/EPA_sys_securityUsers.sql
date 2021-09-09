CREATE TABLE [dbo].[EPA_sys_securityUsers] (
    [IDs]         INT           IDENTITY (1, 1) NOT NULL,
    [GroupID]     VARCHAR (20)  NULL,
    [UserID]      VARCHAR (30)  NULL,
    [UserName]    VARCHAR (50)  NULL,
    [Active_Sign] BIT           NULL,
    [Comments]    VARCHAR (250) NULL,
    [lu_Date]     NCHAR (10)    NULL,
    [lu_User]     VARCHAR (50)  NULL,
    [lu_Function] VARCHAR (50)  NULL
);

