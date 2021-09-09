

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: January 2, 2018 
-- Description:	get NTIP strategy item label
-- ==================================================================================
--  [dbo].[EPA_Appr_AppraisalData_StrategyCheck]  'Get','mif','20182019','0529','00033591','Appraisal1','NTP','STR','STR111' 
 
CREATE proc [dbo].[EPA_Appr_AppraisalData_StrategyCheck]    
	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8)= null,  
	@SchoolCode		varchar(8)= null,  
	@EmployeeID		varchar(20)= null,
	@SessionID		varchar(20)= null,  
	@Category		varchar(10)= null ,
	@Area			varchar(20)= null ,
	@ItemCode		varchar(10)= null,
	@Value			 varchar(1) = null 
 
as

set nocount on 
if @Value is null
    begin
		if exists(select top 1 isnull(Principal_Initail,0) from  [dbo].[EPA_Appr_Strategy]  where School_Year =@SchoolYear and School_Code = @SchoolCode and EmployeeID =@EmployeeID and ItemCode = @ItemCode)
			select  top 1 Principal_Initail   
			from [dbo].[EPA_Appr_Strategy]  
			where School_Year =@SchoolYear and School_Code = @SchoolCode and EmployeeID =@EmployeeID and ItemCode = @ItemCode -- and SessionID = @SessionID
		else
			select '0'
	end
else
 begin
		begin try
			if exists (select * from  [dbo].[EPA_Appr_Strategy]  
						where School_Year =@SchoolYear and School_Code = @SchoolCode and EmployeeID =@EmployeeID and ItemCode = @ItemCode ) -- and SessionID = @SessionID
				  begin		  
						  update  [dbo].[EPA_Appr_Strategy]  
						  set Principal_Initail  = @Value, lu_date =getdate(), lu_user = @UserID, lu_function = app_name()
						  where School_Year =@SchoolYear and School_Code = @SchoolCode and EmployeeID =@EmployeeID and ItemCode = @ItemCode -- and SessionID = @SessionID
				  end
			else
 					insert into   [dbo].[EPA_Appr_Strategy]  
					( School_Year,School_Code,EmployeeID,SessionID,ItemCode,Principal_Initail, lu_date,lu_user,lu_function)
					values(@SchoolYear ,@SchoolCode , @EmployeeID,@SessionID,@ItemCode, @Value, getdate(),@UserID, app_name())

			Select 'Successfully' as rValue
       end try
	   begin catch
			   Select 'Failed' as rValue		
	   end catch
  end  
