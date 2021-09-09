



 

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: December 22, 2017 
-- Description:	get and update observation date and comments
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalData_ObservationText]    -- '0','mif','20172018','0528','00010452','Session1','PPA' 
	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8)= null,  
	@SchoolCode		varchar(8)= null,  
	@EmployeeID		varchar(20)= null,
	@SessionID		varchar(20)= null,  
	@Category		varchar(10)= null ,
	@Area			varchar(20)= null ,
	@ItemCode		varchar(10)= null,  
	@Date			varchar(10) = null,   
	@Value			varchar(1000) = null   

	 
as

set nocount on 
 

 if @Value is null
	begin
		if @Operate ='Date' 
			select top 1 [Observation_Date]  
			from  [dbo].[EPA_Appr_Comments_Observation]
			where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode
		else
			select top 1  Observation_Note
			from  [dbo].[EPA_Appr_Comments_Observation]
			where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode
	end
else
   begin
		begin try
			if exists (select * from  [dbo].[EPA_Appr_Comments_Observation]
						where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode )
				  begin
				      insert into  [dbo].[EPA_Appr_Comments_Observation_Bak]
							(School_Year,School_Code,EmployeeID,SessionID,ItemCode,Appraisal_Note,lu_date,lu_user,lu_function, action_User,action_date)
					  select School_Year,School_Code,EmployeeID,SessionID,ItemCode,Appraisal_Note,lu_date,lu_user,lu_function, @UserID,getdate()
					  from  [dbo].[EPA_Appr_Comments]
					  where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode

					  update  [dbo].[EPA_Appr_Comments_Observation]
					  set [Observation_Date]  = @Date, Observation_Note = @Value, lu_date =getdate(), lu_user = @UserID, lu_function = app_name()
					  where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode
				  end
			else
				insert into   [dbo].[EPA_Appr_Comments_Observation]
				( School_Year,School_Code,EmployeeID,SessionID,ItemCode,[Observation_Date], Observation_Note,lu_date,lu_user,lu_function)
				values(@SchoolYear ,@SchoolCode , @EmployeeID,@SessionID,@ItemCode, @Date, @Value, getdate(),@UserID, app_name())

			Select 'Successfully' as rValue
       end try
	   begin catch
			   Select 'Failed' as rValue		
	   end catch
  end



