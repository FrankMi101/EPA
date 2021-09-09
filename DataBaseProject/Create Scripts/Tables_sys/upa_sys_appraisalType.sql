IF EXISTS (SELECT * FROM sysobjects WHERE type = 'U' AND name = '[dbo].[upa_sys_appraisalType]')
	BEGIN
		DROP  Table [dbo].[upa_sys_appraisalType]
	END
GO

CREATE TABLE [dbo].[upa_sys_appraisalType]
(
	[IDs] [int] IDENTITY(1,1) NOT NULL,
	[Industry_Code] [varchar](20) NOT  NULL,
	[Appraisal_Code] [varchar](20) NOT  NULL,
	[Appraisal_Name] [varchar](200)   NULL,
	[Appraisal_Sign] [varchar](50)   NULL,
	[Appraisal_Method] [varchar](50)   NULL,
	[Appraisal_cycle] [varchar](50)   NULL,
 	[comments] [varchar](500)   NULL,
 	[Template_Sign] [varchar](10)   NULL,
	[lu_Function] [varchar](50)   NULL,
	[lu_Date] [datetime] NULL,
	[lu_User] [varchar](50)  NULL,  
	CONSTRAINT [PK_upa_sys_appraisalType] PRIMARY KEY CLUSTERED 
	(
		[Appraisal_Code] ASC
	 )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]

)

GO
 
