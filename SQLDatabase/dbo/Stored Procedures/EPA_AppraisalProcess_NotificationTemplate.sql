
-- ==================================================================================
-- Author:		Frank Mi
-- Create date: March 22, 2018 
-- Description:	get and update notification email template
-- ==================================================================================
 
          
 

-- Drop proc dbo.EPA_AppraisalProcess_NotificationTemplate 'Save','mif','TPA','ALP','Appraisee','Appraiser','ALP','sd sdfsdf s'
CREATE Procedure [dbo].[EPA_AppraisalProcess_NotificationTemplate] 
 	( @Operate			varchar(30),
	  @UserID			varchar(30) ='upaUser',
	  @Category			varchar(10) = null,
  	  @NoticeType		varchar(10) = null, 
	  @NoticeGo			varchar(10) = null,
	  @NoticeFrom		varchar(10) = null,
 	  @Subject			varchar(150) = null,
	  @Template			varchar(1000) = null 
 	)
AS
BEGIN 
 

	if @Template is null
		begin
			if @Operate ='GetSubject'
				select top 1  [Subject]   from  [dbo].[EPA_sys_EmailNotificationTemplate]
				where NoticeType = @NoticeType and NoticeGo = @NoticeGo and NoticeFrom =@NoticeFrom  and Active ='X'
			else
				select top 1  [Template]  from  [dbo].[EPA_sys_EmailNotificationTemplate]
				where NoticeType = @NoticeType and NoticeGo = @NoticeGo and NoticeFrom = @NoticeFrom  and Active ='X'
	
		end
	else
	  begin
		  begin try
		      begin tran
				 if exists (select * from [dbo].[EPA_sys_EmailNotificationTemplate] where NoticeType = @NoticeType and NoticeGo = @NoticeGo and NoticeFrom = @NoticeFrom  and Active ='X')
					 update [dbo].[EPA_sys_EmailNotificationTemplate]
					 set [Subject] = @Subject , [Template] = @Template, lu_date=getdate(), lu_user = @UserID
					 where NoticeType = @NoticeType and NoticeGo = @NoticeGo and NoticeFrom = @NoticeFrom  and Active ='X' 
				 else
						insert into [dbo].[EPA_sys_EmailNotificationTemplate]
								( category, NoticeType,NoticeGo,NoticeFrom,[Subject], [Template], Active ,lu_User,lu_Function, lu_Date)
						values( @Category, @NoticeType, @NoticeGo,@NoticeFrom,@Subject,@Template, 'X',  @UserID, app_name(),getdate())

			  commit tran	
				 select 'Successful' as rValue

		   end try
		   begin catch
		       Rollback tran
		      select 'Failed' as rValue
		   end catch
	   end
END








