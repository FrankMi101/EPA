CREATE TABLE [dbo].[EPA_Appr_CompetencyLookForsLTO] (
    [DomainID]     INT           NOT NULL,
    [CompetencyID] INT           NOT NULL,
    [LookingForID] INT           NOT NULL,
    [Context]      VARCHAR (255) NULL,
    CONSTRAINT [PK_EPA_Appr_CompetencyLookForsLTO] PRIMARY KEY CLUSTERED ([DomainID] ASC, [CompetencyID] ASC, [LookingForID] ASC)
);

