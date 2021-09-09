


        


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: December 20, 2017 
-- Description:	get and  update appraisal samll Text content and list chose content
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalData_List]    -- '0','mif','20172018','0528','00010452','Session1','PPA' 
	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8)= null,  
	@SchoolCode		varchar(8)= null,  
	@EmployeeID		varchar(20)= null,
	@SessionID		varchar(20)= null,  
	@Category		varchar(10)= null ,
	@Area			varchar(20)= null ,
	@ItemCode		varchar(10)= null,  
	@Value			varchar(1) = null   

	 
as

set nocount on  
 
 if @Value is null

	select top 1 Appraisal_Chose
	from  [dbo].[EPA_Appr_Comments_small] 
	where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode  and Category = @Category
else
   begin
		begin try
			if exists (select * from  [dbo].[EPA_Appr_Comments_small]
						where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode and Category = @Category)			     
					  update  [dbo].[EPA_Appr_Comments_small]
					  set Appraisal_chose = @Value, lu_date =getdate(), lu_user = @UserID, lu_function = app_name()
					  where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode and Category = @Category
 			else
				insert into   [dbo].[EPA_Appr_Comments_small]
				( School_Year,School_Code,EmployeeID,SessionID,ItemCode,Category,Appraisal_chose, lu_date,lu_user,lu_function)
				values(@SchoolYear ,@SchoolCode , @EmployeeID,@SessionID,@ItemCode, @Category, @Value, getdate(),@UserID, app_name())

			Select 'Successfully' as rValue
       end try
	   begin catch
			   Select 'Failed' as rValue		
	   end catch
  end

   




