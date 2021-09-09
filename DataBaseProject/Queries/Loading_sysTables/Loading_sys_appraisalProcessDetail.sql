IF EXISTS (SELECT * FROM [dbo].[upa_sys_appraisalProcessDetail]  )
	BEGIN
		DELETE [dbo].[upa_sys_appraisalProcessDetail]
	END
GO
INSERT INTO [dbo].[upa_sys_appraisalProcessDetail] 
(Appraisal_Code,Appraisal_Process,Appraisal_ProcessDetail,Appraisal_ProcessStep,Appraisal_ProcessDetailName,Appraisal_ProcessDetailNameLong,Appraisal_ProcessSign,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPA','ALP','ALP11','Step 1','Teaching Assignment','Description Teacher''s Assignment (Grade(s), Subject(s), Full-time/Part-time','upaALP11','ALP Process Step 1',app_name(),getdate(),'upaUser')
GO
INSERT INTO [dbo].[upa_sys_appraisalProcessDetail] 
(Appraisal_Code,Appraisal_Process,Appraisal_ProcessDetail,Appraisal_ProcessStep,Appraisal_ProcessDetailName,Appraisal_ProcessDetailNameLong,Appraisal_ProcessSign,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPA','ALP','ALP12','Step 2','Background of Professional Growth Goals','Background to Inform Professional Growth Goals, Action Plan, and Timelines','upaALP12','Process Step 2',app_name(),getdate(),'upaUser')
GO 
INSERT INTO [dbo].[upa_sys_appraisalProcessDetail] 
(Appraisal_Code,Appraisal_Process,Appraisal_ProcessDetail,Appraisal_ProcessStep,Appraisal_ProcessDetailName,Appraisal_ProcessDetailNameLong,Appraisal_ProcessSign,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPA','ALP','ALP13','Step 3','Professional learning and growth','Professional learning and growth that I have experienced over the past year(s):','upaALP13','Process Step 3',app_name(),getdate(),'upaUser')
GO 
INSERT INTO [dbo].[upa_sys_appraisalProcessDetail] 
(Appraisal_Code,Appraisal_Process,Appraisal_ProcessDetail,Appraisal_ProcessStep,Appraisal_ProcessDetailName,Appraisal_ProcessDetailNameLong,Appraisal_ProcessSign,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPA','ALP','ALP14','Step 4','Parental and student input','Parental and student input to inform my professional learning and teaching practice (optional):','upaALP14','Process Step 4',app_name(),getdate(),'upaUser')
GO 
INSERT INTO [dbo].[upa_sys_appraisalProcessDetail] 
(Appraisal_Code,Appraisal_Process,Appraisal_ProcessDetail,Appraisal_ProcessStep,Appraisal_ProcessDetailName,Appraisal_ProcessDetailNameLong,Appraisal_ProcessSign,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPA','ALP','ALP15','Step 5','Professional Growth Goals','Professional learning and growth Goal, Strategy, Action Plan','upaALP15','Process Step 5',app_name(),getdate(),'upaUser')
GO 
INSERT INTO [dbo].[upa_sys_appraisalProcessDetail] 
(Appraisal_Code,Appraisal_Process,Appraisal_ProcessDetail,Appraisal_ProcessStep,Appraisal_ProcessDetailName,Appraisal_ProcessDetailNameLong,Appraisal_ProcessSign,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPA','ALP','ALP16','Step 6','Other Comments','Other Comments of Principal and Teacher','upaALP16','Process Step 6',app_name(),getdate(),'upaUser')
GO 
INSERT INTO [dbo].[upa_sys_appraisalProcessDetail] 
(Appraisal_Code,Appraisal_Process,Appraisal_ProcessDetail,Appraisal_ProcessStep,Appraisal_ProcessDetailName,Appraisal_ProcessDetailNameLong,Appraisal_ProcessSign,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPA','ALP','ALP19','Step 9','Sign off as Complete','Principal’s Signature and Teacher’s Signature','upaALP19','Process Step 9',app_name(),getdate(),'upaUser')
GO 

INSERT INTO [dbo].[upa_sys_appraisalProcessDetail] 
(Appraisal_Code,Appraisal_Process,Appraisal_ProcessDetail,Appraisal_ProcessStep,Appraisal_ProcessDetailName,Appraisal_ProcessDetailNameLong,Appraisal_ProcessSign,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPA','OBS','OBS11','Step 1','Observation Date','Observation Date of Pre_Oservation Post_Observarion','upaOBS11','Process Step 1',app_name(),getdate(),'upaUser')
GO 
INSERT INTO [dbo].[upa_sys_appraisalProcessDetail] 
(Appraisal_Code,Appraisal_Process,Appraisal_ProcessDetail,Appraisal_ProcessStep,Appraisal_ProcessDetailName,Appraisal_ProcessDetailNameLong,Appraisal_ProcessSign,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPA','OBS','OBS12','Step 2','Observation Evidence Log','Observation Evidence Log','upaOBS12','Process Step 2',app_name(),getdate(),'upaUser')
GO 
INSERT INTO [dbo].[upa_sys_appraisalProcessDetail] 
(Appraisal_Code,Appraisal_Process,Appraisal_ProcessDetail,Appraisal_ProcessStep,Appraisal_ProcessDetailName,Appraisal_ProcessDetailNameLong,Appraisal_ProcessSign,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPA','OBS','OBS19','Step 9','Sign off as complete','Sign off as complete','upaOBS19','Process Step 9',app_name(),getdate(),'upaUser')
GO 

INSERT INTO [dbo].[upa_sys_appraisalProcessDetail] 
(Appraisal_Code,Appraisal_Process,Appraisal_ProcessDetail,Appraisal_ProcessStep,Appraisal_ProcessDetailName,Appraisal_ProcessDetailNameLong,Appraisal_ProcessSign,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPA','SUM','SUM11','Step 1','Teaching Assignment','Description Teacher''s Assignment (Grade(s), Subject(s), Full-time/Part-time','upaSUM11','Process Step 1',app_name(),getdate(),'upaUser')
GO 
INSERT INTO [dbo].[upa_sys_appraisalProcessDetail] 
(Appraisal_Code,Appraisal_Process,Appraisal_ProcessDetail,Appraisal_ProcessStep,Appraisal_ProcessDetailName,Appraisal_ProcessDetailNameLong,Appraisal_ProcessSign,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPA','SUM','SUM12','Step 2','Focus of the Classroom Observation','Focus of the Classroom Observation','upaSUM12','Process Step 2',app_name(),getdate(),'upaUser')
GO 
INSERT INTO [dbo].[upa_sys_appraisalProcessDetail] 
(Appraisal_Code,Appraisal_Process,Appraisal_ProcessDetail,Appraisal_ProcessStep,Appraisal_ProcessDetailName,Appraisal_ProcessDetailNameLong,Appraisal_ProcessSign,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPA','SUM','SUM13','Step 3','Comments on Domain Competency','Comments on Domain Competency','upaSUM13','Process Step 3',app_name(),getdate(),'upaUser')
GO  
INSERT INTO [dbo].[upa_sys_appraisalProcessDetail] 
(Appraisal_Code,Appraisal_Process,Appraisal_ProcessDetail,Appraisal_ProcessStep,Appraisal_ProcessDetailName,Appraisal_ProcessDetailNameLong,Appraisal_ProcessSign,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPA','SUM','SUM14','Step 4','Overall Rating','Overall Rating','upaSUM14','Process Step 4',app_name(),getdate(),'upaUser')
GO 
INSERT INTO [dbo].[upa_sys_appraisalProcessDetail] 
(Appraisal_Code,Appraisal_Process,Appraisal_ProcessDetail,Appraisal_ProcessStep,Appraisal_ProcessDetailName,Appraisal_ProcessDetailNameLong,Appraisal_ProcessSign,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPA','SUM','SUM15','Step 5','Principal and Teacher Comments','Principal and Teacher Comments','upaSUM15','Process Step 4',app_name(),getdate(),'upaUser')
GO 
INSERT INTO [dbo].[upa_sys_appraisalProcessDetail] 
(Appraisal_Code,Appraisal_Process,Appraisal_ProcessDetail,Appraisal_ProcessStep,Appraisal_ProcessDetailName,Appraisal_ProcessDetailNameLong,Appraisal_ProcessSign,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPA','SUM','SUM19','Step 9','Sign off as complete','sign off as complete','upaSUM19','Process Step 4',app_name(),getdate(),'upaUser')
GO   

INSERT INTO [dbo].[upa_sys_appraisalProcessDetail] 
(Appraisal_Code,Appraisal_Process,Appraisal_ProcessDetail,Appraisal_ProcessStep,Appraisal_ProcessDetailName,Appraisal_ProcessDetailNameLong,Appraisal_ProcessSign,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPA','IMP','IMP11','Step 1','Competencies Requiring Improvement','Competencies Requiring Improvement','upaIMP11','Process Step 1',app_name(),getdate(),'upaUser')
GO
INSERT INTO [dbo].[upa_sys_appraisalProcessDetail] 
(Appraisal_Code,Appraisal_Process,Appraisal_ProcessDetail,Appraisal_ProcessStep,Appraisal_ProcessDetailName,Appraisal_ProcessDetailNameLong,Appraisal_ProcessSign,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPA','IMP','IMP12','Step 2','Expectations','Expectations','upaIMP12','Process Step 2',app_name(),getdate(),'upaUser')
GO  
INSERT INTO [dbo].[upa_sys_appraisalProcessDetail] 
(Appraisal_Code,Appraisal_Process,Appraisal_ProcessDetail,Appraisal_ProcessStep,Appraisal_ProcessDetailName,Appraisal_ProcessDetailNameLong,Appraisal_ProcessSign,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPA','IMP','IMP13','Step 3','Steps and Actions for Improvement','Steps and Actions for Improvement (teacher input must be taken into account)','upaIMP13','Process Step 3',app_name(),getdate(),'upaUser')
GO
INSERT INTO [dbo].[upa_sys_appraisalProcessDetail] 
(Appraisal_Code,Appraisal_Process,Appraisal_ProcessDetail,Appraisal_ProcessStep,Appraisal_ProcessDetailName,Appraisal_ProcessDetailNameLong,Appraisal_ProcessSign,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPA','IMP','IMP14','Step 4','Support','Support (for example, from principal, from board)','upaIMP14','Process Step 4',app_name(),getdate(),'upaUser')
GO  
INSERT INTO [dbo].[upa_sys_appraisalProcessDetail] 
(Appraisal_Code,Appraisal_Process,Appraisal_ProcessDetail,Appraisal_ProcessStep,Appraisal_ProcessDetailName,Appraisal_ProcessDetailNameLong,Appraisal_ProcessSign,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPA','IMP','IMP15','Step 5','Sample Indicators of Success','Sample Indicators of Success','upaIMP15','Process Step 5',app_name(),getdate(),'upaUser')
GO  
INSERT INTO [dbo].[upa_sys_appraisalProcessDetail] 
(Appraisal_Code,Appraisal_Process,Appraisal_ProcessDetail,Appraisal_ProcessStep,Appraisal_ProcessDetailName,Appraisal_ProcessDetailNameLong,Appraisal_ProcessSign,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPA','IMP','IMP16','Step 6','Date of Next Appraisal ','Date of Next Performance Apprasial','upaIMP16','Process Step 6',app_name(),getdate(),'upaUser')
GO  
INSERT INTO [dbo].[upa_sys_appraisalProcessDetail] 
(Appraisal_Code,Appraisal_Process,Appraisal_ProcessDetail,Appraisal_ProcessStep,Appraisal_ProcessDetailName,Appraisal_ProcessDetailNameLong,Appraisal_ProcessSign,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPA','IMP','IMP17','Step 7','Teacher''s Comments','Teacher`s Comments on the Improvement Plan','upaIMP17','Process Step 7',app_name(),getdate(),'upaUser')
GO  

INSERT INTO [dbo].[upa_sys_appraisalProcessDetail] 
(Appraisal_Code,Appraisal_Process,Appraisal_ProcessDetail,Appraisal_ProcessStep,Appraisal_ProcessDetailName,Appraisal_ProcessDetailNameLong,Appraisal_ProcessSign,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPA','IMP','IMP19','Step 9','Expectations','Expectations','upaIMP13','Process Step 9',app_name(),getdate(),'upaUser')
GO          