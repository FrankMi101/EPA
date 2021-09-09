





 


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: December 20, 2017 
-- Description: check appraisee view permission
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalProcess_CheckViewPermission]  
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
				 if @Area in ('ALP','LOG','AGP','APP','APM','STR')
					select 'SignOff' as rValue
				 else
					if exists(select * from    [dbo].[EPA_Appr_Comments_ViewPermission]  
							where School_year = @SchoolYear and school_code =@SchoolCode and employeeID =@EmployeeID  and SessionID = @SessionID and Category = @Category and ItemArea = @Area)

						select top 1  Permission 
						from  [dbo].[EPA_Appr_Comments_ViewPermission] 
							where School_year = @SchoolYear and school_code =@SchoolCode and employeeID =@EmployeeID  and SessionID = @SessionID and Category = @Category and ItemArea = @Area
					else
						begin
						    if @AppraisalRole ='Appraiser'
							    select 'Allow' as rValue
							else
								begin
									if  exists (select * from EPA_sys_Appraisal_Definition where Appraisal_Category = @Category and Appraisal_Area = @Area and Appraisal_Code = @ItemCode and Content_For = @AppraisalRole)
										select 'Allow' as rValue
									else
									   if @ItemCode in ('OBS21','OBS22','OBS23')
									      select 'Allow' as rValue
										else
											select 	 'NotAllow' as rValue
								end
						end		 
		   end
	end
else
	begin
		begin try
			if exists (select * from  [dbo].[EPA_Appr_Comments_ViewPermission] where School_year = @SchoolYear and school_code =@SchoolCode and employeeID =@EmployeeID  and SessionID = @SessionID and Category = @Category and ItemArea = @Area)
			   update  [dbo].[EPA_Appr_Comments_ViewPermission] 
			   set permission = @Value,lu_function =App_name(),lu_date =getdate(),lu_user =@UserID
			   where School_year = @SchoolYear and school_code =@SchoolCode and employeeID =@EmployeeID  and SessionID = @SessionID and Category = @Category and ItemArea = @Area 
			else
				insert into [dbo].[EPA_Appr_Comments_ViewPermission]
							( School_year ,school_code,employeeID,SessionID,Category,ItemArea,Permission,lu_function,lu_date,lu_User)
				values ( @SchoolYear,@SchoolCode,@EmployeeID ,@SessionID,@Category,@Area,@Value,app_name(),getdate(),@UserID)
		 
			Select 'Successfully' as rValue
       end try
	   begin catch
			   Select 'Failed' as rValue		
	   end catch
   end






