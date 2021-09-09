










-- ==================================================================================
-- Author:		Frank Mi
-- Create date: March 22, 2018 
-- Description:	get and update notification email content
-- ==================================================================================
          
-- Drop proc dbo.EPA_Appr_Notification 'Save','mif','StrategySignOff','mif@tcdsb.org;frank_ml@hotmail.com'
CREATE Procedure [dbo].[EPA_Appr_AppraisalProcess_Notification] 
 	( @Operate			varchar(30),
	  @UserID			varchar(30) ='upaUser',
	  @SchoolYear		varchar(8) = null,
	  @SchoolCode		varchar(8) = null,
	  @EmployeeID		varchar(10) = null,
	  @SessionID		varchar(20) = null,
  	  @NoticeType		varchar(30) = null, 
  	  @NoticeArea		varchar(10) = null, 
	  @NoticeDate		varchar(10) = null,
	  @NoticeRole		varchar(20) = null,
	  @DeadlineDate		varchar(10) = null,
	  @NoticeSubject	varchar(250) = null,
	  @Comments			varchar(4000) = null 
 	)
AS
BEGIN 
 

	if @NoticeSubject is null 
	   select [dbo].[EPA_getNotificationUserEmail] (@UserID, @SchoolYear,@SchoolCode,@EmployeeID,@NoticeType )
	   /*
		begin
			if @NoticeType ='OperateUser'
				select top 1 eMail from EPA_Org_EmployeeList where  UserID = @UserID
			else if @NoticeType ='NoticeUser'
			    select top 1 eMail from EPA_Org_EmployeeList where  Employee_ID = @EmployeeID
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
				      select top 1 eMail from EPA_Org_EmployeeList where  UserID = @ccUser    
				end
			else
 				select 	 top 1 isnull(EmailAddress,'') as EmailAddress
				from  [dbo].[EPA_sys_EmailNotification]
				where  NoticeType =  @NoticeType  and active ='X'		
		end 
		*/
	else
	  begin
		  begin try
		      begin tran
				 --if exists (select * from [dbo].[EPA_Appr_Notification] where School_year = @SchoolYear and School_code = @SchoolCode and EmployeeID =@EmployeeID and SessionID =@SessionID and NoticeType =  @NoticeType  and AppraisalArea= @NoticeArea and NoticeRole = @Operate)
					--update [dbo].[EPA_Appr_Notification]
					--set Comments = @Comments,NoticeSubject = @NoticeSubject, NoticeDate = @NoticeDate, DeadlineDate =@DeadlineDate, lu_date=getdate(), lu_user =@UserID,lu_function =app_name() 
					--where School_year = @SchoolYear and School_code = @SchoolCode and EmployeeID =@EmployeeID and SessionID =@SessionID and NoticeType =  @NoticeType and AppraisalArea= @NoticeArea and NoticeRole = @Operate
				 --else
						insert into  [dbo].[EPA_Appr_Notification]
							  (NoticeAction, School_Year, School_Code, EmployeeID, SessionID, NoticeType, AppraisalArea, NoticeRole, NoticeDate, DeadlineDate, NoticeSubject,Comments,lu_User,lu_Function, lu_Date)
						values(@Operate, @SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@NoticeType, @NoticeArea, @NoticeRole, @NoticeDate, @DeadlineDate,  @NoticeSubject,@Comments,@UserID, app_name(),getdate())

				 if @DeadlineDate !=''
					begin
					    declare  @Category varchar(10)
						select top 1  @SessionID = dbo.EPA_appr_CurrentAppraisalSession(Appraisal_year, Employee_ID,Unit_ID,Appraisal_Cycle,Appraisal_type),
									@Category =  Appraisal_type
									from [dbo].[EPA_Appr_EmployeeList]  
									where Appraisal_year = @SchoolYear and Employee_ID = @EmployeeID  

						 if @NoticeType ='EPA' 
								EXEC  dbo.EPA_Appr_AppraisalData_ObservationDate 
										'dateObservationPre', @UserID,@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,'SUM','OBS',@DeadlineDate  
 						 if @NoticeType ='OBS'
						 		EXEC  dbo.EPA_Appr_AppraisalData_ObservationDate 
										'dateObservation',    @UserID,@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,'SUM','OBS',@DeadlineDate  
					end
			  commit tran	
				 select 'Successful' as rValue

		   end try
		   begin catch
		       Rollback tran
		      select 'Failed' as rValue
		   end catch
	   end
END



 









