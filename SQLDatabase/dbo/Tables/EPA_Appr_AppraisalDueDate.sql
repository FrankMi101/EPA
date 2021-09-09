CREATE TABLE [dbo].[EPA_Appr_AppraisalDueDate] (
    [School_Year]    VARCHAR (8)   NOT NULL,
    [School_Code]    VARCHAR (8)   NOT NULL,
    [Appraisal_Type] VARCHAR (20)  NOT NULL,
    [Due_Date]       SMALLDATETIME NULL,
    [Reminder_1st]   INT           NULL,
    [Reminder_2nd]   INT           NULL,
    [Reminder_3rd]   INT           NULL,
    [lu_function]    VARCHAR (50)  NULL,
    [lu_date]        SMALLDATETIME NULL,
    [lu_user]        VARCHAR (20)  NULL,
    CONSTRAINT [PK_EPA_Appr_AppraisalDueDate] PRIMARY KEY CLUSTERED ([School_Year] ASC, [School_Code] ASC, [Appraisal_Type] ASC)
);

