
    
-- ==================================================================================
-- Author:		Frank Mi
-- Create date: July 13, 2020 
-- Description:	auto email notification action
-- ================================================================================== 
CREATE proc dbo.EPA_Appr_AutoNotice_SendEmail 
(	@SchoolYear	varchar(8) = null,
	@SchoolCode	varchar(8) = null,
	@EmployeeID	varchar(10) = null,
	@NoticeType varchar(10)= null,
	@TempleteID int
	)
as 
set nocount on
 
 declare @mailBody  varchar(4000) , @mailSubject varchar(200), @mailTo varchar(50) , @mailCC  varchar(50), @mailBCC  varchar(50)
 -- step 1 get email template and TO, CC information
  select top 1 @mailBody = template, @mailSubject = Subject
   from [dbo].[EPA_sys_EmailNotificationTemplate] where IDs = @TempleteID  

   begin
	begin try
		  begin tran			 
			-- step 2 send email 
			 EXEC msdb.dbo.sp_send_dbmail 
					@profile_name ='LTO Public Profile',
					@recipients = @mailTo,
					@copy_recipients= @mailCC, 
					@blind_copy_recipients= @mailBCC,
					@body = @mailBody,
					@subject = @mailSubject,
					@body_format ='HTML',
					@from_address = 'EPA.Admin@tcdsb.org'  --'LTO.Admin@tcdsb.org' 

			-- ste 3 update email notice action tracing information 
			if exists (select * from [dbo].[EPA_Appr_Notification_AutoCheckTrace] where School_year =@SchoolYear and school_code = @SchoolCode and Employee_id =@EmployeeID and NoticeType =@NoticeType)
			   update [dbo].[EPA_Appr_Notification_AutoCheckTrace]
			   set NoticeDate = getdate(), NoticeWave = NoticeWave + 1   
			   where School_year =@SchoolYear and school_code = @SchoolCode and Employee_id =@EmployeeID and NoticeType =@NoticeType
			else
				insert into [dbo].[EPA_Appr_Notification_AutoCheckTrace]
				(school_year, school_code, Employee_ID, NoticeType, NoticeDate,NoticeWave,Comments, lu_function, lu_date, lu_user)
				values (@SchoolYear, @SchoolCode, @EmployeeID, @NoticeType, getdate(),'1','Successfully send email Notification',app_name(), getdate(),'SQL Mail')
    
 		  Commit tran
		  Select 'Successfully' as rValue
	  
   end try
       
   begin catch
           Rollback tran
           Select 'Failed' as rValue
		
    end catch
 
end

