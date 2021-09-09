IF EXISTS (SELECT * FROM [dbo].[upa_sys_appraisalType]  )
	BEGIN
		DELETE [dbo].[upa_sys_appraisalType]
	END
GO
INSERT INTO [dbo].[upa_sys_appraisalType] 
(Industry_Code,Appraisal_Code,[Appraisal_Name],Appraisal_Sign,Appraisal_Method,Appraisal_cycle,Comments,lu_Function,lu_Date,lu_User)
VALUES ('Generial','UPA','Universal Performance Appraisal','UPASign','generic','Year','generice Appraisal base',app_name(),getdate(),'upaUser')
GO
INSERT INTO [dbo].[upa_sys_appraisalType]
(Industry_Code,Appraisal_Code,[Appraisal_Name],Appraisal_Sign,Appraisal_Method,Appraisal_cycle,Comments,lu_Function,lu_Date,lu_User)
VALUES ('Education','TPA','Teacher Performance Appraisal','TPASign','TPA','Year','Experienced Teacher Appraisal base',app_name(),getdate(),'upaUser')
GO
INSERT INTO [dbo].[upa_sys_appraisalType]
(Industry_Code,Appraisal_Code,[Appraisal_Name],Appraisal_Sign,Appraisal_Method,Appraisal_cycle,Comments,lu_Function,lu_Date,lu_User)
VALUES ('Education','NTIP','New Teacher Induction Program','NTIPSign','NTIP','2Year','New Teacher Appraisal base',app_name(),getdate(),'upaUser')
GO
INSERT INTO [dbo].[upa_sys_appraisalType]
(Industry_Code,Appraisal_Code,[Appraisal_Name],Appraisal_Sign,Appraisal_Method,Appraisal_cycle,Comments,lu_Function,lu_Date,lu_User)
VALUES ('Education','PPA','Principal Performance Appraisl','PPASign','PPA','Year','Principal Appraisal base',app_name(),getdate(),'upaUser')
GO
INSERT INTO [dbo].[upa_sys_appraisalType]
(Industry_Code,Appraisal_Code,[Appraisal_Name],Appraisal_Sign,Appraisal_Method,Appraisal_cycle,Comments,lu_Function,lu_Date,lu_User)
VALUES ('Education','VPA','Vice Principal Performance Appraisl','VPASign','VPA','Year','Vice Principal Appraisal base',app_name(),getdate(),'upaUser')
GO
INSERT INTO [dbo].[upa_sys_appraisalType]
(Industry_Code,Appraisal_Code,[Appraisal_Name],Appraisal_Sign,Appraisal_Method,Appraisal_cycle,Comments,lu_Function,lu_Date,lu_User)
VALUES ('NBA','NRPA','New Rocke Performance Appraisl','RockeSign','Rocke','Year','New Rocke Appraisal base',app_name(),getdate(),'upaUser')
GO