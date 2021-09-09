CREATE TABLE [dbo].[EPA_sys_FileDocument] (
    [IDs]             INT           NOT NULL,
    [File_ID]         VARCHAR (50)  NULL,
    [File_Type]       VARCHAR (20)  NULL,
    [File_Size]       INT           NULL,
    [File_Name]       VARCHAR (100) NULL,
    [Category]        VARCHAR (200) NULL,
    [Appraisal_Code ] VARCHAR (50)  NULL,
    [File_Content]    IMAGE         NULL,
    [lu_function]     VARCHAR (50)  NULL,
    [lu_date]         DATETIME      NULL,
    [lu_User]         VARCHAR (50)  NULL
);

