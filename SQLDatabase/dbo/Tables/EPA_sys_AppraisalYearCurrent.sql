CREATE TABLE [dbo].[EPA_sys_AppraisalYearCurrent] (
    [Unit_ID]      VARCHAR (10) NOT NULL,
    [Current_Year] VARCHAR (8)  NOT NULL,
    [lu_Function]  VARCHAR (50) NULL,
    [lu_Date]      DATETIME     NULL,
    [lu_User]      VARCHAR (50) NULL,
    CONSTRAINT [PK_EPA_sys_AppraisalYearCurrent] PRIMARY KEY CLUSTERED ([Unit_ID] ASC)
);

