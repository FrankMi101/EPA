﻿CREATE TABLE [dbo].[EPA_Org_CompanyUnit] (
    [IDs]         INT           IDENTITY (1, 1) NOT NULL,
    [UnitCode]    VARCHAR (20)  NOT NULL,
    [UnitName]    VARCHAR (300) NULL,
    [Brief_Name]  VARCHAR (50)  NULL,
    [Company_ID]  VARCHAR (20)  NULL,
    [Header]      VARCHAR (20)  NULL,
    [Area]        VARCHAR (20)  NULL,
    [Type]        VARCHAR (20)  NULL,
    [District]    VARCHAR (50)  NULL,
    [Location]    VARCHAR (100) NULL,
    [comments]    VARCHAR (500) NULL,
    [Active]      BIT           NULL,
    [lu_Function] VARCHAR (50)  NULL,
    [lu_Date]     DATETIME      NULL,
    [lu_User]     VARCHAR (50)  NULL,
    CONSTRAINT [PK_EPA_Org_CompanyUnit] PRIMARY KEY CLUSTERED ([UnitCode] ASC)
);

