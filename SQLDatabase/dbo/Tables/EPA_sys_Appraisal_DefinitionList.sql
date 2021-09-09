CREATE TABLE [dbo].[EPA_sys_Appraisal_DefinitionList] (
    [IDs]                INT           IDENTITY (1, 1) NOT NULL,
    [Appraisal_Category] VARCHAR (10)  NOT NULL,
    [Appraisal_Area]     VARCHAR (20)  NOT NULL,
    [Appraisal_Code]     VARCHAR (10)  NOT NULL,
    [List_Seq]           INT           NOT NULL,
    [Appraisal_Text]     VARCHAR (500) NULL,
    [Content_Page]       VARCHAR (10)  NULL,
    [Content_Type]       VARCHAR (20)  NULL,
    [Content_Value]      VARCHAR (10)  NULL,
    [Active]             NCHAR (10)    NULL,
    [lu_function]        VARCHAR (50)  NULL,
    [lu_date]            SMALLDATETIME NULL,
    [lu_user]            VARCHAR (20)  NULL,
    CONSTRAINT [PK_upa_sys_Appraisal_DefinitionList] PRIMARY KEY CLUSTERED ([Appraisal_Category] ASC, [Appraisal_Area] ASC, [Appraisal_Code] ASC, [List_Seq] ASC)
);

