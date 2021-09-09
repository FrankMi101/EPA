IF EXISTS (SELECT * FROM sysobjects WHERE type = 'U' AND name = '[dbo].[upa_sys_appraisalDomain]')
	BEGIN
		DROP  Table [dbo].[upa_sys_appraisalDomain]
	END
GO

CREATE TABLE [dbo].[upa_sys_appraisalDomain]
(
   	[IDs] [int] IDENTITY(1,1) NOT NULL,
	[Appraisal_Code] [varchar](20) NOT  NULL,
	[Appraisal_Domain] [varchar](50) NOT  NULL,
	[Appraisal_DomainName] [varchar](200)   NULL,
	[Domain_Sign] [varchar](50)   NULL,
	[comments] [varchar](500)   NULL,
	[lu_Function] [varchar](50)   NULL,
	[lu_Date] [datetime] NULL,
	[lu_User] [varchar](50)  NULL , 

	 CONSTRAINT [PK_upa_sys_appraisalDomain] PRIMARY KEY CLUSTERED 
	(
		[Appraisal_Code] ASC,
		[Appraisal_Domain] ASC
	)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [UPA]
GO
ALTER TABLE [dbo].[upa_sys_appraisalDomain]  
WITH CHECK ADD  CONSTRAINT [FK_upa_sys_appraisalDomain_upa_sys_appraisalType] 
FOREIGN KEY([Appraisal_Code])
REFERENCES [dbo].[upa_sys_appraisalType] ([Appraisal_Code])