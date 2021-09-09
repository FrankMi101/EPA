








 

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: March 22, 2018 
-- Description:	get and update notification email template
-- ==================================================================================
  
  

-- Drop proc dbo.EPA_Appr_AppraisalProcess_NotificationTemplate 'AppAreaTitle','mif','NTP','SignOff','SUM','Appraiser','Appraisee','Notice' -- ,'','' 
CREATE Procedure [dbo].[EPA_Appr_AppraisalProcess_NotificationTemplate] 
 	( @Operate			varchar(30),
	  @UserID			varchar(30) ='upaUser',
	  @Category			varchar(10) = null,
  	  @NoticeType		varchar(30) = null, 
  	  @NoticeArea		varchar(10) = null, 
	  @NoticeGo			varchar(15) = null,
	  @NoticeFrom		varchar(15) = null,
	  @Purpose			varchar(10) =null,
 	  @Subject			varchar(250) = null,
	  @Template			varchar(1000) = null 
 	)
AS
BEGIN 
 -- if @Category !='PPA' set @Category ='EPA'

	if @Subject is null
		begin
		    -- set @NoticeFrom = case @NoticeFrom when 'Appraisee' then 'Appraiser' else @NoticeFrom end
		    if exists (select * from [dbo].[EPA_sys_EmailNotificationTemplate] 
				where Category = case @Category when 'PPA' then 'PPA' else 'EPA' end and NoticeType = @NoticeType and NoticeApprArea = @NoticeArea  and NoticeFrom = @NoticeFrom and NoticeFor = @Purpose and Active ='X' )   
                begin
					if @Operate ='AppCategory'
						select   top 1 Appraisal_Name   from   [dbo].[EPA_sys_appraisalType]  
						where Appraisal_Code  = @Category  
                    else if @Operate ='AppAreaTitle'
					    select  top 1  Appraisal_ProcessName   from   [dbo].[EPA_sys_appraisalProcess]   where Appraisal_Code = case  @Category when 'PPA' then 'PPA' else 'EPA' end   and Appraisal_Process = @NoticeArea
					else if @Operate ='GetPurpose'
						select top 1  NoticePurpose   from  [dbo].[EPA_sys_EmailNotificationTemplate]
						where NoticeType = @NoticeType and NoticeApprArea = @NoticeArea  and NoticeFrom =@NoticeFrom and NoticeFor = @Purpose and Active ='X'
					else if @Operate ='GetSubject'
					   begin
							if exists(select * from [dbo].[EPA_Appr_SignOff_AutoNoticeAction] where Action_UserID = @UserID and Category =@Category and ItemArea = @noticeArea and Action_Role = @NoticeFrom and Template ='Personal' )
							     select top 1 [Subject] from [dbo].[EPA_sys_EmailNotificationTemplate_Personal] where UserID = @UserID and Category =@Category and  NoticeApprArea  = @NoticeArea and NoticeFrom = @NoticeFrom and NoticeFor = 'Notice' and Template is not null
							else
								select top 1   [Subject]  from  [dbo].[EPA_sys_EmailNotificationTemplate]
								where NoticeType = @NoticeType and NoticeApprArea = @NoticeArea  and NoticeFrom = @NoticeFrom and NoticeFor = @Purpose and Active ='X'
 					   end
 					else if @Operate ='GetSubjectHR'
					   begin
							if exists(select * from [dbo].[EPA_Appr_SignOff_AutoNoticeAction] where Action_UserID = @UserID and Category =@Category and ItemArea = @noticeArea and Action_Role = @NoticeFrom and Template ='Personal' )
							     select top 1 [Subject] from [dbo].[EPA_sys_EmailNotificationTemplate_Personal] where UserID = @UserID and Category =@Category and  NoticeApprArea  = @NoticeArea and NoticeFrom = @NoticeFrom and NoticeFor = 'Notice' and Template is not null
							else
								select top 1  [Subject]   from  [dbo].[EPA_sys_EmailNotificationTemplate]
								where NoticeType = 'CompleteNTIP' and NoticeApprArea = 'STR'  and NoticeFrom = 'AppSystem' and NoticeFor = @Purpose and Active ='X'
 					   end
					else if @Operate ='GetBodyHR'
					   begin
							if exists(select * from [dbo].[EPA_Appr_SignOff_AutoNoticeAction] where Action_UserID = @UserID and Category =@Category and ItemArea = @noticeArea and Action_Role = @NoticeFrom and Template ='Personal' )
							     select top 1 Template from [dbo].[EPA_sys_EmailNotificationTemplate_Personal] where UserID = @UserID and Category =@Category and  NoticeApprArea  = @NoticeArea and NoticeFrom = @NoticeFrom and NoticeFor = 'Notice' and Template is not null
							else
								select top 1  Template   from  [dbo].[EPA_sys_EmailNotificationTemplate]
								where NoticeType = 'CompleteNTIP' and NoticeApprArea = 'STR'  and NoticeFrom = 'AppSystem' and NoticeFor = @Purpose and Active ='X'
 					   end
                  else
						begin
							if exists(select * from [dbo].[EPA_Appr_SignOff_AutoNoticeAction] where Action_UserID = @UserID and Category =@Category and ItemArea = @noticeArea and Action_Role = @NoticeFrom and Template ='Personal' )
							     select top 1  Template from [dbo].[EPA_sys_EmailNotificationTemplate_Personal] where UserID = @UserID and Category =@Category and NoticeApprArea  = @NoticeArea and NoticeFrom = @NoticeFrom and NoticeFor = 'Notice' and Template is not null
							else
								select top 1  Template   from  [dbo].[EPA_sys_EmailNotificationTemplate]
								where NoticeType = @NoticeType and NoticeApprArea = @NoticeArea  and NoticeFrom = @NoticeFrom and NoticeFor = @Purpose and Active ='X'

						end 
			   end
			else
				begin
					if @Operate ='AppCategory'
						select   top 1 Appraisal_Name   from   [dbo].[EPA_sys_appraisalType]  
						where Appraisal_Code  = @Category  
                    else if @Operate ='AppAreaTitle'
					    select  top 1 Appraisal_ProcessName   from   [dbo].[EPA_sys_appraisalProcess]   where Appraisal_Code =   case  @Category when 'PPA' then 'PPA' else 'EPA' end   and Appraisal_Process = @NoticeArea
					else if @Operate ='GetPurpose'
						select top 1  NoticePurpose   from  [dbo].[EPA_sys_EmailNotificationTemplate]
						where NoticeType = 'Generic' and NoticeApprArea = @NoticeArea  and NoticeFor = @Purpose and Active ='X'
					else if @Operate ='GetSubject'
						select top 1  [Subject]   from  [dbo].[EPA_sys_EmailNotificationTemplate]
						where NoticeType = @NoticeType  and NoticeApprArea = 'EPA'   and NoticeFor = @Purpose and Active ='X'
					else if @Operate ='GetSubjectHR'
						select top 1  [Subject]   from  [dbo].[EPA_sys_EmailNotificationTemplate]
						where NoticeType = 'CompleteNTIP' and NoticeApprArea = 'STR'  and NoticeFrom = 'AppSystem'   and NoticeFor = @Purpose and Active ='X'
					else if @Operate ='GetBodyHR'
						select top 1  [Template]   from  [dbo].[EPA_sys_EmailNotificationTemplate]
						where NoticeType ='CompleteNTIP' and NoticeApprArea = 'STR'  and NoticeFrom = 'AppSystem'    and NoticeFor = @Purpose and Active ='X'
					else
						select top 1  [Template]  from  [dbo].[EPA_sys_EmailNotificationTemplate]
						where NoticeType =  @NoticeType  and NoticeApprArea = 'EPA'  and NoticeFor = @Purpose and Active ='X'

				end
		end
	else
	  begin
		  begin try
		      begin tran
				 if exists (select *  from    [dbo].[EPA_sys_EmailNotificationTemplate] where NoticeType = @NoticeType and NoticeApprArea = @NoticeArea  and NoticeGo = @NoticeGo and NoticeFrom = @NoticeFrom and NoticeFor = @Purpose and Active ='X')
				    if @Operate ='SavePurpose'
						 update [dbo].[EPA_sys_EmailNotificationTemplate]
						 set NoticePurpose = @Subject ,  lu_date=getdate(), lu_user = @UserID
						 where NoticeType = @NoticeType and NoticeApprArea = @NoticeArea  and NoticeGo = @NoticeGo and NoticeFrom = @NoticeFrom and NoticeFor = @Purpose and Active ='X' 
					else
						 update [dbo].[EPA_sys_EmailNotificationTemplate]
						 set   [Subject] = @Subject , [Template] = @Template, lu_date=getdate(), lu_user = @UserID
						 where NoticeType = @NoticeType and NoticeApprArea = @NoticeArea  and NoticeGo = @NoticeGo and NoticeFrom = @NoticeFrom and NoticeFor = @Purpose and Active ='X' 

				 else
					 if @Operate ='SavePurpose'
						insert into [dbo].[EPA_sys_EmailNotificationTemplate]
								( category, NoticeType,NoticeApprArea,NoticeGo,NoticeFrom,NoticeFor, NoticePurpose, [Subject], [Template], Active ,lu_User,lu_Function, lu_Date)
						values( @Category, @NoticeType,@NoticeArea, @NoticeGo,@NoticeFrom,@Purpose,@Subject, '','', 'X',  @UserID, app_name(),getdate())
					 else
						insert into [dbo].[EPA_sys_EmailNotificationTemplate]
							   ( category, NoticeType,NoticeApprArea,NoticeGo,NoticeFrom,NoticeFor, NoticePurpose, [Subject], [Template], Active ,lu_User,lu_Function, lu_Date)
						values( @Category, @NoticeType,@NoticeArea, @NoticeGo,@NoticeFrom,@Purpose, '', @Subject,@Template, 'X',  @UserID, app_name(),getdate())

			  commit tran	
				 select 'Successful' as rValue

		   end try
		   begin catch
		       Rollback tran
		      select 'Failed' as rValue
		   end catch
	   end
END

 







