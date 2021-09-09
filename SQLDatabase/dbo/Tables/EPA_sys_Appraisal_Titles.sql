CREATE TABLE [dbo].[EPA_sys_Appraisal_Titles] (
    [IDs]                INT           IDENTITY (1, 1) NOT NULL,
    [Appraisal_Category] VARCHAR (10)  NOT NULL,
    [Appraisal_Area]     VARCHAR (20)  NOT NULL,
    [Appraisal_Code]     VARCHAR (10)  NOT NULL,
    [Title]              VARCHAR (200) NULL,
    [SubTitle]           VARCHAR (500) NULL,
    [lu_function]        VARCHAR (50)  NULL,
    [lu_date]            SMALLDATETIME NULL,
    [lu_user]            VARCHAR (20)  NULL,
    CONSTRAINT [PK_EPA_sys_Appraisal_Titles] PRIMARY KEY CLUSTERED ([Appraisal_Category] ASC, [Appraisal_Area] ASC, [Appraisal_Code] ASC)
);

