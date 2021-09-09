CREATE TABLE [dbo].[EPA_Appr_SignOff_AutoNoticeAction] (
    [IDs]           INT           IDENTITY (1, 1) NOT NULL,
    [Action_UserID] VARCHAR (30)  NOT NULL,
    [EmployeeID]    VARCHAR (20)  NOT NULL,
    [Category]      VARCHAR (50)  NOT NULL,
    [ItemArea]      VARCHAR (10)  NOT NULL,
    [Action_Role]   VARCHAR (20)  NULL,
    [Action]        VARCHAR (20)  NULL,
    [Template]      VARCHAR (20)  NULL,
    [lu_function]   VARCHAR (50)  NULL,
    [lu_date]       SMALLDATETIME NULL,
    [lu_user]       VARCHAR (20)  NULL
);


GO
CREATE NONCLUSTERED INDEX [EPA_Appr_SignOff_AutoNoticeAction_index]
    ON [dbo].[EPA_Appr_SignOff_AutoNoticeAction]([Action_UserID] ASC, [EmployeeID] ASC, [Category] ASC, [ItemArea] ASC, [Action_Role] ASC);

