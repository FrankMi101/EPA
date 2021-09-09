CREATE TABLE [dbo].[EPA_sys_appraisalDocuments] (
    [IDs]              INT           NOT NULL,
    [Document_ID]      VARCHAR (20)  NOT NULL,
    [Document_Name]    VARCHAR (200) NULL,
    [Documents_Type]   VARCHAR (20)  NOT NULL,
    [Document_Context] IMAGE         NULL,
    [Appraisal_Code]   VARCHAR (20)  NOT NULL,
    [comments]         VARCHAR (500) NULL,
    [lu_Function]      VARCHAR (50)  NULL,
    [lu_Date]          DATETIME      NULL,
    [lu_User]          VARCHAR (50)  NULL
);

