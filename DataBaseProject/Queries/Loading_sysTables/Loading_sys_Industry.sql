IF EXISTS (SELECT * FROM [dbo].[upa_sys_Industry]  )
	BEGIN
		DELETE [dbo].[upa_sys_Industry]
	END 
GO
INSERT INTO [dbo].[upa_sys_Industry] 
([Industry_Code],[Industry_Name],[Industry_Sign],Comments,lu_Function,lu_Date,lu_User)
VALUES ('Generial','Uninvral Performance Appraisal','UPA',' ',app_name(),getdate(),'upaUser')

INSERT INTO [dbo].[upa_sys_Industry] 
([Industry_Code],[Industry_Name],[Industry_Sign],Comments,lu_Function,lu_Date,lu_User)
VALUES ('Education','Education ','educationSign',' ',app_name(),getdate(),'upaUser')
GO
INSERT INTO [dbo].[upa_sys_Industry] 
([Industry_Code],[Industry_Name],[Industry_Sign],Comments,lu_Function,lu_Date,lu_User)
VALUES ('MLB','Major League Baseball','MLBSign',' ',app_name(),getdate(),'upaUser')
GO
INSERT INTO [dbo].[upa_sys_Industry] 
([Industry_Code],[Industry_Name],[Industry_Sign],Comments,lu_Function,lu_Date,lu_User)
VALUES ('NBA','National Basketball Association','educationSign',' ',app_name(),getdate(),'upaUser')
