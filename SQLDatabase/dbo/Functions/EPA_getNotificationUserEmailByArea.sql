﻿

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: August 14, 2020 
-- Description:	get employee email ID
-- ================================================================================== 

CREATE FUNCTION [dbo].[EPA_getNotificationUserEmailByArea]
(	  @Operate			varchar(50) = null,
	  @UserID			varchar(30) ='upaUser',
	  @SchoolYear		varchar(8) = null,
	  @SchoolCode		varchar(8) = null,
	  @EmployeeID		varchar(10) = null,
  	  @NoticeType		varchar(30) = null,
	  @NoticeArea		varchar(10)	= null,
	  @NoticeRole		varchar(30) = null,
	  @Category			varchar(10)	= null)

RETURNS varchar(50)
AS 
  BEGIN
		declare @rValue varchar(50)
		if @NoticeType ='HRAdminUser'
			set @rValue =(select top 1 isnull(EmailAddress,'') from  [dbo].[EPA_sys_EmailNotification]
							where  NoticeType =  @NoticeType  and active ='X')
		else if @NoticeType ='SystemUser'
			set @rValue =(select top 1 isnull(EmailAddress,'') from  [dbo].[EPA_sys_EmailNotification]
							where  NoticeType =  @NoticeType  and active ='X')
		else if @NoticeType ='AppraisalUser'
 			set @rValue =(select top 1 eMail + ';' +  dbo.EPA_getUserEmailbyID(Appraiser)
						  from [dbo].[EPA_Appraisal_StaffListView] where School_year = @SchoolYear and School_Code =@SchoolCode and Employee_ID = @EmployeeID)
 		else if @NoticeType ='OperateUser'
			set @rValue =(select top 1 eMail  from EPA_Org_EmployeeList where  UserID = @UserID)
		else if @NoticeType ='NoticeUser'
			 set @rValue =(   select top 1 eMail from EPA_Org_EmployeeList where  Employee_ID = @EmployeeID)
		else if @NoticeType ='CCUser'
				begin
				     declare @Appraiser varchar(20) , @PrincipalID varchar(20), @ccUser varchar(20)
					 set @PrincipalID = [dbo].[EPA_getSchoolPrincipal](@SchoolCode ,'UserID') 
				     select top 1 @Appraiser = Appraiser  from [dbo].[EPA_Appraisal_StaffListView]   where School_Year = @SchoolYear and School_Code =@SchoolCode and Employee_ID =@EmployeeID
					 if  @UserID = @Appraiser
					     if @UserID = @PrincipalID
						    set @ccUser =  '' 
						 else
							set @ccUser =  @PrincipalID 
					 else
					     set @ccUser =  @Appraiser   

				     set @rValue =(  select top 1 eMail from EPA_Org_EmployeeList where  UserID = @ccUser  )  


				end
		else
 			set @rValue =( select 	 top 1 isnull(EmailAddress,'') as EmailAddress
			from  [dbo].[EPA_sys_EmailNotification]
			where  NoticeType =  @NoticeType  and active ='X')

  
		RETURN(@rValue)
 END

  