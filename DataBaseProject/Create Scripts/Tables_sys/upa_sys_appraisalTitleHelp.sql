IF EXISTS (SELECT * FROM sysobjects WHERE type = 'U' AND name = '[dbo].[upa_sys_appraisalTitleHelp]')
	BEGIN
		DROP  Table [dbo].[upa_sys_appraisalTitleHelp]
	END
GO
 
/*
GRANT SELECT ON Table_Name TO PUBLIC

GO
*/
CREATE TABLE [dbo].[upa_sys_appraisalTitleHelp](
	[IDs] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationID] [varchar](30) NOT NULL,
	[CategoryID] [varchar](30) NOT NULL,
	[PageID] [varchar](30) NULL,
	[ItemID] [varchar](30) NULL,
	[Title] [varchar](200) NULL,
	[Title2] [varchar](500) NULL,
	[Help_Text] [varchar](2000) NULL,
	[ShowHelp] [varchar](10) NULL,
	[comments] [varchar](500) NULL,
	[lu_Function] [varchar](50) NULL,
	[lu_Date] [datetime] NULL,
	[lu_User] [varchar](50) NULL
)