CREATE TABLE [dbo].[EPA_sys_appraisalRole] (
    [IDs]            INT           IDENTITY (1, 1) NOT NULL,
    [Appraisal_Code] VARCHAR (20)  NOT NULL,
    [Role]           VARCHAR (20)  NOT NULL,
    [Full_Name]      VARCHAR (50)  NULL,
    [Role_Code]      VARCHAR (10)  NULL,
    [comments]       VARCHAR (500) NULL,
    [Active_Sign]    BIT           NULL,
    [lu_Function]    VARCHAR (50)  NULL,
    [lu_Date]        DATETIME      NULL,
    [lu_User]        VARCHAR (50)  NULL,
    CONSTRAINT [PK_EPA_sys_appraisalRole] PRIMARY KEY CLUSTERED ([Appraisal_Code] ASC, [Role] ASC)
);

