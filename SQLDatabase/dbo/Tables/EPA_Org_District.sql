CREATE TABLE [dbo].[EPA_Org_District] (
    [IDs]           INT           IDENTITY (1, 1) NOT NULL,
    [District_Code] VARCHAR (20)  NOT NULL,
    [District_Name] VARCHAR (300) NULL,
    [Comments]      VARCHAR (500) NULL,
    [Active_Sign]   BIT           NULL,
    [lu_Function]   VARCHAR (50)  NULL,
    [lu_Date]       DATETIME      NULL,
    [lu_User]       VARCHAR (50)  NULL
);

