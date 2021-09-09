CREATE TABLE [dbo].[EPA_Org_Company] (
    [IDs]           INT           IDENTITY (1, 1) NOT NULL,
    [Unit_Code]     VARCHAR (20)  NOT NULL,
    [Unit_Name]     VARCHAR (300) NULL,
    [Unit_Sign]     VARCHAR (50)  NULL,
    [Industry_Code] VARCHAR (20)  NULL,
    [comments]      VARCHAR (500) NULL,
    [lu_Function]   VARCHAR (50)  NULL,
    [lu_Date]       DATETIME      NULL,
    [lu_User]       VARCHAR (50)  NULL
);

