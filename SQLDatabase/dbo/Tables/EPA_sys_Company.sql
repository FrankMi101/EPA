CREATE TABLE [dbo].[EPA_sys_Company] (
    [IDs]           INT           IDENTITY (1, 1) NOT NULL,
    [Unit_Code]     VARCHAR (20)  NOT NULL,
    [Unit_Name]     VARCHAR (300) NULL,
    [Unit_Sign]     VARCHAR (50)  NULL,
    [Industry_Code] VARCHAR (20)  NULL,
    [comments]      VARCHAR (500) NULL,
    [lu_Function]   VARCHAR (50)  NULL,
    [lu_Date]       DATETIME      NULL,
    [lu_User]       VARCHAR (50)  NULL,
    CONSTRAINT [PK_upa_sys_Company] PRIMARY KEY CLUSTERED ([Unit_Code] ASC),
    CONSTRAINT [FK_upa_sys_Company_upa_sys_Industry] FOREIGN KEY ([Industry_Code]) REFERENCES [dbo].[EPA_sys_Industry] ([Industry_Code])
);

