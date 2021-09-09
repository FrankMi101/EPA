IF EXISTS (SELECT * FROM [dbo].[upa_sys_Company]  )
	BEGIN
		DELETE [dbo].[upa_sys_Company]
	END
GO
INSERT INTO [dbo].[upa_sys_Company] (Unit_Code,Unit_Name,Unit_Sign,Unit_Industry,Comments,lu_Function,lu_Date,lu_User)
VALUES ('UPAIG','Universal Performance Appraisal International Group','UPAIGLogo','SoftWare','First Company',app_name(),getdate(),'upaUser')
GO
INSERT INTO [dbo].[upa_sys_Company] (Unit_Code,Unit_Name,Unit_Sign,Unit_Industry,Comments,lu_Function,lu_Date,lu_User)
VALUES ('TCDSB','Toronto Catholic District School Board','TCDSBLogo','Education','school board',app_name(),getdate(),'upaUser')

