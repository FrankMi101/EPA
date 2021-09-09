CREATE TABLE [dbo].[EPA_sys_Appraisal_UserCommentsSnippet] (
    [UserID]       VARCHAR (30)   NOT NULL,
    [CategoryID]   VARCHAR (10)   NOT NULL,
    [AreaID]       VARCHAR (10)   NOT NULL,
    [ItemCode]     VARCHAR (10)   NOT NULL,
    [DomainID]     INT            NOT NULL,
    [CompetencyID] INT            NOT NULL,
    [RowNo]        INT            NOT NULL,
    [Comments]     VARCHAR (1000) NULL,
    [lu_function]  VARCHAR (50)   NULL,
    [lu_date]      SMALLDATETIME  NULL,
    [lu_user]      VARCHAR (20)   NULL
);


GO
CREATE NONCLUSTERED INDEX [EPA_sys_Appraisal_UserCommentsSnippet_index]
    ON [dbo].[EPA_sys_Appraisal_UserCommentsSnippet]([UserID] ASC, [CategoryID] ASC, [AreaID] ASC, [ItemCode] ASC, [DomainID] ASC, [CompetencyID] ASC, [RowNo] ASC);

