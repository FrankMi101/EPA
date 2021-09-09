  IF EXISTS (SELECT * FROM [dbo].[upa_sys_appraisalPhase]  )
	BEGIN
		DELETE [dbo].[upa_sys_appraisalPhase]
	END
GO
INSERT INTO [dbo].[upa_sys_appraisalPhase] 
(Appraisal_Code,Appraisal_Phase,Appraisal_PhaseName,Appraisal_passSign,Appraisal_PhaseStep,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPA','E','Evaluation Year','X','1','This is phase 1',app_name(),getdate(),'upaUser')
GO 
INSERT INTO [dbo].[upa_sys_appraisalPhase] 
(Appraisal_Code,Appraisal_Phase,Appraisal_PhaseName,Appraisal_passSign,Appraisal_PhaseStep,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPA','NE1','Y1(Non Evaluation Year 1)',' ','2','This is phase 2',app_name(),getdate(),'upaUser')
GO  
INSERT INTO [dbo].[upa_sys_appraisalPhase] 
(Appraisal_Code,Appraisal_Phase,Appraisal_PhaseName,Appraisal_passSign,Appraisal_PhaseStep,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPA','NE2','Y2(Non Evaluation Year 2)',' ','3','This is phase 3',app_name(),getdate(),'upaUser')
GO  
INSERT INTO [dbo].[upa_sys_appraisalPhase] 
(Appraisal_Code,Appraisal_Phase,Appraisal_PhaseName,Appraisal_passSign,Appraisal_PhaseStep,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPA','NE3','Y3(Non Evaluation Year 3)',' ','4','This is phase 4',app_name(),getdate(),'upaUser')
GO  
INSERT INTO [dbo].[upa_sys_appraisalPhase] 
(Appraisal_Code,Appraisal_Phase,Appraisal_PhaseName,Appraisal_passSign,Appraisal_PhaseStep,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPA','NE4','Y4(Non Evaluation Year 4)',' ','5','This is phase 5',app_name(),getdate(),'upaUser')
GO  
