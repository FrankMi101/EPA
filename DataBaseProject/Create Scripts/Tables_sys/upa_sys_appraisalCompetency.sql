IF EXISTS (SELECT * FROM sysobjects WHERE type = 'U' AND name = '[dbo].[upa_sys_appraisalCompetency]')
	BEGIN
		DROP  Table [dbo].[upa_sys_appraisalCompetency]
	END
GO

CREATE TABLE [dbo].[upa_sys_appraisalCompetency]
(
    [IDs] [int] IDENTITY(1,1) NOT NULL,
	[Appraisal_Code] [varchar](20) NOT  NULL,
	[Appraisal_Domain] [varchar](50) NOT  NULL,
	[Appraisal_Competency] [varchar](50) NOT  NULL,
	[Appraisal_CompetencyName] [varchar](500)   NULL,
	[Competency_Sign] [varchar](50)   NULL,
	[comments] [varchar](500)   NULL,
	[lu_Function] [varchar](50)   NULL,
	[lu_Date] [datetime] NULL,
	[lu_User] [varchar](50)  NULL,  

	CONSTRAINT [PK_upa_sys_appraisalCompetency] PRIMARY KEY CLUSTERED 
	(
		[Appraisal_Code] ASC,
		[Appraisal_Domain] ASC,
		[Appraisal_Competency] ASC
	)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [UPA]
GO
ALTER TABLE [dbo].[upa_sys_appraisalCompetency]  
WITH CHECK ADD  CONSTRAINT [FK_upa_sys_appraisalCompetency_upa_sys_appraisalDomain] 
FOREIGN KEY([Appraisal_Code], [Appraisal_Domain])
REFERENCES [dbo].[upa_sys_appraisalDomain] ([Appraisal_Code], [Appraisal_Domain])