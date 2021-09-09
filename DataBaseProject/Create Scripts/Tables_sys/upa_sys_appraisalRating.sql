IF EXISTS (SELECT * FROM sysobjects WHERE type = 'U' AND name = '[dbo].[upa_sys_appraisalRating]')
	BEGIN
		DROP  Table [dbo].[upa_sys_appraisalRating]
	END
GO

CREATE TABLE [dbo].[upa_sys_appraisalRating]
(
	[IDs] [int] IDENTITY(1,1) NOT NULL,
	[Appraisal_Code] [varchar](20)NOT  NULL,
	[Appraisal_Rate] [varchar](50) NOT  NULL,
	[Appraisal_RateType] [varchar](50)   NULL,
	[Appraisal_passSign] [varchar](50)   NULL,
	[Appraisal_Level] int   NULL,
	[comments] [varchar](500)   NULL,
	[lu_Function] [varchar](50)   NULL,
	[lu_Date] [datetime] NULL,
	[lu_User] [varchar](50)  NULL,  
	CONSTRAINT [PK_upa_sys_appraisalRating] PRIMARY KEY CLUSTERED 
	(
		[Appraisal_Code] ASC,
		[Appraisal_Rate] ASC
	)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[upa_sys_appraisalRating]  
WITH CHECK ADD  CONSTRAINT [FK_upa_sys_appraisalRating_upa_sys_appraisalType] 
FOREIGN KEY([Appraisal_Code])
REFERENCES [dbo].[upa_sys_appraisalType] ([Appraisal_Code])