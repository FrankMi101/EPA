









 


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: Auguat 7, 2020
-- Description: Email notice template 
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalProcess_SigeOffAutoNoticeTemplateEdit]  
	@Operate		varchar(30),
	@UserID			varchar(30),
	@Category		varchar(10)= null ,
	@Area			varchar(10)= null,
	@Action			varchar(10) = null,
	@ActionRole		varchar(20) = null,
	@subject		varchar(250) = null,
	@Body			varchar(1000) = null  
as

set nocount on 

if  @Body is null
	begin
	    if @Operate ='System'
			begin
				 if exists( select top 100 * from [dbo].[EPA_sys_EmailNotificationTemplate] where Category = @Category and NoticeApprArea = @Area and NoticeFrom = @ActionRole  and NoticeType = @Action and NoticeFor = 'Notice' and Template is not null)
					select top 1  [Subject] , Template as Body from [dbo].[EPA_sys_EmailNotificationTemplate] 
					where Category =@Category and NoticeApprArea  = @Area and NoticeFrom = @ActionRole and NoticeType = @Action  and NoticeFor = 'Notice' and Template is not null
				else
					select  top 1 [Subject] , Template as Body from [dbo].[EPA_sys_EmailNotificationTemplate] 
					where Category = 'EPA' and NoticeApprArea  = 'EPA' and NoticeFor = 'Notice'  and NoticeType = 'SignOff'and NoticeFrom = @ActionRole and Template is not null
			end	
		else
			begin
				 if exists( select top 1 * from [dbo].[EPA_sys_EmailNotificationTemplate_Personal] where UserID = @UserID and Category =@Category and NoticeApprArea  = @Area and NoticeFrom = @ActionRole and NoticeFor = 'Notice' and Template is not null)
					select top 1  [Subject] , Template as Body from [dbo].[EPA_sys_EmailNotificationTemplate_Personal] where UserID = @UserID and Category =@Category and NoticeApprArea  = @Area and NoticeFrom = @ActionRole and NoticeFor = 'Notice' and Template is not null
				 else 
				    select  top 1 [Subject] , Template  as Body from [dbo].[EPA_sys_EmailNotificationTemplate] 
					where Category = 'EPA' and NoticeApprArea  = 'EPA' and NoticeFor = 'Notice'  and NoticeType = 'SignOff' and NoticeFrom = @ActionRole and Template is not null

			end
	end
else
	begin
		begin try
		    declare @NoticeGo varchar(20)
			set @NoticeGo = case @ActionRole when 'Appraiser' then 'Appraisee' else 'Appraiser' end
			if @Operate ='System'
				begin
					 if exists( select top 1 * from [dbo].[EPA_sys_EmailNotificationTemplate] where Category =@Category and NoticeApprArea  = @Area and NoticeFrom = @ActionRole and NoticeFor = 'Notice' and Template is not null)
						 update  [dbo].[EPA_sys_EmailNotificationTemplate]  
						 set [subject] = @subject, Template = @Body , lu_function = app_name(), lu_date =getdate(), lu_user = @UserID
						 where Category =@Category and NoticeApprArea  = @Area and NoticeFrom = @ActionRole and NoticeFor = 'Notice' and Template is not null
					 else 
					    insert into [dbo].[EPA_sys_EmailNotificationTemplate] 
						(Category,NoticeFor, NoticeType,NoticeApprArea, NoticeGo,NoticeFrom, NoticePurpose, Subject,Template, active, lu_user, lu_function, lu_date )
						values (@Category,'Notice','SignOff',@Area,@NoticeGo,@ActionRole,'This is sign off notification', @subject, @Body ,'X', @UserID,app_name(),getdate() )
				end	
			else
				begin
					 if exists( select top 100 * from [dbo].[EPA_sys_EmailNotificationTemplate_Personal] where  UserID = @UserID and Category =@Category and NoticeApprArea  = @Area and NoticeFrom = @ActionRole and NoticeFor = 'Notice' and Template is not null)
						 update  [dbo].[EPA_sys_EmailNotificationTemplate_Personal] 
						 set [subject] = @subject, Template = @Body , lu_function = app_name(), lu_date =getdate(), lu_user = @UserID
						 where  UserID = @UserID and  Category =@Category and NoticeApprArea  = @Area and NoticeFrom = @ActionRole and NoticeFor = 'Notice' and Template is not null
					 else 
					    insert into [dbo].[EPA_sys_EmailNotificationTemplate_Personal] 
						(UserID, Category,NoticeFor, NoticeType,NoticeApprArea, NoticeGo,NoticeFrom, NoticePurpose, Subject,Template, active, lu_user, lu_function, lu_date )
						values (@UserID,@Category,'Notice','SignOff',@Area,@NoticeGo,@ActionRole,'This is sign off notification',@subject, @Body ,'X', @UserID,app_name(),getdate() )



				end
		 
			Select 'Successfully' as rValue
       end try
	   begin catch
			   Select 'Failed' as rValue		
	   end catch
   end



    
