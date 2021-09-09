CREATE TABLE [dbo].[EPA_sys_Appraisal_FeedBack] (
    [IDs]                INT            IDENTITY (1, 1) NOT NULL,
    [School_Year]        VARCHAR (8)    NULL,
    [Appraisal_Category] VARCHAR (10)   NULL,
    [Appraisal_Area]     VARCHAR (20)   NULL,
    [Appraisal_Code]     VARCHAR (10)   NULL,
    [FeedBack_User]      VARCHAR (30)   NULL,
    [User_Role]          VARCHAR (20)   NULL,
    [Subject]            VARCHAR (100)  NULL,
    [FeedBack]           VARCHAR (2000) NULL,
    [lu_function]        VARCHAR (50)   NULL,
    [lu_date]            SMALLDATETIME  NULL,
    [lu_user]            VARCHAR (20)   NULL
);

