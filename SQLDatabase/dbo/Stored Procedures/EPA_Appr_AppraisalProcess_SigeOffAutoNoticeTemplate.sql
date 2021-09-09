









 


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: Auguat 7, 2020
-- Description: Email notice template 
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalProcess_SigeOffAutoNoticeTemplate]  
	@Operate		varchar(30),
	@UserID			varchar(30),
	@Category		varchar(10)= null ,
	@Area			varchar(10)= null,
	@Action			varchar(10) = null,
	@ActionRole		varchar(20) = null,
	@subject		varchar(250) = null,
	@Value			varchar(1000) = null  
as

set nocount on 

if  @Value is null
	begin
	    if @Operate ='System'
			begin
				 if exists( select top 1 * from [dbo].[EPA_sys_EmailNotificationTemplate] where Category =@Category and NoticeApprArea  = @Area and NoticeFrom = @ActionRole and NoticeFor = 'Notice' and Template is not null)
					select top 1  case  @Action  when 'Subjet' then [Subject]  else  Template  end  from [dbo].[EPA_sys_EmailNotificationTemplate] where Category =@Category and NoticeApprArea  = @Area and NoticeFrom = @ActionRole and NoticeFor = 'Notice' and Template is not null
				 else 
				    select 'The system template has not added yet.'
			end	
		else
			begin
				 if exists( select top 1 * from [dbo].[EPA_sys_EmailNotificationTemplate_Personal] where UserID = @UserID and Category =@Category and NoticeApprArea  = @Area and NoticeFrom = @ActionRole and NoticeFor = 'Notice' and Template is not null)
					select top 1  case  @Action  when 'Subjet' then [Subject]  else  Template  end   from [dbo].[EPA_sys_EmailNotificationTemplate_Personal] where UserID = @UserID and Category =@Category and NoticeApprArea  = @Area and NoticeFrom = @ActionRole and NoticeFor = 'Notice' and Template is not null
				 else 
				    select 'The person template has not added yet.'

			end
	end
else
	begin
		begin try
			if @Operate ='System'
				begin
					 if exists( select top 1 * from [dbo].[EPA_sys_EmailNotificationTemplate] where Category =@Category and NoticeApprArea  = @Area and NoticeFrom = @ActionRole and NoticeFor = 'Notice' and Template is not null)
						 update  [dbo].[EPA_sys_EmailNotificationTemplate] 
						 set Template = @Value , lu_function = app_name(), lu_date =getdate(), lu_user = @UserID
						 where Category =@Category and NoticeApprArea  = @Area and NoticeFrom = @ActionRole and NoticeFor = 'Notice' and Template is not null
					 else 
					    insert into [dbo].[EPA_sys_EmailNotificationTemplate] 
						(Category,NoticeFor, NoticeType,NoticeApprArea, NoticeGo,NoticeFrom, NoticePurpose, Subject,Template, active, lu_user, lu_function, lu_date )
						values (@Category,'Notice','SignOff',@Area,'',@ActionRole,'This is sign off notification','Sign Off of' + @Area , @Value ,'X', @UserID,app_name(),getdate() )
				end	
			else
				begin
					 if exists( select top 1 * from [dbo].[EPA_sys_EmailNotificationTemplate_Personal] where  UserID = @UserID and Category =@Category and NoticeApprArea  = @Area and NoticeFrom = @ActionRole and NoticeFor = 'Notice' and Template is not null)
						 update  [dbo].[EPA_sys_EmailNotificationTemplate_Personal] 
						 set Template = @Value , lu_function = app_name(), lu_date =getdate(), lu_user = @UserID
						 where  UserID = @UserID and  Category =@Category and NoticeApprArea  = @Area and NoticeFrom = @ActionRole and NoticeFor = 'Notice' and Template is not null
					 else 
					    insert into [dbo].[EPA_sys_EmailNotificationTemplate_Personal] 
						(UserID, Category,NoticeFor, NoticeType,NoticeApprArea, NoticeGo,NoticeFrom, NoticePurpose, Subject,Template, active, lu_user, lu_function, lu_date )
						values (@UserID,@Category,'Notice','SignOff',@Area,'',@ActionRole,'This is sign off notification','Sign Off of' + @Area , @Value ,'X', @UserID,app_name(),getdate() )



				end
		 
			Select 'Successfully' as rValue
       end try
	   begin catch
			   Select 'Failed' as rValue		
	   end catch
   end



    
