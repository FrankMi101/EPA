CREATE TABLE [dbo].[EPA_sys_SPNameAndParameters] (
    [IDs]         INT           IDENTITY (1, 1) NOT NULL,
    [ClassName]   VARCHAR (100) NULL,
    [Action]      VARCHAR (100) NULL,
    [SPName]      VARCHAR (255) NULL,
    [Parameters]  VARCHAR (255) NULL,
    [lu_function] VARCHAR (50)  NULL,
    [lu_date]     DATETIME      NULL,
    [lu_User]     VARCHAR (50)  NULL
);


GO
CREATE NONCLUSTERED INDEX [idx_ClassName_Action]
    ON [dbo].[EPA_sys_SPNameAndParameters]([ClassName] ASC, [Action] ASC);

