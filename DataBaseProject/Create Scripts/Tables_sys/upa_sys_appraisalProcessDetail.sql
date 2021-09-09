IF EXISTS (SELECT * FROM sysobjects WHERE type = 'U' AND name = '[dbo].[upa_sys_appraisalProcessDetail]')
	BEGIN
		DROP  Table [dbo].[upa_sys_appraisalProcessDetail]
	END
GO

CREATE TABLE [dbo].[upa_sys_appraisalProcessDetail]
(
	[IDs] [int] IDENTITY(1,1) NOT NULL,
	[Appraisal_Code] [varchar](20) NOT NULL,
	[Appraisal_Process] [varchar](50) NOT NULL,
	[Appraisal_ProcessDetail] [varchar](50) NOT NULL,
	[Appraisal_ProcessStep] [varchar](50)   NULL,
	[Appraisal_ProcessDetailName] [varchar](200)   NULL,
	[Appraisal_ProcessDetailNameLong] [varchar](500)   NULL,
	[Appraisal_ProcessSign] [varchar](50)   NULL,
	[comments] [varchar](500)   NULL,
	[lu_Function] [varchar](50)   NULL,
	[lu_Date] [datetime] NULL,
	[lu_User] [varchar](50)  NULL , 
	CONSTRAINT [PK_upa_sys_appraisalProcessDetail] PRIMARY KEY CLUSTERED 
	(
		[Appraisal_Code] ASC,
		[Appraisal_Process] ASC,
		[Appraisal_ProcessDetail] ASC
	)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
 SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[upa_sys_appraisalProcess]  
WITH CHECK ADD  CONSTRAINT [FK_upa_sys_appraisalProcessDetail_upa_sys_appraisalProcess] 
FOREIGN KEY([Appraisal_Code])
REFERENCES [dbo].[upa_sys_appraisalType] ([Appraisal_Code],[Appraisal_Process])
GO
 