IF EXISTS (SELECT * FROM sysobjects WHERE type = 'U' AND name = '[dbo].[upa_sys_appraisalProcess]')
	BEGIN
		DROP  Table [dbo].[upa_sys_appraisalProcess]
	END
GO

CREATE TABLE [dbo].[upa_sys_appraisalProcess]
(
	[IDs] [int] IDENTITY(1,1) NOT NULL,
	[Appraisal_Code] [varchar](20)   Not NULL,
	[Appraisal_Process] [varchar](50)   Not NULL,
	[Appraisal_ProcessStep] [varchar](50)   NULL,
	[Appraisal_ProcessName] [varchar](100)   NULL,
	[Appraisal_ProcessSign] [varchar](50)   NULL,
	[comments] [varchar](500)   NULL,
	[lu_Function] [varchar](50)   NULL,
	[lu_Date] [datetime] NULL,
	[lu_User] [varchar](50)  NULL , 
	CONSTRAINT [PK_upa_sys_appraisalProcess] PRIMARY KEY CLUSTERED 
	(
		[Appraisal_Code] ASC,
		[Appraisal_Process] ASC
	)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
 SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[upa_sys_appraisalProcess]  
WITH CHECK ADD  CONSTRAINT [FK_upa_sys_appraisalProcess_upa_sys_appraisalType] 
FOREIGN KEY([Appraisal_Code])
REFERENCES [dbo].[upa_sys_appraisalType] ([Appraisal_Code])
GO