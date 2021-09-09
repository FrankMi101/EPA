CREATE TABLE [dbo].[EPA_Appr_Notification] (
    [School_Year]     VARCHAR (8)    NOT NULL,
    [School_Code]     VARCHAR (8)    NOT NULL,
    [EmployeeID]      VARCHAR (20)   NOT NULL,
    [SessionID]       VARCHAR (20)   NULL,
    [NoticeType]      VARCHAR (50)   NOT NULL,
    [AppraisalArea]   VARCHAR (10)   NULL,
    [NoticeRole]      VARCHAR (20)   NULL,
    [NoticeDate]      SMALLDATETIME  NULL,
    [DeadlineDate]    SMALLDATETIME  NULL,
    [ObservationDate] SMALLDATETIME  NULL,
    [NoticeAction]    VARCHAR (50)   NULL,
    [NoticeSubject]   VARCHAR (150)  NULL,
    [Comments]        VARCHAR (4000) NULL,
    [lu_function]     VARCHAR (50)   NULL,
    [lu_date]         SMALLDATETIME  NULL,
    [lu_user]         VARCHAR (20)   NULL
);


GO
CREATE NONCLUSTERED INDEX [EPA_Appr_Notification_index]
    ON [dbo].[EPA_Appr_Notification]([School_Year] ASC, [School_Code] ASC, [EmployeeID] ASC, [SessionID] ASC, [NoticeType] ASC, [AppraisalArea] ASC, [NoticeRole] ASC, [NoticeDate] ASC);

