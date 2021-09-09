CREATE TABLE [dbo].[EPA_Appr_Comments_AIP] (
    [School_Year] VARCHAR (8)   NOT NULL,
    [School_Code] VARCHAR (8)   NOT NULL,
    [EmployeeID]  VARCHAR (20)  NOT NULL,
    [SessionID]   VARCHAR (20)  NOT NULL,
    [ItemCode]    VARCHAR (10)  NOT NULL,
    [SequenceNo]  INT           NOT NULL,
    [Criteria]    VARCHAR (300) NULL,
    [Concern]     VARCHAR (500) NULL,
    [Practices]   VARCHAR (500) NULL,
    [Steps]       VARCHAR (500) NULL,
    [Indicators]  VARCHAR (300) NULL,
    [Completed]   VARCHAR (200) NULL,
    [lu_function] VARCHAR (50)  NULL,
    [lu_date]     SMALLDATETIME NULL,
    [lu_user]     VARCHAR (20)  NULL,
    CONSTRAINT [PK_EPA_Appr_Comments_AIP] PRIMARY KEY CLUSTERED ([School_Year] ASC, [School_Code] ASC, [EmployeeID] ASC, [SessionID] ASC, [ItemCode] ASC, [SequenceNo] ASC)
);

