CREATE TABLE [dbo].[EPA_sys_appraisalType] (
    [IDs]              INT           NOT NULL,
    [Industry_Code]    VARCHAR (20)  NOT NULL,
    [Appraisal_Code]   VARCHAR (20)  NOT NULL,
    [Appraisal_Name]   VARCHAR (200) NULL,
    [Appraisal_Sign]   VARCHAR (50)  NULL,
    [Appraisal_Method] VARCHAR (50)  NULL,
    [Appraisal_cycle]  VARCHAR (50)  NULL,
    [comments]         VARCHAR (500) NULL,
    [Template_Sign]    VARCHAR (10)  NULL,
    [lu_Function]      VARCHAR (50)  NULL,
    [lu_Date]          DATETIME      NULL,
    [lu_User]          VARCHAR (50)  NULL
);

