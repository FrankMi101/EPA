








 


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: July 28, 2020
-- Description: check appraisee view permission
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalProcess_SigeOffAutoNotice]  
	@Operate		varchar(30),
	@UserID			varchar(30),
	@EmployeeID		varchar(10) = null,
	@Category		varchar(10)= null ,
	@Area			varchar(10)= null,
	@ActionRole		varchar(20) = null,
	@Value			varchar(10) = null,
	@Template		Varchar(20) = null
as

set nocount on 

if  @Value is null
	begin
	  	if exists(select  *  from  dbo.EPA_Appr_SignOff_AutoNoticeAction where  Action_UserID = @UserID and  employeeID =@EmployeeID   and Category = @Category and ItemArea = @Area and [Action_Role] = @ActionRole)
			select top 1  case @Operate when 'Template' then isnull(Template,'System') else  isnull([Action],'Auto') end
			from dbo.EPA_Appr_SignOff_AutoNoticeAction
			where Action_UserID = @UserID and  employeeID =@EmployeeID   and Category = @Category and ItemArea = @Area and [Action_Role] = @ActionRole
		else
			select case @Operate when 'Template' then 'System' else 'Auto' end
 
	end
else
	begin
		begin try
			if exists (select * from dbo.EPA_Appr_SignOff_AutoNoticeAction where  Action_UserID = @UserID and  employeeID =@EmployeeID   and Category = @Category and ItemArea = @Area and [Action_Role] = @ActionRole)
			   update  dbo.EPA_Appr_SignOff_AutoNoticeAction
			   set [Action] = @Value, Template = @Template, lu_function =App_name(),lu_date =getdate(),lu_user =@UserID
			   where  Action_UserID = @UserID and  employeeID =@EmployeeID   and Category = @Category and ItemArea = @Area and [Action_Role] = @ActionRole
			else
				insert into dbo.EPA_Appr_SignOff_AutoNoticeAction
							(Action_UserID ,employeeID ,Category, ItemArea,[Action_Role], [action], Template ,lu_function,lu_date,lu_User)
				values ( @UserID,@EmployeeID,@Category,@Area,@ActionRole,@Value,@Template,app_name(),getdate(),@UserID)
		 
			Select 'Successfully' as rValue
       end try
	   begin catch
			   Select 'Failed' as rValue		
	   end catch
   end






