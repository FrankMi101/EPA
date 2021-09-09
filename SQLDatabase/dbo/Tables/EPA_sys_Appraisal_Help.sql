CREATE TABLE [dbo].[EPA_sys_Appraisal_Help] (
    [IDs]                INT            IDENTITY (1, 1) NOT NULL,
    [Appraisal_Category] VARCHAR (10)   NOT NULL,
    [Appraisal_Area]     VARCHAR (20)   NOT NULL,
    [Appraisal_Code]     VARCHAR (10)   NOT NULL,
    [Help_Type]          NCHAR (10)     NOT NULL,
    [Help_Text]          VARCHAR (2000) NULL,
    [Content_Page]       VARCHAR (10)   NULL,
    [lu_function]        VARCHAR (50)   NULL,
    [lu_date]            SMALLDATETIME  NULL,
    [lu_user]            VARCHAR (20)   NULL,
    CONSTRAINT [PK_EPA_sys_Appraisal_Help] PRIMARY KEY CLUSTERED ([Appraisal_Category] ASC, [Appraisal_Area] ASC, [Appraisal_Code] ASC, [Help_Type] ASC)
);

