IF EXISTS (SELECT * FROM sysobjects WHERE type = 'U' AND name = '[dbo].[upa_sys_appraisalDocuments]')
	BEGIN
		DROP  Table [dbo].[upa_sys_appraisalDocuments]
	END
GO

CREATE TABLE [dbo].[upa_sys_appraisalDocuments]
(
	[IDs] [int] IDENTITY(1,1) NOT NULL,
	[Document_ID]	 [varchar](20) NOT  NULL,
	[Document_Name] [varchar](200)   NULL,
	[Documents_Type] [varchar](20) NOT  NULL,
	[Document_Context] [image]   NULL,
	[Appraisal_Code] [varchar](20) NOT  NULL,
 	[comments] [varchar](500)   NULL,
	[lu_Function] [varchar](50)   NULL,
	[lu_Date] [datetime] NULL,
	[lu_User] [varchar](50)  NULL,  
	CONSTRAINT [PK_upa_sys_appraisalDocuments] PRIMARY KEY CLUSTERED 
	(
		[Document_ID] ASC
	 )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]

)

GO
 