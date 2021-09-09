IF EXISTS (SELECT * FROM sysobjects WHERE type = 'U' AND name = '[dbo].[upa_sys_Industry]')
	BEGIN
		DROP  Table [dbo].[upa_sys_Industry]
	END
GO

CREATE TABLE [dbo].[upa_sys_Industry]
(
	[IDs] [int] IDENTITY(1,1) NOT NULL,
	[Industry_Code] [varchar](20) NOT  NULL,
	[Industry_Name] [varchar](300)   NULL,
	[Industry_Sign] [varchar](50)   NULL,
	[comments] [varchar](500)   NULL,
	[lu_Function] [varchar](50)   NULL,
	[lu_Date] [datetime] NULL,
	[lu_User] [varchar](50)  NULL,  
	CONSTRAINT [PK_upa_sys_Industry] PRIMARY KEY CLUSTERED 
	(
		[Industry_Code] ASC
	 )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]

)

GO