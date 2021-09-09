CREATE TABLE [dbo].[EPA_Org_RegionArea] (
    [IDs]         INT           IDENTITY (1, 1) NOT NULL,
    [AreaCode]    VARCHAR (30)  NOT NULL,
    [AreaName]    VARCHAR (50)  NOT NULL,
    [District]    VARCHAR (20)  NULL,
    [SchoolScop]  VARCHAR (50)  NULL,
    [SuperID]     VARCHAR (30)  NULL,
    [SuperName]   VARCHAR (50)  NULL,
    [Officer]     VARCHAR (30)  NULL,
    [OfficerName] VARCHAR (50)  NULL,
    [Comments]    VARCHAR (500) NULL,
    [Active]      BIT           NULL,
    [lu_Function] VARCHAR (50)  NULL,
    [lu_Date]     DATETIME      NULL,
    [lu_User]     VARCHAR (50)  NULL,
    CONSTRAINT [PK_EPA_Org_CompanyUnitArea] PRIMARY KEY CLUSTERED ([AreaCode] ASC)
);


GO
CREATE NONCLUSTERED INDEX [idx_SuperID]
    ON [dbo].[EPA_Org_RegionArea]([SuperID] ASC);

