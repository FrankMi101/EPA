CREATE TABLE [dbo].[EPA_Org_Statements] (
    [IDs]         INT            IDENTITY (1, 1) NOT NULL,
    [No]          INT            NOT NULL,
    [SchoolYear]  VARCHAR (8)    NOT NULL,
    [SchoolCode]  VARCHAR (8)    NOT NULL,
    [Category]    VARCHAR (10)   NULL,
    [Area]        VARCHAR (10)   NULL,
    [Subject]     VARCHAR (250)  NULL,
    [Statements]  VARCHAR (1000) NULL,
    [Active]      BIT            NULL,
    [StartDate]   SMALLDATETIME  NULL,
    [EndDate]     SMALLDATETIME  NULL,
    [Publisher]   VARCHAR (50)   NULL,
    [lu_Function] VARCHAR (50)   NULL,
    [lu_Date]     DATETIME       NULL,
    [lu_User]     VARCHAR (50)   NULL,
    CONSTRAINT [PK_EPA_Org_Statements] PRIMARY KEY CLUSTERED ([No] ASC, [SchoolYear] ASC, [SchoolCode] ASC)
);

