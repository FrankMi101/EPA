






 


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: December 20, 2017 
-- Description: check appraisee view permission
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalProcess_SigeOffActionAutoNotice]  
	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8) = null,  
	@SchoolCode		varchar(8) = null,
	@EmployeeID		varchar(10) = null,
	@SessionID		varchar(20)= null ,
	@Category		varchar(10)= null ,
	@Area			varchar(10)= null,
	@ItemCode		varchar(10)= null,
	@AppraisalRole	varchar(20) = null,
	@Value			varchar(10) = null  
as

set nocount on 

if  @Value is null
	begin
	
		if @ItemCode ='Summary'
			select 'Allow' as rValue
		else
			begin
				 if @Area in ('LOG','AGP','APP','APM','STR')
					select 'Auto' as rValue
				 else
					if exists(select * 	from  [dbo].[EPA_Appr_Comments_SignOffAutoNotice]  
							where School_year =  @SchoolYear and school_code =@SchoolCode and employeeID =@EmployeeID   and Category = @Category and ItemArea = @Area and [Role] = @AppraisalRole)

						select top 1  isnull([Action],'Auto') 
						from  [dbo].[EPA_Appr_Comments_SignOffAutoNotice] 
							where School_year = @SchoolYear and school_code =@SchoolCode and employeeID =@EmployeeID   and Category = @Category and ItemArea = @Area  and [Role] = @AppraisalRole
					else
						 select 'Auto'
		   end
	end
else
	begin
		begin try
			if exists (select * from  [dbo].[EPA_Appr_Comments_SignOffAutoNotice] where School_year = @SchoolYear and school_code =@SchoolCode and employeeID =@EmployeeID   and Category = @Category and ItemArea = @Area and [Role] = @AppraisalRole)
			   update  [dbo].[EPA_Appr_Comments_SignOffAutoNotice] 
			   set [Action] = @Value,lu_function =App_name(),lu_date =getdate(),lu_user =@UserID
			   where School_year = @SchoolYear and school_code =@SchoolCode and employeeID =@EmployeeID  and Category = @Category and ItemArea = @Area   and [Role] = @AppraisalRole
			else
				insert into [dbo].[EPA_Appr_Comments_SignOffAutoNotice]
							( School_year ,school_code,employeeID,SessionID,Category,ItemArea,[Role],[Action],lu_function,lu_date,lu_User)
				values ( @SchoolYear,@SchoolCode,@EmployeeID ,@SessionID,@Category,@Area,@AppraisalRole,@Value,app_name(),getdate(),@UserID)
		 
			Select 'Successfully' as rValue
       end try
	   begin catch
			   Select 'Failed' as rValue		
	   end catch
   end






