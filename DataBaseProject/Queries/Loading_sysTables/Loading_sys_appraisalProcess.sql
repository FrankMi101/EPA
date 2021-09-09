 IF EXISTS (SELECT * FROM [dbo].[upa_sys_appraisalProcess]  )
	BEGIN
		DELETE [dbo].[upa_sys_appraisalProcess]
	END
GO
INSERT INTO [dbo].[upa_sys_appraisalProcess] 
(Appraisal_Code,Appraisal_Process,Appraisal_ProcessStep,Appraisal_ProcessName,Appraisal_ProcessSign,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPA','ALP','Step 1','Annual Learning Plan','upaALP1','Process Step 1',app_name(),getdate(),'upaUser')
GO
INSERT INTO [dbo].[upa_sys_appraisalProcess] 
(Appraisal_Code,Appraisal_Process,Appraisal_ProcessStep,Appraisal_ProcessName,Appraisal_ProcessSign,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPA','OBS','Step 2','Proformance Obsevation and Evidence Log','upaOBS2','Process Step 2',app_name(),getdate(),'upaUser')
GO 
INSERT INTO [dbo].[upa_sys_appraisalProcess] 
(Appraisal_Code,Appraisal_Process,Appraisal_ProcessStep,Appraisal_ProcessName,Appraisal_ProcessSign,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPA','SUM','Step 3','Appraisal Summary ','upaSUM3','Process Step 3',app_name(),getdate(),'upaUser')
GO 
INSERT INTO [dbo].[upa_sys_appraisalProcess] 
(Appraisal_Code,Appraisal_Process,Appraisal_ProcessStep,Appraisal_ProcessName,Appraisal_ProcessSign,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPA','STR','Step 4','Appraisal Individual Strategy','upaSTR4','Process Step 4',app_name(),getdate(),'upaUser')
GO 
INSERT INTO [dbo].[upa_sys_appraisalProcess] 
(Appraisal_Code,Appraisal_Process,Appraisal_ProcessStep,Appraisal_ProcessName,Appraisal_ProcessSign,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPA','IMP','Step 5','Improvment Plan','upaIMP5','Process Step 5',app_name(),getdate(),'upaUser')
GO 
 
INSERT INTO [dbo].[upa_sys_appraisalProcess] 
(Appraisal_Code,Appraisal_Process,Appraisal_ProcessStep,Appraisal_ProcessName,Appraisal_ProcessSign,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPA','ENR','Step 5','Enrichment Plan','upaENR5','Process Step 5',app_name(),getdate(),'upaUser')
GO 
 
 
  