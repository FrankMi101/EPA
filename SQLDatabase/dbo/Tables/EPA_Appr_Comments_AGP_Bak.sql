CREATE TABLE [dbo].[EPA_Appr_Comments_AGP_Bak] (
    [School_Year]    VARCHAR (8)    NOT NULL,
    [School_Code]    VARCHAR (8)    NOT NULL,
    [EmployeeID]     VARCHAR (20)   NOT NULL,
    [SessionID]      VARCHAR (20)   NOT NULL,
    [ItemCode]       VARCHAR (10)   NOT NULL,
    [SequenceNo]     INT            NOT NULL,
    [AreaForGrowth]  VARCHAR (1000) NULL,
    [GrowthStrategy] VARCHAR (2500) NULL,
    [TimeLine]       VARCHAR (200)  NULL,
    [FutureGrowth]   VARCHAR (1000) NULL,
    [action_user]    VARCHAR (50)   NULL,
    [action_date]    SMALLDATETIME  NULL,
    [lu_function]    VARCHAR (50)   NULL,
    [lu_date]        SMALLDATETIME  NULL,
    [lu_user]        VARCHAR (20)   NULL
);

