CREATE TABLE [dbo].[EPA_sys_Statements] (
    [IDs]         INT            NOT NULL,
    [No]          VARCHAR (10)   NOT NULL,
    [SchoolYear]  VARCHAR (8)    NOT NULL,
    [SchoolCode]  VARCHAR (8)    NULL,
    [Category]    VARCHAR (10)   NULL,
    [Area]        VARCHAR (10)   NULL,
    [Subject]     VARCHAR (250)  NULL,
    [Statements]  VARCHAR (1000) NULL,
    [Active]      BIT            NULL,
    [StartDate]   SMALLDATETIME  NULL,
    [EndDate]     SMALLDATETIME  NULL,
    [lu_Function] VARCHAR (50)   NULL,
    [lu_Date]     DATETIME       NULL,
    [lu_User]     VARCHAR (50)   NULL
);

