CREATE TABLE [dbo].[EPA_Appr_StrategyLabel] (
    [IDs]                INT           IDENTITY (1, 1) NOT NULL,
    [Appraisal_Category] VARCHAR (10)  NOT NULL,
    [Appraisal_Area]     VARCHAR (20)  NOT NULL,
    [Appraisal_Code]     VARCHAR (10)  NOT NULL,
    [Seq]                VARCHAR (2)   NULL,
    [Title]              VARCHAR (100) NULL,
    [lu_function]        VARCHAR (50)  NULL,
    [lu_date]            SMALLDATETIME NULL,
    [lu_user]            VARCHAR (20)  NULL
);

