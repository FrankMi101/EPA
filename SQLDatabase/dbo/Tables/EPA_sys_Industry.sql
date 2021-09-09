CREATE TABLE [dbo].[EPA_sys_Industry] (
    [IDs]            INT           IDENTITY (1, 1) NOT NULL,
    [Industry_Code]  VARCHAR (20)  NOT NULL,
    [Industry_Name]  VARCHAR (300) NULL,
    [Industry_Sign]  VARCHAR (50)  NULL,
    [comments]       VARCHAR (500) NULL,
    [Appraisal_Code] VARCHAR (10)  NULL,
    [lu_Function]    VARCHAR (50)  NULL,
    [lu_Date]        DATETIME      NULL,
    [lu_User]        VARCHAR (50)  NULL,
    CONSTRAINT [PK_upa_sys_Industry] PRIMARY KEY CLUSTERED ([Industry_Code] ASC)
);

