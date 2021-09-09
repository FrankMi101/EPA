CREATE TABLE [dbo].[EPA_sys_AppraisalDomainTipsLib] (
    [TreeLevel]  INT           NULL,
    [Panel]      INT           NULL,
    [DomainID]   INT           NULL,
    [Competency] INT           NULL,
    [Look_Fors]  INT           NULL,
    [TipsID]     INT           NULL,
    [SampleID]   INT           NULL,
    [Notes]      VARCHAR (255) NULL
);


GO
CREATE NONCLUSTERED INDEX [EPA_sys_AppraisalDomainTipsLib_index]
    ON [dbo].[EPA_sys_AppraisalDomainTipsLib]([Panel] ASC, [DomainID] ASC, [Competency] ASC, [Look_Fors] ASC, [TipsID] ASC);

