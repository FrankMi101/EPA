


          
 

-- Drop proc dbo.EPA_Appr_Notification 'Save','mif','StrategySignOff','mif@tcdsb.org;frank_ml@hotmail.com'
CREATE Procedure [dbo].[EPA_AppraisalProcess_Notification] 
 	( @Operate			varchar(30),
	  @UserID			varchar(30) ='upaUser',
	  @SchoolYear		varchar(8) = null,
	  @SchoolCode		varchar(8) = null,
	  @EmployeeID		varchar(10) = null,
  	  @NoticeType		varchar(30) = null, 
	  @DeadlineDate		varchar(10) = null,
	  @ObservationDate	varchar(10) = null,
	  @NoticeSubject	varchar(150) = null,
	  @Comments			varchar(1000) = null 
 	)
AS
BEGIN 
 

	if @NoticeSubject is null
		begin
			if @NoticeType ='OperateUser'
				select top 1 eMail from EPA_Org_EmployeeList where  UserID = @UserID
			else if @NoticeType ='NoticeUser'
			    select top 1 eMail from EPA_Org_EmployeeList where  Employee_ID = @EmployeeID
			else
 				select 	 top 1 isnull(EmailAddress,'') as EmailAddress
				from  [dbo].[EPA_sys_EmailNotification]
				where  NoticeType =  @NoticeType  and active ='X'		
		end
	else
	  begin
		  begin try
		      begin tran
				 if exists (select * from [dbo].[EPA_Appr_Notification] where School_year = @SchoolYear and School_code = @SchoolCode and EmployeeID =@EmployeeID and NoticeType =  @NoticeType)
					update [dbo].[EPA_Appr_Notification]
					set Comments = @Comments,NoticeSubject = @NoticeSubject,DeadlineDate =@DeadlineDate,ObservationDate =@ObservationDate
					where School_year = @SchoolYear and School_code = @SchoolCode and EmployeeID =@EmployeeID and NoticeType =  @NoticeType 
				 else
						insert into [dbo].[EPA_Appr_Notification]
								( School_Year, School_Code, EmployeeID,NoticeType,DeadlineDate,ObservationDate,NoticeSubject,Comments,lu_User,lu_Function, lu_Date)
						values( @SchoolYear,@SchoolCode,@EmployeeID,@NoticeType,@DeadlineDate,@ObservationDate, @NoticeSubject,@Comments,@UserID, app_name(),getdate())

			  commit tran	
				 select 'Successful' as rValue

		   end try
		   begin catch
		       Rollback tran
		      select 'Failed' as rValue
		   end catch
	   end
END








