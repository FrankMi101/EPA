IF EXISTS (SELECT * FROM sysobjects WHERE type = 'U' AND name = '[dbo].[upa_sys_Company]')
	BEGIN
		DROP  Table [dbo].[upa_sys_Company]
	END
GO

CREATE TABLE [dbo].[upa_sys_Company]
(
	[IDs] [int] IDENTITY(1,1) NOT NULL,
	[Unit_Code] [varchar](20)  Not NULL,
	[Unit_Name] [varchar](300)   NULL,
	[Unit_Sign] [varchar](50)   NULL,
	[Industry_Code] [varchar](20)   NULL,
	[comments] [varchar](500)  NULL,
	[lu_Function] [varchar](50)   NULL,
	[lu_Date] [datetime] NULL,
	[lu_User] [varchar](50)   NULL,
	CONSTRAINT [PK_upa_sys_Company] PRIMARY KEY CLUSTERED 
	(
		[Unit_Code] ASC
	 )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]


)
GO
 