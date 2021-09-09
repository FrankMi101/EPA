CREATE TABLE [dbo].[EPA_Appr_Notification_AutoCheckSetup] (
    [IDs]             INT           IDENTITY (1, 1) NOT NULL,
    [School_Year]     VARCHAR (8)   NOT NULL,
    [School_Code]     VARCHAR (8)   NOT NULL,
    [NoticeType]      VARCHAR (50)  NOT NULL,
    [StartDate]       SMALLDATETIME NULL,
    [EndDate]         SMALLDATETIME NULL,
    [NoticeAction]    VARCHAR (20)  NULL,
    [NoticeSubject]   VARCHAR (150) NULL,
    [NoticeTempletID] VARCHAR (10)  NULL,
    [Comments]        VARCHAR (500) NULL,
    [lu_function]     VARCHAR (50)  NULL,
    [lu_date]         SMALLDATETIME NULL,
    [lu_user]         VARCHAR (20)  NULL
);

