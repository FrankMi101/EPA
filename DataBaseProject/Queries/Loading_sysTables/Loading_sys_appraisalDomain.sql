IF EXISTS (SELECT * FROM [dbo].[upa_sys_appraisalDomain]  )
	BEGIN
		DELETE [dbo].[upa_sys_appraisalDomain]
	END
GO
 
 
INSERT INTO upa_sys_appraisalDomain
(Appraisal_Code,Appraisal_Domain,Appraisal_DomainName,Domain_Sign,comments,lu_function,lu_date,lu_User)
VALUES ('UPA','1','Commitment to Pupils and Pupil Learning','upaDomain1','',app_name(),getdate(),'upaUser')
GO
INSERT INTO upa_sys_appraisalDomain
(Appraisal_Code,Appraisal_Domain,Appraisal_DomainName,Domain_Sign,comments,lu_function,lu_date,lu_User)
VALUES ('UPA','2','Professional Knowledge','upaDomain2','',app_name(),getdate(),'upaUser')
GO
INSERT INTO upa_sys_appraisalDomain
(Appraisal_Code,Appraisal_Domain,Appraisal_DomainName,Domain_Sign,comments,lu_function,lu_date,lu_User)
VALUES ('UPA','3','Professional Practice','upaDomain3','',app_name(),getdate(),'upaUser')
GO
INSERT INTO upa_sys_appraisalDomain
(Appraisal_Code,Appraisal_Domain,Appraisal_DomainName,Domain_Sign,comments,lu_function,lu_date,lu_User)
VALUES ('UPA','4','Leadership and Community','upaDomain4','',app_name(),getdate(),'upaUser')
GO
INSERT INTO upa_sys_appraisalDomain
(Appraisal_Code,Appraisal_Domain,Appraisal_DomainName,Domain_Sign,comments,lu_function,lu_date,lu_User)
VALUES ('UPA','5','Ongoing Professional Learning','upaDomain5','',app_name(),getdate(),'upaUser')
GO

