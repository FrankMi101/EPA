CREATE TABLE [dbo].[EPA_Org_MultipleSchoolUsers] (
    [IDs]         INT           IDENTITY (1, 1) NOT NULL,
    [Category]    VARCHAR (20)  NULL,
    [SchoolYear]  VARCHAR (8)   NULL,
    [UserID]      VARCHAR (30)  NULL,
    [SchoolCode]  VARCHAR (80)  NULL,
    [comments]    VARCHAR (500) NULL,
    [Active]      BIT           NULL,
    [lu_Function] VARCHAR (50)  NULL,
    [lu_Date]     DATETIME      NULL,
    [lu_User]     VARCHAR (50)  NULL
);


GO
CREATE NONCLUSTERED INDEX [EPA_Org_MultipleSchoolUsers_index]
    ON [dbo].[EPA_Org_MultipleSchoolUsers]([SchoolYear] ASC, [UserID] ASC, [SchoolCode] ASC);

