 IF EXISTS (SELECT * FROM [dbo].[upa_sys_appraisalTitleHelp]  )
	BEGIN
		DELETE [dbo].[upa_sys_appraisalTitleHelp]
	END
GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]   
([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User]) 
 VALUES ('UPA','Appraisal','FileUpload','Button','Upload','','sys_uploadFile_Button   Upload.  Help Text: waiting user entry the help content only admin user can entry and server.','Yes','',app_name(),getdate(),'upaUser')
GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]   
([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  
VALUES ('UPA','Appraisal','FileUpload','Category','Category','','sys_uploadFile_Category   Category.    Help Text: waiting user entry the help content only admin user can entry and server.','Yes','',app_name(),getdate(),'upaUser')  
GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]   
([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  
VALUES ('UPA','Appraisal','FileUpload','Name','File Name','','sys_uploadFile_Name   File Name.  Help Text: waiting user entry the help content only admin user can entry and server.','Yes','',app_name(),getdate(),'upaUser')  
GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]   
([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  
VALUES ('UPA','Appraisal','FileUpload','Title','File Title','','sys_uploadFile_Title   File Title.  Help Text: waiting user entry the help content only admin user can entry and server.','Yes','',app_name(),getdate(),'upaUser')  
GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]   
([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  
VALUES ('UPA','StartPage','AdminPage','Admin_Appraisal','Performance Appraisal','','','Yes','',app_name(),getdate(),'upaUser')  
GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]  
 ([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  
 VALUES ('UPA','StartPage','AdminPage','Admin_Employee','Employee Manager','','','Yes','',app_name(),getdate(),'upaUser')  
 GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]   
([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  
VALUES ('UPA','StartPage','AdminPage','Admin_Function','Select a Function','','','Yes','',app_name(),getdate(),'upaUser')  
GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]   
([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  
VALUES ('UPA','StartPage','AdminPage','Admin_PageTitle','Appraisal Admin Function','','Help Content of this is test spelling check  studd','Yes','',app_name(),getdate(),'upaUser')  
GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]   
([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  
VALUES ('UPA','StartPage','AdminPage','Admin_Security','Security Setup','','','Yes','',app_name(),getdate(),'upaUser')  
GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]   
([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  
VALUES ('UPA','StartPage','AdminPage','Admin_SystemSetup','System Setup','','','Yes','',app_name(),getdate(),'upaUser')  
GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]   
([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  
VALUES ('UPA','StartPage','LoginPage','Copyright','Copyright 2008-2009 MBI, All Rights Reserved.','','Logon_Copyright   Copyright 2008-2009 MBI, All Rights Reserved..  Help Text: waiting user entry the help content only admin user can entry and server.','Yes','',app_name(),getdate(),'upaUser')  
GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]   
([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  
VALUES ('UPA','StartPage','LoginPage','Domain','Domain','','Logon_Domain   Domain.  Help Text: waiting user entry the help content only admin user can entry and server.','Yes','',app_name(),getdate(),'upaUser')  
GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]   
([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  VALUES ('UPA','StartPage','LoginPage','Error','Username or Password error','','Logon_Error   Username or Password error.  Help Text: waiting user entry the help content only admin user can entry and server.','Yes','',app_name(),getdate(),'upaUser')  GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]   
([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  VALUES ('UPA','StartPage','LoginPage','LoginButton','Login','','Logon_LoginButton   Login.  Help Text: waiting user entry the help content only admin user can entry and server.','Yes','',app_name(),getdate(),'upaUser')  GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]   
([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  VALUES ('UPA','StartPage','LoginPage','Password','Password','','Logon_Password   Password.  Help Text: waiting user entry the help content only admin user can entry and server.','Yes','',app_name(),getdate(),'upaUser')  GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]   
([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  VALUES ('UPA','StartPage','LoginPage','TakeTime','Login may take up to 30 seconds.','','Logon_TakeTime   Login may take up to 30 seconds..  Help Text: waiting user entry the help content only admin user can entry and server.','Yes','',app_name(),getdate(),'upaUser')  GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]   
([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  VALUES ('UPA','StartPage','LoginPage','UserName','User Name','Login User Name, it can be your Netwoekr User Name','Logon_UserName   User Name.  Help Text: waiting user entry the help content only admin user can entry and server.','Yes','',app_name(),getdate(),'upaUser')  GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]   
([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  VALUES ('UPA','sys_Profile','Appraisal','AppraisalLogo','Appraisal Logo','','','','',app_name(),getdate(),'upaUser')  GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]   
([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  VALUES ('UPA','sys_Profile','Appraisal','Code',' Code','','','No','',app_name(),getdate(),'upaUser')  GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]   
([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  VALUES ('UPA','sys_Profile','Appraisal','Cycle',' Cycle','','Appraisal Cycle, 1 year, 2year, 3year Months','Yes','',app_name(),getdate(),'upaUser')  GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]   
([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  VALUES ('UPA','sys_Profile','Appraisal','Industry','Industry','','','No','',app_name(),getdate(),'upaUser')  GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]   
([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  VALUES ('UPA','sys_Profile','Appraisal','Logo','Logo','','','Yes','',app_name(),getdate(),'upaUser')  GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]   
([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  VALUES ('UPA','sys_Profile','Appraisal','Method',' Method','','','Yes','',app_name(),getdate(),'upaUser')  GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]   
([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  VALUES ('UPA','sys_Profile','Appraisal','Name','Name','','','No','',app_name(),getdate(),'upaUser')  GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]   
([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  VALUES ('UPA','sys_Profile','AppraisalGoal','Code','Appraisal Code','','','Yes','',app_name(),getdate(),'upaUser')  GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]   
([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  VALUES ('UPA','sys_Profile','AppraisalGoal','Cycle','Cycle','','','Yes','',app_name(),getdate(),'upaUser')  GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]   
([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  VALUES ('UPA','sys_Profile','AppraisalGoal','Industry','Industry','','','Yes','',app_name(),getdate(),'upaUser')  GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]   
([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  VALUES ('UPA','sys_Profile','AppraisalGoal','Method','Appraisal Method','','','Yes','',app_name(),getdate(),'upaUser')  GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]   
([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  VALUES ('UPA','sys_Profile','AppraisalGoal','Name','Appraisal Name','','','Yes','',app_name(),getdate(),'upaUser')  GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]  
 ([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  VALUES ('UPA','sys_Profile','AppraisalGoal','UPAAppraisalLogo','Upload Logo','','','Yes','',app_name(),getdate(),'upaUser')  GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]  
 ([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  VALUES ('UPA','sys_Profile','Company','Code','Company Code','','sys_Profile_CompanyCode   Company Code.    Help Text: waiting user entry the help content only admin user can entry and server.    99090','Yes','',app_name(),getdate(),'upaUser')  GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]  
 ([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  VALUES ('UPA','sys_Profile','Company','Comment','Comments','Comments','Help Content of Company Comment qe qqe','Yes','',app_name(),getdate(),'upaUser')  GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]   
([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  VALUES ('UPA','sys_Profile','Company','Logo','Company Logo','','  Company Logo.  ','No','',app_name(),getdate(),'upaUser')  GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]   
([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  VALUES ('UPA','sys_Profile','Company','LogoUpload','Logo Upload','','','Yes','',app_name(),getdate(),'upaUser')  GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]   
([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  VALUES ('UPA','sys_Profile','Company','Name','Company Name','','sys_Profile_CompanyName   Company Name.    Help Text: waiting user entry the help content only admin user can entry and server.  124 141412414 14 141 ','No','',app_name(),getdate(),'upaUser')  GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]   
([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  VALUES ('UPA','sys_Profile','Company','SaveSubmit','Save & Submit','','','Yes','',app_name(),getdate(),'upaUser')  GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]   
([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  VALUES ('UPA','sys_Profile','Company','UploadLogo','Upload Logo','','','Yes','',app_name(),getdate(),'upaUser')  GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]  
 ([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  VALUES ('UPA','sys_Profile','Industry','Code','Industry Code ','','Industry Code. entry a short words','Yes','',app_name(),getdate(),'upaUser')  GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]  
 ([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  VALUES ('UPA','sys_Profile','Industry','Comment','Comment','','','Yes','',app_name(),getdate(),'upaUser')  GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]   
([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  VALUES ('UPA','sys_Profile','Industry','Logo','Industry Logo','','sys_Profile_IndustryLogo   Industry Logo.    Help Text: waiting user entry the help content only admin user can entry and server.','No','',app_name(),getdate(),'upaUser')  GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]   
([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  VALUES ('UPA','sys_Profile','Industry','LogoUpload','Logo Upload','','','Yes','',app_name(),getdate(),'upaUser')  GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]   
([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  VALUES ('UPA','sys_Profile','Industry','Name','Industry Name','','sys_Profile_IndustryName   Industry Name.    Help Text: waiting user entry the help content only admin user can entry and server.','No','',app_name(),getdate(),'upaUser')  GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]  
 ([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  VALUES ('UPA','sys_Profile','Industry','SaveSubmit','Save & Submit','','','Yes','',app_name(),getdate(),'upaUser')  GO
INSERT INTO [dbo].[upa_sys_appraisalTitleHelp]  
 ([ApplicationID],[CategoryID],[PageID],[ItemID],[Title],[Title2],[Help_Text],[ShowHelp],[comments],[lu_Function],[lu_Date],[lu_User])  VALUES ('UPA','sys_Profile','SystemSetup','PageTitle','Appraisal System Setup','','','No','',app_name(),getdate(),'upaUser')  GO