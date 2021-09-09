﻿CREATE TABLE [dbo].[EPA_Appr_Enrichment_DomainCompetency] (
    [School_Year]    VARCHAR (8)    NOT NULL,
    [School_Code]    VARCHAR (8)    NOT NULL,
    [EmployeeID]     VARCHAR (20)   NOT NULL,
    [SessionID]      VARCHAR (20)   NOT NULL,
    [ItemCode]       VARCHAR (10)   NOT NULL,
    [DomainID]       VARCHAR (10)   NOT NULL,
    [CompetencyID]   VARCHAR (10)   NOT NULL,
    [ActionItem]     VARCHAR (20)   NOT NULL,
    [Appraisal_Note] VARCHAR (1000) NULL,
    [lu_function]    VARCHAR (50)   NULL,
    [lu_date]        SMALLDATETIME  NULL,
    [lu_user]        VARCHAR (20)   NULL,
    CONSTRAINT [PK_EPA_Appr_Enrichment_DomainCompetency] PRIMARY KEY CLUSTERED ([School_Year] ASC, [School_Code] ASC, [EmployeeID] ASC, [SessionID] ASC, [ItemCode] ASC, [DomainID] ASC, [CompetencyID] ASC, [ActionItem] ASC)
);

