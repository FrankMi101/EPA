 IF EXISTS (SELECT * FROM sysobjects WHERE type = 'U' AND name = '[dbo].[upa_sys_appraisalHelp]')
	BEGIN
		DROP Table [dbo].[upa_sys_appraisalHelp]
	END
GO

CREATE TABLE [dbo].[upa_sys_appraisalHelp]
(
	[IDs] [int] IDENTITY(1,1) NOT NULL,
	[Help_ID]	 [varchar](30)  NOT NULL,
	[Help_Type]	 [varchar](20)   NULL,
 	[Help_Category] [varchar]  (50)  NULL,
	[Help_Title]	[varchar](500)   NULL,
 	[Help_Context] [varchar]  (4000)  NULL,
 	[Appraisal_Code] [varchar](20) NOT  NULL,
	[comments] [varchar](500)   NULL,
	[lu_Function] [varchar](50)   NULL,
	[lu_Date] [datetime] NULL,
	[lu_User] [varchar](50)  NULL,  
	CONSTRAINT [PK_upa_sys_appraisalHelp] PRIMARY KEY CLUSTERED 
	(
		[Help_ID] ASC
	 )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]

)

GO