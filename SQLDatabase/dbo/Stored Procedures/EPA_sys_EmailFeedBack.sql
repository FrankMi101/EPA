



          



-- Drop proc dbo.EPA_sys_EmailNotice 'Save','mif','StrategySignOff','mif@tcdsb.org;frank_ml@hotmail.com'
CREATE Procedure [dbo].[EPA_sys_EmailFeedBack] 
 	( @Operate		varchar(30),
	  @UserID		varchar(30) ='upaUser',
  	  @NoticeType	varchar(30) = 'FeedBack', 
	  @eMailAddress	varchar(250) = null 
 	)
AS
BEGIN 
 
	if @eMailAddress is null
		begin
			if @NoticeType ='OperateUser'
				select top 1 eMail from EPA_Org_EmployeeList where  UserID =   @UserID
			else
 				select 	 top 1 isnull(EmailAddress,'') as EmailAddress
				from  [dbo].[EPA_sys_EmailNotification]
				where  NoticeType =  @NoticeType  and active ='X'		
		end
	else
	  begin
		  begin try
		      begin tran
				 if exists (select * from [dbo].[EPA_sys_EmailNotification] where NoticeType =  @NoticeType and Active='X')
					update [dbo].[EPA_sys_EmailNotification]
					set EmailAddress = @eMailAddress
					where NoticeType =  @NoticeType and Active='X'
				 else
						insert into [dbo].[EPA_sys_EmailNotification]
								( NoticeType,EmailAddress,active,lu_User,lu_Function, lu_Date)
						values(	@NoticeType,@eMailAddress,'X'  ,@UserID, app_name(),getdate())

			  commit tran	
				 select 'Successful' as rValue

		   end try
		   begin catch
		       Rollback tran
		      select 'Failed' as rValue
		   end catch
	   end
END









