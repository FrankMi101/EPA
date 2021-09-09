 IF EXISTS (SELECT * FROM [dbo].[upa_sys_appraisalRating]  )
	BEGIN
		DELETE [dbo].[upa_sys_appraisalRating]
	END
GO
INSERT INTO [dbo].[upa_sys_appraisalRating] 
(Appraisal_Code,Appraisal_Rate,Appraisal_RateType,Appraisal_passSign,Appraisal_Level,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPA','Excellent','Character','X','1','This is pass Appraisal Rating',app_name(),getdate(),'upaUser')
GO
INSERT INTO [dbo].[upa_sys_appraisalRating] 
(Appraisal_Code,Appraisal_Rate,Appraisal_RateType,Appraisal_passSign,Appraisal_Level,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPA','Good','Character','','2','This is Failed pass Appraisal Rating',app_name(),getdate(),'upaUser')
GO
INSERT INTO [dbo].[upa_sys_appraisalRating] 
(Appraisal_Code,Appraisal_Rate,Appraisal_RateType,Appraisal_passSign,Appraisal_Level,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPA','Satisfactory','Character','X','3','This is pass Appraisal Rating',app_name(),getdate(),'upaUser')
GO
INSERT INTO [dbo].[upa_sys_appraisalRating] 
(Appraisal_Code,Appraisal_Rate,Appraisal_RateType,Appraisal_passSign,Appraisal_Level,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPA','DevelopNeed','Character','','4','This is level need more Appraisal Rating',app_name(),getdate(),'upaUser')
GO  
INSERT INTO [dbo].[upa_sys_appraisalRating] 
(Appraisal_Code,Appraisal_Rate,Appraisal_RateType,Appraisal_passSign,Appraisal_Level,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPA','Unsatisfactory','Character','','5','This is Failed pass Appraisal Rating',app_name(),getdate(),'upaUser')
GO
INSERT INTO [dbo].[upa_sys_appraisalRating] 
(Appraisal_Code,Appraisal_Rate,Appraisal_RateType,Appraisal_passSign,Appraisal_Level,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPA','Worse','Character','','6','This is Failed  pass Appraisal Rating',app_name(),getdate(),'upaUser')
GO