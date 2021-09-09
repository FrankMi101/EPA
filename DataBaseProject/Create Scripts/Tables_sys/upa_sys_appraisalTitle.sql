 IF EXISTS (SELECT * FROM sysobjects WHERE type = 'U' AND name = '[dbo].[upa_sys_appraisalTitle]')
	BEGIN
		DROP  Table [dbo].[upa_sys_appraisalTitle]
	END
GO

CREATE TABLE [dbo].[upa_sys_appraisalTitle]
(
	[IDs] [int] IDENTITY(1,1) NOT NULL,
	[Title_ID]	 [varchar](30) NOT  NULL,
	[Title_Type] [varchar](50)   NULL,
	[Title_Name] [varchar](200)   NULL,
	[Title_Name2] [varchar](500)   NULL,
 	[Title_Context] [varchar]  (1000)  NULL,
 	[Appraisal_Code] [varchar](20) NOT  NULL,
	[comments] [varchar](500)   NULL,
	[lu_Function] [varchar](50)   NULL,
	[lu_Date] [datetime] NULL,
	[lu_User] [varchar](50)  NULL,  
	CONSTRAINT [PK_upa_sys_appraisalTitles] PRIMARY KEY CLUSTERED 
	(
		[Title_ID] ASC
	 )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]

)

GO