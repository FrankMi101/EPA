CREATE TABLE [dbo].[EPA_Appr_Comments_AIP2] (
    [School_Year] VARCHAR (8)    NOT NULL,
    [School_Code] VARCHAR (8)    NOT NULL,
    [SessionID]   VARCHAR (20)   NOT NULL,
    [EmployeeID]  VARCHAR (20)   NOT NULL,
    [ItemCode]    VARCHAR (10)   NOT NULL,
    [SequenceNo]  INT            NOT NULL,
    [Needs]       VARCHAR (1000) NULL,
    [Strategies]  VARCHAR (1000) NULL,
    [lu_function] VARCHAR (50)   NULL,
    [lu_date]     SMALLDATETIME  NULL,
    [lu_user]     VARCHAR (20)   NULL,
    CONSTRAINT [PK_EPA_Appr_Comments_AIP2] PRIMARY KEY CLUSTERED ([School_Year] ASC, [School_Code] ASC, [SessionID] ASC, [EmployeeID] ASC, [ItemCode] ASC, [SequenceNo] ASC)
);

