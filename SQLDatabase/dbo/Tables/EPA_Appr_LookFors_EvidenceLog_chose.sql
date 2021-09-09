CREATE TABLE [dbo].[EPA_Appr_LookFors_EvidenceLog_chose] (
    [IDs]          INT           IDENTITY (1, 1) NOT NULL,
    [School_Year]  VARCHAR (8)   NOT NULL,
    [School_Code]  VARCHAR (8)   NOT NULL,
    [EmployeeID]   VARCHAR (20)  NOT NULL,
    [SessionID]    VARCHAR (20)  NOT NULL,
    [ItemCode]     VARCHAR (10)  NOT NULL,
    [DomainID]     INT           NOT NULL,
    [CompetencyID] INT           NOT NULL,
    [LookForsID]   INT           NOT NULL,
    [WorkRole]     VARCHAR (20)  NOT NULL,
    [LogDate]      SMALLDATETIME NULL,
    [LogCheck]     BIT           NULL,
    [AllowView]    BIT           NULL,
    [Comments]     VARCHAR (250) NULL,
    [lu_function]  VARCHAR (50)  NULL,
    [lu_date]      SMALLDATETIME NULL,
    [lu_user]      VARCHAR (20)  NULL,
    CONSTRAINT [PK_EPA_Appr_LookFors_EvidenceLog_chose] PRIMARY KEY CLUSTERED ([School_Year] ASC, [School_Code] ASC, [EmployeeID] ASC, [SessionID] ASC, [ItemCode] ASC, [DomainID] ASC, [CompetencyID] ASC, [LookForsID] ASC, [WorkRole] ASC)
);


GO
CREATE NONCLUSTERED INDEX [EPA_Appr_LookFors_EvidenceLog_chose_index]
    ON [dbo].[EPA_Appr_LookFors_EvidenceLog_chose]([School_Year] ASC, [School_Code] ASC, [EmployeeID] ASC, [SessionID] ASC, [ItemCode] ASC, [DomainID] ASC, [CompetencyID] ASC, [LookForsID] ASC);

